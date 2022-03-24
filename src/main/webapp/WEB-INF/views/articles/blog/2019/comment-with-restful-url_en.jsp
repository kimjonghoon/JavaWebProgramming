<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.3.8</div>

<h1>Comment with RESTful URL</h1>

<p>
The following is converting comment request URLs to RESTful URLs.
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
List:		GET /comments/23	--23 is article unique number--
New:		POST /comments/23
Modify:		PUT /comments/23/38 	--38 is a comment unique number--
Delete:		DELETE /comments/23/38
</pre>

<p>
Let's modify the comment part of the board program to the Ajax program. Create CommentsController with the same package as BbsController.
</p>

<pre class="prettyprint">
<b>@RestController</b>
@RequestMapping("<b>comments</b>")
public class CommentsController {

  @Autowired
  private BoardService boardService;
  
  //TODO

}	
</pre>

<p>
@RestController is an annotation that combines the @Controller and @ResponseBody annotations. If you declare the @RestController annotation in the class declaration, you do not have to add @ResponseBody for each method.
</p>

<p>
The return value of a method with the @ResponseBody annotation is not used to resolve a view but is converted via the message converter and written directly to the response body. To have the message converter the method return value to a JSON object, add the following dependency to pom.xml:
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
  &lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;
  &lt;version&gt;2.12.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<p>
Add a field named editable to the Comment class.
</p>

<p>
The editable field will decide whether to show the edit and delete links to the user.
</p>

<pre class="prettyprint">
package net.java_school.board;

import java.util.Date;

public class Comment {

  private int commentNo;
  private int articleNo;
  private String email;
  private String name;
  private String memo;
  private Date regdate;
  <b>private boolean editable;</b>

  public int getCommentNo() {
    return commentNo;
  }

  public void setCommentNo(int commentNo) {
    this.commentNo = commentNo;
  }

  public int getArticleNo() {
    return articleNo;
  }

  public void setArticleNo(int articleNo) {
    this.articleNo = articleNo;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
  <b>
  public boolean isEditable() {
    return editable;
  }

  public void setEditable(boolean editable) {
    this.editable = editable;
  }
  </b>
}
</pre>

<p>
Add the following method to the CommentsController.
</p>

<pre class="prettyprint">
@GetMapping("{articleNo}")
public List&lt;Comment&gt; getAllComments(@PathVariable Integer articleNo, 
  Principal principal, Authentication authentication) {

  List&lt;Comment&gt; comments = boardService.getCommentList(articleNo);

  Collection&lt;? extends GrantedAuthority&gt; authorities = authentication.getAuthorities();

  boolean isAdmin = false;

  for (GrantedAuthority authority : authorities) {
    String role = authority.getAuthority();
    if (role.equals("ROLE_ADMIN")) {
      isAdmin = true;
      break;
    }
  }

  if (isAdmin) {
    for (Comment comment : comments) {
      comment.setEditable(true);
      comment.setEmail(null);
    }
  } else {
    String username = principal.getName();
    for (Comment comment : comments) {
      if (comment.getEmail().equals(username)) {
        comment.setEditable(true);
      }
    }
    for (Comment comment : comments) {
      comment.setEmail(null);
    }
  }

  return comments;
}
</pre>

<p>
Let's implement so that when the detail view page sends a GET /comments/23 request to the server, the same detail view page will receive a JSON object such as [{"commentNo":100,,,,},{"commentNo":99,,,,},{ "commentNo":98,,,,}] from the server.
</p>

<p>
Add the following JavaScript function to the detailed view page.
</p>

<pre class="prettyprint">
function displayComments() {
  var url = '/comments/' + ${articleNo};
  $.getJSON(url, function (data) {
    $('#all-comments').empty();
    $.each(data, function (i, item) {
      var creation = new Date(item.regdate);
      var comments = '&lt;div class="comments"&gt;'
        + '&lt;span class="writer"&gt;' + item.name + '&lt;/span&gt;'
        + '&lt;span class="date"&gt;' + creation.toLocaleString() + '&lt;/span&gt;';
      if (item.editable === true) {
        comments = comments
          + '&lt;span class="modify-del"&gt;'
          + '&lt;a href="#" class="comment-modify-link"&gt;' 
          + 'Modify' + '&lt;/a&gt; | '
          + '&lt;a href="#" class="comment-delete-link" title="' + item.commentNo + '"&gt;' 
          + 'Del' + '&lt;/a&gt;'
          + '&lt;/span&gt;';
        }
        comments = comments
          + '&lt;div class="comment-memo"&gt;' + item.memo + '&lt;/div&gt;'
          + '&lt;form class="comment-form" action="/comments/' + ${articleNo } + '/' 
          + item.commentNo + '" method="put" style="display: none;"&gt;'
          + '&lt;div style="text-align: right;"&gt;'
          + '&lt;a href="#" class="comment-modify-submit-link"&gt;' 
          + 'Sumbit' 
          + '&lt;/a&gt; | &lt;a href="#" class="comment-modify-cancel-link"&gt;' 
          + 'Cancel' + '&lt;/a&gt;'
          + '&lt;/div&gt;'
          + '&lt;div&gt;'
          + '&lt;textarea class="comment-textarea" name="memo" rows="7" cols="50"&gt;' 
          + item.memo + '&lt;/textarea&gt;'
          + '&lt;/div&gt;'
          + '&lt;/form&gt;'
          + '&lt;/div&gt;';
        $('#all-comments').append(comments);
        console.log(item);
    });
  });
}
</pre>

<p>
The displayComments() function should run in the following situations:
</p>

<ul>
	<li>When the page loads</li>
	<li>When you create a new comment</li>
	<li>When you modify the comment</li>
	<li>When you delete the comment</li>
</ul>

<p>
Modify HTML code for comments like below.
</p>

<h6 class="src">HTML code for comments</h6>
<pre class="prettyprint">
&lt;sf:form id="addCommentForm" action="/comments/${articleNo }" method="post" style="margin: 10px 0;"&gt;
  &lt;div id="addComment"&gt;
    &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
  &lt;/div&gt;
  &lt;div style="text-align: right;"&gt;
    &lt;input type="submit" value="Write Comments" /&gt;
  &lt;/div&gt;
&lt;/sf:form&gt;
&lt;!--  comments begin --&gt;
&lt;div id="all-comments"&gt;
&lt;/div&gt;
&lt;!--  comments end --&gt;
</pre>

<p>
To write as above, you need to add the following to the detailed view page:
</p>

<pre class="prettyprint no-border">
&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;.
</pre>

<p>
All comments displays in &lt;div id="all-comments"&gt;. See below to update the list of comments when the page loads or users create comments.
</p>

<pre class="prettyprint">
$(document).ready(function () {
  <b>displayComments();</b>
  
  //..omit..    
  
  $("#addCommentForm").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var memo = $('#addComment-ta').val();
    memo = $.trim(memo);
    if (memo.length === 0) {
      $('#addComment-ta').val('');
      return false;
    }
    var dataToBeSent = $form.serialize();
    var url = $form.attr("action");
    var posting = $.post(url, dataToBeSent);
    posting.done(function () {
      <b>displayComments();</b>
      $('#addComment-ta').val('');
    });
  });    
});
</pre>

<p>
Each time the displayComments() function is executed, comment HTML code is dynamically generated for the content of div id="all-comments". A comment HTML code may have links for editing and deleting the comment. Register each handler using JavaScript DOM programming for these links. If you need to do DOM programming in dynamically generated HTML code after the page has loaded, use the $(document).on() function.
</p>

<pre class="prettyprint">
$(document).on('click', '#all-comments', function (e) {
  if ($(e.target).is('.comment-modify-link')) {
    e.preventDefault();
    var $form = $(e.target).parent().parent().find('.comment-form');
    var $div = $(e.target).parent().parent().find('.comment-memo');

    if ($form.is(':hidden') === true) {
      $form.show();
      $div.hide();
    } else {
      $form.hide();
      $div.show();
    }
  } else if ($(e.target).is('.comment-modify-cancel-link')) {
    e.preventDefault();
    var $form = $(e.target).parent().parent().parent().find('.comment-form');
    var $div = $(e.target).parent().parent().parent().find('.comment-memo');

    if ($form.is(':hidden') === true) {
      $form.show();
      $div.hide();
    } else {
      $form.hide();
      $div.show();
    }
  } else if ($(e.target).is('.comment-modify-submit-link')) {
    e.preventDefault();
    var $form = $(e.target).parent().parent().parent().find('.comment-form');
    var $textarea = $(e.target).parent().parent().find('.comment-textarea');
    var memo = $textarea.val();
    $('#modifyCommentForm input[name*=memo]').val(memo);
    var dataToBeSent = $('#modifyCommentForm').serialize();
    var url = $form.attr("action");
    $.ajax({
      url: url,
      type: 'PUT',
      data: dataToBeSent,
      success: function () {
        displayComments();
      },
      error: function () {
        alert('error!');
      }
    });
  } else if ($(e.target).is('.comment-delete-link')) {
    e.preventDefault();
    var chk = confirm('Are you sure you want to delete this item?');
    if (chk === false) {
      return;
    }
    var $commentNo = $(e.target).attr('title');
    var url = $('#deleteCommentForm').attr('action');
    url += $commentNo;
    var dataToBeSent = $('#deleteCommentForm').serialize();
    $.ajax({
      url: url,
      type: '<b>POST</b>',
      data: dataToBeSent,
      success: function () {
        displayComments();
      },
      error:function(request,status,error){
        console.log("code:"
          + request.status
          + "\n" + "message:" 
          + request.responseText 
          + "\n" + "error:"
          + error);
      }
    });
  }
});
</pre>

<p>
Note that it is a POST request when deleting comments, not a DELETE request. The reason is covered later.
</p>

<p>
Add the following method for adding comments to the CommentsController:
</p>

<pre class="prettyprint">
@PostMapping("{articleNo}")
public void addComment(@PathVariable Integer articleNo, 
      String memo, Principal principal) {
    
  Comment comment = new Comment();
  comment.setMemo(memo);
  comment.setArticleNo(articleNo);
  comment.setEmail(principal.getName());

  boardService.addComment(comment);
}
</pre>

<p>
Now you can add a comment on the detailed view page.
</p>

<p>
Add the following method to the CommentsController:
</p>

<pre class="prettyprint">
@PutMapping("{articleNo}/{commentNo}")
public void updateComment(@PathVariable Integer articleNo, 
      @PathVariable Integer commentNo, String memo, Principal principal) {
      
  Comment comment = boardService.getComment(commentNo);
  comment.setMemo(memo);
  boardService.modifyComment(comment);
}
</pre>

<p>
Now you can modify a comment on the detailed view page.
</p>

<p>
Add the following method to the CommentsController:
</p>

<pre class="prettyprint">
@DeleteMapping("{articleNo}/{commentNo}")
public void deleteComment(@PathVariable Integer articleNo, @PathVariable Integer commentNo) {
  Comment comment = boardService.getComment(commentNo);
  boardService.removeComment(comment);
}
</pre>

<p>
In an environment using Spring MVC and Spring Security, Ajax DELETE request occurs a <b>"Request method 'DELETE' not supported"</b> error.
Ajax DELETE requests work fine in an environment using Spring MVC only.
</p>

<p>
Spring can map POST requests to DELETE requests. This feature is for when the browser doesn't support PUT or DELETE requests, but let's use it for deleting comments. --At this time, you should also modify the code for editing comments--
</p>

<p>
Add the following filter to web.xml:
</p>

<pre class="prettyprint">
&lt;filter&gt;
  &lt;filter-name&gt;httpMethodFilter&lt;/filter-name&gt;
  &lt;filter-class&gt;org.springframework.web.filter.HiddenHttpMethodFilter&lt;/filter-class&gt;
&lt;/filter&gt;

&lt;filter-mapping&gt;
  &lt;filter-name&gt;httpMethodFilter&lt;/filter-name&gt;
  &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;
</pre>

<p>
The added filter determines the HTTP method by the value of the _method parameter and passes that to the handler.
</p>

<p>
Modify the modify comment form and delete comment form in the detailed view page as follows.
</p>

<pre class="prettyprint">
&lt;sf:form id="modifyCommentForm" method="<b>put</b>"&gt;
  &lt;input type="hidden" name="memo" /&gt;
&lt;/sf:form&gt;
</pre>

<pre class="prettyprint">
&lt;sf:form id="deleteCommentForm" action="/comments/${articleNo }/" method="<b>delete</b>"&gt;
&lt;/sf:form&gt;
</pre>

<p>
Change the type from PUT to POST in the ajax transmission code related to comment editing.
</p>

<pre class="prettyprint">
  } else if ($(e.target).is('.comment-modify-submit-link')) {
    e.preventDefault();
    var $form = $(e.target).parent().parent().parent().find('.comment-form');
    var $textarea = $(e.target).parent().parent().find('.comment-textarea');
    var memo = $textarea.val();
    $('#modifyCommentForm input[name*=memo]').val(memo);
    var dataToBeSent = $('#modifyCommentForm').serialize();
    var url = $form.attr("action");
    $.ajax({
      url: url,
      type: '<b>POST</b>',
      data: dataToBeSent,
      success: function () {
        displayComments();
      },
      error: function () {
        alert('error!');
      }
    });
  } else if ($(e.target).is('.comment-delete-link')) {
</pre>

<span id="related-articles">Related Articles</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/restful-url">RESTful URL</a></li>
	<li><a href="/blog/2019/comment-with-restful-url">Comments with RESTful URL</a></li>
</ul>

</article>
