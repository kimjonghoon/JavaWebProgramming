<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>
	
<h1>Inheritance</h1>

<p>
Inheritance allows you to create classes hierarchically.<br />
Subclasses inherit the superclass's implementation.
</p>

<p>
The key to object-oriented programming is reusability.
You can reuse classes as they are or reuse super ones.
</p>

<p>
Reusing a superclass means creating a subclass appropriately from the superclass.
</p>

<p>
Let's start with classes unrelated to inheritance.
The following are the Employee and Manager classes.
</p>

<h6 class="src">Employee.java</h6>
<pre class="prettyprint">
package net.java_school.oop;

public class Employee {
  private String name;
  private String position;
  private String telephone;
	
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(name);
    sb.append("|");
    sb.append(position);
    sb.append("|");
    sb.append(telephone);

    return sb.toString();
  }
}
</pre>

<h6 class="src">Manager.java</h6>
<pre class="prettyprint">
package net.java_school.oop;

public class Manager {
  private String name;
  private String position;
  private String telephone;
  private String manageJob;
	
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }

  public String getManageJob() {
    return manageJob;
  }

  public void setManageJob(String manageJob) {
    this.manageJob = manageJob;
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(name);
    sb.append("|");
    sb.append(position);
    sb.append("|");
    sb.append(telephone);
    sb.append("|");
    sb.append(manageJob);
		
    return sb.toString();
  }
}
</pre>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
package net.java_school.oop;

public class Test {
  public static void main(String[] args) {
    Employee james = new Employee();
    james.setName("JAMES");
    james.setPosition("CLERK");
    james.setTelephone("19");
    System.out.println(james.toString());	
	
    Manager blake = new Manager();
    blake.setName("BLAKE");
    blake.setPosition("MANAGER");
    blake.setTelephone("9");
    blake.setManageJob("Project Management");
    System.out.println(blake.toString());
  }	
}
</pre>

<p>
The two classes above have nothing to do with each other.
</p>

<p>
However, since the proposition that a manager is an employee is correct, the two classes should be an inheritance relationship that establishes an is-a relationship.
</p>

<p>
Since an employee is a concept broader than a manager, an employee is a superclass, and a manager is a subclass.
</p>

<p>
To establish inheritance as code, make sure that there is an overlapping code in the employee and manager classes.
</p>

<p>
You can find the name, position, telephone field, and getters and setters methods are overlapping.
</p>

<p>
You can expect that the part inherited from the employee class will disappear from the manager class source.
</p>

<p>
Modify the Manager class to inherit the Employee class like below.
</p>

<h6 class="src">Manager.java</h6>
<pre class="prettyprint">
package net.java_school.oop;

public class Manager <strong>extends</strong> Employee {
  private String manageJob;
	
  public String getManageJob() {
    return manageJob;
  }

  public void setManageJob(String manageJob) {
    this.manageJob = manageJob;
  }
	
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(getName());
    sb.append("|");
    sb.append(getPosition());
    sb.append("|");
    sb.append(getTelephone());
    sb.append("|");
    sb.append(manageJob);
		
    return sb.toString();
  }
}
</pre>

<p>
You can use the 'extends' keyword in the class declaration of a subclass to inherit a superclass.
</p>

<p>
The superclass's access modifiers are still working when the subclass accesses the inherited variables or methods.
</p>

<p>
The reason for using getName(), getPosition(), and getTelephone() in the toString() method of Manager is that Employee's name, position, and telephone are private. To access these variables directly, you need to change the access modifiers of these superclass variables.
</p>

<p>
Since the employee class and the manager class are in the same package, modifying these variables' access modifiers in the employee class as package-private, protected, or public allows direct access to these superclass variables from the subclass.
</p>

<p>
Suppose the employee class and the manager class are not the same packages. In that case, you must declare the employee class's name, position, and telephone as protected or public for direct access from outside.
</p>

<p>
An object of a subclass type can access a superclass's protected variables and methods even if the package of the subclass and superclass are different.
The protected access modifier protects the inheritance relationship between classes in different packages.
</p>

<p>
Run the Test class to see the results.
</p>

<h3>Method Overriding</h3>

<p>
You can use methods inherited from a parent class, but you can redefine those methods. It is called Method Overriding.
</p>

<p>
When redefining parent class methods in a child class, the return type, method name, and parameter list must be the same as those of the parents.
</p>

<p>
The toString() of the manager class overrides the toString() of the employee class, and the toString() of the employee class overrides the toString() of the Object class.
</p>

<p>
Is there the 'extends' keyword in the class declaration of Employee? None.<br />
A class without the 'extends' keyword inherits the Object class at the class declaration.
</p>

<p>
The compiler intervenes and changes class Employee to class Employee extends Object. As a result, the superclass of the employee class becomes an Object.
</p>

<p>
An element such as @Override is called an annotation.
An annotation passes information to the compiler or platform that code cannot pass to the compiler or platform.
@Override tells the compiler that the method overrides the superclass method.
</p>

<h2>Constructor</h2>

<p>
In the method main of Test class, Manager blake = new Manager(); is the code to create Manager object.
Now it is time to talk more about this part of the code.
The Manager() that comes after new is the code that calls the Manager() constructor. You need to declare the Manager() in the class body like the method.
</p>

<p>
After a new keyword, you can call one of the constructors declared in the class.
</p>

<p>
We did not create a constructor for the Employee and Manager classes in the above example. However, we have code that calls the constructor in the method main. And the example runs without error. It means that the calling constructor has run. How did the undeclared constructor run?
</p>

<p>
The compiler compiles after adding a parameterless constructor to the class code when there isn't any constructor. The constructor that the compiler automatically generates is called the default constructor. The compiler does not add a default constructor if you declare any constructors.
</p>

<p>
You can declare multiple constructors with different parameter lists.
</p>

<p>
The constructor is called just once after an object is created and is not called again.
</p>

<p>
Don't assume that a constructor creates an object. The new keyword allocates space for an object in the heap memory and initializes the variables of an object. Then the constructor after the new keyword is called.
</p>

<p>
When the constructor finishes without errors, the reference variable is assigned a reference value that can refer to the created object.
If there is an error in the constructor, the reference variable is not assigned a reference value, and as a result, the object is disabled.
</p>

<p>
JVM calls a constructor after creating an object. So, most constructors consist of code that initializes an object.
A constructor must have no return type, and the constructor name must be the same as the class name.
Many people mistake putting the 'void' keyword before the constructor's name when making a constructor. If you add the 'void' keyword, it becomes a method, not a constructor.
</p>

<p>
Subclasses do not inherit superclass constructors.
The first line of the subclass constructor must invoke the superclass constructor. If not, the compiler adds code to the first line that calls the default constructor of the superclass.
</p>

<p>
Before adding appropriate constructors to the Employee and Manager classes, look at keywords: 'this' and 'super.'
</p>

<h4>this</h4>

<p>
When JVM executes 'this,' 'this' has the instance's reference.
You can use the 'this' keyword to differentiate between a constructor parameter and an instance variable within a constructor.
Also, you can use this to call another constructor within a constructor.
</p>

<p>
Note that when you write your code in Eclipse, you can get code assists for the available resources (variables, methods, and so on) by typing dot after this.
</p>

<h4>super</h4>

<p>
You can use the super keyword in the following cases:
</p>

<ul>
	<li>When you need to call superclass methods hidden by Method overriding</li>
	<li>When you need to call superclass constructors within a subclass constructor</li>
</ul>

<p>
Add constructors to the Employee like below.
</p>

<pre class="prettyprint">
public Employee() {} //default constructor

public Employee(String name, String position, String telephone) {
  this.name = name;
  this.position = position;
  this.telephone = telephone;
}
</pre>

<p>
Add constructors to the Manager like below.
</p>

<pre class="prettyprint">
public Manager() {} //default constructor

public Manager(String name, String position, String telephone, String manageJob) {
  super(name, position, telephone);
  this.manageJob = manageJob;
}
</pre>

<p>
Modify the main() of the Test.
</p>

<pre class="prettyprint">
Employee james = new Employee("JAMES", "CLERK", "19");
System.out.println(james.toString());

Manager blake = new Manager("BLAKE", "MANAGER", "9", "Project Management");
<strong>System.out.println(blake);</strong>
</pre>

<p>
In System.out.println(blake);, the println() calls the toString() of the instance pointed to by the variable blake. Therefore, the results of System.out.println(blake.toString()); and System.out.println(blake); are the same.
</p>

<p>
The compiler changes constructors as below.
</p>

<pre class="prettyprint">
public Employee() {
  <strong>super();</strong>
}

public Employee(String name, String position, String telephone) {
  <strong>super();</strong>
  this.name = name;
  this.position = position;
  this.telephone = telephone;
}
</pre>

<pre class="prettyprint">
public Manager() {
  <strong>super();</strong>
}

public Manager(String name, String position, String telephone, String manageJob) {
  super(name, position, telephone);
  this.manageJob = manageJob;
}
</pre>

<h3>You can assign a subclass type reference to a superclass type variable</h3>

<p>
Codes with polymorphism make you feel like they are in the same shape but executed in various forms.<br />
You can experience polymorphism by assigning a subclass type reference to a superclass type variable.
</p>

<div>
<div style="float: left;width: 300px;">
	<img src="https://lh3.googleusercontent.com/ZfOxKrlh2ZiCf1BgiINr49yzmknMUiktiGXljDk8dp5EBlmI-M7V15swfwyAYu9K0aH0W3ENkfHNfhxlvHuWg3M4WImdp5-Sg745mqzTW70Yx_SfJ22gxbaihKVPqcsWFE2nVY80a6z26xfSWnVA8pQYflcIKkug5taZpJ4Kcp6yzHyg-knHUXws3GBVhIvEpK5GLdqa_H-MgOOuoUPci7I-02N59ZWtc6yGH_kFSippiYR-_uiwrl4-Y3aFUPMcFqd03dMZqZGVJjl-oH-lQNkXXP5XVP1_-WIb2crWvJgYgnZTbN5wffwHJVhVK6jYvFJwL2KFDwhP-uVGpPlYBx-soQqSUXeT56FGbPHPvzY8LHq2I7QEQYUwMMzrM8LViXR2I2Z18Eg91E3DVuLQUS7bmALGXi-Q_R6WJe-io6szn3Xz1Z1OFd9rxWpCd42RK7NvqzbAHSygytETY2Vj5Cun5uej8glBA6KQgizaEd_a_HVCpvAlTbEHHsLzsnPSFOW_X_BEHZFlRaJ_VvzpFVCuiMY6bQOvkpjqkDOor4cpS8ZeeIjOFZjoFi_DIDMr8zt852alJW5xXMlO06XsVwjb5eD1E4NIGRMPUPr95i8KSJI9G-Hh=w280-h194-no" alt="Polymorphism" />
</div>
<div style="float: left;">
<p>
Guitar extends Instrument<br />
Drum extends Instrument<br />
</p>

<pre class="prettyprint no-border">
<strong>Instrument i</strong> = new Guitar();//i is the variable of Intrument type
/*
JVM casts the reference returned by new Guitar() to the Instrument type
and then assigns it to the variable i.
*/
<strong>i.play()</strong>;//Guitar play
i = new Drum();
<strong>i.play()</strong>;//Drum play
</pre>

</div>
</div>

<p style="clear: both;">
<strong>i.play()</strong>;//Guitar play<br />
<strong>i.play()</strong>;//Drum play<br />
i.play() plays a guitar or drum.<br />
i.play() has polymorphism.<br />
</p>

<p>
JVM determines Whether the i.play() code plays the guitar or the drum at runtime, not compile time.
</p>

<p>
When you assign a subclass type reference to a superclass type variable, JVM casts this reference to the superclass type.
Not all variables and methods of an object can be accessed using this reference.
</p>

<p>
A reference cast to a superclass type can only access instance variables and instance methods inherited from a superclass and methods overridden by a subclass.
</p>

<p>
Add the following to the main() of the Test class.
</p>

<pre class="prettyprint">
Object king = new Manager("KING", "MANAGER", "1", "SALES");
System.out.println(king);
//king.setManageJob("ACCOUNTING");// You can not access the setManagerJob() method with an Object type reference.
//If you want to use the Manager object completely, you need to cast the reference to the Manager class type. 
Manager king1 = (Manager) king;
king1.setManageJob("ACCOUNTING");
<strong>System.out.println(king);</strong>
</pre>

<p>
In the last line, <strong>System.out.println(king)</strong>, the variable king has an Object class type's reference. The println() method internally calls the toString() of Object class. Since the instance created in the heap memory is the manager object, JVM calls the toString() that the manager class overrides. Regardless of the reference's data type, (2) and (3) are covered and can not be seen. Therefore, (1) is called.
</p>

<p>
<img src="https://lh3.googleusercontent.com/SLLiSuKJ0r4l_ZWFW719zO_J2VZ4ANQgkyvSqTPAN7RI3UAxc3H17Pht9TELt4PrdVMPQmdn2YRjJz9uOPeuHOp0ec5i-6RBLc2wKuKcq4jtaZVyUIzeMdFXe05RvN8ypw38t4hB_0hR-USDlO4hTFH1P5jasjMqg7fy0gEWLhGPir1aMwt7wS0YEgiuZLTdHT1y0W38lxlvACGayt2XYhvcIqP_wKfwJBoTkjNjO18h1F9O1sOYR6nKdcRxxMaBF0mKgbVu4srqN4Lr8smrlKhEc5Mq4uo_yzRb9PkiufGvNm9Ze9gLq8INw-7v01FVym77MfFjgt6bXAN7luiDtoQ7BWFUsBUgaayu-kU9DvNclDx1RNBn1cuRtLaCV0VQKwu0hhVIOa74YFCVVewyTeiGC26urQ6AABCWTiR3cuukEPB6iOPRb8walvd5NSqxX7HYSqqCtB6gY2aRtb6zrVetZwWPbR_p0sTMxjmZENl85KIrQu-VGfMoXhJVZ3KKDXA2Y4KDNyNdKQTbFQFGhPjGOsrO38LD713kF3JQhcw7fzjbXChpjCTd05vW5o3kxo8BiTY_FciU08m9tHze3XjbXx_4qkkcdaQbCPfSr5SbtWBoeDic=w1040-h768-no" alt="Manager Object"/>
</p>

<h3>Method Overloading</h3>

<p>
In Java, you can create multiple methods with the same name but different argument lists, called method overloading.
Method Overloading ensures JVM calls the method with argument lists that match the arguments passed.
Note that the return type has nothing to do with Method Overloading. You cannot create multiple methods with the same name and argument lists but only different return types.
</p>

<p>
In Java, naming is important. You should name a method so that its behavior is well understood. Method Overloading reduces this burden of naming.
</p>

<p>
Method Overloading also makes you think that the same method looks to run variously. Method Overloading is polymorphic.
In System.out.println() code, the println() method looks like it prints whatever the argument value is. Java API developers have defined several println methods with different arguments. The appropriate println method reacts according to the passed value.
</p>

<h3>final</h3>

<p>
The keyword final is related to inheritance.
</p>

<ul>
	<li>When used in a class declaration, it is not possible to create a subclass from this class.</li>
	<li>When used in a method declaration, a subclass cannot override this method.</li>
</ul>

<p>
There are also uses that are not related to inheritance. When creating constants, prefix the variable name with the final keyword.
</p>

<h2>Abstract Class</h2>

<p>
In the class declaration section, a class with the abstract keyword before the class keyword is called an abstract class.
</p>

<p>
You cannot instantiate an abstract class using the new keyword.
</p>

<p>
To understand an abstract class, you first need to know the meaning of the abstract method.
An abstract method does not have a method body.
To declare an abstract method, add the abstract keyword after the access modifier in the method declaration.
If a class has one abstract method, you must declare that class as an abstract class.
</p>

<p>
However, not all abstract classes are required to have abstract methods. If necessary, you can make an abstract class without an abstract method.
</p>

<p>
A class that inherits an abstract class must override the super class's abstract methods.
</p>

<p>
Let's create an abstract class by modifying the previous examples.
Create an AbstractEmployee class.
</p>

<h6 class="src">AbstractEmployee.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public abstract class AbstractEmployee {
  private String name;
	
  public AbstractEmployee() {}
	
  public AbstractEmployee(String name) {
    this.name = name;
  }
	
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
	
  <strong>//Abstract method
  public abstract void doWork();
  </strong>
}
</pre>

<p>
The ambiguity of abstract classes improves portability.
Of course, there must be a premise that the class design is good.
</p>

<p>
Change the Employee class to inherit the AbstractEmployee abstract class.<br />
The Employee class must implement the abstract method, doWork() of the AbstractEmployee class.
</p>

<h6 class="src">Employee.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class Employee extends AbstractEmployee {
  private String position;
  private String telephone;
	
  public Employee() {}
	
  public Employee(String name,String position, String telephone) {
    super(name);
    this.position = position;
    this.telephone = telephone;
  }
	
  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }

  public String toString() {
    StringBuffer sb = new StringBuffer();
    sb.append(this.getName());
    sb.append("|");
    sb.append(position);
    sb.append("|");
    sb.append(telephone);
		
    return sb.toString();
  }
	
  <strong>@Override
  public void doWork() {
    System.out.println("work");
  }</strong>	
}
</pre>

<p>
The Manager class does not change.
Change the first line of the Test's main method as below.
</p>

<pre class="prettyprint">
AbstractEmployee james = new Employee ("JAMES", "CLERK", "19");
</pre>

<h3>Interface</h3>

<p>
The Java interface has the interface keyword in place of the class keyword in the class declaration, and all methods of the class body are abstract methods. Since they are all abstract methods, you can omit the abstract keyword.
</p>

<p>
All fields declared in the interface body are static final.
</p>

<p>
As an abstract class, you cannot use an interface alone. You will use classes that implement an interface. A class that implements an interface is a class that implements all of the abstract methods of an interface. You can create a class that implements an interface using the 'implements' keyword in the class declaration sector. A comma-separated list of one or more interfaces can follow the 'implements' keyword, which can look like multiple inheritances.
</p>

<p>
The Java interface is the same as the user interface of the electronic product. Most TVs provide interfaces such as - volume + and - channel + at the bottom of the screen. The fact that electronics have adopted the same interface means that their usage is the same.
</p>

<p>
If the Java class is an electronic product, then the Java interface corresponds to the user interface of the electronic product. The implementation of the TV with the PDP, LCD, and LED in the CRT was different, but fortunately, the interface did not change. As a result, we had no trouble using the TV without having to look at the user manual after buying a new technology TV.
</p>

<p>
<strong>When should we use the interface?</strong><br />
If the focus is on what functions should be, you should consider using the interface.
</p>

<p>
Suppose you have a driver class that inherits the employee class and a transporter class that doesn't inherit the employee class but has many features like the driver class. You can create an interface with these functions.
</p>

<p>
However, we can not create a superclass with duplicate code in the transporter and driver classes. Because the driver cannot has two superclasses. There must be only one class after the 'extends' keyword in the class declaration. You can not list parent classes with (comma) after extends. But, you can create an interface with the duplicate functionality of the transporter and the driver.
</p>

<p>
Let's practice the contents so far in order.
First, create a driver class as follows.
Because a driver is an employee, the driver class inherits the employee class.
</p>

<h6 class="src">Driver.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class Driver <strong>extends Employee</strong> {
  private String carNo;
	
  public Driver() {}
	
  public Driver(String name, String position, String telephone, String carNo) {
    super(name, position, telephone);
    this.carNo = carNo;
  }

  public String getCarNo() {
    return carNo;
  }

  public void setCarNo(String carNo) {
    this.carNo = carNo;
  }

  public void drive() {
    System.out.println(this.getName() + " drives");
  }
	
  public void transport() {
    System.out.println(this.getName() + " transports");
  }
}
</pre>

<h6 class="src">Transporter.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class Transporter {
  private String carNo;
	
  public String getCarNo() {
    return carNo;
  }

  public void setCarNo(String carNo) {
    this.carNo = carNo;
  }

  public void drive() {
    System.out.println("drives");
  }
	
  public void transport() {
    System.out.println("transports");
  }
}
</pre>

<p>
The transporter and the driver class have the same features that drive() and transport(). You can create an interface with these same features.
</p>

<p>
Create a Drivable interface as follows.
</p>

<h6 class="src">Drivable.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public interface Drivable {
  public void drive();
	
  public void transport();
}
</pre>

<p>
Let's change the transporter and the driver classes to implement this interface.
</p>

<h6 class="src">Driver.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class Driver extends Employee implements Drivable {
  private String carNo;
	
  public Driver() {}
	
  public Driver(String name, String position, String telephone, String carNo) {
    super(name, position, telephone);
    this.carNo = carNo;
  }

  public String getCarNo() {
    return carNo;
  }

  public void setCarNo(String carNo) {
    this.carNo = carNo;
  }
	
  @Override
  public void drive() {
    System.out.println(this.getName() + " drives");
  }
	
  @Override
  public void transport() {
    System.out.println(this.getName() + " transports");
  }
}
</pre>

<h6 class="src">Transporter.java</h6>
<pre class="prettyprint">
package net.java_school.example;

public class Transporter implements Drivable {
  private String carNo;
	
  public String getCarNo() {
    return carNo;
  }

  public void setCarNo(String carNo) {
    this.carNo = carNo;
  }

  @Override
  public void drive() {
    System.out.println("drives");
  }
	
  @Override
  public void transport() {
    System.out.println("transports");
  }
}
</pre>

<p>
Add the following code snippet to the Test's main method.
</p>

<h6 class="src">Test.java</h6>
<pre class="prettyprint">
Drivable a = new Driver("Michael","CLERK","ext:8","015000");
System.out.println(a);
a.drive();
Drivable b = new Transporter();
// b.setCarNo("017000"); //error!
b.drive();
</pre>

<p>
As you can see in inheritance, You can assign a subclass type reference to a superclass type variable. Likewise, you can assign a class --implements the interface-- type reference to the interface type variables.
</p>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/static"/>">static keyword</a></li>
    <li>Prev : <a href="<c:url value="/java/package"/>">Package</a></li>
  </ul>
</div>
</article>