<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Java Bank</h1>

<h2>Creating tables and triggers</h2>

<p>
In this section we will practice the Java bank example to store the account and transaction history in the database.
</p>

<p>
Connect to soctt account with SQL*PLUS and create the following table.
</p>

<pre class="prettyprint">
create table bankaccount (
	accountno varchar2(50),
	owner varchar2(20) not null,
	balance number,
	kind varchar2(10),
	constraint PK_BANKACCOUNT primary key(accountno),
	constraint CK_BANKACCOUNT_NORMAL 
		CHECK (balance &gt;= CASE WHEN kind='NORMAL' THEN 0 END),
	constraint CK_BANKACCOUNT_KIND CHECK (kind in ('NORMAL', 'MINUS'))
);  

create table transaction (
    transactiondate timestamp,
    kind varchar2(10),
    amount number,
    balance number,
    accountno varchar2(50),
    constraint FK_TRANSACTION FOREIGN KEY(accountno)
    	REFERENCES bankaccount(accountno)
);
</pre>

<p>
The transaction table will use the trigger to insert the data.
Here is an example of a trigger that is a hint:
</p>

<pre class="prettyprint">
create table a (name varchar2(10));

create table b (name varchar2(10));

CREATE OR REPLACE TRIGGER test_tri
AFTER
INSERT OR UPDATE ON a
FOR EACH ROW
BEGIN
	insert into b values (:new.name);
END;
/

insert into a values ('Alison');
insert into a values ('Bill');
insert into a values ('Carol');

select * from b;
</pre>

<p>
Create a trigger that accumulates data in the transaction history table whenever your account balance changes.
</p>

<pre class="prettyprint">
create or replace trigger bank_trigger
after insert or update of balance on bankaccount
for each row
begin
	if :new.balance &gt; :old.balance then
		insert into transaction 
		values 
		(
			systimestamp,
			'DEPOSIT',
			:new.balance - :old.balance,
			:new.balance,
			:old.accountno
		);
	end if;
	if :new.balance &lt; :old.balance then
		insert into transaction 
		values 
		(
			systimestamp,
			'WITHDRAW',
			:old.balance - :new.balance,
			:new.balance,
			:old.accountno
		);
	end if;
end;
/
</pre>

<h2>JavaBeans</h2>

<h6 class="src">Transaction.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.io.Serializable;

public class Transaction implements Serializable {
	private String transactionDate;
	private String transactionTime;
	private String kind;
	private double amount;
	private double balance;

	public Transaction() {}
	
	public Transaction(String transactionDate,
			String transactionTime,
			String kind,
			double amount,
			double balance) {
		this.transactionDate = transactionDate;
		this.transactionTime = transactionTime;		
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;
	}
	
	public String getTransactionDate() {
		return transactionDate;
	}
	
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	
	public String getTransactionTime() {
		return transactionTime;
	}
	
	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}
	
	public String getKind() {
		return kind;
	}
	
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public long getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public long getBalance() {
		return balance;
	}
	
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(transactionDate);
		sb.append("|");
		sb.append(transactionTime);
		sb.append("|");
		sb.append(kind);
		sb.append("|");
		sb.append(amount);
		sb.append("|");
		sb.append(balance);
		
		return sb.toString();
	}
        
}
</pre>

<h6 class="src">Account.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Account implements Serializable {
	private String accountNo;
	private String name;
	protected double balance;
	private String kind;
	protected List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();
	
	static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");
	static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
	static final String DEPOSIT = "DEPOSIT";
	static final String WITHDRAW = "WITHDRAW";
	static final String NORMAL = "NORMAL";
	static final String MINUS = "MINUS";

	public Account() {}
	
	public Account(String accountNo, String name, String kind) {
		this.accountNo = accountNo;
		this.name = name;
		this.kind = kind;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
	public long getBalance() {
		return balance;
	}
	
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public String getKind() {
		return kind;
	}
	
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public List&lt;Transaction&gt; getTransactions() {
		return transactions;
	}
	
	public void setTransactions(List&lt;Transaction&gt; transactions) {
		this.transactions = transactions;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(accountNo);
		sb.append("|");
		sb.append(name);
		sb.append("|");
		sb.append(balance);
		sb.append("|");
		sb.append(kind);

		return sb.toString();
	}

}
</pre>

<p>
Bank.java shows all the functions that the JavaBank system can do.
</p>

<h6 class="src">Bank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.io.Serializable;
import java.util.List;

public interface Bank extends Serializable {
	
	//Creating an account.
	public void addAccount(String accountNo, String name, String kind);
	
	//Finding an account by account number
	public Account getAccount(String accountNo);
	
	//Finding an account by owner name
	public List&lt;Account&gt; findAccountByName(String name);
	
	//All accounts
	public List&lt;Account&gt; getAccounts();
	
	//Deposit
	public void deposit(String accountNo, double amount);
	
	//Withdraw
	public void withdraw(String accountNo, double amount);
	
	//Transfer
	public void transfer(String from, String to, double amount);
	
	//All transaction history
	public List&lt;Transaction&gt; getTransactions(String accountNo); 
  
}
</pre>

<p>
BankDao.java show all database related functions.
</p>

<h6 class="src">BankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

public interface BankDao {
	
	//Creating an account
	public void insertAccount(String accountNo, String name, String kind);
	
	//Finding an account by account number
	public Account selectOneAccount(String accountNo);
	
	//Finding an account by owner name
	public List&lt;Account&gt; selectAccountsByName(String name);
	
	//All accounts
	public List&lt;Account&gt; selectAllAccounts();
	
	//Deposit
	public void deposit(String accountNo, double amount);
	
	//Withdraw
	public void withdraw(String accountNo, double amount);
	
	//All transaction history
	public List&lt;Transaction&gt; selectAllTransactions(String accountNo);

}
</pre>

<h3>Adding libraries</h3>

<p>
Add the logging library and the Oracle JDBC driver to your classpath.
Download the latest distribution from <a href="http://www.slf4j.org/download.html">http://www.slf4j.org/download.html</a>.
Uncompress and add the slf4j-api-1.7.xx.jar and slf4j-simple-1.7.xx.jar files and the Oracle JDBC driver to the classpath.
If you are working in Eclipse, see the following figure.<img alt="" src="https://lh3.googleusercontent.com/am8h6S3vNyr0SPt6nc7OfQvRrG8HZtIEAQBqg9J39WJ9uGvnES6ScEn7ZXS3c5T0nTW5qT_4svFTpx65ERMc_DoUlUBj5d2IOQqmEv7tqG0ilOioTg9T_CA-CDCWK_D8xDbJootz4ELWi6E79ICZIFlYJjlsToqeTV8mvRfA5L3K9SmccBIt95kpg4ZpBYipd0LJG2yebKQbSPqiUunGMmqpp6twnWAMDYFEyPCH_hhXVO5bPuVz9vPYKw4r-a5GOFN0gCeuPWv-sSALAziA7x8y_fxfixDViPaexHx-1lkojMDCSdIWXYVX3x9DG33lv8ErksKi7lJwclDFXL9Z3j53LNi-VUvegrCqLguny7zljEAGkXows4bsha2kWejyhXIPzl2cAiZQMVzWiWGHOTncV5TgKZo300o4wvbL-733Uohfx0pGsB0aJI2m2CJw-6KsbnT2vMgcuDHSgrOFPjM4O0kbX5-4ghqzGA4-lq24bspaSWulZxHk6FPyXi-8pgKXNrifuvIckC2552rLG_yWXrHwCd8vgU3FGqzgcBUZCcdA6CVy5DQ9Hn9ezCLpnVimILxeT8yVjGvgGP58yGP7_5VhwltjMlVDcqizAD3N5NoUMeKC=w829-h566-no" /><br />
</p>

<p>
Create an implementation class for BankDao.
</p>

<h6 class="src">MyBankDao.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyBankDao implements BankDao {
	Logger logger = LoggerFactory.getLogger(MyBankDao.class);
	
	static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	static final String USER = "scott";
	static final String PASSWORD = "tiger";

	public MyBankDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
    
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
    
	private void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
    
	@Override
	public void insertAccount(String accountNo, String name, String kind) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO bankaccount VALUES (?, ?, 0, ?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, accountNo);
			pstmt.setString(2, name);
			pstmt.setString(3, kind);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
	}

	@Override
	public Account selectOneAccount(String accountNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Account account = null;
		
		String sql = "SELECT accountNo,owner,balance,kind " +
				"FROM bankaccount " +
				"WHERE accountNo = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, accountNo);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				account = new Account();
				account.setAccountNo(rs.getString("accountNo"));
				account.setName(rs.getString("owner"));
				account.setBalance(rs.getDouble("balance"));
				account.setKind(rs.getString("kind"));
				
				return account;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return null;
	}

	@Override
	public List&lt;Account&gt; selectAccountsByName(String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List&lt;Account&gt; matched = new ArrayList&lt;Account&gt;();
		Account account = null;
		
		String sql = "SELECT accountNo,owner,balance,kind " +
				"FROM bankaccount " +
				"WHERE owner = ? " +
				"ORDER By accountNo DESC";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				account = new Account();
				account.setAccountNo(rs.getString("accountNo"));
				account.setName(rs.getString("owner"));
				account.setBalance(rs.getDouble("balance"));
				account.setKind(rs.getString("kind"));
				matched.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return matched;
	}

	@Override
	public List&lt;Account&gt; selectAllAccounts() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List&lt;Account&gt; all = new ArrayList&lt;Account&gt;();
		Account account = null;
		
		String sql = "SELECT accountNo,owner,balance,kind " +
				"FROM bankaccount " +
				"ORDER By accountNo DESC";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				account = new Account();
				account.setAccountNo(rs.getString("accountNo"));
				account.setName(rs.getString("owner"));
				account.setBalance(rs.getDouble("balance"));
				account.setKind(rs.getString("kind"));
				all.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return all;

	}

	@Override
	public void deposit(String accountNo, double amount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE bankaccount " +
				"SET balance = balance + ? " +
				"WHERE accountNo = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, amount);
			pstmt.setString(2, accountNo);
			pstmt.executeUpdate();
			
			logger.debug("AccountNo:{} Amount:{} DEPOSIT/WITHDRAW:{}", 
		            accountNo, amount, Account.DEPOSIT);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
	}

	@Override
	public void withdraw(String accountNo, double amount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE bankaccount " +
				"SET balance = balance - ? " +
				"WHERE accountNo = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, amount);
			pstmt.setString(2, accountNo);
			pstmt.executeUpdate();
			
			logger.debug("AccountNo:{} Amount:{} DEPOSIT/WITHDRAW:{}", 
		            accountNo, amount, Account.DEPOSIT);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
	}

	@Override
	public List&lt;Transaction&gt; selectAllTransactions(String accountNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List&lt;Transaction&gt; all = new ArrayList&lt;Transaction&gt;();
		Transaction transaction = null;
		
		String sql = "SELECT transactionDate,kind,amount,balance " +
				"FROM transaction " +
				"WHERE accountNo = ? " +
				"ORDER By transactionDate ASC";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, accountNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				transaction = new Transaction();
				String date = Account.DATE_FORMAT.format(rs.getTimestamp("transactionDate"));
				String time = Account.TIME_FORMAT.format(rs.getTimestamp("transactionDate"));
				transaction.setTransactionDate(date);
				transaction.setTransactionTime(time);
				transaction.setKind(rs.getString("kind"));
				transaction.setAmount(rs.getDouble("amount"));
				transaction.setBalance(rs.getDouble("balance"));
				all.add(transaction);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return all;

	}

}
</pre>

<p>
Create an implementation class for Bank.
</p>

<h6 class="src">MyBank.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.util.List;

public class MyBank implements Bank {
	
	private BankDao dao = new MyBankDao();

	@Override	
	public void addAccount(String accountNo, String name, String kind) {
		dao.insertAccount(accountNo, name, kind);
	}
	
	@Override
	public Account getAccount(String accountNo) {
		return dao.selectOneAccount(accountNo);
	}

	@Override
	public List&lt;Account&gt; findAccountByName(String name) {
		return dao.selectAccountsByName(name);
	}

	@Override
	public List&lt;Account&gt; getAccounts() {
		return dao.selectAllAccounts();
	}

	@Override
	public void deposit(String accountNo, double amount) {
		dao.deposit(accountNo, amount);
	}

	@Override
	public void withdraw(String accountNo, double amount) {
		dao.withdraw(accountNo, amount);
	}

	@Override
	public void transfer(String from, String to, double amount) {
		dao.withdraw(from, amount);
		dao.deposit(to, amount);
	}

	@Override
	public List&lt;Transaction&gt; getTransactions(String accountNo) {
		return dao.selectAllTransactions(accountNo);
	}

}
</pre>


<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

public class BankUi {

	private Bank bank = new MyBank();
	
	private String readCommandLine() throws IOException {
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		String input = br.readLine();
		return input;
	}
	
	public void startWork() {
			
		String menu = null;
		
			do {
				System.out.println(" ** Please select menu ** ");
				System.out.println(" 1 ** New Account registration    ");
				System.out.println(" 2 ** All Accounts    ");
				System.out.println(" 3 ** Deposit    ");
				System.out.println(" 4 ** Withdraw    ");
				System.out.println(" 5 ** Transfer    ");
				System.out.println(" 6 ** Transaction history    ");
				System.out.println(" q ** Quit    ");
				System.out.println(" ********************** ");
				System.out.println("&gt;&gt;");
				
				try {
					menu = readCommandLine();
				
					String accountNo = null;
					String name = null;
					String kind = null;
					double amount = 0;
					
					if (menu.equals("1")) {
						//TODO New Account registration
						System.out.println("Enter the account number of the account you want to create: ");
						accountNo = this.readCommandLine();
						System.out.println("Enter the owner name of the account you want to create: ");
						name = this.readCommandLine();
						System.out.println("Please select an account kind. noraml (n), minus (m): normal (n) : : ");
						kind = this.readCommandLine();
						if (kind != null &amp;&amp; kind.equals("m")) {
							bank.addAccount(accountNo, name, Account.MINUS);
						} else {
							bank.addAccount(accountNo, name, Account.NORMAL);
						}
					} else if (menu.equals("2")) {
						//TODO All accounts
						List&lt;Account&gt; accounts = bank.getAccounts();
						for (Account account : accounts) {
							System.out.println(account);
						}
					} else if (menu.equals("3")) {
						//TODO Deposit
						System.out.println("Please enter your account number: ");
						accountNo = this.readCommandLine();
						System.out.println("Please enter deposit amount: ");
						amount = Double.parseDouble(this.readCommandLine());
						bank.deposit(accountNo, amount);
					} else if (menu.equals("4")) {
						//TODO Withdraw
						System.out.println("Please enter your account number: ");
						accountNo = this.readCommandLine();
						System.out.println("Please enter withdraw amount: ");
						amount = Double.parseDouble(this.readCommandLine());
						bank.withdraw(accountNo, amount);
					} else if (menu.equals("5")) {
						//TODO Transfer
						System.out.println("Please enter your withdrawal account number: ");
						String from = this.readCommandLine();
						System.out.println("Please enter your deposit account number: ");
						String to = this.readCommandLine();
						System.out.println("Enter transfer amount: ");
						amount = Double.parseDouble(this.readCommandLine());
						bank.transfer(from, to, amount);
					} else if (menu.equals("6")) {
						//TODO Transaction history
						System.out.println("Please enter your account number: ");
						accountNo = this.readCommandLine();
						List&lt;Transaction&gt; transactions = bank.getTransactions(accountNo);
						for (Transaction transaction : transactions) {
							System.out.println(transaction);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println();
			} while (!menu.equals("q"));
		
	}
	
	public static void main(String[] args) throws Exception {
		BankUi ui = new BankUi();
		ui.startWork();
	}
	
}
</pre>

<h3>Final Source</h3>

<p>
<a href="https://github.com/kimjonghoon/JavaBank">https://github.com/kimjonghoon/JavaBank</a>
</p>

</article>