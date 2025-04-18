<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.functions" prefix="fn" %>
<article>
<div class="last-modified">Last Modified 2017.10.27</div>

<h1>국제화</h1>

<p>
예제 소스 : <a href="https://github.com/kimjonghoon/i18nOnSpringMVC">https://github.com/kimjonghoon/i18nOnSpringMVC</a><br />
루트 티렉터리에서 mvn jetty:run을 실행한 후, http://localhost:8080에 방문한다.
</p>

<h3>메시지 소스</h3>

<p>
메시지 소스(MessageSource)는 로케일을 보고 메시지를 결정하는 컴포넌트다.<br />
구현체로는 ResourceBundleMessageSource와 ReloadableResourceBundleMessageSource가 있다.
</p>

<p>
ResourceBundleMessageSource는 클래스 패스에 있는 리소스만 접근할 수 있다.<br />
ReloadableResourceBundleMessageSource는 리소스가 파일 시스템에 있으면 어디든 접근할 수 있다.
</p>

<p>
SpringBbs 프로젝트의 스프링 설정 파일에 다음을 추가한다.
</p>

<pre class="prettyprint">
&lt;bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource"&gt;
	&lt;property name="basename" value="WEB-INF/classes/messages" /&gt;
	&lt;property name="defaultEncoding" value="UTF-8" /&gt;
&lt;/bean&gt;
</pre>

<p>
&lt;property name="defaultEncoding" value="UTF-8" /&gt;을 없으면 한글이 깨진다.<br />
</p>

<h3>로케일 리졸버 설정 추가</h3>

<p>
로케일 리졸버(LocaleResolver)는 로케일을 결정하는 컴포넌트다.<br />
LocaleResolver 설정을 생략하면 디폴트로 AcceptHeaderLocaleResolver가 선택된다.<br />
AcceptHeaderLocaleResolver는 요청 헤더의 "accept-language"에 설정된 로케일을 사용한다.<br />
accept-language 헤더에는 운영체제의 로케일이 세팅된다.<br />
이경우 사용자가 로케일을 변경할 수 없다.<br />
사용자가 로케일을 변경할 수 있게 하려면 LocaleResolver로 SessionLocaleResolver 나 CookieLocaleResolver를 선택해야 하고 LocaleChangeInterceptor가 필요하다.
</p>

<p>
SpringBbs 프로젝트의 스프링 설정 파일에 SessionLocaleResolver 설정과
LocalChangeInterceptor 설정을 추가한다.
</p>

<h6 class="src">spring-bbs-servlet.xml</h6>
<pre class="prettyprint">
&lt;bean id="localeResolver" class="org.springframework.web.servlet.i18n.SessionLocaleResolver"&gt;
    &lt;property name="defaultLocale" value="en" /&gt;
&lt;/bean&gt;
&lt;mvc:interceptors&gt;
	&lt;bean id="localeChangeInterceptor" class="org.springframework.web.servlet.i18n.LocaleChangeInterceptor"&gt;
		&lt;property name="paramName" value="lang" /&gt;
	&lt;/bean&gt;
&lt;/mvc:interceptors&gt;
</pre>

<h3>JSP 수정</h3>

<p>
국제화를 적용할 JSP에 스프링 태그 라이브러리 지시어를 추가한다.
</p>

<pre class="prettyprint no-border">
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;
</pre>

<p>
list.jsp의 검색 버튼의 value 값에 국제화를 적용해 보자.<br />
list.jsp에 스프링 태그 라이브러리 지시어를 추가한 후,
검색 폼에서 서밋 버튼의 value 속성값을 다음과 같이 수정한다.<br />
</p>

<pre class="prettyprint no-border">
&lt;input type="submit" value="<strong>&lt;spring:message code="global.search" /&gt;</strong>" /&gt;
</pre>

<p>
src/java/resources에 내용이 없는
messages_en.properties와 messages_ko.properties 파일을 생성한다.<br />
아래 그림처럼 프로퍼티 파일 인코딩을 UTF-8로 변경한다.<br />
<img src="https://lh3.googleusercontent.com/-UpI9nf8Shxc/VYu4YgZVcsI/AAAAAAAACkw/MYjLW-BHlgA/s640/properties-context-menu-Properties.png" alt="메시지 리소스 파일를 선택하고 컨텍스트 메뉴를 오픈하고 Properties 선택한다. " /><br />
<img src="https://lh3.googleusercontent.com/-ODBHFIXeOZA/VYu4YqxT3iI/AAAAAAAACks/d_YeGThUX30/s889/properties-UTF-8.png" alt="메시지 리소스 파일의 Text file encoding을 UTF-8로 변경한다." /><br />
</p>

<p>
프로퍼티 파일을 다음과 같이 작성한다.
</p>

<h6 class="src">messages_en.properties</h6>
<pre class="prettyprint">
global.search = Search
</pre>

<h6 class="src">messages_ko.properties</h6>
<pre class="prettyprint">
global.search = 검색
</pre>

<p>
header.jsp에 로케일 변경 링크를 추가한다.<br />
</p>

<h6 class="src">header.jsp</h6>
<pre class="prettyprint">
&lt;%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%&gt;
&lt;%@ taglib uri="jakarta.tags.core" prefix="c" %&gt;
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;
&lt;%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %&gt;
&lt;h1 style="float: left;width: 150px;"&gt;&lt;a href="/"&gt;&lt;img src="/images/ci.gif" alt="java-school" /&gt;&lt;/a&gt;&lt;/h1&gt;
&lt;div id="memberMenu" style="float: right;position: relative;top: 7px;"&gt;
&lt;security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"&gt;
	&lt;security:authentication property="principal.username" var="check" /&gt;
&lt;/security:authorize&gt;
&lt;c:choose&gt;
	&lt;c:when test="${empty check}"&gt;
		&lt;input type="button" value="&lt;spring:message code="user.login" /&gt;" onclick="location.href='/users/login'" /&gt;
		&lt;input type="button" value="&lt;spring:message code="user.signup" /&gt;" onclick="location.href='/users/signUp'" /&gt;
	&lt;/c:when&gt;
	&lt;c:otherwise&gt;
		&lt;input type="button" value="&lt;spring:message code="user.logout" /&gt;" id="logout" /&gt;
		&lt;input type="button" value="&lt;spring:message code="user.modify.account" /&gt;" onclick="location.href='/users/editAccount'" /&gt;
	&lt;/c:otherwise&gt;
&lt;/c:choose&gt;
&lt;/div&gt;
<strong>
&lt;%
String url = "";
String english = "";
String korean = "";
String qs = request.getQueryString();
if (qs != null) {
	if (qs.indexOf("&amp;lang=") != -1) {
		qs = qs.substring(0, qs.indexOf("&amp;lang="));
	}
	if (qs.indexOf("lang=") != -1) {
		qs = qs.substring(0, qs.indexOf("lang="));
	}
	if (!qs.equals("")) {
	    String decodedQueryString = java.net.URLDecoder.decode(request.getQueryString(), "UTF-8");
	    url = "?" + decodedQueryString;
	    if (url.indexOf("&amp;lang=") != -1) {
	        url = url.substring(0, url.indexOf("&amp;lang="));
	    } 
	    english = url + "&amp;lang=en";
	    korean = url + "&amp;lang=ko";
	} else {
	    english = url + "?lang=en";
	    korean = url = "?lang=ko";
	}
} else {
    english = url + "?lang=en";
    korean = url = "?lang=ko";
}

pageContext.setAttribute("english", english);
pageContext.setAttribute("korean", korean);
%&gt;
&lt;div id="localeChangeMenu" style="float: right;position: relative;top: 7px;margin-right: 10px;"&gt;
    &lt;input type="button" value="English" onclick="location.href='${english }'" /&gt;
    &lt;input type="button" value="Korean" onclick="location.href='${korean }'" /&gt;
&lt;/div&gt;
</strong>
&lt;form id="logoutForm" action="/logout" method="post" style="display:none"&gt;
	&lt;input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /&gt;
&lt;/form&gt;
&lt;script type="text/javascript" src="/js/jquery-3.0.0.min.js"&gt;&lt;/script&gt;

&lt;script&gt;
$(document).ready(function() {
	$('#logout').click(function() {
		$('#logoutForm').submit();
		return false;
  	});
});
&lt;/script&gt;
</pre>


<h2>데이터베이스를 이용하는 국제화 (게시판 이름)</h2>

<p>
게시판 코드(chat, qna, data)를 이용해서 리소스에 다음과 같이 추가할 수 있다.<br />
</p>

<pre class="prettyprint">
bbs.board.chat = 자유 게시판
bbs.board.qna = 묻고 답하기
bbs.board.data = 자료실
</pre>

<pre class="prettyprint">
bbs.board.chat = Chat
bbs.board.qna = QnA
bbs.board.data = Data
</pre>

<p>
하지만 이경우 게시판을 추가할 때 리소스 메시지를 추가해주어야 한다.<br />
프로그램적으로 리소스 메시지를 추가할 수 없고, 또 그래서도 안 된다.<br />
리소스가 적용되려면 매번 컴파일과 서버 재시작이 필요하다.<br />
<br />
로케일마다 게시판 이름 컬럼을 두는 방법도 있다.<br /> 
현재 board 테이블의 구조는 게시판 이름을 한글로만 저장하고 있다.<br />
</p>

<pre class="shell-prompt">
$ sqlplus java/school
SQL&gt; desc board
Name	    Null?    Type
 ---------------------------------------------
 BOARDCD	   NOT NULL VARCHAR2(20)
 BOARDNM	   NOT NULL VARCHAR2(40)
 
SQL&gt; select * from board;
BOARDCD   BOARDNM
--------  -----------
chat      자유게시판
qna       묻고 답하기
data      자료실
</pre>

<p>
기존 boardnm 컬럼은 영어 게시판 이름을, 
새로 추가할 boardnm_ko는 한글 게시판 이름을 저장하기로 하자. 
</p>

<pre class="shell-prompt">
SQL&gt; alter table board add (boardnm_ko varchar2(40));

SQL&gt; update board set boardnm_ko = boardnm;

SQL&gt; update board set boardnm = 'Chat' where boardcd = 'chat';
SQL&gt; update board set boardnm = 'QnA' where boardcd = 'qna';
SQL&gt; update board set boardnm = 'Data' where boardcd = 'data';

SQL&gt; select * from board;
BOARDCD   BOARDNM   BOARDNM_KO
-----------------------------------
chat      Chat      자유 게시판
qna       QnA       묻고 답하기
data      Data      자료실
</pre>

<h6 class="src">BoardMapper.xml</h6>
<pre class="prettyprint">
&lt;select id="selectOneBoard" parameterType="string" resultType="Board"&gt;
	SELECT * FROM board WHERE boardcd = ${fn:escapeXml("#{boardCd}")}
&lt;/select&gt;
&lt;select id="selectAllBoards" resultType="Board"&gt;
	SELECT * FROM board
&lt;/select&gt;
</pre>

<h6 class="src">BoardMapper.java</h6>
<pre class="prettyprint">
//게시판
public Board selectOneBoard(String boardCd);
//게시판 목록
public List&lt;Board&gt; selectAllBoards();
</pre>

<h6 class="src">BoardService.java</h6>
<pre class="prettyprint">
//게시판
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public Board getBoard(String boardCd);
//게시판 목록
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
public List&lt;Board&gt; getAllBoards();
</pre>


<h6 class="src">BoardServiceImpl.java</h6>
<pre class="prettyprint">
//게시판
@Override
public Board getBoard(String boardCd) {
	return boardMapper.selectOneBoard(boardCd);
}
//게시판 목록
@Override
public List&lt;Board&gt; getAllBoards() {
	return boardMapper.selectAllBoards();
}
</pre>

<h6 class="src">bbs-sub.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="jakarta.tags.core" prefix="c" %&gt;
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;</strong>

&lt;!-- 중간 생략 --&gt;

&lt;c:forEach var="board" items="${boards }" varStatus="status"&gt;
	&lt;li&gt;&lt;a href="/bbs/list?boardCd=${board.boardCd }&amp;page=1"&gt;${board.boardNm }&lt;/a&gt;&lt;/li&gt;
&lt;/c:forEach&gt;

&lt;!-- 중간 생략 --&gt;
</pre>

<h6 class="src">bbs-sub_ko.jsp</h6>
<pre class="prettyprint">
<strong>&lt;%@ taglib uri="jakarta.tags.core" prefix="c" %&gt;
&lt;%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%&gt;</strong>

&lt;!-- 중간 생략 --&gt;

&lt;c:forEach var="board" items="${boards }" varStatus="status"&gt;
	&lt;li&gt;&lt;a href="/bbs/list?boardCd=${board.boardCd }&amp;page=1"&gt;${board.boardNm_ko }&lt;/a&gt;&lt;/li&gt;
&lt;/c:forEach&gt;

&lt;!-- 중간 생략 --&gt;
</pre>

<h6 class="src">BbsController.java</h6>
<pre class="prettyprint">
private String getBoardName(String boardCd, String lang) {
	Board board = boardService.getBoard(boardCd);
	
	switch (lang) {
	case "en":
		return board.getBoardNm();
	case "ko":
		return board.getBoardNm_ko();
	default:
		return board.getBoardNm();
	}
}
</pre>

<p>
BbsController에서 게시판 이름을 뷰에 전달해야 하는 메소드는 java.util.Locale locale 파라미터를 추가한 후 다음을 참조하여 수정한다.
</p>

<pre class="prettyprint">
String lang = locale.getLanguage();
String boardName = this.getBoardName(boardCd, lang);
</pre>

<h2>빈 검증 국제화</h2>

<p>
다음은 현재 웹 사이트의 상태다.
로케일을 변경하더라도 빈 검증 에러 메시지는 로케일에 따라 변경되지 않는다.
<img src="https://lh3.googleusercontent.com/Su6XiYQXugfBuT8GYOq0vIujYVFRP86dh3-f_MIPQfSSgK46TVgqMGyy_Hku3HPjBkwBws3o_7c0N32koMA0_N6CC0O1--eiaknyyIro5Vvk2FJJ9XsNRbNOsYtW7z5bAbQz_qKUB-owYiqX3xY1zSC44nm0y7ePQQ6PA6b3TSuA3ipf6jfj0vAKKXx8AqL9hA-uSjh3ufjB-XZshiffMFv-0Pl_mR4Y4bjhRoWEjFpYleH2ZUd5R4KoVauUEBomvrHvCddXIWN9ZtaaWp2J1YJMPAykZUBGRVhMh10Glj-lW5fjDRcqwwJyTn7bjFsA-lQuu1C0dHkJRhcGJh6ZdkDiEpiTc7yjhxYXN5ROJ8upQRtV7oR5bWMuSOZ3P2_2AjlL65ZlK7VcY8fd64jnzsvIHKXIP2W0DKckQdiGBU5ZgJ-AeiE9KbDglduTKgX7RAGqvvNvMA1uLzaCUhTMWqUrsbX1_QSIuDUfiO65_ivmTjVViMhVY0Ao1EmXWHKxnwUisJznwOzAyXOSE8AU68pDeNqoajTRoKkFaAeVjraYDeBsusaDDWrlF9TWVmXnCqpvVZyM6CtpCcOtSQurN2izwDnikIKOmBl66swDfu3_ZLIWe-M-=w355-h308-no" alt="" style="display: block" />
<img src="https://lh3.googleusercontent.com/j4BzxsT__MRF-HG8lkHLHEka5EniImnowRUlDzFp4zpXFB8K_7xP3B9VVeSoy_NCh5juvlKY6FWOipKprszpcwPh3POYmbTAWcb9PhaRSz2JcUsuW3Ny3vR7TvQmZUu-n10bEpdGcm-rdz8NiTEFthnLFrINBNoYYpQeQrtOVL3Cp3Y8frgF7iVxKWTEBP5c7zPoI9An3LvWjkgxZakJOfSnnF8w_sighWN1w3ohkTwg24YuBzDuWwUQlFQUQFDSmVLkqdMAgHdbKocUuZPhNteFH8EJyPt56C9ZQuDH4K8OUzO0PQWtEwDYFRKm9dhsgDw2iM4I-kQ31T7r-uc4fuI8wstNh-mbTELkfUTclnndqFf1jdGB_BkGSa6oagwIz5k1Y1za28bHQqS0hyfKtFCVryuvGRZmEPK2l0bAtCOE52ASFESsOESH1975p5WJq3KjIUqx_TcukF3M9CDg2rsmU0BcDQMy2qqSXMkhon2Z7lbio3VAVSqfakI9KvTqx7lCdxZ6Tlp67tzhicD07EVdAXUJahZeN9cq45uIa958UhCrVoaXkd4QLZ67fc5O9djsssqX7TYpNXOKwcUkgWjQ7Pz5_doY26YBhP6M0kF93Wyy7lKV=w512-h318-no" alt="" style="display: block" />
</p>

<p>
스프링 설정 파일에 다음 설정을 추가한다.
</p>

<pre class="prettyprint">
&lt;bean id="validator" class="org.springframework.validation.beanvalidation.LocalValidatorFactoryBean"&gt;
	&lt;property name="validationMessageSource" ref="messageSource" /&gt;
&lt;/bean&gt;
</pre>

<p>
기존 설정에 아래 강조된 설정을 추가한다.
</p>

<pre class="prettyprint">
&lt;mvc:annotation-driven <strong>validator="validator"</strong> /&gt;
</pre>

<p>
messages_en.properties에 다음을 추가한다.
</p>

<pre class="prettyprint">
fullname.validation.error = The full name must exceed two characters.
mobile.validation.error = It is not a mobile phone number.
passwd.validation.error = Your password must be at least 4 characters long.
</pre>

<p>
messages_ko.properties에 다음을 추가한다.
</p>

<pre class="prettyprint">
fullname.validation.error = 이름은 2자 이상이어야 합니다.
mobile.validation.error = 모바일 폰 형식이 아닙니다.
passwd.validation.error = 패스워드는 4자 이상이어야 합니다.
</pre>

<p>
User.java에서 강조된 부분을 수정한다.
</p>

<pre class="prettyprint">
@Size(min=4, message="<strong>{passwd.validation.error}</strong>")
private String passwd;
@Size(min=2, message="<strong>{fullname.validation.error}</strong>")
private String name;
@Size(min=6, message="<strong>{mobile.validation.error}</strong>")
private String mobile;
</pre>

<p>
서버를 재시작한 후 내 정보 수정을 다시 방문한다.<br />
로케일을 영어권으로 선택한 후 입력란을 모두 삭제한 다음 전송 버튼을 누른다.<br />
<img src="https://lh3.googleusercontent.com/DdTlTjTB213X_CpCWZ2zlSJb_0cXB3urkBCnPHf9MhpHV0qKCy891r_mgEZBkaL235DqDfBEjkUPc46xRNwJIKRbiwp9LVG36slSzpNUqu2SESz1lkW0q-jXSwEtqNDLNSCoXqmpkbLssK4qqO9gZlvUWPSIj65CQ4dv662h8T46XlWs6HivdZ1EWIPu9oeaqakiR6RbO6Am4-mSYSwVU7iwGyVc9YVp3a1kf3FfIKE4WnRez7erOCY7_FIyvO3GabsEXGNNxkEfeutzYHcLVUGwJ6VOylpiyVKK_TQret79qvrVITJm70WvJ4P0mQ8oSAVkHMzF2peWThUxHQeIM4yDRDl9jNF-pKdsYLBFo10p4AV2JU6l9flObcUO9O1TUQYVJ6lyEtG6wkFl37FS3106t-a_Rw4YEvTd8emp6sEoFizu14oY0CFScqi0nv3UiSlfBXXZXHpS3_m1p-EVPnbr2s7nftw6GeZWPIS-uxmeqMSYzilv1KYLEvABOXwxx3tDuLqH10j_-SHbKXx_Pv-7YJPvX15A0CzJib-262Wg_ksVNxl32jh9ga79gWXpCJvLqo9PU-FIJ2rn6KWGWD9hpAXNCgBZqyu7WRS91A=w514-h306-no" style="display: block;" />
</p>

<h2>내용인 긴 본문 국제화</h2>

<p>
내용이 긴 본문을 국제화하는 데는 정답이 없다.<br />
다만 프로퍼티 파일에 본문을 욱여넣지는 않는다.<br />
필자가 선택한 방법은 아파치 타일즈를 이용하는 것이다.<br />
아파치 타일즈의 정의 파일을 로케일마다 따로 만들면 된다.<br />
영어권 로게일의 타일즈 정의 파일 이름이 template.xml이라면 한글용은 template_ko.xml을 만들면 국제화가 적용된다. 
</p>

</article>
