<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2022.3.8</div>

<h1>게시판 댓글을 RESTful URL로 수정</h1>

<p>
다음은 댓글 요청 URL을 RESTful URL에 부합하도록 수정한 결과다.
</p>

<pre style="border: 2px dotted grey;padding: 0.3em;">
목록:		GET /comments/23	--23은 게시글 고유번호--
새글:		POST /comments/23
수정:		PUT /comments/23/38 	--38은 댓글 고유번호--
삭제:		DELETE /comments/23/38
</pre>

<p>
댓글을 에이잭스 프로그램으로 수정하려 한다.<br />
BbsController와 같은 패키지에 CommentsController를 생성한다.
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
@RestController는 @Controller와 @ResponseBody 어노테이션을 합쳐놓은 어노테이션이다.
클래스 선언에 @RestController 어노테이션을 쓰면, 메소드마다 @ResponseBody를 붙여 주지 않아도 된다.
</p>

<p>
@ResponseBody 어노테이션이 있는 메소드의 반환 값은 뷰를 해석하는 데 사용되는 게 아니라, 
메시지 변환기를 거쳐 변환된 후 응답 바디에 바로 쓰인다.
</p>

<p>
메시지 변환기가 메소드 반환 값을 JSON 객체로 바꾸게 하려면, pom.xml에 다음 의존성을 추가한다.
</p>

<pre class="prettyprint">
&lt;!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind --&gt;
&lt;dependency&gt;
  &lt;groupId&gt;com.fasterxml.jackson.core&lt;/groupId&gt;
  &lt;artifactId&gt;jackson-databind&lt;/artifactId&gt;
  &lt;version&gt;2.12.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>

<h3>목록</h3>

<p>
Comment 클래스에 editable 속성을 추가한다.
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
다음 메소드를 댓글 컨트롤러에 추가한다.
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
상세보기 페이지에서 GET /comments/23 요청을 서버로 전송하면,<br />
[{"commentNo":100,,,,},{"commentNo":99,,,,},{"commentNo":98,,,,}]와 같은 JSON 객체가 상세보기 페이지에 전달된다.
</p>

<p>
다음 자바스크립트 함수를 상세보기 페이지에 추가한다.  
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
          + '수정' + '&lt;/a&gt; | '
          + '&lt;a href="#" class="comment-delete-link" title="' + item.commentNo + '"&gt;' 
          + '삭제' + '&lt;/a&gt;'
          + '&lt;/span&gt;';
        }
        comments = comments
          + '&lt;div class="comment-memo"&gt;' + item.memo + '&lt;/div&gt;'
          + '&lt;form class="comment-form" action="/comments/' + ${articleNo } + '/' 
          + item.commentNo + '" method="put" style="display: none;"&gt;'
          + '&lt;div style="text-align: right;"&gt;'
          + '&lt;a href="#" class="comment-modify-submit-link"&gt;' 
          + '전송' 
          + '&lt;/a&gt; | &lt;a href="#" class="comment-modify-cancel-link"&gt;' 
          + '취소' + '&lt;/a&gt;'
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
페이지가 처음 로드될 때<br />
새 댓글을 작성했을 때<br />
댓글이 수정될 때<br />
댓글이 삭제될 때<br />
displayComments() 함수가 실행돼야 한다.
</p>

<h6 class="src">댓글 관련 HTML 코드</h6>
<pre class="prettyprint">
&lt;sf:form id="addCommentForm" action="/comments/${articleNo }" method="post" style="margin: 10px 0;"&gt;
    &lt;div id="addComment"&gt;
        &lt;textarea id="addComment-ta" name="memo" rows="7" cols="50"&gt;&lt;/textarea&gt;
    &lt;/div&gt;
    &lt;div style="text-align: right;"&gt;
        &lt;input type="submit" value="댓글쓰기" /&gt;
    &lt;/div&gt;
&lt;/sf:form&gt;
&lt;!--  comments begin --&gt;
&lt;div id="all-comments"&gt;
&lt;/div&gt;
&lt;!--  comments end --&gt;
</pre>

<p>
&lt;sf:form .. 처럼 쓰려면, 상세보기 페이지에 다음 선언이 필요하다.<br />
&lt;%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %&gt;
</p>

<p>
div id="all-comments" 콘텐츠에 댓글 목록이 갱신된다.
</p>

<p>
아래를 참고해 페이지가 로드될 때와 댓글이 생성됐을 때 댓글 목록이 갱신되게 한다.
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
displayComments() 함수가 실행될 때마다, div id="all-comments" 콘텐츠에 동적으로 댓글 HTML 코드가 생성된다.
동적으로 생성되는 댓글 HTML 코드에 수정과 삭제 링크가 있다면 DOM 프로그래밍으로 각각의 핸들러를 등록한다. 
--페이지가 로드된 후 동적으로 생성되는 HTML 코드에 DOM 프로그래밍은 $(document).on() 함수에서 해야 한다-- 
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
    var chk = confirm('정말로 삭제하겠습니까?');
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
댓글을 댓글을 삭제할 때 DELETE 요청이 아니라 모두 POST 요청인 것에 주목하라.
--이유는 뒤에 다룬다-- 
여기까지 작성하면 상세보기 페이지에서 댓글을 볼 수 있다.
</p>

<h3>새글</h3>

<p>
다음 새 댓글 쓰기 메소드를 댓글 컨트롤러에 추가한다.
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
이젠 상세보기 페이지에서 댓글을 추가할 수 있다.
</p>

<h3>수정</h3>

<p>
다음 수정 메소드를 댓글 컨트롤러에 추가한다.
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
이젠 댓글을 수정할 수 있다.
</p>

<h3>삭제</h3>

<p>
다음 삭제 메소드를 댓글 컨트롤러에 추가한다.
</p>

<pre class="prettyprint">
@DeleteMapping("{articleNo}/{commentNo}") 
public void deleteComment(@PathVariable Integer articleNo, @PathVariable Integer commentNo) {
  Comment comment = boardService.getComment(commentNo);
  boardService.removeComment(comment);
}
</pre>

<p>
스프링 MVC와 스프링 시큐리티를 사용하는 환경에서 DELETE 요청은 <b>Request method 'DELETE' not supported</b> 에러를 발생시킨다.
스프링 MVC만 사용하는 환경에선 DELETE 요청이 정상 동작한다.
</p>

<p>
스프링은 POST 요청을 PUT이나 DELETE 요청으로 매핑할 수 있다.
사실 이 기능은 브라우저가 PUT이나 DELETE 요청을 지원하지 않을 때 사용한다.
댓글 삭제를 위해 이 기능을 사용해 보자.
--이때 댓글 수정 역시 수정해야 한다--
</p>

<p>
web.xml에 다음 필터를 추가한다.
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
추가한 필터는 _method 파라미터 값을 판단하여, 요청을 핸들러에 전달한다.
</p>

<p>
상세보기 페이지에서 댓글 수정과 삭제 폼을 다음과 같이 수정한다.
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
댓글 수정과 관련된 ajax 전송 코드에서 type을 PUT 에서 POST로 수정한다.
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

<span id="related-articles">관련 글</span>
<ul id="related-articles-ul">
	<li><a href="/blog/2019/restful-url">RESTful URL</a></li>
	<li><a href="/blog/2019/comment-with-restful-url">게시판 댓글을 RESTful URL로 수정</a></li>
</ul>

</article>
