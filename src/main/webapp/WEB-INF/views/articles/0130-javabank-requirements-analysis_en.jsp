<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<article>

<h1>Java bank - Requirements Analysis</h1>

<p>
The first step in developing a program is to share a clear understanding of what program to make. This step is called Requirements Analysis. Requirements Analysis involves writing a scenario.
</p>

<h2>Scenario</h2>

<p>
A bank registers an account.<br />
A bank searches for an account by account number.<br />
A bank can find an account by the owner's name.<br />
A bank can view a list of all accounts.<br />
An account consists of the owner's name, account number, and balance.<br />
An account has deposit and withdrawal functions and a balance check function. Whenever there is a change in balance, An account stores it in a transaction. A transaction consists of the transaction date, transaction time, deposit/withdrawal, transaction amount, and balance.
</p>

<h2>Class Diagram</h2>

<p>
You need to extract the classes, fields, and methods from a scenario.<br />
Nouns become classes or variables. Verbs become methods.
</p>

<p>
<img src="https://lh4.googleusercontent.com/-7_W2KsCUQSU/VX_qK5Qp9gI/AAAAAAAACLM/5EQN6xP4NXo/w814-h526-no/bank-classdiagram2.png" alt="JavaBank Class Diagram" />
</p>

<p>
Besides Class diagrams, there are Use case diagrams and Sequence diagrams. Depending on your project, you may need more of these, but a Class diagram is sufficient for the Java bank project.
</p>

<p>
The private is represented as -, public as +, and protected as # in a class diagram.
</p>

<p>
Class diagrams express the structure of classes and the relationships between objects.
</p>

<p>
A line connecting two classes indicates that the objects created from each class have a relationship.
</p>

<p>
A "has a" relationship is one in which an object has other objects as parts. A line with a diamond at one end indicates a "has a" relationship between objects. --The class adjacent to the diamond is the body, and the class opposite the diamond is the part--
</p>

<p>
There are two types of "has a" relationships: Composition and Aggregation.
</p>

<p>
The composition has a high degree of coupling. In a high degree of coupling, parts disappear as the body disappears. A class diagram expresses it with a diamond filled.
</p>

<p>
The aggregation has a low degree of coupling. In a low degree of coupling, the parts do not disappear even if the body disappears. A class diagram expresses it by a hollow diamond.
</p>

<p>
The number above the line indicates the maximum number of instances between related instances. 0 or * means zero or more.
</p>

<p>
An arrow is a direction in which an object calls the methods of another one.
</p>

<p>
Because a bank has multiple accounts, Bank and Account objects have a "has a" relationship.
</p>

<p>
In Java, you can implement Composition and Aggregation by declaring variables that store the part objects' references in the body object.
</p>
<div id="next-prev">
  <ul>
    <li>Next : <a href="<c:url value="/java/javabank-design"/>">Javabank - Application Design</a></li>
    <li>Prev : <a href="<c:url value="/java/exception"/>">Exception</a></li>
  </ul>
</div>
</article>