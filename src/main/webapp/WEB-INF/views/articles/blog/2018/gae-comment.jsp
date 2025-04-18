<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2018.3.30</div>
	
<h1>오브젝티파이로 댓글 구현</h1>

<p>
최종 소스 : <a href="https://github.com/kimjonghoon/gae-comment">https://github.com/kimjonghoon/gae-comment</a><br />
(<a href="${ctx}/blog/2018/gaefile">구글 클라우드 Blobstore</a> 예제에서 댓글을 데이터스토어에 저장하도록 수정함)
</p>


<h3>실행 방법</h3>

<p>
Google Cloud SDK 설치가 필요하다.<br />
<a href="https://cloud.google.com/sdk/downloads">https://cloud.google.com/sdk/downloads</a>를 방문한다.<br />
'대화형 설치 프로그램'의 지시를 따라 설치한다.<br />
(대화형 설치 프로그램으로 설치해야 최신 버전이 설치된다)<br />
설치 후 명령 프롬프트를 새로 열고 gcloud components install app-engine-java를 실행해 자바 컴포넌트를 설치한다.<br />
</p>

<p>
내려받은 예제를 풀고 루트 디렉터리로 이동하여 mvn appengine:run 실행한다.<br />
(이때 자바는 자바 8이어야 한다)
</p>
<p>
명령 프롬프트에 Dev App Server is now running 메시지가 보이면, 웹 브라우저로 http://localhost:8080을 방문한다.
</p>

</article>
