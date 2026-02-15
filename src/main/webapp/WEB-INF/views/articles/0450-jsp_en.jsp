<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Java Server Pages (JSP)</h1>

<ol>
	<li><a href="#JSP">What is JSP?</a></li>
	<li><a href="#Directives">Directives</a>
		<ol>
			<li><a href="#page_Directives">page directive</a></li>
			<li><a href="#include_Directives">include directive</a></li>
			<li><a href="#taglib_Directives">taglib directive</a></li>
		</ol>
	</li>
	<li><a href="#Scripting">Scripting</a>
		<ol>
			<li><a href="#Declarations">Declarations</a></li>
			<li><a href="#Expressions">Expressions</a></li>
			<li><a href="#Scriptlets">Scriptlets</a></li>
		</ol>
	</li>
	<li><a href="#Actions">Actions</a>
		<ol>
			<li><a href="#useBean">jsp:useBean</a></li>
			<li><a href="#setProperty">jsp:setProperty</a></li>
			<li><a href="#getProperty">jsp:getProperty</a></li>
			<li><a href="#param">jsp:param</a></li>
			<li><a href="#include">jsp:include</a></li>
			<li><a href="#forward">jsp:forward</a></li>
			<!-- <li><a href="#plugin">jsp:plugin</a></li>-->
		</ol>
	</li>
	<li><a href="#Implicit_Objects">Implicit Objects</a>
		<ol>
			<li><a href="#out">out</a></li>
			<li><a href="#request">request</a></li>
			<li><a href="#response">response</a></li>
			<li><a href="#pageContext">pageContext</a></li>
			<li><a href="#session">session</a></li>
			<li><a href="#application">application</a></li>
			<li><a href="#config">config</a></li>
			<li><a href="#page">page</a></li>
			<li><a href="#exception">exception</a></li>
		</ol>
	</li>
	<li><a href="#JSP_Confirm">Things to check in JSP syntax</a>
		<ol>
			<li><a href="#include_vs_include">The differences between include directive and include action</a></li>
			<li><a href="#ServletContext_Web-App">The relationship between ServletContext and Web application</a></li>
			<li><a href="#pageDirectives_session-attr">The page directive's session attributee</a></li>
			<li><a href="#useBean_scope">The jsp:useBean action's scope</a></li>
		</ol>
	</li>
	<li><a href="#examples">JSP Examples</a>
		<ol>
			<li><a href="#error-handling-1">JSP error handling in the early Servlet/JSP spec</a></li>
			<li><a href="#error-handling-2">JSP error handling set in web.xmlc</a></li>
			<li><a href="#cookie-example">Cookie</a></li>
			<li><a href="#include-directive-example">Separate pages using include directive</a></li>
			<li><a href="#login-process">Login using JavaBeans (using session)</a></li>
			<li><a href="#login-process-2">Modify the 'Login using JavaBeans (using session)' to be an example using action.</a></li>
			<li><a href="#fileList-example">JSP examples related to files</a></li>
		</ol>
	</li>
</ol>

<h2 id="JSP">1. What is JSP?</h2>

<p>
JSP emerged as a Java-side countermeasure for ASP as Microsoft's ASP becomes popular.
JSP is Servlet-based technology.
JSP file inself cannot respond to client requests.
JSP file is translated into a servlet by a servlet container, such as tomcat, and this servlet reacts to the client's request.
A servlet java source translated from JSP is similar to the servlet we learned in the Servlet chapter, but they are not precisely the same.
</p>

<p>
It isn't enjoyable job to write Java code and HTML code together.
Servlet compels us to generate the HTML design as a Java String and pass it as an argument to an output stream method.
It means that you have to insert the HTML code into the Java code iff you use Servlet.
In JSP, this is the opposite.
Your job turns into inserting Java code into the HTML code.
When writing HTML code and Java code together, JSP is much easier to write than Servlet.
When you need to show your users the dynamically generated HTML with an intricate design, you should choose JSP.
</p>

<p>
In the chapter: <a href="Creating-a-new-web-application">Creating a new web application</a>, we changed the application named myapp to the ROOT application.
(The DocuementBase for the myapp application is C:/www/myapp)
I recommend you should practice all the examples below in the ROOT application.
Write JSP file in C:\www\myapp or its subdirectories with a regular editor, not Eclipse.
</p>

<p>
Create the following file in the DocumentBase of your ROOT application (C:\www\myapp).
</p>

<h6 class="src">/hello.jsp</h6>
<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
Hello, World!
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit http://localhost:8080/hello.jsp. 
When Tomcat first receives the /hello.jsp request, Tomcat generates a servlet from hello.jsp as follows:
</p>

<pre class="prettyprint">
// .. omit ..

try {
  response.setContentType("text/html");
  pageContext = _jspxFactory.getPageContext(this, request, response,
  			null, true, 8192, true);
  _jspx_page_context = pageContext;
  application = pageContext.getServletContext();
  config = pageContext.getServletConfig();
  session = pageContext.getSession();
  out = pageContext.getOut();
  _jspx_out = out;

  out.write("&lt;html&gt;\n");
  out.write("&lt;body&gt;\n");
  out.write("Hello, World!\n");
  out.write("&lt;/body&gt;\n");
  out.write("&lt;/html&gt;\n");
} catch (java.lang.Throwable t) {
  if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
    out = _jspx_out;
    if (out != null &amp;&amp; out.getBufferSize() != 0)
      try {
        if (response.isCommitted()) {
          out.flush();
        } else {
          out.clearBuffer();
        }
      } catch (java.io.IOException e) {}
    if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
    else throw new ServletException(t);
  }
} finally {
  _jspxFactory.releasePageContext(_jspx_page_context);
}

// .. omit ..
</pre>

<p>
Because hello.jsp is created in the DocumentBase of the ROOT application,the full path to the generated servlet is CATALINA_HOME\work\Catalina\localhost\_\org\apache\jsp\hello_jsp.java.
Tomcat compiles this servlet, creates a servlet object from the servlet bytecode, and invokes the servlet object's service method.
When /hello.jsp request arrives again, Tomcat checks the changes in the the hello.jsp file contents.
If the file hasn't changed, Tomcat searches the servlet object in memory and calls its service method.
If a servlet object is not in memory, Tomcat creates a servlet object.
If there is a change in the JSP file, Tomcat make a new servlet Java source from the JSP file, compiles it, loads it in memory, and calls its service method.
</p>


<h2 id="Directives">2. Directives</h2>

<p>
Directives provide general information about a JSP to a Servlet Container.
There are three directives: page, include, and taglib.
</p>


<h3 id="page_Directives">2.1 page directive</h3>

<pre class="prettyprint no-border">
&lt;%@ page {attribute="value"} %&gt;
</pre>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 190px;">attribute="value"</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">language="scriptLanguage"</td>
	<td class="table-in-article-td">The server-side language to compile the page (mostly java)</td>
</tr>
<tr>
	<td class="table-in-article-td">import="importList"</td>
	<td class="table-in-article-td">The Java package or Java package list that the page imports. Commas (,) separate lists.</td>
</tr>
<tr>
	<td class="table-in-article-td">session="true | false"</td>
	<td class="table-in-article-td">It determines whether the page uses session data (default is true).</td>
</tr>
<tr>
	<td class="table-in-article-td">errorPage="error_uri"</td>
	<td class="table-in-article-td">The relative path of the error page that handles the JSP exceptions.</td>
</tr>
<tr>
	<td class="table-in-article-td">isErrorPage="true | false"</td>
	<td class="table-in-article-td">It determines whether this page is an error page (default is false).</td>
</tr>
<tr>
	<td class="table-in-article-td">contentType="ctinfo"</td>
	<td class="table-in-article-td">It sets the content type and charset of the response.</td>
</tr>
<tr>
	<td class="table-in-article-td">pageEncoding="charset"</td>
	<td class="table-in-article-td">It sets the charset of the JSP file. You should specify the same as the charset specified by contentType.</td>
</tr>
</table>

<p>
If omitted, there are many attributes to which the default value applies.
Therefore, you do not need to set all.
</p>

<p>
Most first page directives set the contentType attribute.
You can set this attribute only once.
</p>

<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
</pre>

<p>
The above directive sets the content type of the response to text/html and the response content's character set to UTF-8.
</p>

<pre class="prettyprint">
&lt;%@ page import="java.util.HashMap,java.util.ArrayList" %&gt;
</pre>

<p>
This setting is required for the JSP's Java code to use the HashMap and ArrayList belonging to the java.util package. You can change the above to:
</p>
 
<pre class="prettyprint">
&lt;%@ page import="java.util.HashMap" %&gt;
&lt;%@ page import="java.util.ArrayList" %&gt;
</pre>

<p>
It is recommended to code this way because it is easy to see.
</p>


<h3 id="include_Directives">2.2 include directive</h3>

<p>
The include directive add documents to the JSP.
The texts you add must be in the web application.
</p>

<pre class="prettyprint no-border">
&lt;%@ include file="header.jsp" %&gt;
</pre>

<h3 id="taglib_Directives">2.3 taglib directive</h3>

<p>
The taglib directive specifies the tag library used by the JSP page.
A tag library is a technology for creating a tag that changes to Java code when the servlet container translates a JSP into a servlet.
If you can use tags instead of Java code in JSP, you can manage your design efficiently.
The tag library uses the uri and the prefix attributes to distinguish its tag set uniquely.
</p>

<pre class="prettyprint no-border">
&lt;%@ taglib <strong>uri</strong>="tagLibraryURI" <strong>prefix</strong>="tagPrefix" %&gt;
</pre>

<p>
The uri is a URI Information that uniquely names the tag library.
The prefix distinguishes the tag libraries within a JSP page.
</p>

<p>
This book does not explain how to create a tag library.
But the JSP Standard Tag Library (JSTL) included in the JSP specification is covered in the chapter: JSP Project.
</p>

<h2 id="Scripting">3. Scripting</h2>

<p>
Scripting is used to insert Java code into JSP pages. 
There are three scripting: Declarations, Expressions, Scriptlets,
</p>

<h3 id="Declarations">3.1 Declarations</h3>

<p>
Declarations declare instance variables and instance methods of the servlet within the JSP page.
The following statement makes the instance variable of the servlet class.
</p>

<pre class="prettyprint no-border">
&lt;%! String name = new String("Alison"); %&gt;
</pre>

<p>
The following declaration makes instance method of the servlet class.
</p>

<pre class="prettyprint no-border">
&lt;%! 
public String getName() {
  return name;
} 
%&gt;
</pre>


<h3 id="Expressions">3.2 Expressions</h3>

<p>
Expressions are converted to a Java String by the servlet container.
If it can't become a Java String, ClassCastException occurs.
The following works with the previous code to print <i>Hello, Alison</i> to the web browser.
</p>

<pre class="prettyprint no-border">
Hello, &lt;%=getName()%&gt;
</pre>

<h3 id="Scriptlets">3.3 Scriptlets</h3>

<p>
You can insert Java statements freely within scriptlets.
Java statements in Scriptlets are included in the servlet's _jspSevice() method when the servlet container translates a JSP into a servlet.
</p>

<h2 id="Actions">4. Actions</h2>

<p>
Actions create or modify objects.
</p>

<h3 id="useBean">4.1 &lt;jsp:useBean&gt;</h3>

<p>
This action creates a bean or finds the bean that already made.
First, it looks for objects that use the same scope and id.
If it cannot find that object, it creates an object according to the specified scope and id attributes.
</p>

<pre class="prettyprint no-border">
&lt;jsp:useBean id="name" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" /&gt;
</pre>

<strong>&lt;jsp:useBean&gt;'s attributes</strong>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 70px;">attribute</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">id</td>
	<td class="table-in-article-td">The key for identifying the object in the same scope.</td>
</tr>
<tr>
	<td class="table-in-article-td">scope</td>
	<td class="table-in-article-td">The range in which the generated bean's reference is valid. The scope's value is one of the following: page(default), request, session, application</td>
</tr>
<tr>
	<td class="table-in-article-td">class</td>
	<td class="table-in-article-td">FQCN(Fully Qualified Class Name)</td>
</tr>
<tr>
	<td class="table-in-article-td">type</td>
	<td class="table-in-article-td">The superclass or interface of the class defined in the class attribute.</td>
</tr>
</table>

<p>
&lt;jsp:useBean id="cart" scope="request" class="example.Cart" /&gt; action is like the following scriptlet:
</p>

<pre class="prettyprint">
&lt;%
  example.Cart cart;
  cart = (example.Cart) request.getAttribute("cart");
  if (cart == null) {
    cart = new example.Cart();
    request.setAttribute("cart", cart);
  }
%&gt;
</pre>

<h3 id="setProperty">4.2 &lt;jsp:setProperty&gt;</h3>

<p>
This action sets the property value of the bean.
</p>

<pre class="prettyprint">
&lt;jsp:useBean id="login" scope="page" class="example.User" /&gt;
&lt;jsp:setProperty name="login" property="passwd" /&gt;
</pre>

<p>
The above actions are like the scriptlet below.
</p>

<pre class="prettyprint">
&lt;%
  example.User user;
  user = (example.User) pageContext.getAttribute("user");
  if (user == null) {
    user = new example.User();
    pageContext.setAttribute("user", user);
  }
  String _jspParam;
  _jspParam = request.getParameter("passwd");
  if (_jspParam != null &amp;&amp; !_jspParam.equals(""))
    user.setPasswd(_jspParam);
%&gt;
</pre>

<strong>&lt;jsp:setProperty&gt;'s attributes</strong>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 70px;">attribute</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">name</td>
	<td class="table-in-article-td">The name of the bean instance defined in &lt;jsp:useBean&gt;.</td>
</tr>
<tr>
	<td class="table-in-article-td">property</td>
	<td class="table-in-article-td">
Beans property whose value you want to change.
If property="*", all the bean properties may change by calling the setter methods that matches each parameter name in the HTTP request.
But if the parameter's value is empty, the property of the corresponding bean is not modified.
	</td>
</tr>
<tr>
	<td class="table-in-article-td">param</td>
	<td class="table-in-article-td">
The value of the param attribute is one of the parameter names of the HTTP request.
The value of the bean's property set in the property attribute becomes the param attribute's value. 
	</td>
</tr>
<tr>
	<td class="table-in-article-td">value</td>
	<td class="table-in-article-td">Change the property of the bean to the string defined in the value attribute.</td>
</tr>
</table>

<p>
Suppose you have the following form page.
</p>

<pre class="prettyprint">
&lt;form action="register.jsp" method="post"&gt;
  &lt;input type="text" name="id" /&gt;
  &lt;input type="password" name="passwd" /&gt;
&lt;/form&gt;
</pre>

<p>
Suppose there is the following action in register.jsp that receives the form input values:
</p>

<pre class="prettyprint no-border">
&lt;jsp:setProperty name="user" property="*" /&gt;
</pre>

<p>
The above action is like the scriptlet below.
</p>

<pre class="prettyprint">
&lt;%
  String _jspParam;
  _jspParam = request.getParameter("passwd");
  if ( _jspParam != null &amp;&amp; !_jspParam.equals("") )
    user.setPasswd(_jspParam);
  _jspParam = request.getParameter("id");
  if ( _jspParam != null &amp;&amp; !_jspParam.equals("") )
    user.setId(_jspParam);
%&gt;
</pre>

<p>
Suppose you have the following form page:
</p>

<pre class="prettyprint">
&lt;form action="signUp.jsp" method="post"&gt;
  &lt;input type="text" name="member_id" /&gt;
&lt;/form&gt;
</pre>

<p>
Suppose you have the following action in signUp.jsp that receives a form input value:
</p>

<pre class="prettyprint no-border">
&lt;jsp:setProperty name="user" property="id" param="member_id" /&gt;
</pre>

<p>
The above action is like the scriptlet below.
</p>

<pre class="prettyprint">
&lt;%
  String _jspParam;
  _jspParam = request.getParameter("member_id");
  if (_jspParam != null &amp;&amp; !_jspParam.equals(""))
    user.setId(_jspParam);
%&gt;
</pre>

<p>
if the name of the bean's variable and the name of the form's parameter are not equal, you need to use the param attribute.
</p>

<p>
The following is an example of the setProperty action.
</p>

<pre class="prettyprint no-border">
&lt;jsp:setProperty name="user" property="id" value="admin" /&gt;
</pre>

<p>
The above setProperty action is like the following scriptlet.
</p>

<pre class="prettyprint">
&lt;%
  user.setId("admin");
%&gt;
</pre>

<h3 id="getProperty">4.3 &lt;jsp:getProperty&gt;</h3>

<p>
The getProperty action takes the property value of the bean and puts it into the output stream.
</p>

<pre class="prettyprint">
&lt;jsp:getProperty name="name" property="propertyName" /&gt;
</pre>

<strong>&lt;jsp:getProperty&gt;'s attributes</strong>
<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 70px;">attribute</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">name</td>
	<td class="table-in-article-td">The bean instance's name</td>
</tr>
<tr>
	<td class="table-in-article-td">property</td>
	<td class="table-in-article-td">The bean instance's property</td>
</tr>
</table>

<h3 id="param">4.4 &lt;jsp:param&gt;</h3>

<p>
This action is used to define the parameters to pass to &lt;jsp:include&gt; and &lt;jsp:forward&gt;.
</p>

<pre class="prettyprint">
&lt;jsp:param name="name" value="value" /&gt;
</pre>

<h3 id="include">4.5 &lt;jsp:include&gt;</h3>

<p>
This action adds static (HTML) or dynamic web components (JSP, Servlet) to the JSP.
</p>

<pre class="prettyprint">
&lt;jsp:include page="urlSpec" flush="true"&gt;
  &lt;jsp:param ... /&gt;
&lt;/jsp:include&gt;
</pre>

<strong>&lt;jsp:include&gt;'s attributes</strong>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th" style="width: 70px;">attribute</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">page</td>
	<td class="table-in-article-td">Relative path of the resources to include</td>
</tr>
<tr>
	<td class="table-in-article-td">flush</td>
	<td class="table-in-article-td">Whether the buffer is flushed</td>
</tr>
</table>

<h3 id="forward">4.6 &lt;jsp:forward&gt;</h3>

<p>
This action does forwarding.
Forwarding means that the resource that received the client's request transfers control to another resource.
The page attribute's value is the relative address of the target resource to which controll passes.
You can use param element as the forward action's child to pass extra parameters to the target resource.
</p>

<pre class="prettyprint">
&lt;jsp:forward page="relativeURL"&gt;
  &lt;jsp:param .../&gt;
&lt;/jsp:forward&gt;
</pre>

<h2 id="Implicit_Objects">5. Implicit Objects</h2>

<p>
The JSP specification provides users with some implicit objects ready to use.
</p>

<h3 id="out">5.1 out</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.jsp.JspWriter.
It writes data to the response stream.
</p>

<p>
Create helloworld.jsp in the DocumentBase of the ROOT application as shown below and visit http://localhost:8080/helloWorld.jsp.
</p>

<h6 class="src">/helloWorld.jsp</h6>
<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
&lt;%
out.println("Hello, World!");
%&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Compare the servlet made from hello.jsp with the servlet made from helloworld.jsp. 
The full path of each servlet is:
</p>

<ul>
	<li>CATALINA_HOME\work\Catalina\localhost\_\org\apache\jsp\hello_jsp.java</li>
	<li>CATALINA_HOME\work\Catalina\localhost\_\org\apache\jsp\helloworld_jsp.java</li>
</ul>

<h3 id="request">5.2 request</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.http.HttpServletRequest.
This reference allows you to access request parameters, information sent by users in the header, and information about the user.
</p>

<p>
Create the following file in the DocumentBase of the ROOT application as shown below and visit http://localhost:8080/request.jsp?user=alison
</p>

<h6 class="src">/request.jsp</h6>
<pre class="prettyprint">
&lt;html&gt;
&lt;body&gt;
&lt;%
out.println("Hello, " + request.getParameter("user"));
%&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3 id="response">5.3 response</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.http.HttpServletResponse.
</p>

<h3 id="pageContext">5.4 pageContext</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.jsp.PageContext.
It provides access to all available resources within the JSP.
For example, it provides access to ServletRequest, ServletResponse, ServletContext, HttpSession, and ServletConfig.
</p>

<h3 id="session">5.5 session</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.http.HttpSession.
</p>

<p>
Create the following file in the DocumentBase of the ROOT application as shown below and visit http://localhost:8080/session.jsp several times.
</p>

<h6 class="src">/session.jsp</h6>
<pre class="prettyprint">
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;session&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
Integer count = (Integer)session.getAttribute("count");
  
if (count == null) {
  count = new Integer(1);
  session.setAttribute("count", count);
} else {
  count = new Integer(count.intValue() + 1);
  session.setAttribute("count", count);
}
out.println("COUNT: " + count); 
%&gt; 
&lt;/body&gt;
&lt;/html&gt;
</pre>


<h3 id="application">5.6 application</h3>

<p>
It is the reference to the instance of type: jakarta.servlet.ServletContext interface.
</p>

<h3 id="config">5.7 config</h3>

<p>
It is the reference to type: jakarta.servlet.ServletConfig.
The ServletConfig type instance contains servlet initialization parameter information.
</p>

<h3 id="page">5.8 page</h3>

<p>
It is a reference of type Object that refers to the servlet instance itself. 
So, you cannot declare a variable named page in JSP scripting. 
You seldom use this reference.
</p>

<h3 id="exception">5.9 exception</h3>

<p>
The exception implicit object provides access to the uncaught exception that occurred in JSP.
This reference is available only within pages whose page directive's isErrorPage attribute is true.
</p>

<h2 id="JSP_Confirm">6. Things to check in JSP syntax</h2>

<h3 id="include_vs_include">6.1 The differences between include directive and include action</h3>

<p>
If you use the include directive, one servlet made from one JSP into which all JSPs combined will responds to the client's request.
If you use the include action, JSsP of the include action become each independent servlet and participates in a single response.
</p>

<h3 id="ServletContext_Web-App">6.2 The relationship between ServletContext and Web application</h3>

<p>
According to the servlet specification, only one ServletContext instance must exist per web application.
ServletContext has methods that communicate with the server-side components of the web application and the servlet container.
So ServletContext serves as a common repository for JSPs and servlets.
The resources stored in ServletContext exist for the lifetime of the web application.
</p>

<h3 id="pageDirectives_session-attr">6.3 The page directive's session attribute</h3>

<p>
When the page directive's session attribute is false, such as &lt;%@ page session="false" ..&gt;, the page can not create a session object nor can it obtain a reference to the existing session instance.
If you try to access the session while session attribute is false, an exception occurs.
</p>

<h3 id="useBean_scope">6.4 The jsp:useBean action's scope</h3>

<p>
The scope attribute of &lt;jsp:useBean&gt; determines how far to use the JavaBean.
Depending on how the scope attribute is specified, the bean instance is available without being destroyed on several pages.
For example, if the scope attribute'value is session, this bean will not be destroyed until the end of the session.
The scope's default value is page.
You can select one of four values.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th">Scope</th>
	<th class="table-in-article-th">Description</th>
</tr>
<tr>
	<td class="table-in-article-td">page</td>
	<td class="table-in-article-td">
It is the default value of scope.
If you omit the scope attribute, this becomes the value of the scope attribute.
A page scope bean is valid only on the page.
A page scope bean is created each time users request the JSP page and eliminates when the page finishes execution.
A page scope bean isn't available on the target page of the target page of the include or forward action.
Even if there is the useBean action with the same id and scope bean on the target page, this action creates a new bean.
Also, the page scope bean made on the target page of the include action isn't available on the page that tabkes back control.
A page scope bean is appropriate when the state of the bean does not need to be maintained.
	</td>
</tr>
<tr>
	<td class="table-in-article-td">request</td>
	<td class="table-in-article-td">
If necessary, A useBean action with scope="request" creates a new bean and stores it in the HttpServletRequest instance.
Therefore, A request scope bean is available on the target page of the include or forward actions.
	</td>
</tr>
<tr>
	<td class="table-in-article-td">session</td>
	<td class="table-in-article-td">
If necessary, A useBean action with scope="session" creates a new bean and stores it in the HttpSession instance.
Therefore, a session scope bean is available on all JSP pages and servlets until the session is invalidated.
On the other hand, page scope beans and request scope beans disappear after the server-side components finish their job.
The session created for each user maintains values that all server-side components can reference until the session is invalidated.
But JSP with &lt;%@ page session="false"&gt; cannot use session scope beans.
	</td>
</tr>
<tr>
	<td class="table-in-article-td">application</td>
	<td class="table-in-article-td">
If necessary, A useBean action with scope="application" creates a new bean and stores it in the ServletContext instance.
Therefore, an application scope bean is available until the web application terminates.
Beans in the ServletContext are common resources for the web application because all JSPs and servlets in the same web application can access beans in the ServletContext.
You should think carefully before deciding to use application scope beans.
	</td>
</tr>
</table>

<h2 id="examples">7. JSP Examples</h2>

<h3 id="error-handling-1">7.1 JSP error handling in the early Servlet/JSP spec</h3>

<p>
JSP spec provides a way to deal with errors by giving JSP page handling only errors.
If an unhandled exception in JSP occurs, the servlet container passes the user's request to the JSP error page with an occurred exception.
To make a JSP error page, set the value of the page directive's isErrorPage attribute to true.
Create the following errorPage.jsp in the DocumentBase in the ROOT application.
</p>

<h6 class="src">/errorPage.jsp</h6>
<pre class="prettyprint">
&lt;%@ page <strong>isErrorPage="true"</strong> contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;html&gt;
&lt;body&gt;
&lt;p&gt;
The following error has occurred.&lt;br /&gt;
<strong>&lt;%=exception.getMessage() %&gt;</strong>
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<pre class="prettyprint no-border">
IsErrorPage="true" 
</pre>

<p>
It tells the container that this page deals with only errors.
</p>

<pre class="prettyprint no-border">
&lt;%=exception.getMessage() %&gt;
</pre>

<p>
It prints the message of the exception sent to the JSP error page.
Here exception is an implicit object.
Only the JSP error page can use this reference.
To see how the JSP error page works, write the following file in the DocumentBase of the ROOT application.
</p>

<h6 class="src">/errorMaker.jsp</h6>
<pre class="prettyprint">
&lt;%@ page <strong>errorPage="errorPage.jsp"</strong> contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%
if (true) {
  throw new Exception("Intentionally occurred Exception.");
}
%&gt;
</pre>

<p>
Handling errors using the JSP error page is an old way that is not well used nowadays.
</p>

<h3 id="error-handling-2">7.2 JSP error handling set in web.xml</h3>

<p>
You can specify several error pages in the web.xml file by HTTP status code and the type of exception.
</p>

<h4>HTTP status code</h4>
<p>
<strong>403</strong> Forbidden<br />
The client does not have access rights to the content; that is, it is unauthorized, so the server refuses to give the requested resource.
</p>
<p>
<strong>404</strong> Not Found<br />
The server can not find the requested resource.
</p>
<p>
<strong>500</strong> Internal Server Error<br />
The server has encountered a situation it doesn't know how to handle.
</p>
<p>
Source: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
</p>

<h6 class="src">WEB-INF/web.xml</h6>
<pre class="prettyprint">
&lt;error-page&gt;
  &lt;error-code&gt;404&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;error-code&gt;403&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
&lt;error-page&gt;
  &lt;error-code&gt;500&lt;/error-code&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
</pre>

<h6 class="src">/403.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;403&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h3&gt;403&lt;/h3&gt;
&lt;p&gt;
Forbidden
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/404.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;404&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h3&gt;404&lt;/h3&gt;
&lt;p&gt;
PAGE NOT FOUND
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/500.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8" /&gt;
&lt;title&gt;500&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
This page isn't working
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Visit http://localhost:8080/Jaqueline.jsp.
If you did not create the Jaqueline.jsp file in the Documentbase, the 404 error occurs, and the 404.jsp file responds.
But in Internet Explorer, if the error page's content is less than a particular byte, the error page may not work.
</p>

<p>
You can also declare several error pages in the web.xml file by the type of exception.
</p>

<pre class="prettyprint">
&lt;error-page&gt;
  &lt;exception-type&gt;java.lang.Throwable&lt;/exception-type&gt;
  &lt;location&gt;/error.jsp&lt;/location&gt;
&lt;/error-page&gt;
</pre>

<p>
Since all exceptions are subtypes of the Throwable type, the servlet container passes the control to error.jsp no matter what exception occurs. 
You can add more specific exceptions. If the thrown exception matches multiple exception handlers, the servlet container chooses the most accurate one of them.
</p>

<p>
With this approach, you can not use the implicit exception object in error.jsp. Instead, you can get information about occurred exception with the request's attribute value like jakarta.servlet.error.exception. 
</p>

<p>
In Scriptlet:
</p>

<pre class="prettyprint no-border">
Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
</pre>

<p>
Here is a list of the attributes of the request related to the error.
You can access all of them in the same way as above.
</p>

<table>
<tr>
	<th>jakarta.servlet.error.status_code</th>
</tr>
<tr>
	<td>
		Error status code.<br />
		Return Type: java.lang.Integer
	</td>
</tr>
<tr>
	<th>jakarta.servlet.error.exception_type</th>
</tr>
<tr>
	<td>
		Exception type.<br />
		Return Type: java.lang.Class
	</td>
</tr>
<tr>
	<th>jakarta.servlet.error.message</th>
</tr>
<tr>
	<td>
		Error message.<br />
		Return Type: String
	</td>
</tr>
<tr>
	<th>jakarta.servlet.error.exception</th>
</tr>
<tr>
	<td>
		Exceptions occurred.<br />
		Return Type: java.lang.Throwable
	</td>
</tr>
<tr>
	<th>jakarta.servlet.error.request_uri</th>
</tr>
<tr>
	<td>
		The URI of the resource that caused the problem.<br />
		Return Type: String
	</td>
</tr>
<tr>
	<th>jakarta.servlet.error.servlet_name</th>
</tr>
<tr>
	<td>
		The name of the servlet that caused the problem.<br />
		Return Type: String
	</td>
</tr>
</table>

<p>
In JSTL, which will be discussed later, the above attributes are accessed as follows:
</p>

<pre class="prettyprint no-border">
&lt;c:out value="${requestScope['jakarta.servlet.error.message']}" /&gt;
</pre>

<p>
The following file is available as a handler for all HTTP status codes and all exceptions.
</p>

<h6 class="src">/error.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Error&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
//Analyze the servlet exception
Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
String servletName = (String) request.getAttribute("jakarta.servlet.error.servlet_name");

if (servletName == null) {
  servletName = "Unknown";
}

String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");

if (requestUri == null) {
  requestUri = "Unknown";
}
 
if (statusCode != null &amp;&amp; statusCode != 500) {
  out.write("&lt;h3&gt;Error Details&lt;/h3&gt;");
  out.write("&lt;strong&gt;Status Code&lt;/strong&gt;:" + statusCode + "&lt;br&gt;");
  out.write("&lt;strong&gt;Requested URI&lt;/strong&gt;:"+requestUri);
} else {
  out.write("&lt;h3&gt;Exception Details&lt;/h3&gt;");
  out.write("&lt;ul&gt;&lt;li&gt;Servlet Name:" + servletName + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Name:" + throwable.getClass().getName() + "&lt;/li&gt;");
  out.write("&lt;li&gt;Requested URI:" + requestUri + "&lt;/li&gt;");
  out.write("&lt;li&gt;Exception Message:" + throwable.getMessage() + "&lt;/li&gt;");
  out.write("&lt;/ul&gt;");
}
%&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
It is better not to set error pages at the development stage for debugging.
</p>

<h3 id="cookie-example">7.3 Cookie</h3>

<p>
Cookies are simple data stored in the web browser and transmitted to server-side components along with user requests.
If the cookie's lifetime is specified using the setMaxAge() method, the web browser stores the cookie information as a file.
Cookies without setMaxAge() will eliminate when the web browser exits.
</p>

<strong>Cookie operation process</strong>
<ol>
	<li>The web browser requests a server resource with code that adds cookies to the HTTP response header.</li>
	<li>The server resource adds cookies value to the HTTP response header.</li>
	<li>The web browser fetches the cookie data from the response header and saves it.</li>
	<li>The web browser sends cookie data whenever it requests resources of the server that provided the cookie.</li>
</ol>

<p>
In step 2, the cookie value included in the response header looks like the string below.
</p>

<pre class="prettyprint no-border">
<strong>Set-Cookie: name=<em>VALUE</em></strong>; expires=<em>DATE</em>; path=<em>PATH</em>; domain=<em>DOMAIN_NAME</em>; secure
</pre>

<p>
The highlighted string is the required data,
<em>Italics</em> are the parts that you need to be change to actual values.
</p>

<p>
In the fourth step, the cookie information included in the request header looks like the string below.
</p>

<pre class="prettyprint no-border">
Cookie: <em>name1=VALUE1</em>; <em>name2=VALUE2</em>;...
</pre>

<strong>One cookie consists of the following information:</strong>
<ul>
	<li>name</li>
	<li>value</li>
	<li>expires</li>
	<li>domain</li>
	<li>path</li>
	<li>secure(https)</li>
</ul>

<p>
The following is Cookie class.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">jakarta.servlet.http.Cookie</dt>
	<dd class="api-summary-dd">Cookie(String name, String value)</dd>
	<dd class="api-summary-dd">getName()</dd>
	<dd class="api-summary-dd">setValue(String)</dd>
	<dd class="api-summary-dd">getValue()</dd>
	<dd class="api-summary-dd">setDomain(String)</dd>
	<dd class="api-summary-dd">getDomain()</dd>
	<dd class="api-summary-dd">setPath(String)</dd>
	<dd class="api-summary-dd">getPath()</dd>
	<dd class="api-summary-dd">setMaxAge(int)</dd>
	<dd class="api-summary-dd">getMaxAge()</dd>
	<dd class="api-summary-dd">setSecure(boolean)</dd>
	<dd class="api-summary-dd">getSecure()</dd>
</dl>	

<p>
The following code snippet shows how to use the Cookie class.
</p>
  
<pre class="prettyprint">
/*
* Creates a cookie.
*/
Cookie cookie = new Cookie("user", "alison");

/*
* If it starts with a dot, the cookie is sent to the relevant domain.
* www.java-school.net, user.java-school.net, blog.java-school.net, etc.
*/
cookie.setDomain(".java-school.net");

/*
* To create a cookie that applies to your website's every path, specify /. 
* If you set a specific path, such as /user, cookies are sent only to requests containing /user.
*/
cookie.setPath("/");

/*
* Set cookie expire time in seconds.
* If you set a negative value here, the cookie is deleted when the web browser terminates. 
*/
cookie.setMaxAge(60*60*24*30); //Cookies valid for 30 days
</pre>

<p>
Create a subdirectory named cookie in the DocumentBase and make the following files in it.
</p>

<h6 class="src">/cookie/index.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Cookie Test&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Cookie Test&lt;/h1&gt;
&lt;ul&gt;
  &lt;li&gt;&lt;a href="setCookie.jsp"&gt;Burn Cookies&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="viewCookie.jsp"&gt;Confirm Cookies&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="editCookie.jsp"&gt;Modify Cookies&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="delCookie.jsp"&gt;Delete Cookies&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/cookie/setCookie.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.net.*"  %&gt;
&lt;%
Cookie cookie = new Cookie("name", URLEncoder.encode("Alison", "UTF-8"));

/*
* If setPath() is not used, the path is set to the directory where setCookie.jsp is located. (path=/cookie)
*/ 
response.addCookie(cookie);
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Burn Cookies&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
Set-Cookie: &lt;%=cookie.getName() %&gt;=&lt;%=cookie.getValue() %&gt;&lt;br /&gt;
&lt;a href="viewCookie.jsp"&gt;Confirm Cookies&lt;/a&gt; 
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/cookie/viewCookie.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.net.*" %&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Confirm Cookies&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
Cookie[] cookies = request.getCookies();
if (cookies != null &amp;&amp; cookies.length &gt; 1) {
  int length = cookies.length;
  for (int i = 0; i &lt; length; i++) {
%&gt;
  &lt;%=cookies[i].getName() %&gt;=&lt;%=URLDecoder.decode(cookies[i].getValue(), "UTF-8") %&gt;&lt;br /&gt;
&lt;%			
  }
}
%&gt;
&lt;a href="./"&gt;index.html&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/cookie/editCookie.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.net.*" %&gt;
&lt;%
Cookie[] cookies = request.getCookies();
if (cookies != null &amp;&amp; cookies.length &gt; 1) {
  int length = cookies.length;
  for (int i = 0; i &lt; length; i++) {
    if (cookies[i].getName().equals("name")) {
      Cookie cookie = new Cookie("name", URLEncoder.encode("Bill" ,"UTF-8"));
      response.addCookie(cookie);
    }
  }
}
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Modify Cookies&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
Cookie value changed.&lt;br /&gt;
&lt;a href="viewCookie.jsp"&gt;Confirm Cookies&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h6 class="src">/cookie/delCookie.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%
Cookie[] cookies = request.getCookies();
if (cookies != null &amp;&amp; cookies.length &gt; 1) {
  int length = cookies.length;
  for (int i = 0; i &lt; length; i++) {
    if (cookies[i].getName().equals("name")) {
      Cookie cookie = new Cookie("name", "");
      cookie.setMaxAge(0);
      response.addCookie(cookie);
      break;
    }
  }
}
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Delete Cookies&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
name cookie deleted.&lt;br /&gt;
&lt;a href="viewCookie.jsp"&gt;Confirm Cookies&lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<h3 id="include-directive-example">7.4 Separate pages using include directive</h3>

<p>
Copy all files in <a href="https://github.com/kimjonghoon/example">https://github.com/kimjonghoon/example</a> and paste them to the DocumentBase of your ROOT application.
Open the index.jsp file and confirm the following:
</p>

<pre class="prettyprint no-border">
&lt;%@ include file="sub.jsp" %&gt;
</pre>

<p>
The index.jsp includes the sub.jsp.
Separating the parts of the page into independent files and consolidating them using include directives makes maintenance becomes easier.
In the sub.jsp code, the path for files, images, style sheets, and so on should be relative to the index.jsp.
Because JSP files are combined based on the index.jsp.
On the other hand, paths within style sheets should be relative to the style sheet file itself, not index.jsp.
Visit http://localhost:8080/example/ex1/index.jsp to confirm this.
</p>

<h3 id="login-process">7.5 Login using JavaBeans (using session)</h3>

<p>
The location of this example is /example/ex2/.
The login_proc.jsp page is the page that uses the bean of User type (net.java_school.user.User) to process Login.
To run the example, write net.java_school.user.User.java like below and compile it to generate bytecode in WEB-INF/classes.
</p>

<h6 class="src">User.java</h6>
<pre class="prettyprint">
package net.java_school.user;

public class User {

  private String id;
  private String passwd;
	
  public String getId() {
      return id;
  }
	
  public void setId(String id) {
      this.id = id;
  }
	
  public String getPasswd() {
      return passwd;
  }	
	
  public void setPasswd(String passwd) {
      this.passwd = passwd;
  }

}
</pre>

<p>
Visit http://localhost:8080/example/ex2/index.jsp and test Login.
</p>

<p>
Confirm the following code in the index.jsp.
</p>

<pre class="prettyprint no-border">
&lt;input type="text" name="<strong>id</strong>" /&gt;
</pre>

<p>
The id parameter goes to login_proc.jsp.
Confirm the following code in the login_proc.jsp.
</p>

<pre class="prettyprint no-border">
String id = request.getParameter("<strong>id</strong>");
</pre>

<p>
You can get the value of the id parameter in login_proc.jsp using the getParameter() method of the request implicit object.
The login_proc.jsp creates a User object and sets its instance variables using the passed id and passwd parameters.
The login process completes by putting this User object in the session.
To simplify the example, I omitted the code related to the database.
Therefore, log in is successful for any ID and password.
</p>

<h6 class="src">login_proc.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;

&lt;%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

/* 
* Here you need the logic to query the database for members with id and passwd.
*/
User user = new User();
user.setId(id);

//Store the User instance in the session with the key named user.
session.setAttribute("user", user);
%&gt;

&lt;jsp:forward page="index.jsp" /&gt;
</pre>

<h3 id="login-process-2">7.6 Modify the 'Login using JavaBeans (using session)' to be an example using action</h3>

<p>
The location of the example is /example/ex3/.
The login_proc.jsp uses actions.
</p>

<h6 class="src">/login_proc.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="net.java_school.user.User" %&gt;
&lt;jsp:useBean id="user" scope="session" class="net.java_school.user.User" /&gt;
&lt;jsp:setProperty name="user" property="*"/&gt;
&lt;jsp:forward page="index.jsp" /&gt;
</pre>

<p>
The useBean action finds an object with the "user" key in the session.
If there is no such object, this action creates a User object from the net.java_school.user.User class and store it in the session with the value of id attribute value of the useBean action, the User object's key.
The setProperty action sets the instance variables by calling the JSP beans's setter methods with the parameters's values in the HTTP request.
</p>

<pre class="prettyprint no-border">
&lt;jsp:setProperty name="user" property="*"/&gt;
</pre>

<p>
The above action calls the setId() and setPasswd() methods of the User bean.
The servlet container finds all setter methods that match the HTTP request parameters and passes the request parameter's value of the setter method as an argument.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th">JSP or JSP bean</th>
	<th class="table-in-article-th">Code</th>
</tr>
<tr>
	<td class="table-in-article-td">index.jsp</td>
	<td class="table-in-article-td"><pre class="prettyprint no-border">&lt;input type="text" name="<strong>id</strong>" /&gt;</pre></td>
</tr>
<tr>	
	<td class="table-in-article-td">login_proc.jsp</td>
	<td class="table-in-article-td"><pre class="prettyprint no-border">&lt;jsp:setProperty name="login" property="<strong>id</strong>" /&gt;</pre></td>
</tr>
<tr>
	<td class="table-in-article-td">User.java</td>
	<td class="table-in-article-td"><pre class="prettyprint no-border">set<strong>Id</strong>(String id)</pre></td>
</tr>
</table>

<p>
In the "setId()" method name, the "I" in Id is an uppercase letter.
(We already studied Java naming convention in the Java chapter)
The setProperty action will not work unless beans follow the Java naming convention.
Here, the Java naming convention is not a recommendation, but a grammar.
</p>

<h3 id="fileList-example">7.7 JSP examples related to files</h3>

<p>
We already covered the file upload example in the Servlet chapter.
The following JSP shows a list of uploaded files in the upload folder.
</p>

<h6 class="src">/fileList.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="java.io.*" %&gt;
&lt;%@ page import="java.net.*" %&gt;
&lt;%
String upload = application.getRealPath("/upload");

File dir = new File(upload);
File[] files = dir.listFiles();
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;List of saved files&lt;/title&gt;
&lt;script type="text/javascript"&gt;
function goDownload(filename) {
  var form = document.getElementById("downForm");
  form.filename.value = filename;
  form.submit();
}
&lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;%
int len = files.length;
for (int i = 0; i &lt; len; i++) {
  File file = files[i];
  String filename = file.getName();
%&gt;
  &lt;a href="javascript:goDownload('&lt;%=filename %&gt;')"&gt;&lt;%=file.getName() %&gt;&lt;/a&gt;&lt;br /&gt;
&lt;%
}
%&gt;
&lt;form id="downForm" action="download.jsp" method="post"&gt;
  &lt;input type="hidden" name="filename" /&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
The following JSP responds when you click the file name on the file list page above.
</p>

<h6 class="src">/download.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %&gt;
&lt;%@ page import="java.io.File" %&gt;
&lt;%@ page import="java.net.URLEncoder" %&gt;
&lt;%@ page import="java.io.OutputStream" %&gt;
&lt;%@ page import="java.io.FileInputStream" %&gt;
&lt;%@ page import="java.io.IOException" %&gt;
&lt;%@ page import="org.apache.commons.io.FileUtils" %&gt;
&lt;%
request.setCharacterEncoding("UTF-8");
String filename = request.getParameter("filename");

String path = application.getRealPath("/upload");
File file = new File(path + "/" + filename);

response.setContentLength((int) file.length());

String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());
if (filetype.trim().equalsIgnoreCase("txt")) {
  response.setContentType("text/plain");
} else {
  response.setContentType("application/octet-stream");
}

String userAgent = request.getHeader("user-agent");
boolean ie = userAgent.indexOf("MSIE") != -1;
if (ie) {
  filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
} else {
  filename = new String(filename.getBytes("UTF-8"), "8859_1");
}

response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
/* response.setHeader("Content-Transfer-Encoding", "binary"); */

OutputStream outputStream = response.getOutputStream();

try {
  FileUtils.copyFile(file, outputStream);
} finally {
  outputStream.flush();
}
%&gt;
</pre>

<p>
The following is the JSP replacement of the file upload servlet in the Servlet chapter.
</p>

<h6 class="src">fileupload_proc.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%&gt;
&lt;%@ page import="
java.util.Iterator,
java.io.File,java.util.List,
jakarta.servlet.http.HttpServletRequest,
org.apache.commons.fileupload.FileItem,
org.apache.commons.fileupload.FileItemFactory,
org.apache.commons.fileupload.FileUploadException,
org.apache.commons.fileupload.disk.DiskFileItemFactory,
org.apache.commons.fileupload.servlet.ServletFileUpload" %&gt;
&lt;%
//Check that we have a file upload request
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//Create a factory for disk-based file items
DiskFileItemFactory factory = new DiskFileItemFactory();

//Configure a repository (to ensure a secure temp location is used)
File repository = (File) application.getAttribute("jakarta.servlet.context.tempdir");
factory.setRepository(repository);

//Create a new file upload handler
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8");
//Parse the request
List&lt;FileItem&gt; items = upload.parseRequest(request);
//Process a file upload
Iterator&lt;FileItem&gt; iter = items.iterator();
while (iter.hasNext()) {
  FileItem item = iter.next();
  String fileName = null;
  if (!item.isFormField()) {
    String fieldName = item.getFieldName();
    out.println("fieldName : " + fieldName);out.println(",");
    fileName = item.getName();
    out.println("fileName : " + fileName);out.println(",");
    String contentType = item.getContentType();
    out.println("contentType : " + contentType);out.println(",");
    boolean isInMemory = item.isInMemory();
    out.println("isInMemory : " + isInMemory);out.println(",");
    long sizeInBytes = item.getSize();
    out.println("sizeInBytes : " + sizeInBytes);
  }
  // Process a file upload
  String dir = application.getRealPath("/upload");
  File uploadedFile = new File(dir + "/" + fileName);
  item.write(uploadedFile);
}
response.sendRedirect("upload.html");
%&gt;
</pre>

<div id="next-prev">
	<ul>
		<li>Next : <a href="<c:url value="/jsp/using-jdbc"/>">Using JDBC</a></li>
		<li>Prev : <a href="<c:url value="/jsp/servlets"/>">Servlets</a></li>
	</ul>
</div>

</article>