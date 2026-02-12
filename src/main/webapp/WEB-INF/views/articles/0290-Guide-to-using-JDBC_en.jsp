<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>JDBC Guide</title>
<meta name="Keywords" content="java,JDBC Guide" />
<meta name="Description" content="This article describes JDBC Programming" />
<link rel="stylesheet" href="../../../static/css/english.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/screen.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/print.css" type="text/css" />
<link rel="stylesheet" href="../../static/css/prettify.css" type="text/css" />
<script src="../../static/js/jquery.js"></script>
<script src="../../static/js/commons.js"></script>
<script src="../../static/js/prettify.js"></script>
<script src="../../static/js/javaschool-prettify.js"></script>
</head>

<body>

<article>

<h1>JDBC Guide</h1>

<p>
Memorize the following order.
</p>

<ol>
	<li>Loading the JDBC driver</li>
	<li>Getting a Connection</li>
	<li>Execute SQL</li>
	<li>[If the SQL statement is a select statement, use a ResultSet.]</li>
	<li>Returning Resources</li>
</ol>

<h2>1. Loading the JDBC driver</h2>

<pre class="prettyprint">
Class.forName("oracle.jdbc.driver.OracleDriver");
</pre>

<p>
The string in parentheses indicates the start class of the Oracle JDBC driver.
In the ojdbc6.jar file, you can find this.
Class is not a class that belongs to JDBC and is used to get class information.
The forName() method is a static method of the Class class.
The forName() method allows the class loader to load the class corresponding to the string input as an argument into memory space.
There is a return value for the forName() method but not necessary for JDBC programming.
When this method runs, the class loader refers to the classpath and loads it into memory space.
If the class loader cannot find the corresponding one, it causes a ClassNotFoundException.
In conclusion, the above code responsible for loading the OracleDriver into memory.
The loaded OracleDriver class registers itself with java.sql.DriverManager.
After that, you call getConnection() of DriverManager and pass appropriate values as arguments to this method, and it will return Oracle Connection implementation instance.   
</p>

<h2>2. Getting a Connection</h2>

<pre class="prettyprint">
conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");
</pre>

<p>
The JDBC APIs are primarily interfaces.<br />
In our example, they are all interfaces exception DriverManager.<br />
DriverManager's getConnection() method returns a Connection object implemented by a specific database vendor according to values entered as arguments.
Obtaining a Connection object means that running your java program has connected to the database.
</p>

<h2>3. Execute SQL</h2>

<pre class="prettyprint">
// Getting a Statement
stmt = conn.createStatement();
// Execute SQL
rs = stmt.executeQuery(query);
</pre>

<p>
You can use either a Statement implementation or a PreparedStatement implementation to pass SQL statements to the database. You may create a Statement implementation or a PreparedStatement implementation through a Connection implementation. The above example uses the Statement interface. If the SQL statement is a select statement, use the executeQuery() method of the Statement interface. If the SQL statement is for an insert, update, or delete record, use the executeUpdate() method of the Statement interface.
</p>

<h2>4. [If the SQL statement is a select statement, use a ResultSet.]</h2>

<pre class="prettyprint">
while (rs.next()) {
  String empno = rs.getString(1);
  String ename = rs.getString(2);
  ...
  ..
</pre>

<p>
If the SQL statement is a select statement, you need an object to store returned records. ResultSet acts as a container for returned records from a database. Think of ResultSet as a collection used only by JDBC to store data such as tables. The returned ResultSet object has the cursor whose initial position is before the first record. Therefore, you must call the next() method to let the cursor point to the first record. When the next() runs, it moves the cursor down one level and returns true if there is a record at the cursor point.
</p>

<h2>5. Returning Resources</h2>

<p>
In JDBC programming, returning resources is essential. The garbage collector works when the instance is no longer in use. However, it does not collect that waiting for data from the user. If you don't return connection instances that are no longer in use, they will increasingly take up heap memory, and the server will stop eventually. Therefore, you have to write code that returns used resources in JDBC programming.
</p>

<p>
Write the following code in a finally block.
</p>

<pre class="prettyprint">
// Close the ResultSet.
rs.close();
// Close the Statement.
stmt.close();
// Close the Connection.
conn.close();
</pre>

<p>
You have to return the resources order in the reverse order of the generated.
</p>

</article>

</body>
</html>
