<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.14</div>

<h1>자바 9 모듈</h1>

<p>
자바는 9 버전부터 모듈을 지원한다.<br />
프로그래머는 모듈 단위로 프로그램을 구성할 수 있다.
</p>

<p>
모듈을 지원하기 위해, 자바는 먼저 자바 API를 모듈화해야 했다.<br />
모듈 간 의존이 순환되지 않도록 패키지를 그룹화하는 작업은 쉽지 않았다.<br />
A 모듈이 B 모듈을 의존하고 B 모듈이 C 모듈을 의존하고 C 모듈이 다시 A 모듈을 의존한다면, 이를 모듈 간 의존이 순환된다고 말한다.
</p>

<p>
모듈에는 모듈 디스크립터가 있다.<br />
모듈 디스크립터는 모듈 이름과 모듈이 필요로 하는<sup>requires</sup> 외부 모듈 목록, 모듈이 익스포트<sup>exports</sup>하는 패키지 목록을 정의한다.<br />
</p>

<p>
모듈 이름은 유일한 이름으로 짓는 게 좋다.<br />
유일한 이름을 갖기 위해, 대부분 모듈은 도메인 역순으로 시작하는 이름을 가진다.
</p>

<p>
모듈은 이미지나 설정 파일--자바 프로퍼티, XML 파일--과 같은 리소스를 가질 수 있지만, 이들을 모듈 디스크립터에 정의하지 않는다.
</p>

<dl class="note">
<dt>
자바 EE는 아직 모듈을 채택하지 않았다.<br />
웹 프로젝트를 모듈화해야 한다는 부담을 가질 필요 없다.
</dt>
</dl>

<p>
<a href="/jdbc/Connection-Pool">커넥션 풀</a> 소스를 모듈화하는 실습을 준비했다.<br />
실습하기 전 아랫글을 읽어 보는 게 좋다.
</p>

<ul>
	<li><a href="https://www.oracle.com/corporate/features/understanding-java-9-modules.html">Understanding Java 9 Modules</a></li>
	<li><a href="http://openjdk.java.net/projects/jigsaw/quick-start">Project Jigsaw: Module System Quick-Start Guide</a></li>
</ul>

<p>
모듈화 전
</p>

<pre lang="en">
src/
├── net
│    └── java_school
│            └── db
│                └── dbpool
│                     ├── <a href="#DBConnectionPool.java">DBConnectionPool.java</a>
│                     ├── <a href="#DBConnectionPoolManager.java">DBConnectionPoolManager.java</a>
│                     └── <a href="#ConnectionManager.java">ConnectionManager.java</a>
├── net
│    └── java_school
│            └── db
│                └── dbpool
│                     └── oracle
│                           └── <a href="#OracleConnectionManager.java">OracleConnectionManager.java</a>
├── net
│    └── java_school
│            └── db
│                └── dbpool
│                     └── mysql
│                           └── <a href="#MySqlConnectionManager.java">MySqlConnectionManager.java</a>
├── net
│    └── java_school
│            └── test
│                  └── <a href="#GetEmp.java">GetEmp.java</a>
├── <a href="#mysql.properties">mysql.properties</a>
├── <a href="#oracle.properties">oracle.properties</a>
jars/
├── <a href="#ojdbc6.jar">ojdbc6.jar</a>
└── <a href="#mysql-connector-java-8.0.28.jar">mysql-connector-java-8.0.28.jar</a>
</pre>

<p>
디렉터리 구조대로 파일을 생성한다.
</p>

<h6 class="src" id="DBConnectionPool.java">DBConnectionPool.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionPool {
	private static final Logger logger = Logger.getLogger(DBConnectionPool.class.getName());
	
	// Number of connections currently in use
	private int checkedOut;

	// Free Connection List
	private Vector&lt;Connection&gt; freeConnections = new Vector&lt;Connection&gt;();

	// Maximum number of connections
	private int maxConn;

	// Waiting time (maximum time to wait when there is no connection in the pool)
	private int maxWait;

	// Connection Pool Name
	private String poolName;

	// DB Password
	private String passwd;

	// DB URL
	private String URL;

	// DB UserID
	private String userID;

	// Constructor
	public DBConnectionPool(String poolName, 
			String URL, 
			String userID, 
			String passwd, 
			int maxConn, 
			int initConn, 
			int waitTime) {

		this.poolName = poolName;
		this.URL = URL;
		this.userID = userID;
		this.passwd = passwd;
		this.maxConn = maxConn;
		this.maxWait = waitTime;

		for (int i = 0; i &lt; initConn; i++) {
			freeConnections.addElement(newConnection());
		}
	}

	// Returning Connection
	// @param con : Connection to return
	public synchronized void freeConnection(Connection con) {
		freeConnections.addElement(con);
		checkedOut--;
		//Notify thread waiting to get Connection
		notifyAll();
	}

	// Get Connection
	@SuppressWarnings("resource")
	public synchronized Connection getConnection() {
		Connection con = null;
		//If Connection is in Free List, get the first of List
		if (freeConnections.size() > 0) {
			con = (Connection) freeConnections.firstElement();
			freeConnections.removeElementAt(0);

			try {
				//If the connection is closed by the DBMS, request again
				if (con.isClosed()) {
					logger.log(Level.SEVERE, "Removed bad connection from " + poolName);
					con = getConnection();
				}
			} //If strange connection occurs, request again
			catch (SQLException e) {
				logger.log(Level.SEVERE, "Removed bad connection from " + poolName);
				con = getConnection();
			}
		} //If Connection is not in Free List, create new
		else if (maxConn == 0 || checkedOut &lt; maxConn) {
			con = newConnection();
		}

		if (con != null) {
			checkedOut++;
		}

		return con;
	}

	// Get Connection
	// @param timeout : Maximum Wait Time to Obtain a Connection
	public synchronized Connection getConnection(long timeout) {
		long startTime = new Date().getTime();
		Connection con;
		while ((con = getConnection()) == null) {
			try {
				wait(timeout * maxWait);
			} catch (InterruptedException e) {}
			if ((new Date().getTime() - startTime) >= timeout) {
				//Wait timeout
				return null;
			}
		}

		return con;
	}

	// Get Connection
	private Connection newConnection() {
		Connection con = null;
		try {
			if (userID == null) {
				con = DriverManager.getConnection(URL);
			} else {
				con = DriverManager.getConnection(URL, userID, passwd);
			}
			logger.info("Created a new connection in pool " + poolName);
		} catch (SQLException e) {
			StringBuffer sb = new StringBuffer();
			sb.append("Can't create a new connection for ");
			sb.append(URL);
			sb.append(" user: ");
			sb.append(userID);
			sb.append(" passwd: ");
			sb.append(passwd);
			logger.log(Level.SEVERE, sb.toString());
			return null;
		}

		return con;
	}

}
</pre>

<h6 class="src" id="DBConnectionPoolManager.java">DBConnectionPoolManager.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool;

import java.sql.Connection;
import java.util.Hashtable;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionPoolManager {
	private static final Logger logger = Logger.getLogger(DBConnectionPoolManager.class.getName());
	
	// To apply the singleton pattern to the DBConnectionPoolManager (keep only one instance), 
	// declare it as static
	static private DBConnectionPoolManager instance;
	private Vector&lt;String&gt; drivers = new Vector&lt;String&gt;();
	private Hashtable&lt;String, DBConnectionPool&gt; pools = new Hashtable&lt;String, DBConnectionPool&gt;();

	// Obtaining instance of DBConnectionPoolManager
	// @return DBConnectionManger
	static synchronized public DBConnectionPoolManager getInstance() {
		if (instance == null) {
			instance = new DBConnectionPoolManager();
		}

		return instance;
	}

	// Default Constructor
	private DBConnectionPoolManager() {}

	// Send current Connection to Free Connection List
	// @param name : Pool Name
	// @param con : Connection
	public void freeConnection(String name, Connection con) {
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) {
			pool.freeConnection(con);
		}

		logger.info("One Connection of " + name + " was freed");
	}

	// Obtain Open Connection.
	// Creates a new connection if there are no open connections and the maximum number 
	// of connections has not been reached.
	// Waits for the default wait time when there are no open connections currently 
	// and the maximum number of connections is in use.
	// @param name : Pool Name
	// @return Connection : The connection or null
	public Connection getConnection(String name) {
		DBConnectionPool pool = (DBConnectionPool) pools.get(name);
		if (pool != null) {
			return pool.getConnection(10);
		}
		return null;
	}

	// Create a Connection Pool
	// @param poolName : Name of Pool to create
	// @param url : DB URL
	// @param userID : DB UserID
	// @param passwd : DB Password
	private void createPools(String poolName, 
			String url, 
			String userID,
			String passwd, 
			int maxConn, 
			int initConn, 
			int maxWait) {

		DBConnectionPool pool = new DBConnectionPool(poolName, url, userID, passwd, maxConn, initConn, maxWait);
		pools.put(poolName, pool);
		logger.info("Initialized pool " + poolName);
	}

	// Initialization
	public void init(String poolName, 
			String driver, 
			String url,
			String userID, 
			String passwd, 
			int maxConn, 
			int initConn, 
			int maxWait) {

		loadDrivers(driver);
		createPools(poolName, url, userID, passwd, maxConn, initConn, maxWait);
	}

	// JDBC Driver Loading
	// @param driverClassName : The JDBC driver for the DB you want to use.
	private void loadDrivers(String driverClassName) {
		try {
			Class.forName(driverClassName);
			drivers.addElement(driverClassName);
			logger.info("Registered JDBC driver " + driverClassName);
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Can't register JDBC driver: " + driverClassName);
		}
	}

	public Hashtable&lt;String,DBConnectionPool&gt; getPools() {
		return pools;
	}
	
	public int getDriverNumber() {
		return drivers.size();
	}

}
</pre>

<h6 class="src" id="ConnectionManager.java">ConnectionManager.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool;

import java.sql.Connection;

public abstract class ConnectionManager {

	protected DBConnectionPoolManager poolManager;
	protected String poolName;
	
	public ConnectionManager() {
		this.poolManager = DBConnectionPoolManager.getInstance();
	}
	
	public Connection getConnection() {
		return (poolManager.getConnection(poolName));
	}

	public void freeConnection(Connection con) {
		poolManager.freeConnection(poolName, con);
	}
	
	public abstract void initPoolManager(String poolName, String driver, String url, 
			String userID, String passwd, int maxConn, int initConn, int maxWait);
	
	public int getDriverNumber() {
        return poolManager.getDriverNumber();
    }

}
</pre>

<h6 class="src" id="OracleConnectionManager.java">OracleConnectionManager.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool.oracle;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.java_school.db.dbpool.ConnectionManager;

public class OracleConnectionManager extends ConnectionManager {
	private static final Logger logger = Logger.getLogger(OracleConnectionManager.class.getName());

	public OracleConnectionManager() {
		this.poolName = "oracle";
		String configFile = "oracle.properties";
		
		ClassLoader resource = this.getClass().getClassLoader();
		URL path = resource.getResource(configFile);
		
		try {
			Properties prop = new Properties();
			FileInputStream inputStream = new FileInputStream(new File(path.getFile()));
			prop.load(inputStream);
					
			String dbServer = prop.getProperty("dbServer");
			String port = prop.getProperty("port");
			String dbName = prop.getProperty("dbName");
			String userID = prop.getProperty("userID");
			String passwd = prop.getProperty("passwd");
			int maxConn = Integer.parseInt(prop.getProperty("maxConn"));
			int initConn = Integer.parseInt(prop.getProperty("initConn"));
			int maxWait = Integer.parseInt(prop.getProperty("maxWait"));
			String driver = "oracle.jdbc.driver.OracleDriver";
			String JDBCDriverType = "jdbc:oracle:thin";
			String url = JDBCDriverType + ":@" + dbServer + ":" + port + ":" + dbName;
			
			initPoolManager(this.poolName, driver, url, userID, passwd, maxConn, initConn, maxWait);
		} catch (IOException e) {
			logger.log(Level.SEVERE, "Error reading properties of " + configFile);
			throw new RuntimeException(e);
		}

	}

	@Override
	public void initPoolManager(String poolName, String driver, String url, 
			String userID, String passwd, int maxConn, int initConn, int maxWait) {
		this.poolManager.init(poolName, driver, url, userID, passwd, maxConn, initConn, maxWait);
	}

}
</pre>

<h6 class="src" id="MySqlConnectionManager.java">MySqlConnectionManager.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool.mysql;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.java_school.db.dbpool.ConnectionManager;

public class MySqlConnectionManager extends ConnectionManager {
	
	private static final Logger logger = Logger.getLogger(MySqlConnectionManager.class.getName());

	public MySqlConnectionManager() {
		this.poolName = "mysql";
		String configFile = "mysql.properties";
		
		ClassLoader resource = this.getClass().getClassLoader();
		URL path = resource.getResource(configFile);

		try {
			Properties prop = new Properties();
			FileInputStream inputStream = new FileInputStream(new File(path.getFile()));
			prop.load(inputStream);
		
			String dbServer = prop.getProperty("dbServer");
			String port = prop.getProperty("port");
			String dbName = prop.getProperty("dbName");
			String userID = prop.getProperty("userID");
			String passwd = prop.getProperty("passwd");
			int maxConn = Integer.parseInt(prop.getProperty("maxConn"));
			int initConn = Integer.parseInt(prop.getProperty("initConn"));
			int maxWait = Integer.parseInt(prop.getProperty("maxWait"));
			String driver = "com.mysql.jdbc.Driver";
			String JDBCDriverType = "jdbc:mysql";
			String url = JDBCDriverType + "://" + dbServer + ":" + port + "/" + 
				dbName + "?useUnicode=true&amp;characterEncoding=UTF-8&amp;useSSL=false";
				
			initPoolManager(this.poolName, driver, url, userID, passwd, maxConn, initConn, maxWait);
		} catch (IOException e) {
			logger.log(Level.SEVERE, "Error reading properties of " + configFile);
			throw new RuntimeException(e);
		}

	}
	
	@Override
	public void initPoolManager(String poolName, String driver, String url, 
			String userID, String passwd, int maxConn, int initConn, int maxWait) {
		this.poolManager.init(poolName, driver, url, userID, passwd, maxConn, initConn, maxWait);
	}

}
</pre>

<h6 class="src" id="oracle.properties">oracle.properties</h6>
<pre class="prettyprint">
############################################ 
# Database Connection Properties for Oracle
############################################ 

# Database Server Name OR IP address 
dbServer = 127.0.0.1

# The port number your DB server listents to. 
port = 1521

# Database Name 
dbName = XE

# Database User 
userID = scott

# Database Password 
passwd = tiger

# Maximum Connection Number 
maxConn = 20

# Inital Connection Number 
initConn = 5

# Maximum Wait Time 
maxWait = 5
</pre>

<h6 class="src" id="mysql.properties">mysql.properties</h6>
<pre class="prettyprint">
############################################ 
# Database Connection Properties for MySQL
############################################ 

# Database Server Name OR IP address 
dbServer = localhost

# The port number your DB server listents to. 
port = 3306

# Database Name 
dbName = xe

# Database User 
userID = scott

# Database Password 
passwd = tiger

# Maximum Connection Number 
maxConn = 20

# Inital Connection Number 
initConn = 5

# Maximum Wait Time 
maxWait = 5
</pre>

<p>
MySQL에 접속하여 다음을 실행한다.
</p>

<pre class="prettyprint">
mysql --user=root --password mysql

create user 'scott'@'%' identified by 'tiger';
grant all privileges on *.* to 'scott'@'%';

create database xe;
exit;

mysql --user=scott --password xe

CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE TINYINT,
    LOSAL SMALLINT,
    HISAL SMALLINT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
exit;
</pre>

<h6 class="src" id="GetEmp.java">GetEmp.java</h6>
<pre class="prettyprint">
package net.java_school.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.java_school.db.dbpool.mysql.MySqlConnectionManager;
import net.java_school.db.dbpool.oracle.OracleConnectionManager;

public class GetEmp {

	public static void main(String[] args) {

		OracleConnectionManager oracleConnectionManager = new OracleConnectionManager();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM EMP";

		try {
			con = oracleConnectionManager.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				String empno = rs.getString(1);
				String ename = rs.getString(2);
				String job = rs.getString(3);
				String mgr = rs.getString(4);
				String hiredate = rs.getString(5);
				String sal = rs.getString(6);
				String comm = rs.getString(7);
				String depno = rs.getString(8);

				System.out.println(empno + " : " + ename + " : " + job + " : " + 
					mgr + " : " + hiredate + " : " + sal + " : " + comm + " : " + depno);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {}
			try {
				stmt.close();
			} catch (SQLException e) {}
			oracleConnectionManager.freeConnection(con);
		}
		
		MySqlConnectionManager mysqlConnectionManager = new MySqlConnectionManager();
		
		try {
			con = mysqlConnectionManager.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				String empno = rs.getString(1);
				String ename = rs.getString(2);
				String job = rs.getString(3);
				String mgr = rs.getString(4);
				String hiredate = rs.getString(5);
				String sal = rs.getString(6);
				String comm = rs.getString(7);
				String depno = rs.getString(8);

				System.out.println(empno + " : " + ename + " : " + job + " : " + 
					mgr + " : " + hiredate + " : " + sal + " : " + comm + " : " + depno);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {}
			try {
				stmt.close();
			} catch (SQLException e) {}
			mysqlConnectionManager.freeConnection(con);
		}
		
		System.out.println("Driver Number: " + mysqlConnectionManager.getDriverNumber());
		
	}
}
</pre>

<p>
<a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox" id="ojdbc6.jar">Oracle JDBC Driver Download</a><br />
<a href="https://dev.mysql.com/downloads/file/?id=509727" id="mysql-connector-java-8.0.28.jar">MySQL JDBC Driver Download</a><br />
각 링크에서 내려받은 JDBC 드라이버를 jars/ 폴더에 복사한다.
</p>

<h4>윈도에서 테스트</h4>

<p>
dir 명령을 실행할 때 아래처럼 보이는 디렉터리에서 이어지는 명령을 실행한다.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen"> Volume in drive H has no label.
 Volume Serial Number is 26D8-3E15

 Directory of H:\this-is-not-modules-example

03/05/2020  05:41 AM    &lt;DIR&gt;          .
03/05/2020  05:41 AM    &lt;DIR&gt;          ..
03/05/2020  05:35 AM    &lt;DIR&gt;          jars
03/05/2020  05:35 AM    &lt;DIR&gt;          src

</pre>

<p>
바이트 코드가 만들어지는 디렉터리를 생성한다.
--리눅스에서 javac는 -d 옵션 다음에 나오는 디렉터리가 없으면 만들지만, 윈도에서 javac는 그렇지 않다-- 
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mkdir out
</pre>

<p>
컴파일
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -d out src/net/java_school/db/dbpool/*.java
javac -d out src/net/java_school/db/dbpool/oracle/OracleConnectionManager.java
javac -d out src/net/java_school/db/dbpool/mysql/MySqlConnectionManager.java
javac -d out src/net/java_school/test/GetEmp.java
</pre>

<p>
프로퍼티 파일을 out 디렉터리에 복사
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">xcopy src\*.properties out
</pre>

<p>
실행
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=jars/ojdbc6.jar;jars/mysql-connector-java-8.0.28.jar;out
java net.java_school.test.GetEmp
</pre>

<h4>리눅스에서 테스트</h4>

<p>
ls 명령을 실행할 때 아래처럼 출력되는 디렉터리에서 이어지는 명령을 실행한다.
</p>

<pre class="shell-prompt">
jars  src
</pre>

<p>
컴파일
</p>

<pre class="shell-prompt">
javac -d out -sourcepath src $(find src -name "*.java")
</pre>

<p>
프로퍼티 파일을 out 디렉터리에 복사
</p>

<pre class="shell-prompt">
cp $(find src -name '*.properties') out
</pre>

<p>
실행
</p>

<pre class="shell-prompt">
CP=jars/ojdbc6.jar
CP+=:jars/mysql-connector-java-8.0.28.jar
java -cp $CP:out net.java_school.test.GetEmp
</pre>

<pre class="result">
<span style="color: red;">Sep 17, 2019 11:46:41 AM net.java_school.db.dbpool.DBConnectionPoolManager loadDrivers
INFO: Registered JDBC driver oracle.jdbc.driver.OracleDriver
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool oracle
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool oracle
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool oracle
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool oracle
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool oracle
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPoolManager createPools
INFO: Initialized pool oracle</span>
7369 : SMITH : CLERK : 7902 : 1980-12-17 00:00:00 : 800 : null : 20
7499 : ALLEN : SALESMAN : 7698 : 1981-02-20 00:00:00 : 1600 : 300 : 30
7521 : WARD : SALESMAN : 7698 : 1981-02-22 00:00:00 : 1250 : 500 : 30
7566 : JONES : MANAGER : 7839 : 1981-04-02 00:00:00 : 2975 : null : 20
7654 : MARTIN : SALESMAN : 7698 : 1981-09-28 00:00:00 : 1250 : 1400 : 30
7698 : BLAKE : MANAGER : 7839 : 1981-05-01 00:00:00 : 2850 : null : 30
7782 : CLARK : MANAGER : 7839 : 1981-06-09 00:00:00 : 2450 : null : 10
7788 : SCOTT : ANALYST : 7566 : 1987-07-13 00:00:00 : 3000 : null : 20
7839 : KING : PRESIDENT : null : 1981-11-17 00:00:00 : 5000 : null : 10
7844 : TURNER : SALESMAN : 7698 : 1981-09-08 00:00:00 : 1500 : 0 : 30
7876 : ADAMS : CLERK : 7788 : 1987-07-13 00:00:00 : 1100 : null : 20
7900 : JAMES : CLERK : 7698 : 1981-12-03 00:00:00 : 950 : null : 30
7902 : FORD : ANALYST : 7566 : 1981-12-03 00:00:00 : 3000 : null : 20
7934 : MILLER : CLERK : 7782 : 1982-01-23 00:00:00 : 1300 : null : 10
<span style="color: red;">Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPoolManager freeConnection
INFO: One Connection of oracle was freed
Sep 17, 2019 11:46:42 AM net.java_school.db.dbpool.DBConnectionPoolManager loadDrivers
INFO: Registered JDBC driver com.mysql.jdbc.Driver
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool mysql
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool mysql
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool mysql
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool mysql
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPool newConnection
INFO: Created a new connection in pool mysql
Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPoolManager createPools
INFO: Initialized pool mysql</span>
7369 : SMITH : CLERK : 7902 : 1980-12-17 : 800.00 : null : 20
7499 : ALLEN : SALESMAN : 7698 : 1981-02-20 : 1600.00 : 300.00 : 30
7521 : WARD : SALESMAN : 7698 : 1981-02-22 : 1250.00 : 500.00 : 30
7566 : JONES : MANAGER : 7839 : 1981-04-02 : 2975.00 : null : 20
7654 : MARTIN : SALESMAN : 7698 : 1981-09-28 : 1250.00 : 1400.00 : 30
7698 : BLAKE : MANAGER : 7839 : 1981-05-01 : 2850.00 : null : 30
7782 : CLARK : MANAGER : 7839 : 1981-06-09 : 2450.00 : null : 10
7788 : SCOTT : ANALYST : 7566 : 1987-06-28 : 3000.00 : null : 20
7839 : KING : PRESIDENT : null : 1981-11-17 : 5000.00 : null : 10
7844 : TURNER : SALESMAN : 7698 : 1981-09-08 : 1500.00 : 0.00 : 30
7876 : ADAMS : CLERK : 7788 : 1987-07-13 : 1100.00 : null : 20
7900 : JAMES : CLERK : 7698 : 1981-12-03 : 950.00 : null : 30
7902 : FORD : ANALYST : 7566 : 1981-12-03 : 3000.00 : null : 20
7934 : MILLER : CLERK : 7782 : 1982-01-23 : 1300.00 : null : 10
<span style="color: red;">Sep 17, 2019 11:46:43 AM net.java_school.db.dbpool.DBConnectionPoolManager freeConnection
INFO: One Connection of mysql was freed</span>
Driver Number: 2
</pre>

<h3>모듈로 분해</h3>

<p>
모듈로 나누는 데 있어 정답은 없다.<br />
예제를 아래처럼 모듈화할 것이다.
</p>

<pre style="border: 2px dotted #333;padding: 0.5em;">
1st module : net.java_school.db.dbpool (Module Name)
DBConnectionPool.java
DBConnectionPoolManager.java
ConnectionManager.java
</pre>
<pre style="border: 2px dotted #333;padding: 0.5em;">
2nd module : net.java_school.db.dbpool.oracle
OracleConnectionManager.java
oracle.properties
</pre>
<pre style="border: 2px dotted #333;padding: 0.5em;">
3rd module : net.java_school.db.dbpool.mysql
MySqlConnectionManager.java
mysql.properties
</pre>
<pre style="border: 2px dotted #333;padding: 0.5em;">
4th module : main.app
GetEmp.java
</pre>
<pre style="border: 2px dotted #333;padding: 0.5em;">
5th module
ojdbc6.jar
</pre>
<pre style="border: 2px dotted #333;padding: 0.5em;">
6th module
mysql-connector-java-8.0.28.jar
</pre>

<p>
디렉터리 구조를 아래와 같이 변경한다.<br />
src/ 바로 아래, 모듈 이름의 폴더가 있어야 한다.
</p>

<pre lang="en">
src/
├── net.java_school.db.dbpool (Module Name)
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               ├── DBConnectionPool.java
│   │               ├── DBConnectionPoolManager.java
│   │               └── ConnectionManager.java
│   └── <a href="#first-module-info.java">module-info.java</a>
├── net.java_school.db.dbpool.oracle
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               └── oracle
│   │                   └── OracleConnectionManager.java
│   ├── <a href="#second-module-info.java">module-info.java</a>
│   └── oracle.properties
├── net.java_school.db.dbpool.mysql
│   ├── net
│   │   └── java_school
│   │       └── db
│   │           └── dbpool
│   │               └── mysql
│   │                   └── MySqlConnectionManager.java
│   ├── <a href="#third-module-info.java">module-info.java</a>
│   └── mysql.properties
├── main.app
│   ├── net
│   │   └── java_school
│   │       └── test
│   │            └── GetEmp.java
│   └── <a href="#fourth-module-info.java">module-info.java</a>
jars/
├── ojdbc6.jar
└── mysql-connector-java-8.0.28.jar
</pre>

<h4>1st Module : net.java_school.db.dbpool</h4>

<p>
src/net.java_school.db.dbpool 폴더에 모듈 디스트립터를 다음과 같이 생성한다.  
</p>

<h6 class="src" id="first-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module net.java_school.db.dbpool {
	requires java.logging;
	requires transitive java.sql;
	
	exports net.java_school.db.dbpool;
}
</pre>

<p>
모듈 디스크립터는 클래스 파일이지만 일반적인 클래스 파일은 아니다.<br />
모듈 디스크립터 내용은 module로 시작한다. module 다음에 모듈 이름이 온다.<br />
모듈 이름 다음에 블록<sup>{  }</sup>이 시작된다.<br /> 
블록 안에 이 모듈이 필요로 하는 다른 모듈과 이 모듈이 익스포트 하는 패키지를 정의한다.
</p>

<p>
requires <em>modulename</em>;<br />
이 모듈이 사용하는 외부 모듈
</p>

<p>
requires <em>transitive</em> java.sql;<br />
이 모듈은 java.sql 모듈을 사용한다.<br />
거기에 더하여, 외부 모듈이 이 모듈을 사용하면<sup>requires</sup>, 그 외부 모듈은 java.sql 모듈도 자동으로 사용할 수 있게 된다.
</p>

<p>
exports <em>package</em>;<br />
이 모듈이 익스포트 하는 패키지<br />
</p>

<dl class="note">
<dt>
A 모듈이 B 모듈을 requires 한다고 해도, A 모듈은 B 모듈이 exports 하는 패키지의 public 요소만 사용할 수 있다.
</dt>
</dl>

<h4>2nd Module : net.java_school.db.dbpool.oracle</h4>

<p>
src/net.java_school.db.dbpool.oracle 폴더에 모듈 디스트립터를 생성한다.  
</p>

<h6 class="src" id="second-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module net.java_school.db.dbpool.oracle {
	requires net.java_school.db.dbpool;
	
	exports net.java_school.db.dbpool.oracle;
}
</pre>

<h4>3rd Module : net.java_school.db.dbpool.mysql</h4>

<p>
src/net.java_school.db.dbpool.mysql 폴더에 모듈 디스트립터를 생성한다.  
</p>

<h6 class="src" id="third-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module net.java_school.db.dbpool.mysql {
	requires net.java_school.db.dbpool;
	
	exports net.java_school.db.dbpool.mysql;
}
</pre>

<h4>4th Module : main.app</h4>

<p>
src/main.app 폴더에 모듈 디스트립터를 생성한다. 
</p>

<h6 class="src" id="fourth-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module main.app {
	requires java.sql;
	requires net.java_school.db.dbpool.oracle;
	requires net.java_school.db.dbpool.mysql;
}
</pre>

<p>
이후 설명 중에 나오는 모듈 이름에서 도메인 부분(net.java_school.)은 생략하겠다.<br />
모듈 디스크립터에 의해 모듈 간 관계는 아래 그림처럼 설정된다.<br />
<img src="https://lh3.googleusercontent.com/CbAUTlrRZbucK1xF4Yr9YqW6Zjx8zywXw3VoUIjJDt641lTFR4fbu42hxzj-xirWDKJhlgwVgOEgrtPsxi7rvm6BAsI4i7xiqaITXuaGkrvmEfvQyt83EwlIPapv8ZBhvldpNDG3OoaBhKe85xdK-wBmGADdUWI7WtP6YY5pI2-4pR-67ACm0KwdS9EBduJ6it1cS2t6jmFilvrH0BggBgIZylgSceyfllZEW8MbrJkxv7fO1OZZjPv2t_FDu-RBiHVdfEZS8JZLrVFqAotc49O4kuIxJ0cqEhmGuRqZNSF1GEAnTqJo8Ey2aCsweyakI2dvSN0e07sAHyl28gv0OpTLui0CundFFZo3OtPCxAsDioZalM73r0QY7jJuHU5ftZstnQt1skEQiyDoSkXSoM0Cz-41I51n60xuxMjg9sMopMk2dwS4xOA91GZUBXcEt4nxmdnsVObYi888JXGUAXooa4jXgFLaSVxcQn-X7LKuuNDwIjWwXjK_NJZC-Yzz3XTMtIbALOr4b_SOXd0WEdhPfSVd5CKli3ZNSdI2M3cYQ4RTVYBIo6zXIO-UcErOezxnIOwoOh15gRK0431ByjoS4ws43DASCwguKbR8Xs772J8S0HOsa-w0ItrplQH04pCcJ4iE86wnZO3JaPw1nYwiV6B5A5iMVQYzFIQDTqPzSSFQoX2uX2AQXNX2=w1813-h668-no" alt="java modules 1" />
</p>

<p>
모듈에 속한 클래스로부터 모듈을 대표하는 java.lang.Module 을 얻을 수 있다.<br />
Module은 절대 경로를 사용하므로 경로에 슬래시<sup>/</sup>를 사용하지 않는다.<br />
모듈 루트에 설정 파일이 있으면 경로에 파일 이름만 입력하면 된다.<br />
oracle.properties 와 mysql.properties 파일은 모듈의 루트 디렉터리에 있다.<br />
프로퍼티 파일을 로딩하는 코드를 아래처럼 수정한다.
</p>

<h6 class="src">OracleConnectionManager.java</h6>
<pre class="prettyprint">
public OracleConnectionManager() {
	this.poolName = "oracle";
	String configFile = "oracle.properties";

	<b>Class&lt;?&gt; clazz = OracleConnectionManager.class;
	Module m = clazz.getModule();</b>

	try {
		<b>InputStream inputStream = m.getResourceAsStream(configFile);</b>
		Properties prop = new Properties();
		prop.load(inputStream);
		
		//..Omit..

</pre>

<h6 class="src">MySqlConnectionManager.java</h6>
<pre class="prettyprint">
public MySqlConnectionManager() {
	this.poolName = "mysql";
	String configFile = "mysql.properties";

	<b>Class&lt;?&gt; clazz = MySqlConnectionManager.class;
	Module m = clazz.getModule();</b>

	try {
		<b>InputStream inputStream = m.getResourceAsStream(configFile);</b>
		Properties prop = new Properties();
		prop.load(inputStream);
		
		//..Omit..

</pre>

<h4>윈도에서 테스트</h4>

<p>
컴파일
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -d out --module-source-path src ^
-m main.app,net.java_school.db.dbpool, ^
net.java_school.db.dbpool.oracle,net.java_school.db.dbpool.mysql
</pre>

<p>
--module-source-path : 모듈 소스 위치<br />
-m : 컴파일 대상 모듈 리스트
</p>

<p>
프로퍼티 파일 복사
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\net.java_school.db.dbpool.oracle\oracle.properties ^
out\net.java_school.db.dbpool.oracle\
copy src\net.java_school.db.dbpool.mysql\mysql.properties ^
out/net.java_school.db.dbpool.mysql\
</pre>

<p>
실행
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">java -p jars:out -m main.app/net.java_school.test.GetEmp
</pre>

<p>
-p : 모듈 패스<br />
-m : 실행할 모듈, -m 다음에는 <strong>모듈 이름/실행될 클래스</strong> 가 온다. 모듈형 jar는 모듈 이름만 입력한다.
</p>

<p>
모듈 패스에 있는 모듈형 jar가 아닌 jar는 모두 자동 모듈<sup>Automatic Modules</sup>이 된다.<br />
자동 모듈은 다른 모든 모듈에 대해서 requires transitive <strong>다른_모듈</strong>; 관계라고 해석된다.<br />
자동 모듈은 자신의 모든 패키지를 익스포트 한다.
</p>

<h4>리눅스에서 테스트</h4>

<p>
컴파일
</p>

<pre class="shell-prompt">
javac -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
프로퍼티 파일 복사
</p>

<pre class="shell-prompt">
cp src/net.java_school.db.dbpool.oracle/oracle.properties \
out/net.java_school.db.dbpool.oracle/
cp src/net.java_school.db.dbpool.mysql/mysql.properties \
out/net.java_school.db.dbpool.mysql/
</pre>

<p>
실행
</p>

<pre class="shell-prompt">
java -p jars:out -m main.app/net.java_school.test.GetEmp
</pre>

<h3>ServiceLoader 사용하기</h3>

<p>
모듈을 채택하면서 모듈 시스템을 지원하는 기능이 추가되었다.<br />
새로운 ServiceLoader를 사용하면 서비스와 서비스 구현을 각각의 모듈로 구성할 수 있다.<br />
여기서 서비스는, 스프링 프로젝트에서 서비스 컴포넌트를 떠올리면 쉽게 이해할 수 있다.<br />
서비스는 대부분 인터페이스다.<br />
모듈 디스크립터를 편집해, ServiceLoader로 하여금 런타임에 서비스 구현을 로드하도록 할 수 있다.
</p>

<p>
main.app 모듈은 uses 키워드를 사용해 ConnectionManager를 서비스로 사용한다고 선언한다.
--ConnectionManager는 추상 클래스다. 추상 클래스나 구현 클래스도 서비스가 될 수 있다--
</p>

<pre class="prettyprint">
module main.app {
  requires net.java_school.db.dbpool;
  
  <strong>uses net.java_school.db.dbpool.ConnectionManager;</strong>
}
</pre>

<p>
db.dbpool.oracle 모듈은 provides <strong>서비스</strong> with <strong>구현 클래스</strong> 를 사용해,
ConnectionManager 서비스의 구현으로 OracleConnectionManager를 제공한다고 선언한다.  
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool.oracle {
  requires net.java_school.db.dbpool;
  
  <strong>provides net.java_school.db.dbpool.ConnectionManager 
      with net.java_school.db.dbpool.oracle.OracleConnectionManager;</strong>
}
</pre>

<p>
마찬가지로, db.dbpool.mysql 모듈 디스크립터를 수정한다.
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool.mysql {
  requires net.java_school.db.dbpool;
  
  <strong>provides net.java_school.db.dbpool.ConnectionManager 
      with net.java_school.db.dbpool.mysql.MySqlConnectionManager;</strong>
}
</pre>

<p>
모듈 디스크립터에 의해 모듈 간 관계는 아래 그림처럼 설정된다.<br />
<img src="https://lh3.googleusercontent.com/am5o5bfYEZLwAe7F6NkvjzL41WJ8gPs9Y3M1meeZZEmQw5bEGBqCydzb314fF-4yzh4QK0x2YZAqL7SpuWMd7QPPUVmuiv9qHoOALBWT2PWCcqzb71K2_Oyyx-bZsKBf1tfjwR-HxBz-9eITjmaaFeH56UO4SFi4pzjuFU9zYYAEaLukUiY5NGrP2r5UsywOlsH2xlpD-2qYxitH2tNzZaDhScFL3ClxpYtAhQCBuZ_a4f8in8r2PWKfHYl_ElKCJxaXDYF7NnJBjAnQs3zzWFJ1ECkn7PjM5QII2ab_8jy9CfGx_clnfu0b5r1QK9xy30UYtS0sjlYt_1uBILRF_xsD4b7tV5VxaKF50CWV-OZEo1ZIVLDfgUBNaJC1g6za8Y-Xr3nZ34Rmo-BnGwgliATTKcpeOCe5pNCaKmMQaQ7GDtG4Q9zjzxCEyxZubEXUjFQut7k2u_TfVHBCFP2nJKIydmGsHt51sG2vvaWUQrCG1KQb0tC4BltMgEs2nYVddf51OHkIXjAVVkb1Ggf7gM4HWOI89tTVmQb3yOeniAATG-YmUVGY7l-aUYHAZGw09EpHrDznO6FG5jKMLk7XWPgZgbvltwmmR5wz4cBvxUDNZednm_lU1r22m-38GQpXG7I8Lz-jlBky3j4LAjTIGWIswSpbR4B1V7TpsHlrSuZoVDnT9o3WB9QWLWQPGg=w1897-h834-no" alt="java modules 2" />
</p>

<p>
서비스 구현을 제공하는 모듈에서 자신의 어떤 패키지도 익스포트하지 않았다는 점에 주목하자.<br />
main.app 모듈의 GetEmp 클래스는 이전과 달리 서비스 구현 모듈의 어떤 타입도 코드에 사용할 수 없다.<br />
수정된 GetEmp 클래스에서 확인한다.
</p>

<pre class="prettyprint">
package net.java_school.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
<b>import java.util.ServiceLoader;</b>

import net.java_school.db.dbpool.ConnectionManager;

public class GetEmp {

  public static void main(String[] args) {

    <b>Iterable&lt;ConnectionManager&gt; managers = ServiceLoader.load(ConnectionManager.class);</b>
		
    <b>for (ConnectionManager manager : managers) {</b>
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;

      //.. Omit ..
      			
    <b>}</b>

  }

}
</pre>

<p>
이제 서비스와 구현이 각각의 모듈로 완벽하게 분리되어 있다.<br />
GetEmp 클래스 코드는 db.dbpool.oracle과 db.dbpool.mysql 모듈의 어떤 타입도 사용하지 않는다.<br />
db.dbpool.oracle과 db.dbpool.mysql 모듈 중 하나만 있어도 main.app 모듈을 실행할 수 있다.<br />
실행은 안 되지만 구현 모듈을 모두 제거해도 컴파일엔 성공한다.<br />
모듈 패스에 Microsoft SQL Server 데이터베이스를 다루는 모듈을 만든다면, main.app 모듈은 수정 없이 동작한다.
</p>

<p>
java.sql 모듈 디스크립터에는 uses java.sql.Driver; 라고 선언되어 있다.<br />
JDBC 드라이버 모듈은 디스크립터에 provides java.sql.Driver with <strong>구현_클래스</strong>; 라고 선언해야 한다.<br />
JDBC 드라이버 모듈을 모듈 패스에 두면 <strong>구현_클래스</strong>는 서비스 바인딩 된다.<br />
서비스 바인딩이란 런타임에 SerivceLoader가 모듈 디스크립터를 참조해 구현을 인스턴스 화하는 것을 말한다.<br />
그런데 예제에서 사용한 JDBC 드라이버는 모두 모듈이 아니다.<br />
그런데도 서비스 바인딩이 된다.<br />
이 점에서 자바가 편의를 제공했다고 생각한다.<br />
모듈화했는데 데이터베이스 연동이 안 된다면 자바에 대한 신뢰가 무너질 것이다.<br />
JDBC 드라이버를 모듈 패스가 아닌 클래스 패스에 둬도 예제는 실행된다.
</p>

<h3>서비스 필터링</h3>

<p>
ServiceLoader를 사용하면 모듈 패스에 있는 서비스 구현을 모두 서비스 바인딩한다.
이 동작을 컨트롤할 수 있는 기능이 ServiceLoader에 없다.
GetEmp에서 서비스 바인딩 대상인 OracleConnectionManager 와 MySqlConnectionManager 중 OracleConnectionManager 만 사용하고 싶다면,
서비스 구현이 인스턴스 화하기 전에 서비스를 필터링하면 된다.
인스턴스 화하기 전 필터링이므로 클래스 차원의 정보를 서비스 구현 클래스에 추가해야 한다. 
</p>

<p>
db.dbpool 모듈에 다음 어노테이션을 생성한다.<br />
이 어노테이션을 OracleConnectionManager 서비스 구현 클래스에 추가되는 클래스 차원의 정보로 사용하려 한다. 
</p>

<pre class="prettyprint">
package net.java_school.db.dbpool;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Oracle {
  public boolean value() default true;
}
</pre>

<p>
db.dbpool.oracle 모듈의 OracleConnectionManager 클래스에 Oracle 어노테이션을 추가한다.
</p>

<pre class="prettyprint">
<b>import net.java_school.db.dbpool.Oracle;</b>

<b>@Oracle</b>
public class OracleConnectionManager extends ConnectionManager {
  //..
}
</pre>

<p>
GetEmp 클래스를 수정한다.
</p>

<pre class="prettyprint">
import net.java_school.db.dbpool.ConnectionManager;
<b>import net.java_school.db.dbpool.Oracle;</b>

public class GetEmp {

	public static void main(String[] args) {

		<b>ServiceLoader&lt;ConnectionManager&gt;</b> managers = ServiceLoader.load(ConnectionManager.class);
		
		<b>ConnectionManager manager = managers.stream()
				.filter(provider -&gt; isOracle(provider.type())) //1.
				.map(ServiceLoader.Provider::get).findAny().get();</b> //2.

        //.. Omit.. 
	}
	<b>
	private static boolean isOracle(Class&lt;?&gt; clazz) {
		return clazz.isAnnotationPresent(Oracle.class)
				&amp;&amp; clazz.getAnnotation(Oracle.class).value() == true;
	}
	</b>
}
</pre>

<ol>
	<li>type() 메소드를 통해서 클래스 정보<sup>java.lang.Class</sup>를 얻는다. 클래스 정보를 isOracle() 메소드에 전달해 서비스 구현을 필터링한다.</li>
	<li>ServiceLoader의 Provider 클래스를 사용해 필터링 된 서비스 구현을 인스턴스 화한다.</li>
</ol>

<p>
Oracle 어노테이션이 db.dbpool 모듈에 있어야 한다는 점이 마음에 들지 않는다.<br />
다음 예에서 이 점을 개선하자.
</p>

<h3>인터페이스 추가</h3>

<p>
db.dbpool.api 모듈을 새로 만들고, ConnectionManageable 인터페이스를 아래와 같이 생성한다.
</p>

<h6 class="src">ConnectionManageable.java</h6>
<pre class="prettyprint">
package net.java_school.db.dbpool.api;

import java.sql.Connection;

public interface ConnectionManageable {
	
  public Connection getConnection();

  public void freeConnection(Connection con);

  public int getDriverNumber();

}
</pre>

<p>
db.dbpool 모듈의 ConnectionManager 추상 클래스가 db.dbpool.api 모듈의 ConnectionManageable 인터페이스를 구현하게 한다.
</p>

<pre class="prettyprint">
package net.java_school.db.dbpool;

import java.sql.Connection;

<b>import net.java_school.db.dbpool.api.ConnectionManageable;</b>

public abstract class ConnectionManager <b>implements ConnectionManageable</b> {

  protected DBConnectionPoolManager poolManager;
  protected String poolName;

  public ConnectionManager() {
    this.poolManager = DBConnectionPoolManager.getInstance();
  }

  <b>@Override</b>	
  public Connection getConnection() {
    return (poolManager.getConnection(poolName));
  }

  <b>@Override</b>
  public void freeConnection(Connection con) {
    poolManager.freeConnection(poolName, con);
  }

  public abstract void initPoolManager(String poolName, String driver, String url, 
      String userID, String passwd, int maxConn, int initConn, int maxWait);

  <b>@Override</b>	
  public int getDriverNumber() {
    return poolManager.getDriverNumber();
  }

}
</pre>

<p>
db.dbpool.api 모듈의 모듈 디스크립터를 생성한다.
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool.api {
  requires transitive java.sql;
  
  exports net.java_school.db.dbpool.api;
}
</pre>

<p>
기존 모듈 디스크립터를 수정한다.
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool {
  requires <b>transitive net.java_school.db.dbpool.api</b>;
  
  exports net.java_school.db.dbpool;
}
</pre>

<pre class="prettyprint">
module net.java_school.db.dbpool.mysql {
  requires net.java_school.db.dbpool;
  
  provides <b>net.java_school.db.dbpool.api.ConnectionManageable</b>
      with net.java_school.db.dbpool.mysql.MySqlConnectionManager;
}
</pre>

<pre class="prettyprint">
module net.java_school.db.dbpool.oracle {
  requires net.java_school.db.dbpool;
  
  provides <b>net.java_school.db.dbpool.api.ConnectionManageable</b>
      with net.java_school.db.dbpool.oracle.OracleConnectionManager;
}
</pre>

<pre class="prettyprint">
module main.app {
  requires <b>net.java_school.db.dbpool.api</b>;
  
  uses <b>net.java_school.db.dbpool.api.ConnectionManageable</b>;
}
</pre>

<p>
모듈 간 관계는 아래 그림처럼 설정된다.<br />
<img src="https://lh3.googleusercontent.com/iud-JqLIuK4XqwL_dZYzCHShuHGph_hhVsmc5MEg_nBYFK0bXfRSb9LfEjoIUzgyuL7-uv78vELnGqkTxG_vdbl20FUyEVolZkBYpfKl-mtOc0GwsLfAeUtkrP7JXS_r5AE8eEJOWZFoaHKFj2aJ4VkW_3Ax5YDRQ0xLxyG5ZIaFwnXwRIMuHLOff_tP5CIZFYIKSAzbMxtGGIUspR5jePuitDWxd3CV2uIlYInmJS39IUPcHYfNEBEc8OIKfHEwOj8ft7VWbeGLd8hPdVDVN3p967WOKaevoobXFiE1tXv_39IeDlwz0UncyD9OYvYr3gz1LoKKuKCn_8KxP6jU1xYJqYLw4VXSfzoI1yy7VVMDLi6e28mptddG2K2N07pSFdNYP9cP4TPD8fg98C1Q9T0zWJ-SwnhqvN_D_6pinGXkV-oB0WdBXX4d3gMPiuCzVRVwos_wkscHQsbetlh0Q7dyewT9uguz_ujq6eFqr5CdR3AZNCi2n35LcFURxTlQsQNpdfMh6CFOiEzCPMAtICV3vB_0xLCcOqWiP1Pp2uQeO5A1qRi5cKOo2vniRKquaVcIwNjPna9hTIAbebmiU3JzzpdM0DC3uNjCuBpIaO59huuynbNXLGkqxTsgG7z32UI6wp-pSuQuM8eeOvO-emA22T0m7LREpj3Ex7a1VNByQrZXMI4ue067kHRqCw=w1620-h911-no" alt="java modules 3" />
</p>

<p>
어노테이션 Oracle.java를 db.dbpool 모듈에서 db.dbpool.api 모듈로 옮긴 후 패키지를 수정한다.
</p>

<pre class="prettyprint">
<b>package net.java_school.db.dbpool.api;</b>

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Oracle {
  public boolean value() default true;
}
</pre>

<p>
db.dbpool.oracle 모듈의 OracleConnectionManager 클래스를 수정한다.
</p>

<pre class="prettyprint">
package net.java_school.db.dbpool.oracle;

import net.java_school.db.dbpool.ConnectionManager;
<b>import net.java_school.db.dbpool.api.Oracle;</b>

<b>@Oracle</b>
public class OracleConnectionManager extends ConnectionManager {
</pre>

<p>
main.app 모듈의 GetEmp 클래스를 수정한다.
</p>

<pre class="prettyprint">
<b>import net.java_school.db.dbpool.api.ConnectionManageable;</b>
<b>import net.java_school.db.dbpool.api.Oracle;</b>

public class GetEmp {

  public static void main(String[] args) {

    ServiceLoader&lt;<b>ConnectionManageable</b>&gt; managers = ServiceLoader.load(<b>ConnectionManageable.class</b>);

    <b>ConnectionManageable</b> manager = managers.stream()
        .filter(provider -&gt; isOracle(provider.type()))
        .map(ServiceLoader.Provider::get).findAny().get();
			
</pre>

<p>
이제 우리의 예제는 좋은 코드의 모습을 가진다.<br />
공급자와 소비자는 서비스 타입으로 ConnectionManageable 인터페이스만 공유한다.<br />
공급자는 어떤 패키지도 익스포트 하지 않는다.
--db.dbpool.oracle과 db.dbpool.mysql 모듈은 공급자<sup>Provider</sup>다.
main.app 모듈은 소비자<sup>Consumer</sup>다--
</p>

<p>
최종 소스: <a href="https://github.com/kimjonghoon/java-module-test">https://github.com/kimjonghoon/java-module-test</a>
</p>

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/java-9-modules">자바 9 모듈</a></li>
	<li><a href="/blog/2020/java-modules-javabank">자바은행 예제 모듈화</a></li>
</ul>

<span id="refer">참조</span>
<ul id="references">
	<li><a href="https://www.oracle.com/corporate/features/understanding-java-9-modules.html">Understanding Java 9 Modules</a></li>
	<li><a href="http://openjdk.java.net/projects/jigsaw/quick-start">Project Jigsaw: Module System Quick-Start Guide</a></li>
	<li><a href="https://dev.mysql.com/downloads/file/?id=509727">MySQL JDBC Driver Download</a></li>
	<li><a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">Oracle JDBC Driver Download</a></li>
	<li><a href="https://www.oreilly.com/library/view/java-9-modularity/9781491954157/ch04.html">https://www.oreilly.com/library/view/java-9-modularity/9781491954157/ch04.html</a></li>
</ul>

</article>
