<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.2.14</div>

<h1>Java 9 Modules</h1>

<p>
This article covers a Java 9 module example.
You read the following articles before starting.
</p>

<ul>
  <li><a href="https://www.oracle.com/corporate/features/understanding-java-9-modules.html">Understanding Java 9 Modules</a></li>
  <li><a href="http://openjdk.java.net/projects/jigsaw/quick-start">Project Jigsaw: Module System Quick-Start Guide</a></li>
</ul>


<h3>Custom Connection Pool</h3>

<p>
The below is not a Java module example.
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
    if (freeConnections.size() &gt; 0) {
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
      if ((new Date().getTime() - startTime) &gt;= timeout) {
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
<pre class="prettyprint">package net.java_school.db.dbpool;

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
<pre class="prettyprint">package net.java_school.db.dbpool;

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
<pre class="prettyprint">package net.java_school.db.dbpool.oracle;

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
<pre class="prettyprint">package net.java_school.db.dbpool.mysql;

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
<pre class="prettyprint">############################################ 
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
<pre class="prettyprint">############################################ 
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
Create a MySQL user and database as follows:
</p>

<pre class="prettyprint">mysql --user=root --password mysql

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
<pre class="prettyprint">package net.java_school.test;

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
Copy the JDBC drivers to the jars/ folder.
</p>

<h4>Test on Windows</h4>

<p>
Run the dir command and verify that the output looks like this:
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
Create a directory where Javac will generate byte codes.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">mkdir out
</pre>

<p>
Compile in the following order:
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -d out src\net\java_school\db\dbpool\*.java
javac -d out src\net\java_school\db\dbpool\oracle\OracleConnectionManager.java
javac -d out src\net\java_school\db\dbpool\mysql\MySqlConnectionManager.java
javac -d out src\net\java_school\test\GetEmp.java
</pre>

<p>
Copy the Java property files into the out directory.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">xcopy src\*.properties out
</pre>

<p>
Run
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">set classpath=jars/ojdbc6.jar;jars/mysql-connector-java-8.0.28.jar;out
java net.java_school.test.GetEmp
</pre>

<h4>Test on Linux</h4>

<p>
Run the <em>ls</em> command and verify that the output looks like this:
</p>

<pre class="shell-prompt">jars  src
</pre>

<p>
Compile
</p>

<pre class="shell-prompt">javac -d out -sourcepath src $(find src -name "*.java")
</pre>

<p>
Copy the Java property files into the out directory. 
</p>

<pre class="shell-prompt">cp $(find src -name '*.properties') out
</pre>

<p>
Run
</p>

<pre class="shell-prompt">CP=jars/ojdbc6.jar
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

<h3>Modularization</h3>

<p>
Let's divide the example into parts.
Each one will be a module.
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
Change the directory structure as shown below.<br />
Just under src/, there should be folders with module names.
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

<h6 class="src" id="first-module-info.java">module-info.java</h6>
<pre class="prettyprint">module net.java_school.db.dbpool {
  requires java.logging;
  requires transitive java.sql;
	
  exports net.java_school.db.dbpool;
}
</pre>

<p>
<b>requires</b> java.logging;<br />
The <b>requires</b> keyword specifies on which this module depends the external module.<br />
java.logging is a module name, not a package name.
</p>

<p>
requires <b>transitive</b> java.sql;<br />
The module that depends on net.java_school.db.dbpool will automatically depend on java.sql.
</p>

<p>
<b>exports</b> net.java_school.db.dbpool;<br />
The <b>exports</b> keyword specifies the package that this module exports.<br />
net.java_school.db.dbpool is the package name and the the module name.
</p>

<dl class="note">
<dt>
Although module A requires module B, module A can only use the public elements of packages exported by module B.
</dt>
</dl>

<h4>2nd Module : net.java_school.db.dbpool.oracle</h4>

<h6 class="src" id="second-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module net.java_school.db.dbpool.oracle {
  requires net.java_school.db.dbpool;
	
  exports net.java_school.db.dbpool.oracle;
}
</pre>

<h4>3rd Module : net.java_school.db.dbpool.mysql</h4>

<h6 class="src" id="third-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module net.java_school.db.dbpool.mysql {
  requires net.java_school.db.dbpool;
	
  exports net.java_school.db.dbpool.mysql;
}
</pre>

<h4>4th Module : main.app</h4>

<h6 class="src" id="fourth-module-info.java">module-info.java</h6>
<pre class="prettyprint">
module main.app {
  requires java.sql;
  requires net.java_school.db.dbpool.oracle;
  requires net.java_school.db.dbpool.mysql;
}
</pre>

<p>
<img src="https://lh3.googleusercontent.com/CbAUTlrRZbucK1xF4Yr9YqW6Zjx8zywXw3VoUIjJDt641lTFR4fbu42hxzj-xirWDKJhlgwVgOEgrtPsxi7rvm6BAsI4i7xiqaITXuaGkrvmEfvQyt83EwlIPapv8ZBhvldpNDG3OoaBhKe85xdK-wBmGADdUWI7WtP6YY5pI2-4pR-67ACm0KwdS9EBduJ6it1cS2t6jmFilvrH0BggBgIZylgSceyfllZEW8MbrJkxv7fO1OZZjPv2t_FDu-RBiHVdfEZS8JZLrVFqAotc49O4kuIxJ0cqEhmGuRqZNSF1GEAnTqJo8Ey2aCsweyakI2dvSN0e07sAHyl28gv0OpTLui0CundFFZo3OtPCxAsDioZalM73r0QY7jJuHU5ftZstnQt1skEQiyDoSkXSoM0Cz-41I51n60xuxMjg9sMopMk2dwS4xOA91GZUBXcEt4nxmdnsVObYi888JXGUAXooa4jXgFLaSVxcQn-X7LKuuNDwIjWwXjK_NJZC-Yzz3XTMtIbALOr4b_SOXd0WEdhPfSVd5CKli3ZNSdI2M3cYQ4RTVYBIo6zXIO-UcErOezxnIOwoOh15gRK0431ByjoS4ws43DASCwguKbR8Xs772J8S0HOsa-w0ItrplQH04pCcJ4iE86wnZO3JaPw1nYwiV6B5A5iMVQYzFIQDTqPzSSFQoX2uX2AQXNX2=w1813-h668-no" alt="java modules 1" />
</p>

<p>
See below to modify the code that reads the Java property file.
</p>

<h6 class="src">OracleConnectionManager.java</h6>
<pre class="prettyprint">
public OracleConnectionManager() {
  this.poolName = "oracle";
  String configFile = "oracle.properties";

  <strong>Class&lt;?&gt; clazz = OracleConnectionManager.class;</strong>
  <strong>Module m = clazz.getModule();</strong>

  try {
    <strong>InputStream inputStream = m.getResourceAsStream(configFile);</strong>
    Properties prop = new Properties();
    prop.load(inputStream);
		
    //..Omit..
			
</pre>

<h6 class="src">MySqlConnectionManager.java</h6>
<pre class="prettyprint">
public MySqlConnectionManager() {
  this.poolName = "mysql";
  String configFile = "mysql.properties";

  <strong>Class&lt;?&gt; clazz = MySqlConnectionManager.class;</strong>
  <strong>Module m = clazz.getModule();</strong>

  try {
    <strong>InputStream inputStream = m.getResourceAsStream(configFile);</strong>
    Properties prop = new Properties();
    prop.load(inputStream);
		
    //..Omit..
			
</pre>

<h4>Test on Windows</h4>

<p>
Compile
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">javac -d out --module-source-path src ^
-m main.app,net.java_school.db.dbpool, ^
net.java_school.db.dbpool.oracle,net.java_school.db.dbpool.mysql
</pre>

<p>
--module-source-path: Specify where to find input source files for multiple modules.<br />
-m: Compile only the specified module.
</p>

<p>
Copy the Java property file into each module directory.
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">copy src\net.java_school.db.dbpool.oracle\oracle.properties ^
out\net.java_school.db.dbpool.oracle\
copy src\net.java_school.db.dbpool.mysql\mysql.properties ^
out\net.java_school.db.dbpool.mysql\
</pre>

<p>
Run
</p>

<strong class="screen-header"><b>C:\</b> Command Prompt</strong>
<pre class="screen">java -p jars:out -m main.app/net.java_school.test.GetEmp
</pre>

<p>
-p: module path<br />
-m: <em>module/base class</em> --For modular jars, enter module name only--<br />
</p>

<p>
Non-modular jars in the module path become automatic modules. Java VM interprets automatic modules as requires transitive all other modules on the module path. It means that automatic modules can read all packages exported by all named modules in the module path.
</p>

<p>
Automatic Modules export all their packages.
</p>

<h4>Test on Linux</h4>

<p>
Compile
</p>

<pre class="shell-prompt">javac -d out --module-source-path src $(find src -name "*.java")
</pre>

<p>
Copy the Java property files into each module directory.
</p>

<pre class="shell-prompt">cp src/net.java_school.db.dbpool.oracle/oracle.properties \
out/net.java_school.db.dbpool.oracle/
cp src/net.java_school.db.dbpool.mysql/mysql.properties \
out/net.java_school.db.dbpool.mysql/
</pre>

<p>
Run
</p>

<pre class="shell-prompt">java -p jars:out -m main.app/net.java_school.test.GetEmp
</pre>

<h3>Using ServiceLoader</h3>

<p>
Using ServiceLoader, you can make services and service implementations into separate modules.
</p>

<pre class="prettyprint">
module main.app {
  requires net.java_school.db.dbpool;
  
  <strong>uses net.java_school.db.dbpool.ConnectionManager;</strong>
}
</pre>

<p>
<b>uses</b> net.java_school.db.dbpool.ConnectionManager;<br />
A <b>uses</b> keyword specifies a service used by this module.<br /> 
The net.java_school.db.dbpool.ConnectionManager is an abstract class.<br />
Abstract or implementation classes can also be services.
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool.oracle {
  requires net.java_school.db.dbpool;
  
  <strong>provides net.java_school.db.dbpool.ConnectionManager 
      with net.java_school.db.dbpool.oracle.OracleConnectionManager;</strong>
}
</pre>

<p>
<b>provides</b> net.java_school.db.dbpool.ConnectionManager<sup>Service</sup><br />
<b>with</b> net.java_school.db.dbpool.oracle.OracleConnectionManager<sup>Implementation</sup>;<br />
</p>

<pre class="prettyprint">
module net.java_school.db.dbpool.mysql {
  requires net.java_school.db.dbpool;
  
  <strong>provides net.java_school.db.dbpool.ConnectionManager 
      with net.java_school.db.dbpool.mysql.MySqlConnectionManager;</strong>
}
</pre>

<p>
<b>provides</b> net.java_school.db.dbpool.ConnectionManager<sup>Service</sup><br />
<b>with</b> net.java_school.db.dbpool.mysql.MySqlConnectionManager<sup>Implementation</sup>;<br />
</p>

<p>
Note that the module providing the implementation<sup>Provider</sup> does not export any packages of its own. Therefore, the GetEmp class of the main.app module<sup>Consumer</sup> cannot use any type in Providers.
</p>

<p>
<img src="https://lh3.googleusercontent.com/am5o5bfYEZLwAe7F6NkvjzL41WJ8gPs9Y3M1meeZZEmQw5bEGBqCydzb314fF-4yzh4QK0x2YZAqL7SpuWMd7QPPUVmuiv9qHoOALBWT2PWCcqzb71K2_Oyyx-bZsKBf1tfjwR-HxBz-9eITjmaaFeH56UO4SFi4pzjuFU9zYYAEaLukUiY5NGrP2r5UsywOlsH2xlpD-2qYxitH2tNzZaDhScFL3ClxpYtAhQCBuZ_a4f8in8r2PWKfHYl_ElKCJxaXDYF7NnJBjAnQs3zzWFJ1ECkn7PjM5QII2ab_8jy9CfGx_clnfu0b5r1QK9xy30UYtS0sjlYt_1uBILRF_xsD4b7tV5VxaKF50CWV-OZEo1ZIVLDfgUBNaJC1g6za8Y-Xr3nZ34Rmo-BnGwgliATTKcpeOCe5pNCaKmMQaQ7GDtG4Q9zjzxCEyxZubEXUjFQut7k2u_TfVHBCFP2nJKIydmGsHt51sG2vvaWUQrCG1KQb0tC4BltMgEs2nYVddf51OHkIXjAVVkb1Ggf7gM4HWOI89tTVmQb3yOeniAATG-YmUVGY7l-aUYHAZGw09EpHrDznO6FG5jKMLk7XWPgZgbvltwmmR5wz4cBvxUDNZednm_lU1r22m-38GQpXG7I8Lz-jlBky3j4LAjTIGWIswSpbR4B1V7TpsHlrSuZoVDnT9o3WB9QWLWQPGg=w1897-h834-no" alt="java modules 2" />
</p>

<pre class="prettyprint">package net.java_school.test;

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
	
      String sql = "SELECT * FROM EMP";
	
      try {
        con = manager.getConnection();
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
          
          System.out.println(empno + " : " + ename + " : " + job
              + " : " + mgr + " : " + hiredate + " : " + sal
              + " : " + comm + " : " + depno);
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
          <b>manager.freeConnection(con);</b>
      }

      System.out.println("Driver Number: " + <b>manager.getDriverNumber()</b>);
		
    <b>}</b>

  }
}
</pre>

<p>
The service and implementation are now entirely separated into their respective modules.
</p>

<p>
If only net.java_school.db.dbpool.oracle or net.java_school.db.dbpool.mysql is in the module path, you can run main.app. Even if neither net.java_school.db.dbpool.oracle nor net.java_school.db.dbpool.mysql is in the module path, compilation succeeds.
</p>

<h3>Filtering Services</h3>

<p>
Create the following file in net.java_school.db.dbpool module. 
</p>

<pre class="prettyprint">package net.java_school.db.dbpool;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Oracle {
  public boolean value() default true;
}
</pre>

<p>
Add an Oracle annotation to the OracleConnectionManager class in net.java_school.db.dbpool.oracle module. 
</p>

<pre class="prettyprint"><b>import net.java_school.db.dbpool.Oracle;</b>

<b>@Oracle</b>
public class OracleConnectionManager extends ConnectionManager {
  //..
}
</pre>

<p>
Modify GetEmp class.
</p>

<pre class="prettyprint"><b>import net.java_school.db.dbpool.Oracle;</b>

public class GetEmp {

  public static void main(String[] args) {

    <strong>ServiceLoader&lt;ConnectionManager&gt;</strong> managers = ServiceLoader.load(ConnectionManager.class);
		
    <strong>ConnectionManager manager = managers.stream()</strong>
      <strong>.filter(provider -&gt; isOracle(provider.type()))</strong>
      <strong>.map(ServiceLoader.Provider::get).findAny().get();</strong>
				
    //..Omit..
      
  }
  
  <strong>private static boolean isOracle(Class&lt;?&gt; clazz) {</strong>
    <strong>return clazz.isAnnotationPresent(Oracle.class)</strong>
	<strong>&amp;&amp; clazz.getAnnotation(Oracle.class).value() == true;</strong>
  <strong>}</strong>
}
</pre>

<h3>Adding Interface</h3>

<p>
Create the net.java_school.db.dbpool.api module.<br />
Create the following interface in net.java_school.db.dbpool.api module.
</p>

<h6 class="src">ConnectionManageable.java</h6>
<pre class="prettyprint">package net.java_school.db.dbpool.api;

import java.sql.Connection;

public interface ConnectionManageable {
	
  public Connection getConnection();

  public void freeConnection(Connection con);

  public int getDriverNumber();

}
</pre>

<p>
Modify ConnectionManager abstract class in net.java_school.db.dbpool module.
</p>

<pre class="prettyprint">
package net.java_school.db.dbpool;

import java.sql.Connection;

<strong>import net.java_school.db.dbpool.api.ConnectionManageable;</strong>

public abstract class ConnectionManager <strong>implements ConnectionManageable</strong> {

  protected DBConnectionPoolManager poolManager;
  protected String poolName;

  public ConnectionManager() {
    this.poolManager = DBConnectionPoolManager.getInstance();
  }

  <strong>@Override</strong>	
  public Connection getConnection() {
    return (poolManager.getConnection(poolName));
  }

  <strong>@Override</strong>
  public void freeConnection(Connection con) {
    poolManager.freeConnection(poolName, con);
  }

  public abstract void initPoolManager(String poolName, String driver, String url, 
      String userID, String passwd, int maxConn, int initConn, int maxWait);

  <strong>@Override</strong>	
  public int getDriverNumber() {
    return poolManager.getDriverNumber();
  }
}
</pre>

<p>
Create the module descriptor for net.java_school.db.dbpool.api module.
</p>

<pre class="prettyprint">module net.java_school.db.dbpool.api {
  requires transitive java.sql;
  
  exports net.java_school.db.dbpool.api;
}
</pre>

<p>
Modify module descriptors.
</p>

<pre class="prettyprint">module net.java_school.db.dbpool {
  requires <strong>transitive net.java_school.db.dbpool.api</strong>;
  
  exports net.java_school.db.dbpool;
}
</pre>

<pre class="prettyprint">module net.java_school.db.dbpool.mysql {
  requires net.java_school.db.dbpool;

  provides <strong>net.java_school.db.dbpool.api.ConnectionManageable</strong>
    with net.java_school.db.dbpool.mysql.MySqlConnectionManager;
}
</pre>

<pre class="prettyprint">module net.java_school.db.dbpool.oracle {
  requires net.java_school.db.dbpool;

  provides <strong>net.java_school.db.dbpool.api.ConnectionManageable</strong>
    with net.java_school.db.dbpool.oracle.OracleConnectionManager;
}
</pre>

<pre class="prettyprint">
module main.app {
  requires <strong>net.java_school.db.dbpool.api</strong>;

  uses <strong>net.java_school.db.dbpool.api.ConnectionManageable</strong>;
}
</pre>

<p>
<img src="https://lh3.googleusercontent.com/iud-JqLIuK4XqwL_dZYzCHShuHGph_hhVsmc5MEg_nBYFK0bXfRSb9LfEjoIUzgyuL7-uv78vELnGqkTxG_vdbl20FUyEVolZkBYpfKl-mtOc0GwsLfAeUtkrP7JXS_r5AE8eEJOWZFoaHKFj2aJ4VkW_3Ax5YDRQ0xLxyG5ZIaFwnXwRIMuHLOff_tP5CIZFYIKSAzbMxtGGIUspR5jePuitDWxd3CV2uIlYInmJS39IUPcHYfNEBEc8OIKfHEwOj8ft7VWbeGLd8hPdVDVN3p967WOKaevoobXFiE1tXv_39IeDlwz0UncyD9OYvYr3gz1LoKKuKCn_8KxP6jU1xYJqYLw4VXSfzoI1yy7VVMDLi6e28mptddG2K2N07pSFdNYP9cP4TPD8fg98C1Q9T0zWJ-SwnhqvN_D_6pinGXkV-oB0WdBXX4d3gMPiuCzVRVwos_wkscHQsbetlh0Q7dyewT9uguz_ujq6eFqr5CdR3AZNCi2n35LcFURxTlQsQNpdfMh6CFOiEzCPMAtICV3vB_0xLCcOqWiP1Pp2uQeO5A1qRi5cKOo2vniRKquaVcIwNjPna9hTIAbebmiU3JzzpdM0DC3uNjCuBpIaO59huuynbNXLGkqxTsgG7z32UI6wp-pSuQuM8eeOvO-emA22T0m7LREpj3Ex7a1VNByQrZXMI4ue067kHRqCw=w1620-h911-no" alt="java modules 3" />
</p>

<p>
After moving net.java_school.db.dbpool.Oracle.java to net.java_school.db.dbpool.api module, 
modify it as bellows:
</p>

<pre class="prettyprint"><strong>package net.java_school.db.dbpool.api;</strong>

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Oracle {
  public boolean value() default true;
}
</pre>

<p>
Modify OracleConnectionManager in net.java_school.db.dbpool.oracle module.
</p>

<pre class="prettyprint">package net.java_school.db.dbpool.oracle;

import net.java_school.db.dbpool.ConnectionManager;
<strong>import net.java_school.db.dbpool.api.Oracle;</strong>

<strong>@Oracle</strong>
public class OracleConnectionManager extends ConnectionManager {
</pre>

<p>
Modify GetEmp class.
</p>

<pre class="prettyprint"><strong>import net.java_school.db.dbpool.api.ConnectionManageable;</strong>
<strong>import net.java_school.db.dbpool.api.Oracle;</strong>

public class GetEmp {

  public static void main(String[] args) {

    ServiceLoader&lt;<strong>ConnectionManageable</strong>&gt; managers = ServiceLoader.load(<strong>ConnectionManageable.class</strong>);

    <strong>ConnectionManageable</strong> manager = managers.stream()
        .filter(provider -&gt; isOracle(provider.type()))
        .map(ServiceLoader.Provider::get).findAny().get();
			
</pre>

<p>
Source: <a href="https://github.com/kimjonghoon/java-module-test">https://github.com/kimjonghoon/java-module-test</a>
</p>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/java-9-modules">Java 9 Modules</a></li>
	<li><a href="/blog/2020/java-modules-javabank">JavaBank Modularization</a></li>
</ul>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://www.oracle.com/corporate/features/understanding-java-9-modules.html">Understanding Java 9 Modules</a></li>
	<li><a href="http://openjdk.java.net/projects/jigsaw/quick-start">Project Jigsaw: Module System Quick-Start Guide</a></li>
	<li><a href="https://dev.mysql.com/downloads/file/?id=509727">MySQL JDBC Driver Download</a></li>
	<li><a href="https://www.oracle.com/database/technologies/jdbcdriver-ucp-downloads.html#license-lightbox">Oracle JDBC Driver Download</a></li>
	<li><a href="https://www.oreilly.com/library/view/java-9-modularity/9781491954157/ch04.html">https://www.oreilly.com/library/view/java-9-modularity/9781491954157/ch04.html</a></li>
</ul>

</article>
