<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>Socket</h1>

<p>
BSD UNIX first introduced a socket in 1982.
</p>

<p>
A socket is a communication connection point written in software and uses TCP/IP.
</p>

<p>
Java also has Socket API.
</p>

<p>
Once the client and server sockets are connected, they can communicate using the stream.
</p>

<p>
To pass a message from a client to a server, you can implement:
</p>

<ul>
	<li>A client program creates an output stream whose destination is its socket.</li>
	<li>A server program creates an input stream whose source is its socket.</li>
	<li>A client sends messages to the output stream, and a server gets them through the input stream.</li>
</ul>

<p>
Both clients and servers use the java.net.Socket class to communicate with each other. To connect these sockets, you need the java.net.ServerSocket class on the server-side. ServerSocket acts as a front desk. When a socket connection request comes from the outside, a ServerSocket creates a server-side socket and connects it to the client socket.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

  public static void main(String[] args) throws IOException {
    ServerSocket serverSocket = new ServerSocket(3000);
    <strong>Socket socket = serverSocket.accept();</strong>
    //TODO
  }
}
</pre>

<pre class="prettyprint no-border">
Socket socket = serverSocket.accept();
</pre>

<p>
The above code stops the program and waits for external socket connection requests. When a socket connection request comes in, the accept() method creates a server-side socket, connects it to the client socket, and returns its reference. Server-side sockets will have randomly chosen numbers among free port numbers.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;
<strong>import java.io.BufferedWriter;</strong>
import java.io.IOException;
<strong>import java.io.OutputStream;</strong>
<strong>import java.io.OutputStreamWriter;</strong>
<strong>import java.io.PrintWriter;</strong>
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

  public static void main(String[] args) throws IOException {
    ServerSocket serverSocket = new ServerSocket(3000);
    Socket socket = serverSocket.accept();
    <strong>OutputStream os = socket.getOutputStream();</strong>
    <strong>OutputStreamWriter osw = new OutputStreamWriter(os);</strong>
    <strong>BufferedWriter bw = new BufferedWriter(osw);</strong>
    <strong>PrintWriter pw = new PrintWriter(bw);</strong>
    <strong>pw.println("Socket Connected[" + socket.getPort() + "]");</strong>
  }
}
</pre>

<p>
Create a client program.
</p>

<p>
The client needs to know the server IP and the port number of the ServerSocket to send a connection request.
</p>

<p>
If you test with a single computer, you can replace IP with localhost. If you have two computers, replace localhost with the server IP address in the source below.
</p>

<p>
The port number is 3000 because the ServerSocket uses port 3000.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {

  public static void main(String[] args) throws UnknownHostException, IOException {
    <strong>Socket socket = new Socket("localhost", 3000);</strong>
    //TODO
  }
}
</pre>

<p>
When sockets are connected, the server delivers the message to the client.<br />
Add the following code to output things sent by the server.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

<strong>import java.io.BufferedWriter;</strong>
import java.io.IOException;
<strong>import java.io.OutputStream;</strong>
<strong>import java.io.OutputStreamWriter;</strong>
<strong>import java.io.PrintWriter;</strong>
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {

  public static void main(String[] args) throws UnknownHostException, IOException {
    Socket socket = new Socket("localhost", 3000);
    <strong>OutputStream os = socket.getOutputStream();</strong>
    <strong>OutputStreamWriter osw = new OutputStreamWriter(os);</strong>
    <strong>BufferedWriter bw = new BufferedWriter(osw);</strong>
    <strong>PrintWriter pw = new PrintWriter(bw);</strong>
    <strong>pw.println("Socket Connected[Port:" + socket.getPort() + "]");</strong>
    <strong>pw.flush();</strong>
  }
}
</pre>

<p>
The server program passes the connected server-side socket port number as a message to the client and ends immediately. The client program receives the message from the server and prints the message to the console and exits.
</p>

<p>
Run the server first, then run the client.
When running on the same PC, run the server and client with separate command prompts.
</p>

<p>
When a connection request comes in from a client, the server sends a message and shuts down immediately. Modifying the server to not exit allows multiple clients to connect to the server.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
public static void main(String[] args) throws IOException {
  ServerSocket serverSocket = new ServerSocket(3000);
  <strong>while (true) {</strong>
    <strong>Socket socket = serverSocket.accept();</strong>
    <strong>OutputStream os = socket.getOutputStream();</strong>
    <strong>OutputStreamWriter osw = new OutputStreamWriter(os);</strong>
    <strong>BufferedWriter bw = new BufferedWriter(osw);</strong>
    <strong>PrintWriter pw = new PrintWriter(bw);</strong>
    <strong>pw.println("Socket Connected[Port:" + socket.getPort() + "]");</strong>
    <strong>pw.flush();</strong>
    <strong>pw.close();</strong>
    <strong>socket.close();</strong>
  <strong>}</strong>
}
</pre>

<p>
Typing Ctrl + C will force the server to shut down.
</p>

<p>
Let's practice a more advanced communication example.<br />
The following echo program sends the message sent by the client back to the client.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

public class Server {
  //TODO
}
</pre>

<p>
The server has to do two things at the same time.
</p>

<ul>
	<li>Handling socket connection requests</li>
	<li>Receiving the message from the client and sending it back to the client</li>
</ul>

<p>
Our echo program needs a thread to do two things together.<br />
Let code that receives the client's message and sends it back to the client run on the new thread.
</p>

<p>
We need the server code to receive the client's message and send it back to the client.<br />
Let's create a server program so that an input stream, whose source is a socket, and an output stream, whose source is a socket, run on a thread.
</p>

<p>
It would be nice to create a thread class that consists of a socket, an input stream, and an output stream. Let's name this class Echo. --By making the Echo class an inner class of the Server class, the Echo class can easily access the Server class's resources--
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

<strong>import java.io.BufferedReader;</strong>
<strong>import java.io.BufferedWriter;</strong>
<strong>import java.io.IOException;</strong>
<strong>import java.io.InputStream;</strong>
<strong>import java.io.InputStreamReader;</strong>
<strong>import java.io.OutputStream;</strong>
<strong>import java.io.OutputStreamWriter;</strong>
<strong>import java.io.PrintWriter;</strong>
<strong>import java.net.Socket;</strong>

public class Server {

  <strong>private class Echo extends Thread {
    private Socket socket;
    private BufferedReader br;
    private PrintWriter pw;
			
    public Echo(Socket socket) throws IOException {
      this.socket = socket;
      InputStream is = socket.getInputStream();
      br = new BufferedReader(new InputStreamReader(is));
      OutputStream os = socket.getOutputStream();
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
      pw = new PrintWriter(bw);
    }

    @Override
    public void run() {
      try {
        while (true) {
          String str = br.readLine();
          pw.println("From Server: " + str);
          pw.flush();
        }
      } catch (Exception e) {
        e.printStackTrace();
        close();
      }
    }
		
    private void close() {
      try {
        br.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      pw.close();
      try {
        socket.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }//Echo inner class end</strong>
}
</pre>

<p>
To maintain a socket connection, we must keep an Echo object. To do this, add an ArrayList to hold the Echo instance. At the end of Echo's close() method, add code to remove the Echo reference from the ArrayList.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
<strong>import java.util.ArrayList;</strong>

public class Server {

  <strong>private ArrayList&lt;Echo&gt; echos = new ArrayList&lt;Echo&gt;();</strong>

  private class Echo extends Thread {
    private Socket socket;
    private BufferedReader br;
    private PrintWriter pw;
			
    public Echo(Socket socket) throws IOException {
      this.socket = socket;
      InputStream is = socket.getInputStream();
      br = new BufferedReader(new InputStreamReader(is));
      OutputStream os = socket.getOutputStream();
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
      pw = new PrintWriter(bw);
    }

    @Override
    public void run() {
      try {
        while (true) {
          String str = br.readLine();
          pw.println("From Server: " + str);
          pw.flush();
        }
      } catch (Exception e) {
        e.printStackTrace();
        close();
      }
    }
		
    private void close() {
      try {
        br.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      pw.close();
      try {
        socket.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      <strong>echos.remove(this);</strong>
    }
  }//Echo inner class end
}
</pre>

<p>
Next, add the method to handle external socket connection requests to the Server class. -- It would be nice to put the ServerSocket's accept() in an infinite loop in this method --
</p>

<p>
Have main() execute this method immediately after creating the Server instance.
</p>

<h6 class="src">Server.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class Server {

  private ArrayList&lt;Echo&gt; echos = new ArrayList&lt;Echo&gt;();
  <strong>
  public void startServer() {
    ServerSocket serverSocket = null;
    try {
      serverSocket = new ServerSocket(3000);
      while (true) {
        Socket socket = serverSocket.accept();
        Echo echo = new Echo(socket);
        echo.start();
        echos.add(echo);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }</strong>
	
  private class Echo extends Thread {

    private Socket socket;
    private BufferedReader br;
    private PrintWriter pw;
			
    public Echo(Socket socket) throws IOException {
      this.socket = socket;
      InputStream is = socket.getInputStream();
      br = new BufferedReader(new InputStreamReader(is));
      OutputStream os = socket.getOutputStream();
      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
      pw = new PrintWriter(bw);
    }

    @Override
    public void run() {
      try {
        while (true) {
          String str = br.readLine();
          pw.println("From Server: " + str);
          pw.flush();
        }
      } catch (Exception e) {
        e.printStackTrace();
        close();
      }
    }
		
    private void close() {
      try {
        br.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      pw.close();
      try {
        socket.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
      echos.remove(this);
    }
  }//Echo inner class end
  <strong>
  public static void main(String[] args) {
    new Server().startServer();
  }</strong>
}
</pre>

<p>
Next, create a client program.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

public class Client {
  //TODO
}
</pre>

<p>
Should the client be a multi-threaded program?<br />
If the message comes from the server while the user is writing, the answer is yes. -- For the same reason, the client of the chat program must be a multi-threaded program -- But in the echo program, the server and client are synchronized. The server can send a message to the client only when the client sends something to the server. So, the Echo client does not need extra thread.
</p>

<p>
Add code to connect sockets.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	
  public static void main(String[] args) throws UnknownHostException, IOException {
    <strong>Socket socket = new Socket("localhost", 3000);</strong>
    //TODO
  }
}
</pre>

<p>
Next, add an input stream whose source is the keyboard.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	
  public static void main(String[] args) throws UnknownHostException, IOException {
    Socket socket = new Socket("localhost", 3000);
    <strong>BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));</strong>
    //TODO
  }
}
</pre>

<p>
Next, add an output stream whose destination is the socket.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	
  public static void main(String[] args) throws UnknownHostException, IOException {
    Socket socket = new Socket("localhost", 3000);
    BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
    <strong>OutputStream os = socket.getOutputStream();
    OutputStreamWriter osw = new OutputStreamWriter(os);
    PrintWriter pw = new PrintWriter(osw);</strong>
    //TODO		
  }
}
</pre>

<p>
Next, add an input stream whose source is the socket.<br />
This input stream is needed to read messages sent from the server.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	
  public static void main(String[] args) throws UnknownHostException, IOException {
    Socket socket = new Socket("localhost", 3000);
    BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
    OutputStream os = socket.getOutputStream();
    OutputStreamWriter osw = new OutputStreamWriter(os);
    PrintWriter pw = new PrintWriter(osw);
    <strong>InputStream is = socket.getInputStream();
    InputStreamReader isr = new InputStreamReader(is);
    BufferedReader br = new BufferedReader(isr);</strong>
    //TODO		
  }
}
</pre>

<p>
Because it is a single-threaded program with only the main thread, add a flag to distinguish whether the user is waiting for input on the keyboard or waiting for a message from the server.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	
  public static void main(String[] args) throws UnknownHostException, IOException {
    Socket socket = new Socket("localhost", 3000);
    BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
    OutputStream os = socket.getOutputStream();
    OutputStreamWriter osw = new OutputStreamWriter(os);
    PrintWriter pw = new PrintWriter(osw);
    InputStream is = socket.getInputStream();
    InputStreamReader isr = new InputStreamReader(is);
    BufferedReader br = new BufferedReader(isr);
    <strong>boolean isCommandLineInputWaiting = true;
    String str = null;
    while (true) {
      if (isCommandLineInputWaiting) {
        str = keyboard.readLine();
        pw.println(str);
        pw.flush();
        isCommandLineInputWaiting = false;
        continue;
      }
      if (isCommandLineInputWaiting == false) {
        str = br.readLine();
        System.out.println(str);
        isCommandLineInputWaiting = true;
        continue;
      }
    }</strong>
  }
}
</pre>


<h3>Test on two computers</h3>

<p>
Replace "localhost" with the server IP in the Client source.<br />
The computer running the server should open port 3000. If your system is Windows, you need to take steps to open the ports in Windows Firewall.
</p>

<h2>Chat program</h2>

<p>
Let's create a simple chat program by extending the example above. The difference with the echo program is that the server forwards the received message to all users.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

public class Client {
  //TODO
}
</pre>

<p>
The chat client must be a multi-threaded program, as messages can come from the server while the user is typing on the keyboard.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

public class Client <strong>extends Thread</strong> {

  <strong>@Override
  public void run() {
    //TODO
  }</strong>
}
</pre>

<p>
When the client runs, it connects sockets with the server and gets an input stream whose source is its socket.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

<strong>import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;</strong>

public class Client extends Thread {

  <strong>private Socket socket;</strong>
  <strong>private BufferedReader br;</strong>
	
  <strong>public Client() throws IOException {
    this.socket = new Socket("localhost", 3000);
    InputStream is = socket.getInputStream();
    br = new BufferedReader(new InputStreamReader(is));
    //TODO
  }</strong>

  @Override
  public void run() {
    //TODO
  }

  <strong>public static void main(String[] args) throws IOException {
    new Client();
  }</strong>
}
</pre>

<p>
The run() method prints messages from the server.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class Client extends Thread {

  private Socket socket;
  private BufferedReader br;
	
  public Client() throws IOException {
    this.socket = new Socket("localhost", 3000);
    InputStream is = socket.getInputStream();
    br = new BufferedReader(new InputStreamReader(is));
    //TODO
  }
	
  @Override
  public void run() {
    <strong>String str = null;
    while(true) {
      try {
        str = br.readLine();
        System.out.println(str);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }</strong>
  }
	
  public static void main(String[] args) throws IOException {
    new Client();
  }
}
</pre>

<p>
To send a message to the server, you need an input stream whose source is the keyboard and an output stream whose socket is the destination.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
<strong>import java.io.BufferedWriter;</strong>
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
<strong>import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;</strong>
import java.net.Socket;

public class Client extends Thread {

  private Socket socket;
  private BufferedReader br;
  private BufferedReader keyboard;
  private PrintWriter pw;
	
  public Client() throws IOException {
    this.socket = new Socket("localhost", 3000);
    InputStream is = socket.getInputStream();
    br = new BufferedReader(new InputStreamReader(is));
    <strong>keyboard = new BufferedReader(new InputStreamReader(System.in));
    OutputStream os = socket.getOutputStream();
    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
    pw = new PrintWriter(bw);</strong>
  }
	
  @Override
  public void run() {
    String str = null;
    while(true) {
      try {
        str = br.readLine();
        System.out.println(str);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
	
  public static void main(String[] args) throws IOException {
    new Client();
  }
}
</pre>

<p>
The chatStart() method transfers input from the keyboard to the server.
</p>

<h6 class="src">Client.java</h6>
<pre class="prettyprint">
package net.java_school.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

public class Client extends Thread {

  private Socket socket;
  private BufferedReader br;
  private BufferedReader keyboard;
  private PrintWriter pw;
	
  public Client() throws IOException {
    this.socket = new Socket("localhost", 3000);
    InputStream is = socket.getInputStream();
    br = new BufferedReader(new InputStreamReader(is));
    keyboard = new BufferedReader(new InputStreamReader(System.in));
    OutputStream os = socket.getOutputStream();
    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
    pw = new PrintWriter(bw);
  }

  <strong>public void chatStart() {
    start();
    String str = null;
    while (true) {
      try {
        str = keyboard.readLine();
        pw.println(str);
        pw.flush();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }</strong>

  @Override
  public void run() {
    String str = null;
    while(true) {
      try {
        str = br.readLine();
        System.out.println(str);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
	
  public static void main(String[] args) throws IOException {
    <strong>new Client().chatStart();</strong>
  }
}
</pre>

<p>
You can create a chat server simply by modifying the echo server.
</p>

<ul>
	<li>Rename the inner class Echo of the echo server to Chatter</li>
	<li>Add code to check if the message sent by the client is null. --The client sends null to the server when it exits--</li>
</ul>

<pre class="prettyprint">
@Override
public void run() {
  try {
    String str = null;
    while (true) {
      str= br.readLine();
      if (str != null) {
        <strong>for (Echo echo : echos) {
          echo.pw.println(str);
          echo.pw.flush();</strong>
        }
      } else {
        throw new Exception("null!");
      }
    }
  } catch (Exception e) {
    e.printStackTrace();
    close();
  }
}
</pre>

<h3>Bug fixes</h3>

<p>
When you shut down the server, all clients constantly output null to the console.<br />
Modify the client's run() method as follows:
</p>

<pre class="prettyprint">
@Override
public void run() {
  String str = null;
  try {
    while((str = br.readLine()) != null) {
      System.out.println(str);
    }
  } catch (IOException e) {
    e.printStackTrace();
  }
}
</pre>

<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/rmi"/>">RMI</a></li>
    <li>Prev : <a href="<c:url value="/java/logging"/>">Logging</a></li>
  </ul>
</div>

</article>