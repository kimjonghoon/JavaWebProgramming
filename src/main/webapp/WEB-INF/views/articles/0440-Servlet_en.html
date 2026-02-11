<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Servlet</title>
<meta name="Keywords" content="Java,Servlet,basic structure of servlet,GenericServlet,HttpServlet,ServletConfig,init(),service(),destroy(),ServletConext,RequestDispatcher,ServletRequest,HttpServletRequest,ServletResponse,HttpServletResponse,HttpSession,Cookie,Servlet examples,getParameter(),getParameterValues(),getParameterNames(),RequestDispatcher,ServletContext Initialization Parameters,Listener,custom connection pool,Filter,MultipartRequest,commons-fileupload,Session," />
<meta name="Description" content="This article describes Servlet" />
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

<h1>Servlet</h1>

<h2>What is a Servlet?</h2>

<p>
Servlet is a Java-based technology for creating programs such as bulletin boards. 
Just as the java.sql and javax.sql packages are called JDBC, the jakarta.servlet and jakarta.servlet.http packages are called Servlet. Servlet is independent of the network protocol but mainly used to create server-side components which operate in the HTTP protocol environment.
</p>

<h2>The basic structure of Servlet</h2>

<p>
The basic structure of Servlet consists of:
</p>

<ul>
	<li>The jakarta.servlet.Servlet interface which all servlets must implement</li>
	<li>The jakarta.servlet.GenericServlet abstract class which most servlets inherit</li>
	<li>The jakarta.servlet.http.HttpServlet class which servlets operate in the HTTP protocol inherit</li>
</ul>

<P>
As shown in the figure below, GenericServlet implements the jakarta.servlet.ServletConfig interface.<br />
<img src="https://lh3.googleusercontent.com/9IeGxc54vtjXg7SZtRqTESFpYFI6hbHBfx3-qaC9_yYdi7nNWGFLTeU8-bsaMmxAMNxmFjYft3QoJ_kAIkAH_vJej5nvX3IFQImNYjkBWmo8UEgo8VXNEKHN2qSJJ8udkzP8DeH1oYG4-Cc9r1UE8XcavlPJOmB4eQcrTipIZNFqeSYwyWCI6oGhum_NW2sR2TvzQYVzS8NEQi8I8J42esbVLBQnOCjegriVNy3AJqmwlvIkXqG9IXRA1zsAcQnUDpjs7x6ThOPvr00-mSp11qHNZ5aQLGhBf4nbaM6I9fALeMf984mcpHSMVwhx6aS5DZiwLooxcyRxmYPvTEG1FzBepUuBm8O5XNNBe_p_50ZdwUcSFW0qBdfTCvNdAnhfSf5DA0VIehZsv-0uHt-QqeDk1wNvGI8g-NB66O4iz5Ywm1M1BZ7qaGNUonHZBVaaeMWfHVQB94wj6NxOhJCGmXuBfn99WEe82GBF4zn9bjOaedAAR2-Pz2lw3J0BZbEzix6VIKyHzzD1Egq1I_6uW1mkb40Aiqa-xX4cudg6rfXTeW007lcK7TD1TqKaxDrQMfjxzV-0f4Fscsb7aznqLYP21cFlk0IEbQklRwfjMVnS_S1q8llGoA1h=w495-h921-no" alt="Servlets Framework" /><br />
The figure does not show all properties and methods of GenericServlet and HttpServlet.
</p>

<h3>Servlet Interface</h3>

<p>
The jakarta.servlet.Servlet interface is the heart of a Servlet architecture.
All servlets must implement this interface.
The Servlet interface declares the lifecycle methods of Servlet.
</p>

<ul>
	<li><strong>init()</strong> initializes the servlet</li>
	<li><strong>service()</strong> services to client requests</li>
	<li><strong>destroy()</strong> stops service, returns resources</li>
</ul>

<h4>init()</h4>

<p>
The servlet container calls the init() method once after it created the servlet object. A servlet can service only after the init() method completes without errors. Before the init() completes, requests are blocked. The init() method receives the object of the ServletConfig interface type as an argument. If you set the Servlet initialization parameters in web.xml, this ServletConfig will have servlet initialization information set in web.xml. If there is servlet initialization information, you have to write the code to initialize the servlet in the body of the init() method.
</p>
 
<pre class="prettyprint no-border">
void init(ServletConfig config) throws ServletException;
</pre>

<h4>service()</h4>

<p>
A client sends a request to a servlet. The servlet container intercept the client's request and then calls the corresponding servlet's service() method. The service() method reads the request information from the ServletRequest type instance that is the first argument and responds to the client using the ServletResponse type instance that is the second argument.
</p>

<p>
Note that the servlet container executes the service() method on a new thread whenever a client sends a request. So a servlet can respond to a large number of client requests without delay. However, the critical section problem can arise with resources that the servlet uses (files, network connections, static variables, instance variables, etc.). Synchronizing resources used by the servlet is not good code in most cases. It is best not to create static or instance variables within the servlet class's body.
</p>

<pre class="prettyprint no-border">
void service(ServletRequest req, ServletResponse res) throws ServletException, IOException;
</pre>


<h4>destroy()</h4>

<p>
It is called by the servlet container when the servlet is no longer in service. This method is not what the programmer calls in code. If you unload the web application using the tomcat manager or shut down Tomcat, the destroy() of servlets executes. The tomcat manager is a web application that you can access at http://localhost:8080/manager. You can manage web applications with the tomcat manager. The tomcat manager needs you to log in with the administrator id and password you set when installing Tomcat. If you do not remember your administrator id and password, you can see that in the CATALINA_HOME/conf/tomcat-users.xml.
</p>

<pre class="prettyprint no-border">
void destroy();
</pre>


<h3>GenericServlet abstract class</h3>

<p>
Most servlets inherit GenericServlet. GenericServlet implements Servlet and ServletConfig interface. Because GenericServlet does not implement the service() method of Servlet interface, GenericServlet's service() method remains an abstract method, so GenericServlet is an abstract class. Subclasses that inherit GenericServlet must implement the following service() method.
</p>

<pre class="prettyprint no-border">
public abstract void service(ServletRequest req, ServletResponse res) throws ServletException, IOException;
</pre>

<p>
The init(ServletConfig config) method is implemented in GenericServlet as follows:
</p>

<pre class="prettyprint no-border">
public void init(ServletConfig config) throws ServletException {
  this.config = config;
  <strong>this.init();</strong>
}
</pre>

<p>
The init(ServletConfig config) method calls the init() method with no parameters on the last line. The parameterless init() method was added to the GenericServlet for convenience. This method has nothing in the method body like below.
</p>

<pre class="prettyprint no-border">
public void init() throws ServletException {

}
</pre>

<p>
You better override the parameterless init() rather than the init(ServletConfig config) in the subclass because you don't have to worry about storing the ServletConfig object. if you overrie the init(ServletConfig config) method in a subclass, you need to add super.init(config); code on the first line. Without this code, the servlet will not store the ServletConfig object.
</p>

<p>
The init(ServletConfig config) method saves the ServletConfig object received as an argument in the instance variable config. The getServletConfig() method of GenericServlet returns this variable's value.
</p>

<pre class="prettyprint no-border">
public ServletConfig getServletConfig() {
  return config;
}
</pre>

<p>
The getServletContext() is method of ServletConfig interface. GenericServlet implements ServletConfig interface. The getServletContxt() method of GenericServlet returns an object of type ServletContext.
</p>

<pre class="prettyprint no-border">
public ServletContext getServletContext() {
  return getServletConfig().getServletContext();
}
</pre>

<p>
The getInitParameter() and getInitParameterNames() methods of the ServletConfig interface are implemented as follows in the GenericServlet.
</p>

<pre class="prettyprint no-border">
public String getInitParameter(String name) {
  return getServletConfig().getInitParameter(name);
}
</pre>

<pre class="prettyprint no-border">
public Enumeration getInitParameterNames() {
  return getServletConfig().getInitParameterNames();
}   
</pre>

<p>
The Enumeration interface has two methods to access the data in order:
hasMoreElements() and nextElement().
</p>

<p>
It is for the convenience of the programmer that GenericServlet implements ServletConfig. It is easier to use this.getServletContext() rather than this.getServletConfig().GetServletContext() to get the reference to an object of type ServletContext in servlet. It is easier to use String driver = this.getInitParameter("driver") rather than String driver = this.getServletConfig().GetInitParameter("driver") to get servlet's initialization parameter information.
</p>


<h3>HttpServlet</h3>

<p>
Servlet responding HTTP requests should inherit HttpServlet abstract class. HttpServlet inherits GenericServlet abstract class. HttpServlet provides methods for handling HTTP requests.
</p>

<p>
The service() of HttpServlet has the following two parameters.
</p>

<ul>
	<li>HttpServletRequest</li>
	<li>HttpServletResponse</li>
</ul>

<p>
When the user's request reaches the server, the servlet container intercepts the request, creates two instances. One is the object of type HttpServletRequest from the user's request information. Another is the object of type HttpServletResponse required when the servlet sends the result to the user. The servlet container delivers created two objects to the servlet by calling the service(ServletRequest req, ServletResponse resp) method and this method the service(HttpServletRequest req, HttpServletResponse resp) method.
</p>

<p>
HttpServlet class implements the GenericServlet's service() abstract method by calling the protected void service(HttpServletRequest req, HttpServletResponse resp) method.
</p>

<pre class="prettyprint">
public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	
  HttpServletRequest  request;
  HttpServletResponse response;
	
  try {
    request = (HttpServletRequest) req;
    response = (HttpServletResponse) res;
  } catch (ClassCastException e) {
    throw new ServletException(&quot;non-HTTP request or response&quot;);
  }
	
  <strong>service(request, response);</strong>
}
</pre>

<p>
Eventually, the following method handles the HTTP request.
</p>

<pre class="prettyprint">
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

  String method = req.getMethod();

  if (method.equals(METHOD_GET)) {
    long lastModified = getLastModified(req);
    if (lastModified == -1) {
      // servlet doesn't support if-modified-since, no reason
      // to go through further expensive logic
      <strong>doGet(req, resp);</strong>
    } else {
      long ifModifiedSince = req.getDateHeader(HEADER_IFMODSINCE);
      if (ifModifiedSince &lt; (lastModified / 1000 * 1000)) {
        // If the servlet mod time is later, call doGet()
        // Round down to the nearest second for a proper compare
        // A ifModifiedSince of -1 will always be less
        maybeSetLastModified(resp, lastModified);
        <strong>doGet(req, resp);</strong>
      } else {
        resp.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
      }
    }
  } else if (method.equals(METHOD_HEAD)) {
    long lastModified = getLastModified(req);
    maybeSetLastModified(resp, lastModified);
    doHead(req, resp);
  } else if (method.equals(METHOD_POST)) {
    <strong>doPost(req, resp);</strong>
  } else if (method.equals(METHOD_PUT)) {
    doPut(req, resp);
  } else if (method.equals(METHOD_DELETE)) {
    doDelete(req, resp);
  } else if (method.equals(METHOD_OPTIONS)) {
    doOptions(req,resp);
  } else if (method.equals(METHOD_TRACE)) {
    doTrace(req,resp);
  } else {
    //
    // Note that this means NO servlet supports whatever
    // method was requested, anywhere on this server.
    //
    String errMsg = lStrings.getString("http.method_not_implemented");
    Object[] errArgs = new Object[1];
    errArgs[0] = method;
    errMsg = MessageFormat.format(errMsg, errArgs);

    resp.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED, errMsg);
  }
}	
</pre>

<p>
The only thing the HttpServlet's +service() method does is call the #service() method. (Where + denotes the public access modifier and # the protected access modifier)
</p>

<p>
When the #service() method of HttpServlet class runs, this method reads the HTTP METHOD (POST, GET etc.) in the request object (an object of type HttpServletRequest) and calls the matching method according to this value. For example, if the HTTP method is "GET", it calls doGet() and if "POST", it calls the doPost() method. Methods like doGet() and doPost() are the methods we need to override.
</p>

<p>
HttpServletRequest interface inherits ServletRequest interface. HttpServletResponse interface inherits ServletResponse interface. A vendor making servlet container makes classes that implement HttpServletRequest and HttpServletResponse interfaces.
</p>

<h2>Summary of Servlet API</h2>
<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">Servlet Interface</dt>
	<dd class="api-summary-dd">init(ServletConfig config)</dd>
	<dd class="api-summary-dd">service(ServletRequest req, ServletResponse resp)</dd>
	<dd class="api-summary-dd">destroy()</dd>
	<dd class="api-summary-dd">getServletConfig():ServletConfig</dd>
	<dd class="api-summary-dd-method-desc">Returns a ServletConfig object, which contains initialization and startup parameters for this servlet.</dd>
	<dd class="api-summary-dd">getServletInfo():String</dd>
	<dd class="api-summary-dd-method-desc">Return simple information about this servlet</dd>
</dl>	

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">ServletConfig Interface</dt>
	<dd class="api-summary-dd">getInitParameter(String name):String</dd>
	<dd class="api-summary-dd-method-desc">Gets the value of the initialization parameter with the given name.</dd>
	<dd class="api-summary-dd">getInitParameterNames():Enumeration</dd>
	<dd class="api-summary-dd-method-desc">Return the names of the servlet's initialization parameters as an Enumeration of String objects, or an empty Enumeration if the servlet has no initialization parameters.</dd>
	<dd class="api-summary-dd">getServletContext():ServletContext</dd>
	<dd class="api-summary-dd-method-desc">Return a reference to the ServletContext</dd>
	<dd class="api-summary-dd">getServletName():String</dd>
	<dd class="api-summary-dd-method-desc">Return the name of this servlet instance</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">+GenericServlet Abstract class</dt>
	<dd class="api-summary-dd-class-desc bottom-line">This class defines a generic, protocol independent servlet. This class implements Servlet and ServletConfig interface.</dd>
	<dd class="api-summary-dd">+init()</dd>
	<dd class="api-summary-dd-method-desc">Servlet initialization method, which is called by GenericServlet's init(ServletConfig config) method</dd>
	<dd class="api-summary-dd">&lt;&lt;abstract&gt;&gt; +service(ServletRequest req, ServletResponse res)</dd>
	<dd class="api-summary-dd-method-desc">The GenericServlet abstract class still does not implement the service() method of the Servlet interface.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">HttpServlet Abstract class</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Inherits GenericServlet.</dd>
	<dd class="api-summary-dd">#doGet(HttpServletRequest req, HttpServletResponse resp)</dd>
	<dd class="api-summary-dd-method-desc">Method to handle HTTP GET requests</dd>
	<dd class="api-summary-dd">#doPost(HttpServletRequest req, HttpServletResponse resp)</dd>
	<dd class="api-summary-dd-method-desc">Method to handle HTTP POST</dd>
	<dd class="api-summary-dd">+service(ServletRequest req, ServletResponse res)</dd>
	<dd class="api-summary-dd-method-desc">This method overrides GenericServlet's abstract method service(). This method does nothing other than call the #service() method.</dd>
	<dd class="api-summary-dd">#service(HttpServletRequest req, HttpServletResponse resp)</dd>
	<dd class="api-summary-dd-method-desc">Call one of doGet(req, resp), doHead(req, resp), doPost(req, resp), doGet(req, resp), doDelete(req, resp), doOptions(req, resp), doTrace(req, resp) according to the HTTP METHOD.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">ServletContext Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">
This interface provides a set of methods that a servlet uses to communicate with its servlet container. These methods do following:
<ul>
	<li>Get the MIME type of a file</li>
	<li>Get the full path of a file</li>
	<li>Dispatch requests</li>
	<li>Write to a log file</li>
</ul>
MIME means Multipurpose Internet Mail Extensions, for example, MIME of .html is text/html, .txt is text/plain, .gif is image/gif.<br />
There is one ServletContext instance per web application. This instance serves as a common repository for dynamic components. In other words, data stored in the ServletContext is freely accessible form servlets and JSPs within the same web application. 
	</dd>
	<dd class="api-summary-dd">setAttribute(Strng name, Object value)</dd>
	<dd class="api-summary-dd-method-desc">Stores data as a name-value pair.</dd>
	<dd class="api-summary-dd">getAttribute(String name):Object</dd>
	<dd class="api-summary-dd-method-desc">Returns data with the given name.</dd>
	<dd class="api-summary-dd">removeAttribute(String name)</dd>
	<dd class="api-summary-dd-method-desc">Removes the data with the given name.</dd>
	<dd class="api-summary-dd">getInitParameter(String name):String</dd>
	<dd class="api-summary-dd-method-desc">Returns the value of the web application initialization parameter with the given name.</dd>
	<dd class="api-summary-dd">getRequestDispatcher(String path):RequestDispatcher</dd>
	<dd class="api-summary-dd-method-desc">Returns a RequestDispatcher object for the resource located at the given path.</dd>
	<dd class="api-summary-dd">getRealPath(String path):String</dd>
	<dd class="api-summary-dd-method-desc">Returns the real path corresponding to the given virtual path.</dd>
	<dd class="api-summary-dd">getResource(String path):URL</dd>
	<dd class="api-summary-dd-method-desc">Returns a URL to the resource, which is mapping to the given path.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">RequestDispatcher Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Used to sends requests from the client to any resource (such as a servlet, HTML file, or JSP file) on the server or adds another resource's contents to the response.</dd>
	<dd class="api-summary-dd">forward(ServletRequest req, ServletResponse res)</dd>
	<dd class="api-summary-dd-method-desc">Forwards a request from a servlet to another resource (servlet, JSP file, or HTML file) on the server.</dd>
	<dd class="api-summary-dd">include(ServletRequest req, ServletResponse res)</dd>
	<dd class="api-summary-dd-method-desc">Includes the contents of a resource (servlet, JSP file, HTML file) in the response.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">ServletRequest Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Contains client request information.</dd>
	<dd class="api-summary-dd">setAttribute(String name, Object o)</dd>
	<dd class="api-summary-dd-method-desc">Stores data as a name-value pair in this request.</dd>
	<dd class="api-summary-dd">getAttribute(String name):Object</dd>
	<dd class="api-summary-dd-method-desc">Returns the stored data with the given name.</dd>
	<dd class="api-summary-dd">removeAttribute(String name)</dd>
	<dd class="api-summary-dd-method-desc">Removes the stored data with the given name.</dd>
	<dd class="api-summary-dd">getInputStream():ServletInputStream</dd>
	<dd class="api-summary-dd-method-desc">Returns an input stream to read the binary data in the body of the request.</dd>
	<dd class="api-summary-dd">getParameter(String name):String</dd>
	<dd class="api-summary-dd-method-desc">Returns the value of the HTTP parameter with the given name.</dd>
	<dd class="api-summary-dd">getParameterNames():Enumeration</dd>
	<dd class="api-summary-dd-method-desc">Return all HTTP parameter names as an Enumeration type.</dd>
	<dd class="api-summary-dd">getParameterValues(String name):String[]</dd>
	<dd class="api-summary-dd-method-desc">Returns all the values of the HTTP parameter with the given name as a String array. This method returns multiple values in a single HTTP parameter, such as a checkbox or a multiple-selection list.</dd>
	<dd class="api-summary-dd">getRemoteAddr():String</dd>
	<dd class="api-summary-dd-method-desc">Returns the client's IP address.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">HttpServletRequest Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Inherits ServletReqeust.</dd>
	<dd class="api-summary-dd">getCookies():Cookie[]</dd>
	<dd class="api-summary-dd-method-desc">Returns an array containing all cookie objects the client sent with this request.</dd>
	<dd class="api-summary-dd">getSession():HttpSession</dd>
	<dd class="api-summary-dd-method-desc">Returns current session associated with this request, or if the request does not have a session, creates one.</dd>
	<dd class="api-summary-dd">getSession(boolean create):HttpSession</dd>
	<dd class="api-summary-dd-method-desc">Returns the current session associated with this request or, if there is no current session and create's value is true, returns a new session. If create is false, returns null.</dd>
	<dd class="api-summary-dd">getContextPath():String</dd>
	<dd class="api-summary-dd-method-desc">Returns the part of the request URI that indicates the context of this request. If you request http://localhost:8080/contextPath/board/list.jsp?page=1, it will return "/contextPath".</dd>
	<dd class="api-summary-dd">getRequestURI():String</dd>
	<dd class="api-summary-dd-method-desc">If you request http://localhost:8080/ContextPath/board/list.jsp?page=1, it will return "/ContextPath/board/list.jsp".</dd>
	<dd class="api-summary-dd">getServletPath():String</dd>
	<dd class="api-summary-dd-method-desc">Returns the part of this request's URL that calls the servlet.</dd>
	<dd class="api-summary-dd">getQueryString():String</dd>
	<dd class="api-summary-dd-method-desc">If you request http://localhost:8080/ContextPath/board/list.jsp?page=1, it will return "page=1".</dd>
</dl>


<dl class="api-summary">
	<dt class="api-summary-dt">ServletResponse Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Used to send a response to client.</dd>
	<dd class="api-summary-dd">getOutputStream():ServletOutputStream</dd>
	<dd class="api-summary-dd-method-desc">Returns an output stream for writing binary data in the response.</dd>
	<dd class="api-summary-dd">getWriter():PrintWriter</dd>
	<dd class="api-summary-dd-method-desc">Returns an output stream for writing character text in the response.</dd>
	<dd class="api-summary-dd">setContentType(String type)</dd>
	<dd class="api-summary-dd-method-desc">
Sets the content type of the response being sent to the client. (For example, if the response data is HTML, set MIME to text/html, if plain text, set MIME to text/plain, if binary data, set MIME to application/octet-stream) It should be called before the getWriter() method.
	</dd>
	<dd class="api-summary-dd">getContentType():String</dd>
	<dd class="api-summary-dd-method-desc">
Return the content type specified by the setContentType() method or returns null if not specified.
	</dd>
	<dd class="api-summary-dd">setCharacterEncoding(String charset)</dd>
	<dd class="api-summary-dd-method-desc">
Sets the character encoding (MIME charset) of the response. To set it to UTF-8, code as setCharacterEncoding ("UTF-8");. SetCharacterEncoding("UTF-8"); is equivalent to <em>charset=UTF-8</em> in setContentType("text/html; <em>charset=UTF-8</em>"); in JSP code. It should be called before the getWrite() method is executed.
	</dd>
	<dd class="api-summary-dd">getCharacterEncoding():String</dd>
	<dd class="api-summary-dd-method-desc">
Returns the name of the character encoding (MIME charset) used for the body  of this response. Returns "ISO-8859-1" if no character encoding is specified.
	</dd>
	<dd class="api-summary-dd">setContentLength(int length)</dd>
	<dd class="api-summary-dd-method-desc">
Sets the length of the content body in the response with an int value. This method sets the HTTP Content-Length header.	
	</dd>				
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">HttpServletResponse Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">
Inherits the ServletResponse interface. 
Used to send an HTTP response to the client.
	</dd>
	<dd class="api-summary-dd">addCookie(Cookie cookie)</dd>
	<dd class="api-summary-dd-method-desc">Adds the specified cookie to the response header.</dd>
	<dd class="api-summary-dd">sendRedirect(String location)</dd>
	<dd class="api-summary-dd-method-desc">Sends a temporary redirect response to the client using the given location URL.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">HttpSession Interface</dt>
	<dd class="api-summary-dd-class-desc bottom-line">Used to store user information needed for session maintenance on the server-side.</dd>
	<dd class="api-summary-dd">getAttribute(String name):Object</dd>
	<dd class="api-summary-dd">setAttribute(String name, Object value)</dd>
	<dd class="api-summary-dd">removeAttribute(String name)</dd>
	<dd class="api-summary-dd">invalidate()</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt">Cookie</dt>
	<dd class="api-summary-dd-class-desc bottom-line">
Cookies are the information stored on the client-side for session maintenance. For maintaining the session, the web browser adds the cookie information to the request whenever it sends a request to the server that sent the cookie. Cookies can store multiple name-value pairs. Also, cookies can have optional values for path, domain, expiration date, and security. To create a cookie on a server-side component, you need to write code that adds a string of the promised format to the response header.  A web browser that receives a response containing cookie information will also send cookie information whenever it sends a client request. The cookie information passed to the server-side component can be obtained as an array type using the getCookie() method of HttpServletRequest. Cookie or session is the technology that overcomes the HTTP protocol's limitations to disconnect after a response.
	</dd>
	<dd class="api-summary-dd">Cookie(String name, String value)</dd>
	<dd class="api-summary-dd">getName():String</dd>
	<dd class="api-summary-dd">getValue():String</dd>
	<dd class="api-summary-dd">setValue(String newValue)</dd>
	<dd class="api-summary-dd">getPath():String</dd>
	<dd class="api-summary-dd">setPath(String uri)</dd>
	<dd class="api-summary-dd">getDomain():String</dd>
	<dd class="api-summary-dd">setDomain(String pattern)</dd>
	<dd class="api-summary-dd">getMaxAge():int</dd>
	<dd class="api-summary-dd">setMaxAge(int expiry)</dd>
	<dd class="api-summary-dd">getSecure():boolean</dd>
	<dd class="api-summary-dd">setSecure(boolean flag)</dd>
</dl>


<h2>Servlet Examples</h2>

<p>
Write all the examples below in the ROOT application.
In the <a href="Creating-a-new-web-application">Creating a new web application</a>, 
we changed the application with the document base C:/www/myapp to the ROOT application.
Create JSPs in C:/www/myapp and java sources in C:/www/myapp/WEB-INF/src.
Instead of using Eclipse, use a regular editor such as EditPlus.
</p>

<h6 class="src">SimpleServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SimpleServlet extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    doPost(req,resp);
  }
	
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) 
      throws ServletException, IOException {
			
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    	
    out.println("&lt;html&gt;");
    out.println("&lt;body&gt;");
    	
    //Output the IP of client
    out.println("Your IP Address is " + req.getRemoteAddr() + ".\n");
    out.println("&lt;/body&gt;&lt;/html&gt;");
    out.close();
  }
  
}
</pre>

<p>
SimpleServlet does not implement servlet lifecycle methods init() and destroy(). These methods are already implemented in GenericServlet and are not visible in the above sources because there is no reason to override them. Open the /WEB-INF/web.xml file and add the servlet element to the subelement of the web-app element, as shown below.
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;SimpleServlet&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.SimpleServlet&lt;/servlet-class&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;SimpleServlet&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/simple&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
At the command prompt, navigate to the folder where SimpleServlet.java exists and compile as shown below.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp "C:/apache-tomcat-9.0.87/lib/servlet-api.jar" ^
SimpleServlet.java
</pre>

<dl class="note">
<dt>package jakarta.servlet.http does not exist</dt>
<dd>
The above compilation error means that the Java compiler can not find the jakarta.servlet.http package. Because you did not add the full path to the servlet-api.jar file as the javac's cp option value, if the classpath you are adding as cp option's value contains whitespace character, you must enclose it with double quotes character (").
</dd>
</dl>

<p>
Restart Tomcat and visit http://localhost:8080<em>/simple</em>.
</p>

<h3>SimpleServlet.java source description</h3>

<pre class="prettyprint">
public class SimpleServlet extends HttpServlet
</pre>

<p>
Servlets that inherit the HttpServlet class must be declared public.
</p>

<pre class="prettyprint">
@Override
public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  doPost(req, resp);
}

@Override
public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  //.. omit ..
}
</pre>

<p>
The doGet() and doPost() methods are methods that override the doGet() and doPost() methods of HttpServlet. A servlet that receives a GET request overrides the doGet() method.
It is a request of the GET method to request the resource of the web server by inputting the address in the web browser.
In the above example, the doGet() method calls the doPost() method.
Therefore, the same code is executed whether it is a GET or a POST request.
The doGet() and doPost() methods have HttpServletRequest and HttpServletResponse as parameters.
</p>

<pre class="prettyprint">
resp.setContentType("text/html; charset=UTF-8");
PrintWriter out = resp.getWriter();
</pre>

<p>
resp.setContentType("text/html; charset=UTF-8") sets the content type and character encoding of the document to be output to a web browser. This code can be used only once in servlet and must run before getting the PrintWriter object. You can obtain the PrintWriter instance by calling the getWriter() of HttpServletResponse.
</p>

<pre class="prettyprint no-border">
out.println("&lt;html&gt;");
out.println("&lt;body&gt;");

//Output the IP of client
out.println("Your IP Address is " + req.getRemoteAddr() + ".\n");
</pre>

<p>
SimpleServlet uses PrintWriter's println() method to send HTML code to the client. PrintWriter's println() method ouputs string passed as an argument to the client's web browser. HttpServletRequest's getRemoteAddr() is a method that returns the IP address of the client. HttpServeltRequest object contains information sent by the client and about the client.
</p>

<p>
Let's take a look at the process until the SimpleServlet servlet responds.
The client uses the web browser to request the SimpleServlet.
Tomcat intercepts the request and calls the +service(ServletRequest req, ServletResponse res) method of SimpleServlet.
At this time, Tomcat passes the HttpServletRequest object that encapsulates the client's request and the HttpServletResponse object as method arguments to the +service() method.
The +service(ServletRequest req, ServletResponse res) method merely calls the #service(HttpServletRequest req, HttpServletResponse resp) method. The #service() invokes methods such as doGet() or doPost() depending on HTTP Method (GET, POST, etc.).
You requested SimpleServlet by typing directly into the web browser address bar. This request is a GET Method request. So the doGet() method runs.
</p>

<h2>How to send data to server-side resources and how server-side resources receive data from the client</h2>

<p>
In the Web environment, dynamic components are respond differently depending on the string data sent by the client.
Web programmers who need to create dynamic web components need to know how to send string data to server-side resources using their web browser and obtain string data from clients on server-side resources.
Web programmers mainly use form element and its subelements to allow clients to send string data to server-side resources.
The web browser passes the client's data to the server-side resource specified by the form element's action attribute.
</p>

<p>
In the table below, the "HTML Form" item shows the HTML tag to receive data from the user, and the "Servlet" item shows code to get values from parameters sent by clients.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-th">HTML Form</th>
	<th class="table-in-article-th">Servlet</th>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;input type="text" name="<strong>addr</strong>" /&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameter("<strong>addr</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;input type="radio" name="<strong>os</strong>" value="Windows" /&gt;
&lt;input type="radio" name="<strong>os</strong>" value="Linux" /&gt;
</pre>				
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameter("<strong>os</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;input type="hidden" name="<strong>curPage</strong>" value="1" /&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameter("<strong>curPage</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;input type="password" name="<strong>passwd</strong>" /&gt;
</pre>
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParamter("<strong>passwd</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;textarea name="<strong>content</strong>" cols="60" rows="12"&gt;blah blah&lt;/textarea&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParamter("<strong>content</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;select name="<strong>grade</strong>"&gt;
  &lt;option value="A"&gt;A&lt;/option&gt;
  &lt;option value="B"&gt;B&lt;/option&gt;
  &lt;option value="C"&gt;C&lt;/option&gt;
  &lt;option value="D"&gt;D&lt;/option&gt;
  &lt;option value="F"&gt;F&lt;/option&gt;
&lt;/select&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameter("<strong>grade</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;input type="checkbox" name="<strong>hw</strong>" value="Intel" /&gt;
&lt;input type="checkbox" name="<strong>hw</strong>" value="AMD" /&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameterValues("<strong>hw</strong>");
</pre>
	</td>
</tr>
<tr>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
&lt;select name="<strong>sports</strong>" <strong>multiple="multiple"</strong>&gt;
  &lt;option value="soccer"&gt;Soccer&lt;/option&gt;
  &lt;option value="baseball"&gt;Baseball&lt;/option&gt;
  &lt;option value="basketball"&gt;Basketball&lt;/option&gt;
&lt;/select&gt;
</pre>	
	</td>
	<td class="table-in-article-td">
<pre class="prettyprint no-border">
req.getParameterValues("<strong>sports</strong>");
</pre>
	</td>
</tr>
</table>

<h4>getParameter(String name)</h4>

<p>
The getParameter(String name) method of ServletRequest is the most common method used to get data sent by the web browser.
The type of character data that the client sends to the server is a parameter name-value pair.
Here, the name of the parameter is the value of the name attribute of the form's subelements (input, textarea, select, etc.), and value is the user input.
 
In the server-side resource code, 
if the name of the parameter passed by the client is given as the argument of the getParameter(String name) method, 
this method returns the value that the user has entered or selected.

An input element whose type attribute value is radio is called a radio button.
Radio buttons with the same name attribute value can form a group and select only one item within a group.
</p>

<h4>getParameterValues(String name)</h4>

<p>
When a client sends multiple values with one parameter, the getParamterValues(String name) method of HttpServletRequest is needed to get these values on the server-side resource.
This method returns an array of strings consisting of the values chosen by the user.
You can send multiple values with one parameter with the following HTML elements:
</p>

<ul>
	<li>&lt;select <strong>multiple="multiple"</strong> ..&gt;&lt;option..&gt;&lt;/option&gt;..&lt;/select&gt;</li>
	<li>&lt;input type=<strong>"checkbox"</strong>../&gt;</li>
</ul>

<p>
If the select element has multiple= "multiple" attribute, the user can select multiple options using the Ctrl or Shift key.
An input element whose type attribute value is "checkbox" is called a checkbox.
Multiple checkboxes with same name attribute value belong to the same group.
A checkbox differs from a radio button in that multiple checkboxes within the same group can be selected.
</p>

<h4>getParamterNames()</h4>

<p>
To figure out what parameters sent by the user on the server-side components, you need the getParamterNames() method of HttpServletRequest.
The getParameterNames() method returns an Enumeration object containing all parameter names.
</p>

<dl class="note">
<dt>&lt;input type="file" ../&gt;</dt>
<dd>
The input element whose type attribute value is "file" transfers binary data such as images to the server. 
It's parent element, the form must have attributes such as <strong>method="post" enctype="multipart/form-data"</strong>.
If you need to send other additional string data (For example, name, title, content, etc.) as well as binary data, add other elements to the form element in which &lt;input type="file" /&gt; exists.
If you submit the form element in which &lt;input type="file" /&gt; exists, the web browser will transmit data with a different protocol than when sending only string data.
In this case, the getParameter(String name) method can not access data sent from the client.
Most programmers use external libraries to access data sent with binary data and binary data. 
</dd>
</dl>

<h3>String transfer example</h3>

<p>
Let's practice how to get data sent by the client in the servlet.
Create SignUp.html in the documentbase/example diretory.
</p>

<h6 class="src">/example/SignUp.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;Sign Up&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h3&gt;Sign Up&lt;/h3&gt;

&lt;form id="joinForm" action="../RegisterServlet" method="post"&gt;
&lt;div&gt;ID &lt;input type="text" name="id" /&gt;&lt;/div&gt;
&lt;div&gt;Nickname &lt;input type="text" name="nickname" /&gt;&lt;/div&gt;
&lt;div&gt;Password &lt;input type="password" name="passwd" /&gt;&lt;/div&gt;
&lt;div&gt;Name &lt;input type="text" name="name" /&gt;&lt;/div&gt;
&lt;div&gt;Gender Male &lt;input type="radio" name="gender" value="M" /&gt; Female &lt;input type="radio" name="gender" value="F" /&gt;&lt;/div&gt;
&lt;div&gt;Birthday &lt;input type="text" name="birthday" /&gt;&lt;/div&gt;
&lt;div&gt;Mobile &lt;input type="text" name="mobile" /&gt;&lt;/div&gt;
&lt;div&gt;Telephone &lt;input type="text" name="tel" /&gt;&lt;/div&gt;
&lt;div&gt;Address &lt;input type="text" name="address" /&gt;&lt;/div&gt;
&lt;div&gt;Email &lt;input type="text" name="email" /&gt;&lt;/div&gt;
&lt;div&gt;
Sports
&lt;input type="checkbox" name="sports" value="soccer" /&gt;soccer
&lt;input type="checkbox" name="sports" value="baseball" /&gt;baseball
&lt;input type="checkbox" name="sports" value="basketball" /&gt;Basketball
&lt;input type="checkbox" name="sports" value="tennis" /&gt;Tennis
&lt;input type="checkbox" name="sports" value="tabletennis" /&gt;Tabletennis
&lt;/div&gt;
&lt;div&gt;
Lectures
&lt;select name="main-menu" multiple="multiple"&gt;
  &lt;option value=""&gt;-- Multiple Select --&lt;/option&gt;
  &lt;option value="java"&gt;JAVA&lt;/option&gt;
  &lt;option value="jdbc"&gt;JDBC&lt;/option&gt;
  &lt;option value="jsp"&gt;JSP&lt;/option&gt;
  &lt;option value="css-layout"&gt;CSS Layout&lt;/option&gt;
  &lt;option value="jsp-prj"&gt;JSP Project&lt;/option&gt;
  &lt;option value="spring"&gt;Spring&lt;/option&gt;
  &lt;option value="javascript"&gt;JavaScript&lt;/option&gt;
&lt;/select&gt;
&lt;/div&gt;
&lt;div&gt;
About Me
&lt;textarea name="aboutMe" cols="40" rows="7"&gt;&lt;/textarea&gt;
&lt;/div&gt;
&lt;div&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/div&gt;
&lt;/form&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create RegisterServlet.java in /WEB-INF/src/example directory.
</p>

<h6 class="src">RegisterServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class RegisterServlet extends HttpServlet {
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws IOException,ServletException {
		
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    req.setCharacterEncoding("UTF-8");
		
    String id = req.getParameter("id");
		
    out.println("&lt;html&gt;&lt;body&gt;");
    out.println("id : " + id);
		
    String[] sports = req.getParameterValues("sports");
    int len = sports.length;
		
    out.println("&lt;ol&gt;");
    for (int i = 0; i &lt; len; i++) {
      out.println("&lt;li&gt;" + sports[i] + "&lt;/li&gt;");
    }
		
    out.println("&lt;/ol&gt;");
		
    String path = req.getContextPath();
    out.println("&lt;a href=" + path + "/example/SignUp.html&gt;Join&lt;/a&gt;");
    out.println("&lt;/body&gt;&lt;/html&gt;");
  }

}
</pre>

<p>
Open a command prompt and go to /WEB-INF/src/example and compile as below.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp C:/apache-tomcat-9.0.87/lib/servlet-api.jar ^
RegisterServlet.java
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;			
  &lt;servlet-name&gt;RegisterServlet&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.RegisterServlet&lt;/servlet-class&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;RegisterServlet&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/RegisterServlet&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
After restarting Tomcat, go to http://localhost:8080/example/SignUp.html.
TODO: Add a code to the servlet to check for values other than ID and sports.
</p>

<h2>RequestDispatcher Interface</h2>

<p>
RequestDispathcer has two methods, include() and forward().
The include() passes control to another resource and retakes control when another resource completes its work.
As a result, It adds messages produced by other resources to the response.
The forward() passes control to another resource, which response to the client. 
</p>

<p>
Let's practice the forward() method example.
Create the ControllerServlet.java file in the /WEB-INF/src/example directory as follows:
</p>

<h6 class="src">ControllerServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req, resp);
  }

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
		
    String uri = req.getRequestURI();
    String contextPath = req.getContextPath();
    String command = null;
    String view = null;
    boolean isRedirect = false;
		
    command = uri.substring(contextPath.length());
		
    if (command.equals("/example/SignUp.action")) {
      view = "/example/SignUp.html";
    }
		
    if (isRedirect == false) {
      ServletContext sc = this.getServletContext();
      RequestDispatcher rd = sc.getRequestDispatcher(view);
      <strong>rd.forward(req, resp);</strong>
    } else {
      resp.sendRedirect(view);
    }
  }

}
</pre>

<p>
Open a command prompt and go to /WEB-INF/src/example and compile as follows:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp C:/apache-tomcat-9.0.87/lib/servlet-api.jar ^
ControllerServlet.java
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;Controller&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.ControllerServlet&lt;/servlet-class&gt;
  &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;Controller&lt;/servlet-name&gt;
  &lt;url-pattern&gt;*.action&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
After restarting Tomcat, go to http://localhost:8080<span class="emphasis">/example/SignUp.action</span> and verify that /example/SignUp.html responds.
</p>

<h4>The process until the doPost() method runs.</h4>

<p>
We added servlet declaration and servlet-mapping of ControllerServlet in web.xml so that ControllerServlet would handle all requests ending in .action.
When a request string which ends in .action comes, Tomcat interprets the mapping information in web.xml and invokes ControllerServlet's +servlet(servletRequest req, ServletResponse res).
The +service(ServletRequest req, ServletResponse res) simply calls the #service(HttpServletRequest req, HttpServletResponse resp).
The #service (HttpServletRequest req, HttpServletResponse resp) is responsible for checking the HTTP METHOD of the request and calling the appropriate method according to HTTP METHOD.
HTTP METHOD of the request is the GET method because you requested http://localhost:8080/example/SignUp.action in the address bar of your web browser.
So, #service() calls doGet() method.
The doGet() calls the doPost() as we implemented it.
</p>


<p>
The following summarizes the HttpServletRequest methods used in the body of doPost().
</p>

<table>
<tr>
	<th>getRequestURI()</th>
</tr>
<tr>	
	<td>
		Returns the part of this request's URL from the protocol name to the query string in the HTTP request.<br />
		When requesting http://localhost:8080/example/SignUp.action in a web browser, it returns "/example/SignUp.action".<br />
		The string following the quotation mark (?) after the URL is called a query string. The query string passes to the server-side resource corresponding to the URL. If there is more than one information in the query string, use &amp; from the second. (e.g., http://localhost:8080/list.jsp?board=chat&amp;page=1)
	</td>
</tr>
<tr>
	<th>getContextPath()</th>
</tr>
<tr>	
	<td>
		Returns the portion of the request URI that indicates the context of the request.<br />
As we work in the ROOT application, the value we get through this method is "".
	</td>
</tr>
</table>

<p>
The example detects the URL requested by the user with the following code.
</p>

<pre class="prettyprint no-border">req.getRequestURI().substring(req.getContextPath().length()):</pre>

<p>
The code returns "/example/SignUp.action".
</p>

<p>
The user requesting /example/SignUp.action receives a response of /example/SignUp.html.<br />
Therefore, the user requested /example/SignUp.action gets a response from /example/SignUp.html.
</p>

<h4>TODO</h4>

<p>
In ControllerServlet.java, change isRedirect to true and recompile and test.
</p>

<h2>Servlet using database</h2>

<p>
Let's convert the GetEmp.java file, which we practiced in the JDBC chapter, into a servlet.<br />
This task describes how to turn a pure Java application into a servlet.<br />
Create the GetEmpServlet.java file in the /WEB-INF/src/example directory of the ROOT application.
</p>

<h6 class="src" id="GetEmpServlet">GetEmpServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetEmpServlet extends HttpServlet {
	
  private String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
  private String DB_USER = "scott";
  private String DB_PASSWORD = "tiger";
	
  /*
   * GenericServlet's init() method
   * init(ServletConfig config) invoke this method.
   * Therefore, you do not need to override the init(ServletConfig config) method.
   */
  @Override
  public void init() throws ServletException {
    try {
      Class.forName( "oracle.jdbc.driver.OracleDriver" );
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
  }
	

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
		
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
		
    String sql = "select * from emp";
		
    try {
      con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      stmt = con.createStatement();
      rs = stmt.executeQuery(sql);
			
      while (rs.next()) {
        String empno = rs.getString(1);
        String ename = rs.getString(2);
        String job = rs.getString(3);
        String mgr = rs.getString(4);
        String hiredate = rs.getString(5);
        String sal = rs.getString(6);
        String comm = rs.getString(7);
        String depno = rs.getString(8);
			
        out.println( empno + " : " + ename + " : " + job + " : " + mgr + 
          " : " + hiredate + " : " + sal + " : " + comm+" : " + depno + "&lt;br /&gt;" );
      }

    } catch (SQLException e) {
      e.printStackTrace(out);
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt != null) {
        try {
          stmt.close();
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
  }

}
</pre>

<p>
Use the command prompt to navigate to the /WEB-INF/src/example directory of the ROOT application and compile it as follows:
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^ 
-cp C:/apache-tomcat-9.0.87/lib/servlet-api.jar ^
GetEmpServlet.java
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;GetEmpServlet&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.GetEmpServlet&lt;/servlet-class&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;GetEmpServlet&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/empList&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
Copy the JDBC driver file to CATALINA_HOME/lib.<br />
After restarting Tomcat, visit http://localhost:8080<span class="emphasis">/empList</span>.
</p>

<pre class="browser">
7369 : SMITH : CLERK : 7902 : 1980-12-17 00:00:00.0 : 800 : null : 20
7499 : ALLEN : SALESMAN : 7698 : 1981-02-20 00:00:00.0 : 1600 : 300 : 30
7521 : WARD : SALESMAN : 7698 : 1981-02-22 00:00:00.0 : 1250 : 500 : 30
7566 : JONES : MANAGER : 7839 : 1981-04-02 00:00:00.0 : 2975 : null : 20
7654 : MARTIN : SALESMAN : 7698 : 1981-09-28 00:00:00.0 : 1250 : 1400 : 30
7698 : BLAKE : MANAGER : 7839 : 1981-05-01 00:00:00.0 : 2850 : null : 30
7782 : CLARK : MANAGER : 7839 : 1981-06-09 00:00:00.0 : 2450 : null : 10
7788 : SCOTT : ANALYST : 7566 : 1987-04-19 00:00:00.0 : 3000 : null : 20
7839 : KING : PRESIDENT : null : 1981-11-17 00:00:00.0 : 5000 : null : 10
7844 : TURNER : SALESMAN : 7698 : 1981-09-08 00:00:00.0 : 1500 : 0 : 30
7876 : ADAMS : CLERK : 7788 : 1987-05-23 00:00:00.0 : 1100 : null : 20
7900 : JAMES : CLERK : 7698 : 1981-12-03 00:00:00.0 : 950 : null : 30
7902 : FORD : ANALYST : 7566 : 1981-12-03 00:00:00.0 : 3000 : null : 20
7934 : MILLER : CLERK : 7782 : 1982-01-23 00:00:00.0 : 1300 : null : 10
</pre>

<p>
If you do not see the results you want, check the list below.
</p>

<ul>
	<li>Is the servlet declaration and servlet mapping of GetEmpServlet added correctly to the web.xml file?</li>
	<li>Is there GetEmpServlet bytecode in the /WEB-INF/classes/example directory.</li>
	<li>Is there an Oracle JDBC driver file (ojdbc6.jar) in the CATALINA_HOME/lib directory.</li>
	<li>Did the ROOT web application load successfully?</li>
</ul>

<h2>Using ServletConfig initialization parameter</h2>

<p>
Let's modify the GetEmpServlet example to use the ServletConfig initialization parameter.<br />
Create the following servlet in the /WEB-INF/src/example directory.
</p>

<h6 class="src">InitParamServlet.java</h6>
<pre class="prettyprint">
package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InitParamServlet extends HttpServlet {
	
  private String url;
  private String user;
  private String passwd;
  private String driver;
	
  @Override
  public void init() throws ServletException {
    url = this.getInitParameter("url");
    user = this.getInitParameter("user");
    passwd = this.getInitParameter("passwd");
    driver = this.getInitParameter("driver");
		
    try {
      Class.forName(driver);
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
		
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
		
    String sql = "SELECT * FROM emp";
		
    try {
      con = DriverManager.getConnection(url, user, passwd);
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
				
        out.println(empno + " : " + ename + " : " + job + " : " + mgr + 
            " : " + hiredate + " : " + sal + " : " + comm+" : " + depno + "&lt;br /&gt;");
      }
    } catch (SQLException e) {
      e.printStackTrace(out);
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt != null) {
        try {
          stmt.close();
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
  }

}
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;InitParamServlet&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.InitParamServlet&lt;/servlet-class&gt;
  &lt;init-param&gt;
    &lt;param-name&gt;driver&lt;/param-name&gt;
    &lt;param-value&gt;oracle.jdbc.driver.OracleDriver&lt;/param-value&gt;
  &lt;/init-param&gt;
  &lt;init-param&gt;
    &lt;param-name&gt;url&lt;/param-name&gt;
    &lt;param-value&gt;jdbc:oracle:thin:@127.0.0.1:1521:XE&lt;/param-value&gt;
  &lt;/init-param&gt;
  &lt;init-param&gt;
    &lt;param-name&gt;user&lt;/param-name&gt;
    &lt;param-value&gt;scott&lt;/param-value&gt;
  &lt;/init-param&gt;
  &lt;init-param&gt;
    &lt;param-name&gt;passwd&lt;/param-name&gt;
    &lt;param-value&gt;tiger&lt;/param-value&gt;
  &lt;/init-param&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;InitParamServlet&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/initParam&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
You can obtain values of the initialization parameters with the getInitParameter(String name) method of ServletConfig.<br />
After restarting Tomcat, visit http://localhost:8080<span class="emphasis">/initParam</span>.
</p>

<h2>Using ServletContext Initialization Parameters</h2>

<p>
All servlets and JSPs can reference the ServletContext initialization parameters in the web application.
The ServletContext initialization parameter is set in web.xml using the context-param element.
The elements in web.xml have a specified order.
The following excerpts from <a href="http://java.sun.com/dtd/web-app_2_3.dtd">http://java.sun.com/dtd/web-app_2_3.dtd</a>.
</p>

<div id="web-app" class="codebox">
&lt;!ELEMENT web-app (icon?, display-name?, description?, distributable?,
<strong>context-param*</strong>, filter*, filter-mapping*, <strong>listener*</strong>, <strong>servlet*</strong>,
servlet-mapping*, session-config?, mime-mapping*, welcome-file-list?,
error-page*, taglib*, resource-env-ref*, resource-ref*, security-constraint*,
login-config?, security-role*, env-entry*, ejb-ref*,  ejb-local-ref*)&gt;
</div>

<p>
You can see that the context-param must be declared ahead of the servlet.<br />
Open web.xml and add the following:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;context-param&gt;
  &lt;param-name&gt;url&lt;/param-name&gt;
  &lt;param-value&gt;jdbc:oracle:thin:@127.0.0.1:1521:XE&lt;/param-value&gt;
&lt;/context-param&gt;
</pre>

<p>
The getServletContext() method return a reference of ServletContext instance.<br />
The value of url, which is the ServletContext initialization parameter declared above, is obtained by using getInitParameter(String name) method of ServletContext.<br />
Add the following code to the SimpleServlet.java and recompile.
</p>

<pre class="prettyprint">
ServletContext sc = getServletContext();
String url = sc.getInitParameter("url");
out.println(url);
</pre>

<p>
After restarting Tomcat, visit http://localhost:8080/simple.<br />
</p>

<h2>Listener</h2>

<p>
The listener runs on the web application event.
Two types of Web application events:
</p>

<ul>
	<li>Application startup and shutdown</li>
	<li>Session creation and session invalidation</li>
</ul>

<p>
An application startup event occurs when a web application is first loaded and started by a servlet container.<br />
Application shutdown events occur when the web application is shut down.<br />
Session creation events occur when the servlet container creates a new session.<br />
Session invalidation events occur each time a session is invalidated.<br />
To use events, you need to write a class called Listener.<br />
The Listener class is a pure Java class that implements the following interfaces:
</p>

<ul>
	<li>jakarta.servlet.ServletContextListener</li>
	<li>jakarta.servlet.http.HttpSessionListener</li>
</ul>

<p>
If you want listeners for application startup or shutdown events, implement ServletContextListener interface.<br />
ServletContextListener interface consists of two methods:
</p>

<ul>
	<li>public void contextInitialized(ServletContextEvent sce);</li>
	<li>public void contextDestroyed(ServletContextEvent sce);</li>
</ul>

<p>
If you want listeners for session creation and session invalidation events, implement HttpSessionListener interface.<br />
HttpSessionListener interface consists of two methods:
</p>

<ul>
	<li>public void sessionCreated(HttpSessionEvent se);</li>
	<li>public void sessionDestroyed(HttpSessionEvent se);</li>
</ul>

<p>
Write the following Listener class, which, right after the web application startup, creates an OracleConnectionManager object and stores it in the ServletContext. 
</p>

<h6 class="src">MyServletContextListener.java</h6>
<pre class="prettyprint">
package net.java_school.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import net.java_school.db.dbpool.OracleConnectionManager;

public class MyServletContextListener implements ServletContextListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    ServletContext sc = sce.getServletContext();
    OracleConnectionManager dbmgr = new OracleConnectionManager();
    sc.setAttribute("dbmgr", dbmgr);
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    ServletContext sc = sce.getServletContext();
    sc.removeAttribute("dbmgr");
  }

}
</pre>

<p>
Add the following to web.xml, below the context-param, above the servlet declarations.
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;listener&gt;
  &lt;listener-class&gt;net.java_school.listener.MyServletContextListener&lt;/listener-class&gt;
&lt;/listener&gt;
</pre>

<h3 id="Custom-ConnectionPool">Using a custom connection pool</h3>
<p>
Add all the java source files from the lession entitled "<a href="../jdbc/Connection-Pool">ConnectionPool</a>" in the JDBC chapter to the ROOT application's WEB-INF/src directory.<br />
Open Log.java and modify it as follows:
</p>

<pre class="prettyprint">
public String logFile = "C:/www/myapp/WEB-INF/myapp.log";
</pre>

<p>
Copy the orcale.properties file in the "<a href="../jdbc/Connection-Pool">ConnectionPool</a>" to the ROOT application's WEB-INF directory.<br />
Open ConnectionManager.java and modify it as follows:
</p>

<pre class="prettyprint">
configFile = "C:/www/myapp/WEB-INF/" + poolName + ".properties";
</pre>

<p>
When the ROOT web application starts, out Listener will create an OracleConnectionManager object and store its reference in the ServletContext.<br />
To test it, modify the GetEmpServlet.java file as shown below.
</p>

<h6 class="src">GetEmpServlet.java</h6>
<pre class="prettyprint">
package example;

import java.sql.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import net.java_school.db.dbpool.*;

public class GetEmpServlet extends HttpServlet {

  <strong>private OracleConnectionManager dbmgr;</strong>
	
  @Override
  public void init() throws ServletException {
    <strong>ServletContext sc = getServletContext();</strong>
    <strong>dbmgr = (OracleConnectionManager) sc.getAttribute("dbmgr");</strong>
  }
	
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
		
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
		
    String sql = "SELECT * FROM emp";
		
    try {
      con = <strong>dbmgr.getConnection();</strong>
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
				
        out.println( empno + " : " + ename + " : " + job + " : " + mgr +
          " : " + hiredate + " : " + sal + " : " + comm+" : " + depno + "&lt;br&gt;" );
      }
    } catch (SQLException e) {
      e.printStackTrace(out);
    } finally {
      if (rs != null) {
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if (stmt != null) {
        try {
          stmt.close();
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
  }

}
</pre>

<p>
Compile the custom connection pool source and GetEmpServlet.java.<br />
Restart Tomcat and visit http://localhost:8080/empList.
(We have already set up the declaration and mapping for the GetEmpServlet in previous exercises)
</p>

<p>
The HttpSessionListener interface consists of two methods. One for session creation events and the other for session invalidation events.
</p>

<ul>
	<li>public void sessionCreated(HttpSessionEvent se);</li>
	<li>public void sessionDestroyed(HttpSessionEvent se);</li>
</ul>

<p>
The following is an example of an HttpSessionListener.
</p>

<h6 class="src">SessionCounterListener.java</h6>
<pre class="prettyprint">
package net.java_school.listener;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class SessionCounterListener implements HttpSessionListener {

  public static int totalCount;
	
  @Override
  public void sessionCreated(HttpSessionEvent event) {
    totalCount++;
    System.out.println("Session Increase. Total Sessions:" + totalCount);
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent event) {
    totalCount--;.
    System.out.println("Session Reduction. Total Sessions:" + totalCount);
  }

}
</pre>

<p>
Add the following to web.xml:
</p>

<pre class="prettyprint">
&lt;listener&gt;
  &lt;listener-class&gt;net.java_school.listener.SessionCounterListener&lt;/listener-class&gt;
&lt;/listener&gt;
</pre>

<p>
Restart Tomcat and visit http://localhost:8080/simple.<br />
Visit http://localhost:8080/simple with another web browser.<br />
Check log messages in the Tomcat log file.
</p>

<h2>Filter</h2>

<p>
If there is code to execute before a user's request reaches a server resource, use filter.<br />
For the filter to work, you need to add declaration and mapping about the filter to web.xml.<br />
If filter one followed by filter two in web.xml in order, filter one - filter two - Server resource - filter two - filter one runs.<br />
A filter class must implement the following interface:
</p>

<pre class="prettyprint no-border">
jakarta.servlet.filter
</pre>

<p>
The following is a pure Java application created to understand the filter mechanism.
</p>

<h6 class="src">ChainFilter.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

import java.util.ArrayList;
import java.util.Iterator;

public class ChainFilter {
  private ArrayList&lt;Filter&gt; filters;
  private Iterator&lt;Filter&gt; iterator;

  public void doFilter() {
    if (iterator.hasNext()) {
      iterator.next().doFilter(this);
    } else {
      System.out.println("Run Server resource");
    }
  }

  public ArrayList&lt;Filter&gt; getFilters() {
    return filters;
  }

  public void setFilters(ArrayList&lt;Filter&gt; filters) {
    this.filters = filters;
    this.iterator = filters.iterator();
  }
	
}
</pre>

<h6 class="src">Filter.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

public interface Filter {
	
  public void doFilter(ChainFilter chain);

}
</pre>

<h6 class="src">Filter1.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

public class Filter1 implements Filter {

  @Override
  public void doFilter(ChainFilter chain) {
    System.out.println("Run Filter 1 before the server resource runs");
    chain.doFilter();
    System.out.println("Run Filter 1 after the server resource runs");
  }

}
</pre>

<h6 class="src">Filter2.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

public class Filter2 implements Filter {

  @Override
  public void doFilter(ChainFilter chain) {
    System.out.println("Run Filter 2 before the server resource runs");
    chain.doFilter();
    System.out.println("Run Filter 2 after the server resource runs");
  }

}
</pre>

<h6 class="src">Tomcat.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

import java.util.ArrayList;

public class Tomcat {

  public static void main(String[] args) {
    ChainFilter chain = new ChainFilter();
    ArrayList&lt;Filter&gt; filters = new ArrayList&lt;Filter&gt;();
    Filter f1 = new Filter1();
    Filter f2 = new Filter2();
    filters.add(f1);
    filters.add(f2);
    chain.setFilters(filters);
    chain.doFilter();
  }

}
</pre>

<pre class="console">
<strong class="console-result">Run Filter 1 before the server resource runs
Run Filter 2 before the server resource runs
Run Server resource.
Run Filter 2 after the server resource runs
Run Filter 1 after the server resource runs
</strong></pre>

<h3>Filter Interface</h3>
<ul>
	<li>init(FilterConfig filterConfig) throws ServletException;
	When the servlet container calls this method, the filter is in service state.
	</li>
	<li>doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException;
	Called by the servlet container to perform the filtering operation.
	</li>
	<li>destroy()
	When called by the servlet container, the filter is no longer able to service. Mainly it used to return resources.
	</li>
</ul>

<p>
The doFilter() method's arguments show that the filter can access the ServletRequest, ServletResponse, and jakarta.servlet.FilterChain objects when it intercepts the request or response.
A FilterChain has a list of filters to run in order.
</p>

<p>
In the doFilter() method, the code before FilterChain's doFilter() is the code to run before the request reaches the server resource, and the code after FilterChain's doFilter() is the code to run before the response.
</p>

<h3>Filter Example</h3>

<p>
The following is an example that runs req.setCharacterEncoding("UTF-8"); code before all server resources are executed.<br />
Create a CharsetFilter.java file as follows:
</p>

<h6 class="src">/WEB-INF/src/net/java_school/filter/CharsetFilter.java</h6>
<pre class="prettyprint">
package net.java_school.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class CharsetFilter implements Filter {

  private String charset = null;
	
  @Override
  public void init(FilterConfig config) throws ServletException {
    this.charset = config.getInitParameter("charset");
  }
	
  @Override
  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) 
    throws IOException, ServletException {
		
    if (req.getCharacterEncoding() == null) {
      req.setCharacterEncoding(charset);
      chain.doFilter(req,resp);
    }
  }

  @Override
  public void destroy() {
    //Implement it if you have resources to return.
  }

}
</pre>

<p>
At the command prompt, go to the /WEB-INF/src/net/java_school/filter directory and compile as follows.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp C:/apache-tomcat-9.0.87/lib/servlet-api.jar ^
CharsetFilter.java
</pre>

<p>
Open the web.xml file and add the following:<br />
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;filter&gt;
  &lt;filter-name&gt;CharsetFilter&lt;/filter-name&gt;
  &lt;filter-class&gt;net.java_school.filter.CharsetFilter&lt;/filter-class&gt;
  &lt;init-param&gt;
     &lt;param-name&gt;charset&lt;/param-name&gt;
     &lt;param-value&gt;UTF-8&lt;/param-value&gt;
  &lt;/init-param&gt;
&lt;/filter&gt;

&lt;filter-mapping&gt;
  &lt;filter-name&gt;CharsetFilter&lt;/filter-name&gt;
  &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;
</pre>

<p>
You have to place the above code between the context-param element and the listener element- 
</p>

<p>
Open the RegisterServlet.java source and comment out the req.setCharacterEncoding("UTF-8"); and recompile RegisterServlet.java.<br />
Go to http://localhost:8080/example/SignUp.html and input the non-English characters into the ID and click submit button.
If req.setCharacterEncoding("UTF-8"); is executed, the ID will be output correctly. 
</p>

<p>
You can set up filter initialization parameters using the filter's subelement, init-param.<br />
The getInitParameter() and getInitParameters() methods of FilterConfig are used to read filter initialization parameters.
</p>

<p>
The filter-mapping element in web.xml specifies the resource to be filtered.<br />
The servlet container adds filters to the FilterChain in the order they are listed in web.xml.<br />
But the filter mapped to the servlet name is added after the filter that matches the URL pattern.<br />
The doFilter() method of FilterChain calls the next filter of FilterChain.
</p>

<h2>Uploading files</h2>

<p>
This section introduces two external libraries to upload files.
</p>

<h3>MultipartRequest</h3>

<p>
Download the latest file from the following address:<br />
<a href="http://www.servlets.com/cos/index.html">http://www.servlets.com/cos/index.html</a><br />
After decompressing, copy the cos.jar file to the ROOT application's /WEB-INF/lib directory.<br />
There are eight constructors for the MultipartRequest class. For a more detailed explanation, please refer to the following address:<br />
<a href= "http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html">http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html</a><br />
The following constructor resolves the encoding problem for non-English characters and automatically rename the file name when its name is the same as a file of the server file system.
</p>

<pre class="prettyprint">
public MultipartRequest(HttpServletRequest request,
  String saveDirectory,
  int maxPostSize,
  String encoding,
  FileRenamePolicy policy) throws IOException
</pre>

<h4>Methods of MultipartRequest</h4>

<p>
If the MultipartRequest constructor has done successfully, the upload was successful.<br />
The following shows the methods of MultipartRequest available after uploading files to the server's file system.<br />
Suppose you upload the logo.gif image file using the &lt;input type="file" name="photo" /&gt;.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-td">getContentType("photo");</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return the MIME type of the uploaded file. For example, if the file's extension is a gif, "image/gif" is returned.</td>
</tr>
<tr>
	<th class="table-in-article-td">getFile("photo");</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return the File object of the file uploaded and stored in the server.</td>
</tr>
<tr>
	<th class="table-in-article-td">getFileNames();</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return parameter names whose type attribute is "file" as Enumeration type.</td>
</tr>
<tr>
	<th class="table-in-article-td">getFilesystemName("photo");</th>
</tr>
<tr>	
	<td class="table-in-article-td">Returns the actual file name that is uploaded and exists in the server file system.</td>
</tr>
<tr>
	<th class="table-in-article-td">getOriginalFileName("photo");</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return original filename</td>
</tr>
</table>

<table>
<caption>Methods to provide the same interface as HttpServletRequest</caption>
<tr>
	<th class="table-in-article-td">getParameter(String name);</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return the value of parameter with the given name.</td>
</tr>
<tr>
	<th class="table-in-article-td">getParameterNames();</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return all parameter names as Enumeration type.</td>
</tr>
<tr>
	<th class="table-in-article-td">getParameterValues(String name);</th>
</tr>
<tr>	
	<td class="table-in-article-td">Returns values of the parameter with the given name.</td>
</tr>
</table>

<h4>MultipartRequest Example</h4>

<p>
Create the following HTML file in the DocumentBase/example directory of the ROOT application.
</p>

<h6 class="src">MultipartRequest.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;MultipartRequest Servlet Example&lt;/title&gt;
  &lt;meta charset="UTF-8" /&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;h1&gt;File Upload Test with MultipartRequest&lt;/h1&gt;

&lt;form action="../servlet/UploadTest" method="post" enctype="multipart/form-data"&gt;
&lt;div&gt;Name: &lt;input type="text" name="name" /&gt;&lt;/div&gt;
&lt;div&gt;File 1: &lt;input type="file" name="file1" /&gt;&lt;/div&gt;
&lt;div&gt;File 2: &lt;input type="file" name="file2" /&gt;&lt;/div&gt;
&lt;div&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/div&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create the following servlet in the WEB-INF/src/example directory.
</p>

<h6 class="src">UploadTest.java</h6>
<pre class="prettyprint">
package example;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadTest extends HttpServlet {
	
  @Override	
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
		
    ServletContext cxt = getServletContext();
    String dir = cxt.getRealPath("/upload");
		
    try {
      MultipartRequest multi = new MultipartRequest(req, dir, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
					
      out.println("&lt;html&gt;");
      out.println("&lt;body&gt;");
      out.println("&lt;h1&gt;Parameters passed by the user&lt;/h1&gt;");
      out.println("&lt;ol&gt;");
      Enumeration&lt;?&gt; params = multi.getParameterNames();
			
      while (params.hasMoreElements()) {
        String name = (String) params.nextElement();
        String value = multi.getParameter(name);
        out.println("&lt;li&gt;" + name + "=" + value + "&lt;/li&gt;");
      }
			
      out.println("&lt;/ol&gt;");
      out.println("&lt;h1&gt;Uploaded files&lt;/h1&gt;");
			
      Enumeration&lt;?&gt; files = multi.getFileNames();
			
      while (files.hasMoreElements()) {
        out.println("&lt;ul&gt;");
        String name = (String) files.nextElement();
        String filename = multi.getFilesystemName(name);
        String originalName =multi.getOriginalFileName(name);
        String type = multi.getContentType(name);
        File f = multi.getFile(name);
        out.println("&lt;li&gt;Parameter name: "  + name + "&lt;/li&gt;");
        out.println("&lt;li&gt;File name: " + filename + "&lt;/li&gt;");
        out.println("&lt;li&gt;File original name: " + originalName + "&lt;/li&gt;");
        out.println("&lt;li&gt;File type: " + type + "&lt;/li&gt;");
				
        if (f != null) {
          out.println("&lt;li&gt;File size: " + f.length() + "&lt;/li&gt;");
        }
        out.println("&lt;/ul&gt;");
      }
    } catch(Exception e) {
      out.println("&lt;ul&gt;");
      e.printStackTrace(out);
      out.println("&lt;/ul&gt;");
    }
    out.println("&lt;/body&gt;&lt;/html&gt;");
  }

}
</pre>

<p>
When compiling, you need to tell the Java compiler the path to the cos.jar file.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp C:/www/myapp/WEB-INF/lib/cos.jar ^
UploadTest.java
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;UploadTest&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.UploadTest&lt;/servlet-class&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;UploadTest&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/servlet/UploadTest&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
TEST
</p>

<ol>
	<li>Create a subdirectory named upload in the DocumentBase of the ROOT application.</li>
	<li>Restart Tomcat and visit http://localhost:8080/example/upload.html.</li>
	<li>After uploading duplicate files, check the file name in upload folder. If you upload the same name file, you will see a number appended to the file name's end.</li>
</ol>

<p>
If the test fails, check the list below.
</p>

<ol>
	<li>Check that the bytecode of the UploadTest servlet exists.</li>
	<li>Make sure that there is a subdirectory named upload in the DocumentBase of the ROOT application.</li>
	<li>Make sure the cos.jar file is in WEB-INF/lib in the ROOT application.</li>
	<li>Make sure the UploadTest servlet is correctly registered and mapped in the web.xml.</li>
	<li>Make sure the ROOT web application is loaded.</li>
</ol>

<h3>commons-fileupload</h3>

<p>
Commons-fileupload is a file upload library provided by The Apache Software Foundation.<br />
Download the latest binary files from the following addresses:
</p>

<ul>
	<li><a href="http://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi">http://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi</a></li>
	<li><a href="http://commons.apache.org/proper/commons-io/download_io.cgi">http://commons.apache.org/proper/commons-io/download_io.cgi</a></li>
</ul>

<p>
Uncompress and copy the commons-fileupload-&lt;version&gt;.jar and commons-io-&lt;version&gt;.jar files to the ROOT application's /WEB-INF/lib.
</p>

<h4>Example</h4>

<p>
Create the following HTML file in the DocumentBase/example directory of the ROOT application.
</p>

<h6 class="src">commons-fileupload.html</h6>
<pre class="prettyprint">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta charset="UTF-8"&gt;
&lt;title&gt;commons-fileupload Test&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;h1&gt;Uploading files using commons-fileupload&lt;/h1&gt;

&lt;form action="../CommonsUpload" method="post" enctype="multipart/form-data"&gt;
&lt;div&gt;File : &lt;input type="file" name="upload" /&gt;&lt;/div&gt;
&lt;div&gt;&lt;input type="submit" value="Submit" /&gt;&lt;/div&gt;
&lt;/form&gt;

&lt;/body&gt;
&lt;/html&gt;
</pre>

<p>
Create the following servlet in the WEB-INF/src/example directory of the ROOT application.
</p>

<h6 class="src">CommonsUpload.java</h6>
<pre class="prettyprint">
package example;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.util.Iterator;
import java.io.File;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class CommonsUpload extends HttpServlet {

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) 
      throws IOException, ServletException {
			
    resp.setContentType("text/html; charset=UTF-8");
    PrintWriter out = resp.getWriter();
    //Check that we have a file upload request
    boolean isMultipart = ServletFileUpload.isMultipartContent(req);
    //Create a factory for disk-based file items
    DiskFileItemFactory factory = new DiskFileItemFactory();
		
    //Configure a repository (to ensure a secure temp location is used)
    ServletContext servletContext = this.getServletConfig().getServletContext();
    File repository = (File) servletContext.getAttribute("jakarta.servlet.context.tempdir");
    factory.setRepository(repository);
		
    //Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setHeaderEncoding("UTF-8");
    try {
      //Parse the request
      List&lt;FileItem&gt; items = upload.parseRequest(req);
      //Process a file upload
      Iterator&lt;FileItem&gt; iter = items.iterator();
      while (iter.hasNext()) {
        FileItem item = iter.next();
        String fileName = null;
        if (!item.isFormField()) {
          String fieldName = item.getFieldName();
          out.println(fieldName);
          fileName = item.getName();
          out.println(fileName);
          String contentType = item.getContentType();
          out.println(contentType);
          boolean isInMemory = item.isInMemory();
          out.println(isInMemory);
          long sizeInBytes = item.getSize();
          out.println(sizeInBytes);
        }
        // Process a file upload
        ServletContext cxt = getServletContext();
        String dir = cxt.getRealPath("/upload");
        File uploadedFile = new File(dir + "/" + fileName);
        item.write(uploadedFile);
      }
    } catch (Exception e) {
      out.println("&lt;ul&gt;");
      e.printStackTrace(out);
      out.println("&lt;/ul&gt;");
    }
    out.println("&lt;a href="/example/commons-fileupload.html"&gt;commons-fileupload.html&lt;/a&gt;");
  }

}
</pre>

<p>
Compile it like below.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">
javac -d C:/www/myapp/WEB-INF/classes ^
-cp C:/www/myapp/WEB-INF/lib/commons-fileupload-&lt;version&gt;.jar; ^
C:/www/myapp/WEB-INF/lib/commons-io-&lt;version&gt;.jar ^
CommonsUpload.java
</pre>

<p>
Add the following to web.xml:
</p>

<h6 class="src">web.xml</h6>
<pre class="prettyprint">
&lt;servlet&gt;
  &lt;servlet-name&gt;commonsUpload&lt;/servlet-name&gt;
  &lt;servlet-class&gt;example.CommonsUpload&lt;/servlet-class&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
  &lt;servlet-name&gt;commonsUpload&lt;/servlet-name&gt;
  &lt;url-pattern&gt;/CommonsUpload&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;
</pre>

<p>
Restart Tomcat and visit http://localhost:8080/example/commons-fileupload.html.<br />
When uploading the same name file, unlike cos.jar, it overwrites the existing file.
</p>

<h2>Cookie</h2>

<p>
The HTTP protocol does not maintain a state.
A cookie is one of technologies for overcoming a web browser's inabilty to hold a communication session with a server due to the HTTP protocol's characteristics.
</p>

<h3>The server sends a cookie to the web browser.</h3>

<p>
First, the server makes and sends the cookie to a web browser.
The cookie looks like as follows: 
</p>

<pre class="prettyprint">
Set-Cookie : name = value ; expires = date ; path = path ; domain = domain ; secure
</pre>

<p>
A web browser stores the cookie passed from the server into a file or memory.
</p>

<h3>The web browser sends the cookie to the server.</h3>

<p>
Once the web browser stores the cookie, the web browser sends the cookie whenever it requests the server resource.
The cookie looks like the following: 
</p>
 
<pre class="prettyprint">
Cookie ; name = value1 ; name2 = value2 ;
</pre>

<p>
Cookie name and value can not contain characters such as [] () = "/? @ :;
</p>

<h3>Cookie's constructor</h3>

<p>
Creates a cookie using the Cookie(String name, String value) constructor.
</p>

<h3>Methods of Cookie class</h3>

<table class="table-in-article">
<tr>
	<th class="table-in-article-td">setValue(String value)</th>
</tr>
<tr>	
	<td class="table-in-article-td">Reset the value of the created cookie.</td>
</tr>
<tr>
	<th class="table-in-article-td">setDomain(String pattern)</th>
</tr>
<tr>	
	<td class="table-in-article-td">
By default, a web browser can send cookies the server that sent them.
If you want to send a cookies to another server that belongs to the same domain group, use the setDomain() method.
But you cannot specify domains not related to the server with setDomain().
	</td>
</tr>
<tr>
	<th class="table-in-article-td">setMaxAge(int expiry)</th>
</tr>
<tr>	
	<td class="table-in-article-td">
Set the validity period of the cookie in seconds.
If you set a negative number, a web browser deletes the cookie when it terminates.
	</td>
</tr>
<tr>
	<th class="table-in-article-td">setPath(String uri)</th>
</tr>
<tr>	
	<td class="table-in-article-td">
Sets the path to which cookies will be applied.
If you specify a Uri, a web browser will send the cookie to the web server only if it visit the Uri.
	</td>
</tr>
<tr>
	<th class="table-in-article-td">setSecure(boolean flag)</th>
</tr>
<tr>	
	<td class="table-in-article-td">If the flag is true, cookies are sent only for servers using secure channels. (https)</td>
</tr>
</table>

<p>
If you create a cookie with the cookie constructor and call the cookie's methods to set the cookie appropriately, you need to send it to a web browser.
The following is the code that sends a cookie to a web browser.
</p>

<pre class="prettyprint no-border">
resp.addCookie(cookie);
</pre>

<h3>Access cookies sent by web browser</h3>

<pre class="prettyprint no-border">
Cookie[] cookie = <strong>req.getCookies();</strong>
</pre>

<p>
Use the getCookies() method of HttpServletRequest to get the cookie array.
If there is no cookie, the getCookies() method returns null.
You can get information about cookies by using the following method.
Among them, getName() and getValue() are mainly used.
</p>

<table class="table-in-article">
<tr>
	<th class="table-in-article-td">getName()</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return cookie name</td>
</tr>
<tr>
	<th class="table-in-article-td">getValue()</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return cookie value</td>
</tr>
<tr>
	<th class="table-in-article-td">getDomain()</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return cookie domain</td>
</tr>
<tr>
	<th class="table-in-article-td">getMaxAge()</th>
</tr>
<tr>	
	<td class="table-in-article-td">Return cookie expiration</td>
</tr>
</table>

<p>
Here is the code snippet that gets cookie value on the server resource.
</p>

<pre class="prettyprint">
String id = null;
Cookie[] cookies = request.getCookies();

if (cookies != null) {

  for (int i = 0; i &lt; cookies.length; i++) {
    String name = cookies[i].getName();
    if (name.equals("id")) {
      id = cookies[i].getValue();
      break;
    }
  }

}
</pre>

<p>
The following code shows how to delete a cookie.
It creates a cookie with the same name as the cookie you want to delete, calls setMaxAge(0), and sends the cookie to a web browser.
</p>

<pre class="prettyprint">
Cookie cookie = new Cookie("id","");
cookie.setMaxAge(0);
resp.addCookie(cookie);
</pre>

<p>
The <a href="JSP">JSP</a> chapter covers cookie examples.
</p>

<h2>Session</h2>

<p>
A session is a cookie-based technology for overcoming weaknesses in cookie security.
Unlike cookies, a web browser stores only session ID as a cookie.
Session ID cookie stored in a web browser and session object (HttpSession Type) mapped to session ID cookie in server cooperate to maintain the user's data.
The code snippet for creating a session is as follows.
</p>

<pre class="prettyprint">
HttpSession session = req.getSession(true); //If there is no session, create it.
HttpSession session = req.getSession(false); //If there is no session, returns null.
</pre>

<p>
Once you create a session object, you can store the user's data in the session.
</p>

<pre class="prettyprint">
User user = new User("Alison", "11111111");
session.setAttribue("user", user);
</pre>

<p>
The <a href="JSP">JSP</a> chapter covers session examples.
</p>

<span id="refer">References</span>
<ul id="references">
	<li><a href="https://java.net/downloads/servlet-spec/Final/servlet-3_1-final.pdf">https://java.net/downloads/servlet-spec/Final/servlet-3_1-final.pdf</a></li>
	<li><a href="https://tomcat.apache.org/tomcat-8.0-doc/servletapi/">https://tomcat.apache.org/tomcat-8.0-doc/servletapi/</a></li>
	<li><a href="https://jcp.org/en/jsr/detail?id=315">https://jcp.org/en/jsr/detail?id=315</a></li>
	<li><a href="http://docs.oracle.com/javaee/7/api/index.html?overview-summary.html">http://docs.oracle.com/javaee/7/api/index.html?overview-summary.html</a></li>
	<li><a href="http://www.mkyong.com/servlet/a-simple-httpsessionlistener-example-active-sessions-counter/">http://www.mkyong.com/servlet/a-simple-httpsessionlistener-example-active-sessions-counter/</a></li>
	<li><a href="https://java.net/downloads/servlet-spec/Final/servlet-3_1-final.pdf">https://java.net/downloads/servlet-spec/Final/servlet-3_1-final.pdf</a></li>
	<li><a href="https://tomcat.apache.org/tomcat-8.0-doc/servletapi/">https://tomcat.apache.org/tomcat-8.0-doc/servletapi/</a></li>
	<li><a href="https://jcp.org/en/jsr/detail?id=315">https://jcp.org/en/jsr/detail?id=315</a></li>
	<li><a href="http://docs.oracle.com/javaee/7/api/index.html?overview-summary.html">http://docs.oracle.com/javaee/7/api/index.html?overview-summary.html</a></li>
	<li><a href="http://www.mkyong.com/servlet/a-simple-httpsessionlistener-example-active-sessions-counter/">http://www.mkyong.com/servlet/a-simple-httpsessionlistener-example-active-sessions-counter/</a></li>
	<li><a href="http://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi">http://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi</a></li>
	<li><a href="http://commons.apache.org/proper/commons-io/download_io.cgi">http://commons.apache.org/proper/commons-io/download_io.cgi</a></li>
	<li><a href="http://commons.apache.org/proper/commons-fileupload/using.html">http://commons.apache.org/proper/commons-fileupload/using.html</a></li>
	<li><a href="http://www.albumbang.com/board/board_view.jsp?board_name=free&no=292">http://www.albumbang.com/board/board_view.jsp?board_name=free&amp;no=292</a></li>
	<li><a href="http://www.docjar.com/docs/api/javax/servlet/GenericServlet.html">http://www.docjar.com/docs/api/javax/servlet/GenericServlet.html</a></li>
</ul>
</article>

</body>
</html>
