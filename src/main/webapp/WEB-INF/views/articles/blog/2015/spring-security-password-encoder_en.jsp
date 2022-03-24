<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2021.11.25</div>

<h1>Spring Security - Password Encoder</h1>

<h3>Add Password Encoder</h3>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
&lt;authentication-manager&gt;
  &lt;authentication-provider&gt;
    &lt;jdbc-user-service data-source-ref="dataSource"
      users-by-username-query="select 
          email as username,passwd as password,1 as enabled
        from member 
        where email = ?"
      authorities-by-username-query="select 
          email as username,authority
        from authorities 
        where email = ?" /&gt;
    <strong>&lt;password-encoder hash="bcrypt" /&gt;</strong>
  &lt;/authentication-provider&gt;
&lt;/authentication-manager&gt;
</pre>

<p>
The <strong>&lt;password-encoder hash="bcrypt" /&gt;</strong> tells Spring to use BCryptPasswordEncoder, which implements the PasswordEncoder interface and uses the bcrypt algorithm.
</p>

<p>
If you try to log in as johndoe@gmail.org/1111 after rerunning Tomcat, the login will fail because the unencrypted password, 1111, is stored in the member table.
</p>

<p>
Delete all data of authorities and member tables.
</p>

<pre class="shell-prompt">
sqlplus java/school

delete from authorities;

delete from member;

commit;
</pre>

<p>
Sign up again with email johndoe@gmail.org and password 1111.
</p>

<p>
Even if you try to log in again after signing up, you cannot log in because the system stores the password in plain text 1111 in the member table.
</p>

<p>
Modify the UserServiceImpl class to encrypt and store passwords.
</p>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">

<strong>import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;</strong>

@Service
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper userMapper;
  <strong>
  @Autowired
  private BCryptPasswordEncoder bcryptPasswordEncoder;</strong>

  @Override
  public void addUser(User user) {
    <strong>user.setPasswd(this.bcryptPasswordEncoder.encode(user.getPasswd()));</strong>
    userMapper.insert(user);
  }
	
  //..omit..	
}	
</pre>

<p>
Recompile it (mvn clean compile war: inplace) and rerun Tomcat. This time the application is not loaded. Tomcat log tells the reason for the loading failure is that Spring can not inject BCryptPasswordEncoder into UserServiceImpl. If you want Spring to reference the BCryptPasswordEncoder outside the Authentication Provider, you must modify the password encoder configuration below.
</p>

<h6 class="src">security.xml</h6>
<pre class="prettyprint">
<strong>&lt;beans:bean id="bcryptPasswordEncoAccess Deniedder" 
  class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" /&gt;
</strong>
&lt;authentication-manager&gt;
  &lt;authentication-provider&gt;
    &lt;jdbc-user-service data-source-ref="dataSource"
      users-by-username-query="select 
          email as username,passwd as password,1 as enabled
        from member 
        where email = ?"
      authorities-by-username-query="select 
          email as username,authority
        from authorities 
        where email = ?" /&gt;
    &lt;password-encoder <strong>ref="bcryptPasswordEncoder"</strong> /&gt;
  &lt;/authentication-provider&gt;
&lt;/authentication-manager&gt;
</pre>

<p>
Restart Tomcat and try to sign up. This time, SQLException occurs because of the length of the passwd column in the member table. Increase the passwd column of the member table as shown below.
</p>

<h6 class="src">Oracle</h6>
<pre class="prettyprint">
alter table member modify passwd varchar2(200);
</pre>

<h6 class="src">MySQL</h6>
<pre class="prettyprint">
alter table member modify passwd varchar(200) not null;
</pre>

<p>
Delete all data of authorities and member tables and sign up with email johndoe@gmail.org and password 1111.
</p>

<p>
If the login succeeds, update the following methods.
</p>

<h6 class="src">UsersController.java</h6>
<pre class="prettyprint">
@RequestMapping(value="/bye", method=RequestMethod.POST)
public String bye(String email, String passwd, HttpServletRequest req) 
    throws ServletException {
  User user = new User();
  user.setEmail(email);
  user.setPasswd(passwd);
  userService.bye(user);
	
  req.logout();

  return "redirect:/users/bye_confirm";
}
</pre>

<h6 class="src">UserServiceImpl.java</h6>
<pre class="prettyprint">
@Override
public int editAccount(User user) {
  String encodedPassword = this.getUser(user.getEmail()).getPasswd();   
  boolean check = this.bcryptPasswordEncoder.matches(user.getPasswd(), encodedPassword);

  if (check == false) {
    throw new AccessDeniedException("The current password is incorrect.");
  }
	
  user.setPasswd(encodedPassword);

  return userMapper.update(user);
}

@Override
public int changePasswd(String currentPasswd, String newPasswd, String email) {
  String encodedPassword = this.getUser(email).getPasswd();
  boolean check = this.bcryptPasswordEncoder.matches(currentPasswd, encodedPassword);

  if (check == false) {
    throw new AccessDeniedException("The current password is incorrect.");
  }
	
  newPasswd = this.bcryptPasswordEncoder.encode(newPasswd);
	
  return userMapper.updatePasswd(encodedPassword, newPasswd, email);
}

@Override
public void bye(User user) {
  String encodedPassword = this.getUser(user.getEmail()).getPasswd();
  boolean check = this.bcryptPasswordEncoder.matches(user.getPasswd(), encodedPassword);

  if (check == false) {
    throw new AccessDeniedException("The current password is incorrect.");
  }
	
  userMapper.deleteAuthority(user.getEmail());
  userMapper.delete(user);
}
</pre>

<p>
The login(String email, String passwd) method of UserService class is unnecessary, so remove it.
</p>

</article>
