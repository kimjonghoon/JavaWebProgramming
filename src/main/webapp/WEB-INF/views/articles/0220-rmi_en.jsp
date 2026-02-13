<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>RMI</h1>

<p>
We've seen method calls between instances in the same JVM so far.
Now, let's look at how to call methods of objects in other JVMs.
</p>

<p>
We already know about sockets. However, sockets require the programmer to define a protocol between the two objects.
Suppose you are writing a banking program that uses sockets.
An interbank transfer requires a message:
</p>

<pre class="prettyprint">
Transfer|Bank Account|SWIFT|Bank Account|Amount
</pre>

<p>
RMI allows you to directly call methods on objects in other JVMs without these protocols. RMI eliminates the need to define a protocol and interpret messages according to a protocol.
</p>

<h3>RMI Programming Procedures</h3>

<ol>
	<li>Defining a remote interface</li>
	<li>Implementing a server</li>
	<li>Implementing a client</li>
	<li>Starting the Java RMI Registry, Starting the server, Starting the client</li>
</ol>

<h3>RMI Example</h3>

<ul>
	<li>Hello.java - Remote Interface</li>
	<li>Server.java - Remote interface implementation</li>
	<li>Client.java - Clients that call remote methods</li>
</ul>

<h3>1. Defining a remote interface: Hello.java</h3>

<p>
A remote interface defines methods called remotely from the client. A remote interface must extend the Remote. Remote methods on the remote interface must declare throws RemoteException. In addition to RemoteException -- adding additional exceptions are available --
</p>

<h6 class="src">Hello.java</h6>
<pre class="prettyprint">
package example.hello;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Hello extends Remote {
  String sayHello() throws RemoteException;
}
</pre>

<h3>2. Remote interface implementation: Server.java</h3>

<p>
Server implements the remote interface Hello.<br />
When implementing the sayHello(), you don't need "throws RemoteException" in the method declaration because the remote object's sayHello() does not throw a RemoteException.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package example.hello;

import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;

public class Server implements Hello {

  public Server(){}
	
  public String sayHello() {
    return "Hello, World!";
  }
	
  public static void main(String[] args) {
    Server obj = new Server();
    try {
      Hello stub = (Hello) UnicastRemoteObject.exportObject(obj, 0);
      //Bind the remote object's stub in the registry
      Registry registry = LocateRegistry.getRegistry();
      registry.bind("Hello", stub);
      System.out.println("Server ready");
    } catch (Exception e) {
      System.out.println("Server exception: " + e.toString());
    }
  }
}
</pre>

<p>
The server's method main creates a remote object that supplies the service and exports the remote object to the Java RMI runtime.
</p>

<pre class="prettyprint">
Server obj = new Server();
Hello stub = (Hello) UnicastRemoteObject.exportObject(obj, 0);
</pre>

<p>
The following code registers the server-side stub created with the above code in the Java RMI registry so that their clients can find it:
</p>

<pre class="prettyprint">
Registry registry = LocateRegistry.getRegistry();
registry.bind("Hello", stub);
</pre>

<p>
If the getRegistry() method of the LocateRegistry without arguments runs, the LocateRegistry uses the default port of 1099. So, it may be necessary to open the 1099 port.
</p>

<h3>3. Implementing a Client</h3>

<p>
The client finds the registered stub on the server-side with the registered name and downloads it to the client-side JVM. It then calls the stub's sayHello() method.
</p>

<pre class="prettyprint">
package example.hello;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Client {

  private Client() {}

  public static void main(String[] args) {
    String host = (args.length &lt; 1) ? null : args[0];
    try {
      Registry registry = LocateRegistry.getRegistry(host);
      Hello stub = (Hello) registry.lookup("Hello");
      String response = stub.sayHello();
      System.out.println("response: " + response);
    } catch (Exception e) {
      System.err.println("Client exception: " + e.toString());
      e.printStackTrace();
    }
  }
}
</pre>

<h3>4. Starting the Java RMI Registry, Starting the server, Starting the client</h3>

<h4>Test on Windows systems</h4>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">start rmiregistry

start java -classpath c:/java/rmi/bin ^
-Djava.rmi.server.codebase=file:c:/java/rmi/bin ^
example.hello.Server
</pre>

<p>
^ Is a newline character in a Windows command.<br />
Launch a new command prompt and run the client.
</p>

<div class="cmd-header">&nbsp;</div>
<pre class="cmd">java -classpath c:\java\rmi\bin example.hello.Client
</pre>

<h4>Test on Linux Systems</h4>

<pre class="shell-prompt">
rmiregistry &amp;

java -classpath /home/kim/java/rmi/bin \
-Djava.rmi.server.codebase=file:/home/kim/java/rmi/bin \
example.hello.Server &amp;
</pre>

<p>
The backslash is the newline character in Linux bash.<br />
Launch a new terminal and run the client.
</p>

<pre class="shell-prompt">
java -classpath /home/John/java/rmi/bin example.hello.Client
</pre>

<h4>Test on two or more computers</h4>

<p>
If the server IP is 192.168.0.8, run the following on the client:
</p>

<pre class="shell-prompt">
java -classpath /home/John/java/rmi/bin example.hello.Client 192.168.0.8
</pre>

<p>
Place the bytecodes of Hello and Client on the client machine and the bytecodes of Hello and Server on the server machine.
</p>

<h4>Test Failure Checklist</h4>

<ol>
	<li>If the test fails on a Windows system, try disabling the loopback adapter and try again.</li>
	<li>If the test fails when running the server on Windows, open port 1099 (RMI default port) and try again.</li>
	<li>If the test using Linux as a server in an environment using a router fails, open the /etc/hosts file, modify 127.0.0.1 to the router-assigned private IP, and test again.</li>
</ol>

<span id="refer">References</span>
<ul id="references">
	<li><a href="http://docs.oracle.com/javase/7/docs/technotes/guides/rmi/hello/hello-world.html">http://docs.oracle.com/javase/7/docs/technotes/guides/rmi/hello/hello-world.html</a></li>
</ul>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/jdbc/intro"/>">JDBC Introduction</a></li>
    <li>Prev : <a href="<c:url value="/java/socket"/>">Socket</a></li>
  </ul>
</div>
</article>