<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>JDBC Introduction</h1>

<p>
JDBC (Java Database Connectivity) is a Java library for accessing a database and executing SQL statements.
If database vendors make their own libraries, the programming method will vary from product to product, and Java programmers will have to learn how to use the classes created by each vendor.
Sun Microsystems has provided JDBC as a standard Java library for accessing RDBMS and executing SQL statements.
JDBC has very few implementation classes, most of which are interfaces.
It is the responsibility of each vendor to create a class that implements the interface.
From now on, we will learn how to use the interface provided by Sun.
In the JDBC example source, you cannot see the JDBC implementations created by each vendor.
Only the Sun's interfaces are visible.
</p>
 
<dl class="note">
<dt>Relational Database</dt>
<dd>
In 1970, E.F. Codd introduced "A set of relational tables can represent data".
Since then, many companies have created relational database management systems (RDBMS).
Oracle is the first company to commercialize an RDBMS.
</dd>

<dt>SQL</dt>
<dd>
SQL (Structured Query Language) is the standard language of RDBMS.
With SQL, you can do the following.
<ul>
	<li>Create a table</li>
	<li>Insert, update, and delete records in a table</li>
	<li>Control the privileges of a database user</li>
</ul>
</dd>
</dl>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jdbc/oracle-install"/>">Oracle Install</a></li>
		<li>Prev : <a href="<c:url value="/java/rmi"/>">RMI</a></li>
	</ul>
</div>

</article>