<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>Java I/O</title>
<meta name="Keywords" content="Java I/O,Stream,source,destination,byte stream,character stream,InputStream,OutputStream,FileInputStream,FileOutputStream,Reader,Writer,BufferedReader,BufferedWriter,InputStreamReader,OutputStreamWriter,Serializable,ObjectOutputStream,ObjectInputStream,File,FileReader,StringTokenizer,FileWriter,BufferedWriter," />
<meta name="Description" content="This article describes Java I/O API" />
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

<h1>Java I/O</h1>

<p>
The Java API designer considered input and output as streams. If the stream comes into the Java program, it is an input stream. If the stream goes out of the Java program, it is an output stream. When creating a stream object, the critical information is the source for the input stream and the destination for the output stream. You need this information as an argument for stream constructors. The shape of sources or destinations varies. It may be a file, a console screen, or a socket.
</p>

<p>
Streams are classified as follows:
</p>

<ul>
	<li>Is it a byte stream? Is it a character stream?</li>
	<li>Is it an input stream? Is it an output stream?</li>
	<li>Does it do I/O? Does it help with I/O performance?</li>
</ul>

<h2>Byte Stream</h2>

<p>
The byte stream is input and output in units of 1 byte for generally I/O to binary files such as videos or images. InputStream and OutputStream are abstract and top-level classes of all byte stream classes.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">InputStream</dt>
	<dd class="api-summary-dd">int read()</dd>
	<dd class="api-summary-dd-method-desc">
	It is an abstract method. It reads one byte from the input stream and returns a value between 0 and 255. It returns -1 if the end of the input stream has been reached and can no longer be read.</dd>
	<dd class="api-summary-dd">int read(byte[] b)</dd>
	<dd class="api-summary-dd-method-desc">
	In most cases, it reads up to the size of b, stores it in b, and returns the number of bytes read. It returns -1 if the end of the input stream has been reached and can no longer be read.</dd>
	<dd class="api-summary-dd">int read(byte[] b, int off, int len)</dd>
	<dd class="api-summary-dd-method-desc">
	It reads up to the size of the len, stores it in the off position of b, and returns the number of bytes read. It returns -1 if the end of the input stream has been reached and can no longer be read.</dd>
	<dd class="api-summary-dd">int available()</dd>
	<dd class="api-summary-dd-method-desc">
It returns the number of bytes that JVM can read.
	</dd>
	<dd class="api-summary-dd">void close()</dd>
	<dd class="api-summary-dd-method-desc">
	It closes the input stream and returns the system resources associated with the stream.
	</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">OutputStream</dt>
	<dd class="api-summary-dd">void write(int b)</dd>
	<dd class="api-summary-dd-method-desc">It outputs the low 8 bits of b.</dd>
	<dd class="api-summary-dd">void write(byte[] b)</dd>
	<dd class="api-summary-dd-method-desc">It outputs the contents of b.</dd>
	<dd class="api-summary-dd">void write(byte[] b, int off, int len)</dd>
	<dd class="api-summary-dd-method-desc">It outputs len bytes from the off position of b.</dd>
	<dd class="api-summary-dd">void flush()</dd>
	<dd class="api-summary-dd-method-desc">It outputs the remaining bytes in the buffer.</dd>
	<dd class="api-summary-dd">void close()</dd>
	<dd class="api-summary-dd-method-desc">It closes the output stream and returns the system resources associated with it.</dd>
</dl>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.FileInputStream;

public class Test {

  public static void main(String[] args) throws Exception {
    int n = 0;
    FileInputStream fis = new FileInputStream("C:/javaApp/test.txt");
    while ((n = fis.available()) &gt; 0) {
      byte[] b = new byte[n];
      int result = fis.read(b);
      if (result == -1) {
        break;
      }
      String s = new String(b);
      System.out.println(s);
    }
    fis.close();
  }
}
</pre>

<p>
Test with the following file:
</p>

<h6 class="src">test.txt</h6>
<pre class="prettyprint">
a b c d e
1 2 3 4 5
</pre>

<p>
The following is an example of creating a copy file.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.FileInputStream;
<strong>import java.io.FileOutputStream;</strong>
import java.io.IOException;

public class Test {

  public static void main(String[] args) throws IOException {
    int n = 0;
    FileInputStream fis = new FileInputStream("C:/javaApp/test.txt");
    <strong>FileOutputStream fos = new FileOutputStream("C:/javaApp/testCopy.txt", false);</strong>
    while ((n = fis.available()) &gt; 0) {
      byte[] b = new byte[n];
      int result = fis.read(b);
      if (result == -1) {
        break;
      }
      <strong>fos.write(b);</strong>
    }
    fis.close();
    <strong>fos.close();</strong>
  }
}
</pre>

<p>
FileInputStream/FileOutputStream is a class for file I/O in bytes.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">FileInputStream's Constructors</dt>
	<dd class="api-summary-dd">FileInputStream(File <em>file</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an input stream for the file specified by the <em>file</em> argument.</dd>
	<dd class="api-summary-dd">FileInputStream(String <em>name</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an input stream for the file specified by <em>name</em>.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">FileOutputStream's Constructors</dt>
	<dd class="api-summary-dd">FileOutputStream(File <em>file</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an output stream for the file specified by the <em>file</em> argument.</dd>
	<dd class="api-summary-dd">FileOutputStream(File <em>file</em>, boolean <em>append</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an output stream for the file specified by the <em>file</em> argument. If <em>append</em> flag is true, the output stream appends the contents to the end of the file's contents.</dd>
	<dd class="api-summary-dd">FileOutputStream(String <em>name</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an output stream for the file specified by <em>name</em>.</dd>
	<dd class="api-summary-dd">FileOutputStream(String <em>name</em>, boolean <em>append</em>)</dd>
	<dd class="api-summary-dd-method-desc">It creates an output stream for the file specified by <em>name</em>. If the <em>append</em> flag is true, the output stream appends the contents to the end of the file's contents. If false, the output stream overwrites the existing contents.</dd>
</dl>

<p>
The methods of FileInputStream and FileOutputStream used in the example are those of InputStream and OutputStream. FileInputStream extends OutputStream and FileOutputStream extends OutputStream.
</p>

<h2>Character Stream</h2>

<p>
<!-- 
<img src="https://lh4.googleusercontent.com/-6xNIYh4BAfo/UrREJcHeK7I/AAAAAAAABhs/2U_pBrm-C-Q/w590-h555-no/CharacterStream.jpg" alt="Character Stream" />
-->
Reader and Writer are the character input and output classes' top-level classes. Reader and Writer are all abstract classes, and the unit of input and output data in the method is a character.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">Reader</dt>
	<dd class="api-summary-dd">int read()</dd>
	<dd class="api-summary-dd-method-desc">It reads one single character and returns the Unicode value of the character.</dd>
	<dd class="api-summary-dd">int read(char[] <em>b</em>)</dd>
	<dd class="api-summary-dd-method-desc">It reads a character as many as the size of array <em>b</em>, stores it in b, and returns the number of characters read.</dd>
	<dd class="api-summary-dd">abstract int read(char[] b, int off, int len)</dd>
	<dd class="api-summary-dd-method-desc">It reads a character as many as the size of len and returns the number of characters read.</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">Writer</dt>
	<dd class="api-summary-dd">void write(String <em>s</em>)</dd>
	<dd class="api-summary-dd-method-desc">It outputs <em>s</em>.</dd>
	<dd class="api-summary-dd">void write(char[] <em>b</em>)</dd>
	<dd class="api-summary-dd-method-desc">It outputs <em>b</em>.</dd>
	<dd class="api-summary-dd">void write(char[] <em>b</em>, int <em>off</em>, int <em>len</em>)</dd>
	<dd class="api-summary-dd-method-desc">It outputs characters as many as the size of <em>len</em> from the <em>off</em> index of array <em>b</em>.</dd>
	<dd class="api-summary-dd">void write(String <em>s</em>, int <em>off</em>, int <em>len</em>)</dd>
	<dd class="api-summary-dd-method-desc">It outputs characters as many as size of <em>len</em> from the <em>off</em> index of String <em>s</em>.</dd>
</dl>

<h6 class="src">Test2.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.FileReader;
import java.io.FileWriter;

public class Test2 {

  public static void main(String[] args) throws Exception {
    int n = 0;
    FileReader fr = new FileReader("C:/javaApp/test.txt");
    FileWriter fw = new FileWriter("C:/javaApp/testCopy.txt", false);
    while ((n = fr.read()) != -1) {
      fw.write(n);
    }
    fr.close();
    fw.close();
  }
}
</pre>

<h3>BufferedReader/BufferedWriter</h3>

<p>
BufferedReader/BufferedWriter provides a buffering function for character I/O.
</p>

<h6 class="src">Test2.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Test {

  public static void main(String[] args) throws Exception {
    FileReader fr = new FileReader("C:/javaApp/test.txt");
    BufferedReader br = new BufferedReader(fr);
    String s = null;
    FileWriter fw = new FileWriter("C:/javaApp/testCopy2.txt", false);
    BufferedWriter bw = new BufferedWriter(fw);
    while ((s = br.readLine()) != null) {
      bw.write(s);
      bw.newLine();
    }
    fr.close();
    br.close();
    bw.close();
    fw.close();
  }
}
</pre>

<h3>InputStreamReader/OutputStreamWriter</h3>

<p>
An InputStreamReader is a bridge from byte streams to character streams: It reads bytes and decodes them into characters using a specified charset.<br />
For more information, see <a href="https://docs.oracle.com/javase/8/docs/api/java/io/InputStreamReader.html">this</a>.<br /> 
An OutputStreamWriter is a bridge from character streams to byte streams: Characters written to it are encoded into bytes using a specified charset.<br />
For more information, see <a href="https://docs.oracle.com/javase/8/docs/api/java/io/OutputStreamWriter.html">this</a>.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">InputStreamReader's Constructor</dt>
	<dd class="api-summary-dd">InputStreamReader(InputStream in)</dd>
	<dd class="api-summary-dd">InputStreamReader(InputStream in, String enc)</dd>
</dl>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">OutputStreamWriter's Constructor</dt>
	<dd class="api-summary-dd">OutputStreamWriter(OutputStream out)</dd>
	<dd class="api-summary-dd">OutputStreamWriter(OutputStream out, String enc)</dd>
</dl>

<p>
The following example uses InputStreamReader to convert bytes input from the keyboard to characters.
</p>

<h6 class="src">InputTest.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.*;

public class InputTest {
  public static void main(String[] args) throws IOException {
    InputStreamReader isr = new InputStreamReader(System.in);
    BufferedReader br = new BufferedReader(isr);
    String input = br.readLine();
    System.out.println("Input: " + input); 
  }
}
</pre>

<p>
The example creates an InputStreamReader with the keyboard as the source. -- In Java, the keyboard is represented by System.in -- Then create a BufferedReader object for the buffer function. At this time, the example code passes the InputStreamReader's reference to the BufferedReader's constructor.
</p>

<pre class="prettyprint no-border">
String input = br.readLine();
</pre>

<p>
This code waits for user input.
</p>

<p>
BufferedReader's readLine() method returns the input string excluding the Enter key when the user presses the Enter key.
</p>

<p>
For more information about the BufferedReader, see <a href="https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html">this</a>.
</p>

<p>
The following example prints character data to a file.
</p>

<h6 class="src">OutputTest.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.*;

public class OutputTest {
  public static void main(String[] args) {
    FileWriter fw = null;
    try {
      fw = new FileWriter("C:/output.txt", true);
      fw.write("TEST");
      fw.flush();
    } catch(IOException e) {
      e.printStackTrace();
    } finally {
      try {
        <strong>fw.close();</strong>
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}
</pre>

<p>
You can use the FileWriter to output character data to a file. In the FileWriter's constructor, the first argument is the destination, and the second argument is a flag that determines whether to keep the existing contents in the file. If true, leave the current contents intact.
</p>

<p>
It is important to close the output stream.
</p>

<pre class="prettyprint n0-border">
fw.close();
</pre>

<p>
This code closes the output stream.
</p>

<h6 class="src">SubtitleToText.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class SubtitleToText {
	
  public static void main(String[] args) throws IOException {
    FileReader fr = null;
    FileWriter fw = null;
    BufferedReader br = null;
    BufferedWriter bw = null;
		
    if (args.length &gt;= 2) {
      try {
        fr = new FileReader(args[0]);
        br = new BufferedReader(fr);
        fw = new FileWriter(args[1], false);
        bw = new BufferedWriter(fw);
        String s = null;
        while ((s = br.readLine()) != null) {
          try {
            Integer.parseInt(s);
          } catch (NumberFormatException e) {
            if (!s.contains("-&gt;")) {
              bw.write(s);
              bw.newLine();
            }
          }
        }
      } catch (IOException e) {
        e.printStackTrace();
      } finally {
        try {
          if (fr != null) {
            fr.close();
          }
        } catch (IOException e) {
          e.printStackTrace();
        }
        try {
          if (br != null) {
            br.close();
          }
        } catch (IOException e) {
          e.printStackTrace();
        }
        try {
          if (bw != null) {
            bw.close();
          }
        } catch (IOException e) {
          e.printStackTrace();
        }
        try {
          if (fw != null) {
            fw.close();
          }
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  } 
}
</pre>

<h6 class="src">URLTest.java</h6>
<pre class="prettyprint">
package net.java_school.stream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;

public class URLTest {

  public static void main(String[] args) {
    String url = "http://www.java-school.net";
    String file = "index.html";
    InputStream in = null;
    BufferedReader br = null;
    FileOutputStream fos = null;
    BufferedWriter bw = null;
    try {
      in = (new URL(url)).openStream();
      br = new BufferedReader(new InputStreamReader(in));
      fos = new FileOutputStream(file);
      bw = new BufferedWriter(new OutputStreamWriter(fos));
      String str = null;
      while ((str = br.readLine()) != null) {
        bw.write(str);
        bw.newLine();
      }
    } catch (MalformedURLException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (br != null) {
        try {
          br.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
      if (bw != null) {
        try {
          bw.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
      if (fos != null) {
        try {
          fos.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }
}
</pre>

<h2>Object Stream</h2>

<p>
Passing an object through a file or network needs serialization. Also, reconstructing an object from a file or an object stream passed over the network requires deserialization. The below example stores object information in a file and create an object from the file where object information is stored.
</p>

<h6 class="src">Address.java</h6>
<pre class="prettyprint">
package net.java_school.serial;

import java.io.Serializable;

public class Address <strong>implements Serializable</strong> {

  private String mobile;
  private String address;
	
  public String getMobile() {
    return mobile;
  }
  public void setMobile(String mobile) {
    this.mobile = mobile;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
}
</pre>

<p>
If the Address object is serialized and stored in a file through a stream, the Address class must declare that it implements the Serializable interface.
</p>

<pre class="prettyprint no-border">
public class Address implements Serializable
</pre>

<p>
The Serializable interface does not have any method to implement.<br />
The Serializable interface only tells the virtual machine that it may have to serialize objects created from the class. Such an interface is called a declarative interface.
</p>

<p>
Primitive data types in Java do not need serialization. Many popular classes, such as String and Collection, are serializable. These classes declare that they implement Serializable in their class declaration. Similarly, if you create a class that JVM may have to serialize, you must declare that it implements Serializable in the class declaration.
</p>

<h6 class="src">Backup.java</h6>
<pre class="prettyprint">
package net.java_school.serial;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Backup {

  public static void main(String[] args) {
    ObjectOutputStream out = null;
    try {
      out = new ObjectOutputStream(new FileOutputStream("address.txt"));
      Address addr = new Address();
      addr.setMobile("212-963-4475");
      addr.setAddress("760 United Nations Plaza, Manhattan, New York City");
      out.writeObject(addr);
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      try {
        out.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}
</pre>

<p>
The Backup class creates an Address object and stores it in a file. -- It used ObjectOutputStream to generate the object stream and FileOutputStream to store the Address object in the file --
</p>

<p>
The following example creates an object from the object information stored in a file.
</p>

<h6 class="src">Recovery.java</h6>
<pre class="prettyprint">
package net.java_school.serial;

import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

public class Recovery {

  public static void main(String[] args) {
    ObjectInputStream in = null;
    try {
      in = new ObjectInputStream(new FileInputStream("address.txt"));
      while(true) {
        Address addr = (Address) in.readObject();
        System.out.println(addr.getMobile());
        System.out.println(addr.getAddress());
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (EOFException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } finally {
      try {
        in.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}
</pre>

<p>
The Recovery class creates an object of the same content from the object information stored in the address.txt file and puts it in the heap memory. -- It uses a FileInputStream to read bytes from a file. This example uses an ObjectInputStream for an object stream coming into a Java program --
</p>

<h2>Edit Javabank Example to use Java I/O</h2>

<p>
Create and test a new class called BankUi, as shown below.
</p>

<pre class="prettyprint">
package net.java_school.bank;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BankUi{
	
  public static void main(String[] args) throws IOException {
    InputStreamReader isr = new InputStreamReader(System.in);
    BufferedReader br = new BufferedReader(isr);
    String input = <strong>br.readLine();</strong>
    System.out.println("Input: " + input);
  }
}
</pre>

<h3>TODO</h3>

<p>
Change the BankUi as shown below and implement the TODO part.
</p>

<pre class="prettyprint">
package net.java_school.bank;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

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
      System.out.println(" ** Menu ** ");
      System.out.println(" 1 ** Bank account registration    ");
      System.out.println(" 2 ** List of bank accounts    ");
      System.out.println(" 3 ** Deposit    ");
      System.out.println(" 4 ** Withdrawal    ");
      System.out.println(" 5 ** Transfer    ");
      System.out.println(" 6 ** Transaction history    ");
      System.out.println(" q ** Exit    ");
      System.out.println(" ********************** ");
      System.out.print("&gt;&gt;");
            
      try {
        menu = readCommandLine();
        if (menu.equals("1")) {
          //TODO Bank account registration
        } else if (menu.equals("2")) {
          //TODO List of bank accounts
        } else if (menu.equals("3")) {
          //TODO Deposit
        } else if (menu.equals("4")) {
          //TODO Withdrawal
        } else if (menu.equals("5")) {
          //TODO Transfer
        } else if (menu.equals("6")) {
          //TODO Transaction history
        }
      } catch (Exception e) {
          e.printStackTrace();
      }
      System.out.println();
    } while (!menu.equals("q"));
  }

  public static void main(String[] args) {
    BankUi ui = new BankUi();
    ui.startWork();
  }
}
</pre>

<p>
Implement all //TODO parts and test them thoroughly. The Java bank program has evolved into an interactive program, but accounts and transaction history disappear once the program ends. You can save the account information and transaction history in the following ways:
</p>

<ol>
	<li>Save the bank object to a file</li>
	<li>Save the account info and transaction history to a text file</li>
	<li>Save the account info and transaction history to a database</li>
</ol>

<h3>1. Save a bank object to a file</h3>

<p>
JVM can save only serializable objects to a file.<br />
Modify the Bank, Account, and Transaction classes, as shown below.
</p>

<pre class="prettyprint no-border">
import java.io.Serializable;
</pre>

<pre class="prettyprint">
public interface Bank <strong>extends Serializable</strong>
</pre>

<pre class="prettyprint">
public abstract class Account <strong>implements Serializable</strong>
</pre>

<pre class="prettyprint">
public class Transaction <strong>implements Serializable</strong>
</pre>

<p>
The scenario is as follows. When the program starts, it de-serializes the bank object information stored in the file named bank.ser and loads the bank object into the heap memory. When you run the program for the first time, FileNotFoundException occurs because of the bank.ser file does not exist. When a FileNotFoundException occurs, call the bank class's constructor to create the bank object and assign the bank reference to the variable named bank. At the end of the program, JVM saves the bank object information in the bank.ser file.
</p>

<p>
Add the following method to the BankUi class.
</p>

<pre class="prettyprint">
public void loadBank() throws Exception {
  try {
    ObjectInputStream in = null;
    in = new ObjectInputStream(new FileInputStream("bank.ser"));
    bank = (Bank) in.readObject();
    in.close();
  } catch (FileNotFoundException e) {
    bank = new MyBank();
  } 
}
</pre>

<pre class="prettyprint">
public void saveBank() throws Exception {
  ObjectOutputStream out = null;
  out = new ObjectOutputStream(new FileOutputStream("bank.ser"));
  out.writeObject(bank);
  out.close();
}
</pre>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
<strong>private Bank bank;

public BankUi() throws Exception {
  loadBank();
}
</strong>
public static void main(String[] args) <strong>throws Exception</strong> {
  BankUi ui = new BankUi();
  ui.startWork();
  <strong>ui.saveBank();</strong>
}
</pre>

<h3>2. Save the account info and transaction history to a text file.</h3>

<p>
Before looking at the code hints for saving to a text file, let's first look at the File class. What you can do with the File class is as follows.
</p>

<ul>
	<li>See the contents of the directory.</li>
	<li>Get the attributes of the file.</li>
	<li>Rename or delete the file.</li>
</ul>

<p>
Note that the File class does not have I/O capabilities for files.
</p>

<pre class="prettyprint no-border">
File dir = new File(path);
</pre>

<p>
The above code snippet creates a file object. The file or directory corresponding to the path must be the full path of the system.
</p>

<p>
The following are the essential methods of the File class.
</p>

<dl class="api-summary">
	<dt class="api-summary-dt bottom-line">File</dt>
	<dd class="api-summary-dd">isDirectory():boolean</dd>
	<dd class="api-summary-dd-method-desc">dir.isDirectory(); //Returns true if dir is a directory.</dd>
	<dd class="api-summary-dd">isFile():boolean</dd>
	<dd class="api-summary-dd-method-desc">dir.isFile(); //Returns true if dir is a file.</dd>
	<dd class="api-summary-dd">list():String[]</dd>
	<dd class="api-summary-dd-method-desc">dir.list(); //If dir is a directory, return the file names in the directory as String[].</dd>
	<dd class="api-summary-dd">listFiles():File[]</dd>
	<dd class="api-summary-dd-method-desc">dir.listFiles(); //Returns an array of file objects for files in the directory.</dd>
	<dd class="api-summary-dd">mkdir():boolean</dd>
	<dd class="api-summary-dd-method-desc">dir.mkdir(); //Create a directory with the name of the File object.</dd>
	<dd class="api-summary-dd">getName():String</dd>
	<dd class="api-summary-dd-method-desc">Return file name.</dd>
	<dd class="api-summary-dd">getPath():String</dd>
	<dd class="api-summary-dd-method-desc">Return path.</dd>
	<dd class="api-summary-dd">delete():boolean</dd>
	<dd class="api-summary-dd-method-desc">Delete file.</dd>
	<dd class="api-summary-dd">exists():boolean</dd>
	<dd class="api-summary-dd-method-desc">Returns true if the file or directory exists, false if not.</dd>
</dl>

<p>
For more information, see <a href="https://docs.oracle.com/javase/8/docs/api/java/io/File.html">https://docs.oracle.com/javase/8/docs/api/java/io/File.html</a>
</p>

<p>
JVM will store the account information in a file named accounts.txt. The format of the stored account information is as follows.
</p>

<pre class="prettyprint">
101|Alison|10000|Normal
202|Bill|5000|Normal
303|Carol|0|Normal
404|Alison|0|Minus
</pre>

<p>
Open the Account.java file and modify the toString() method as follows:
</p>

<pre class="prettyprint">
@Override
public String toString() {
  StringBuffer sb = new StringBuffer();
  sb.append(accountNo);
  sb.append("|");		
  sb.append(name);
  sb.append("|");
  <strong>sb.append(balance);</strong>
  sb.append("|");
  sb.append(getKind());

  return sb.toString();
}
</pre>

<p>
JVM will store the transaction history in a file with the same name as the account number. The format of the transaction history information stored is as follows.
</p>

<pre class="prettyprint">
2014/5/1|09:33:30|Deposit|10|10
2014/5/3|09:33:30|Withdrawal|6|4
</pre>

<p>
Open the Transaction.java file and modify the toString() method as follows:
</p>

<pre class="prettyprint">
@Override
public String toString() {
  StringBuilder sb = new StringBuilder();
  sb.append(transactionDate);
  sb.append("|");
  sb.append(transactionTime);
  sb.append("|");
  sb.append(kind);
  sb.append("|");
  <strong>sb.append(amount);</strong>
  sb.append("|");
  <strong>sb.append(balance);</strong>

  return sb.toString();
}
</pre>

<p>
Open BankUi.java and modify the code referring to the following.
</p>

<pre class="prettyprint">
<strong>static final String ACCOUNT_FILE = "accounts.txt";
static final String DATA_DIR = "./data/";
</strong>
private Bank bank = <strong>new MyBank();
/*	
public BankUi() throws Exception {
  loadBank();
}
*/</strong>	

public static void main(String[] args) throws Exception {
  BankUi ui = new BankUi();
  ui.startWork();
  <strong>//ui.saveBank();</strong>
}
</pre>

<p>
When the program starts, it reads the account information from the accounts.txt file and loads the account object. If you work in Eclipse, you need to create a data folder in the project root directory and create an empty file named accounts.txt in the folder.
</p>

<pre class="prettyprint">
FileReader fr = null;
fr = new FileReader(DATA_DIR + BankUi.ACCOUNT_FILE);
BufferedReader br = new BufferedReader(fr);
String str = null;

while ((str = br.readLine()) != null) {
  StringTokenizer st = new StringTokenizer(str, "|");
  String accountNo = st.nextToken();
  String name = st.nextToken();
  double balance = Double.parseDouble(st.nextToken());
  String kind = st.nextToken();

  if (kind.equals(NormalAccount.KIND)) {
    bank.addAccount(accountNo, name, balance, NormalAccount.KIND);
  } else if (kind.equals(MinusAccount.KIND)) {
    bank.addAccount(accountNo, name, balance, MinusAccount.KIND);
  }
}

br.close();
</pre>

<p>
The program loads the transaction history object from each transaction history file and binds it with the account object when it starts.
</p>

<pre class="prettyprint">
File dir = new File(BankUi.DATA_DIR);
File[] files = dir.listFiles();
FileReader fr = null;
BufferedReader br = null;

for (File file : files) {
  if (file.isFile()) {

    String fileName = file.getName();

    if (!fileName.equals(BankUi.ACCOUNT_FILE)) {
      fr = new FileReader(BankUi.DATA_DIR + fileName);
      br = new BufferedReader(fr);
      List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();
      String str = null;

      while ( (str = br.readLine()) != null) {
        StringTokenizer st = new StringTokenizer(str, "|");
        String day = st.nextToken();
        String time = st.nextToken();
        String kind = st.nextToken();
        double amount = Double.parseDouble(st.nextToken());
        double balance = Double.parseDouble(st.nextToken());
        transactions.add(new Transaction(day,time,kind,amount,balance));
      }

      Account account = bank.getAccount(fileName);

      if (account != null) {
        account.setTransactions(transactions);
      }
    }
  }
} 		
</pre>

<p>
The program saves the account and transaction details when it ends.
</p>

<pre class="prettyprint">
StringBuilder sbForAccounts = new StringBuilder();
List&lt;Account&gt; accounts = bank.getAccounts();

for (Account account : accounts) {
  sbForAccounts.append(account);
  sbForAccounts.append(System.getProperty("line.separator"));
  StringBuilder sbForTransactions = new StringBuilder();
  List&lt;Transaction&gt; transactions = account.getTransactions();

  for (Transaction transaction : transactions) {
    sbForTransactions.append(transaction);
    sbForTransactions.append(System.getProperty("line.separator"));
  }

  FileWriter fw = new FileWriter(BankUi.DATA_DIR + account.getAccountNo(), false);
  BufferedWriter bw = new BufferedWriter(fw);
  bw.write(sbForTransactions.toString());
  bw.close();
}

FileWriter fw = null;
BufferedWriter bw = null;
fw = new FileWriter(DATA_DIR + BankUi.ACCOUNT_FILE, false);
bw = new BufferedWriter(fw);
bw.write(sbForAccounts.toString());
bw.close();		
</pre>

<p>
Saving to the database is described in the JDBC chapter.
</p>

<h6 class="src">BankUi.java</h6>
<pre class="prettyprint">
package net.java_school.bank;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class BankUi {

  static final String ACCOUNT_FILE = "accounts.txt";
  static final String DATA_DIR = "./data/";
	
  private Bank bank = new MyBank();
  /*	
  public BankUi() throws Exception {
    loadBank();
  }
  */	
  private String readCommandLine() throws IOException {
    InputStreamReader isr = new InputStreamReader(System.in);
    BufferedReader br = new BufferedReader(isr);
    String input = br.readLine();
    return input;
  }
	
  public void startWork() {
    String menu = null;
      do {
        System.out.println(" ** Menu ** ");
        System.out.println(" 1 ** Bank account registration    ");
        System.out.println(" 2 ** List of bank accounts    ");
        System.out.println(" 3 ** Deposit    ");
        System.out.println(" 4 ** Withdrawal    ");
        System.out.println(" 5 ** Transfer    ");
        System.out.println(" 6 ** Transaction history    ");
        System.out.println(" q ** Exit    ");
        System.out.println(" ********************** ");
        System.out.print("&gt;&gt;");
        try {
          menu = readCommandLine();
          String accountNo = null;
          String name = null;
          String kind = null;
          double amount = 0;
          if (menu.equals("1")) {
            //TODO Bank account registration
            System.out.print("Please enter the number of the account to be created: ");
            accountNo = this.readCommandLine();
            System.out.print("Please enter the owner name of the account to be created: ");
            name = this.readCommandLine();
            System.out.print("Please select the account type to be created. Normal(just Enter), Minus(2): ");
            kind = this.readCommandLine();
            if (kind != null &amp;&amp; kind.equals("2")) {
              bank.addAccount(accountNo, name, MinusAccount.KIND);
            } else {
              bank.addAccount(accountNo, name, NormalAccount.KIND);
            }
          } else if (menu.equals("2")) {
            //TODO List of bank accounts
            List&lt;Account&gt; accounts = bank.getAccounts();
            for (Account account : accounts) {
              System.out.println(account);
            }
          } else if (menu.equals("3")) {
            //TODO Deposit
            System.out.print("Please enter your account number: ");
            accountNo = this.readCommandLine();
            System.out.print("Please enter deposit amount: ");
            amount = Integer.parseInt(this.readCommandLine());
            Account account = bank.getAccount(accountNo);
            account.deposit(amount);
          } else if (menu.equals("4")) {
            //TODO Withdrawal
            System.out.print("Please enter your account number: ");
            accountNo = this.readCommandLine();
            System.out.print("Please enter deposit amount: ");
            amount = Integer.parseInt(this.readCommandLine());
            Account account = bank.getAccount(accountNo);
            account.withdraw(amount);
          } else if (menu.equals("5")) {
            //TODO Transfer
            System.out.print("Please enter your account number: ");
            String from = this.readCommandLine();
            System.out.print("Please enter the account number you wish to transfer: ");
            String to = this.readCommandLine();
            System.out.print("Enter transfer amount: ");
            amount = Integer.parseInt(this.readCommandLine());
            Account fromAccount = bank.getAccount(from);
            Account toAccount = bank.getAccount(to);
            fromAccount.withdraw(amount);
            toAccount.deposit(amount);	
          } else if (menu.equals("6")) {
            //TODO Transaction history
            System.out.print("Please enter your account number: ");
            accountNo = this.readCommandLine();
            Account account = bank.getAccount(accountNo);
            List&lt;Transaction&gt; transactions = account.getTransactions();
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
	
  public void loadBank() throws Exception {
    try {
      ObjectInputStream in = null;
      in = new ObjectInputStream(new FileInputStream("bank.ser"));
      bank = (Bank) in.readObject();
      in.close();
    } catch (FileNotFoundException e) {
      bank = new MyBank();
    }
  }
	
  public void saveBank() throws Exception {
    ObjectOutputStream out = null;
    out = new ObjectOutputStream(new FileOutputStream("bank.ser"));
    out.writeObject(bank);
    out.close();
  }
	
  public void readAccounts() throws Exception {
    FileReader fr = null;
    fr = new FileReader(DATA_DIR + BankUi.ACCOUNT_FILE);
    BufferedReader br = new BufferedReader(fr);
    String str = null;
		
    while ( (str = br.readLine()) != null) {
      StringTokenizer st = new StringTokenizer(str, "|");
      String accountNo = st.nextToken();
      String name = st.nextToken();
      double balance = Double.parseDouble(st.nextToken());
      String kind = st.nextToken();
			
      if (kind.equals(NormalAccount.KIND)) {
        bank.addAccount(accountNo, name, balance, NormalAccount.KIND);
      } else if (kind.equals(MinusAccount.KIND)) {
        bank.addAccount(accountNo, name, balance, MinusAccount.KIND);
      }
    }
    br.close();
  }
	
  public void readTransactions() throws Exception {
    File dir = new File(BankUi.DATA_DIR);
    File[] files = dir.listFiles();
    FileReader fr = null;
    BufferedReader br = null;
		
    for (File file : files) {
      if (file.isFile()) {
        String fileName = file.getName();
        if (!fileName.equals(BankUi.ACCOUNT_FILE)) {
          fr = new FileReader(BankUi.DATA_DIR + fileName);
          br = new BufferedReader(fr);
          List&lt;Transaction&gt; transactions = new ArrayList&lt;Transaction&gt;();
          String str = null;
          while ( (str = br.readLine()) != null) {
            StringTokenizer st = new StringTokenizer(str, "|");
            String day = st.nextToken();
            String time = st.nextToken();
            String kind = st.nextToken();
            double amount = Double.parseDouble(st.nextToken());
            double balance = Double.parseDouble(st.nextToken());
            transactions.add(new Transaction(day,time,kind,amount,balance));
          }
          Account account = bank.getAccount(fileName);
          if (account != null) {
            account.setTransactions(transactions);
          }
        }
      }
    } 		
  }
	
  public void readAll() throws Exception {
    readAccounts();
    readTransactions();
  }
	
  public void writeAll() throws Exception {
    StringBuilder sbForAccounts = new StringBuilder();
    List&lt;Account&gt; accounts = bank.getAccounts();
		
    for (Account account : accounts) {
      sbForAccounts.append(account);
      sbForAccounts.append(System.getProperty("line.separator"));
      StringBuilder sbForTransactions = new StringBuilder();
      List&lt;Transaction&gt; transactions = account.getTransactions();
			
      for (Transaction transaction : transactions) {
        sbForTransactions.append(transaction);
        sbForTransactions.append(System.getProperty("line.separator"));
      }
			
      FileWriter fw = new FileWriter(BankUi.DATA_DIR + account.getAccountNo(), false);
      BufferedWriter bw = new BufferedWriter(fw);
      bw.write(sbForTransactions.toString());
      bw.close();
    }
		
    FileWriter fw = null;
    BufferedWriter bw = null;
    fw = new FileWriter(DATA_DIR + BankUi.ACCOUNT_FILE, false);
    bw = new BufferedWriter(fw);
    bw.write(sbForAccounts.toString());
    bw.close();		
  }
	
  public static void main(String[] args) throws Exception {
    BankUi ui = new BankUi();
    ui.readAll();
    ui.startWork();
    ui.writeAll();
    //ui.saveBank();
  }
}
</pre>

</article>

</body>
</html>
