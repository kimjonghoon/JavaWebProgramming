<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
<div class="last-modified">Last Modified 2018.1.11</div>
	
<h1>좋아요 메뉴를 에이잭스로 구현</h1>

<p>
예제 소스 : <a href="https://github.com/kimjonghoon/ajax-like">https://github.com/kimjonghoon/ajax-like</a><br />
(<a href="${ctx}/blog/2017/ajax-fileupload">에이잭스 파일 업로드 예제</a>에 좋아요 기능 추가)
</p>


<h3>실행 방법</h3>

<p>
압축을 풀고 루트 디렉터리로 이동하여 mvn jetty:run 실행하고 http://localhost:8080을 방문한다.
</p>

<h3>시나리오</h3>

<p>
페이지가 처음 로드될 때 게시글 테이블과 좋아요 테이블을 조인해서 게시글 객체의 '좋아요' 속성을 세팅한다.<br />
'좋아요' 속성이 있으면 화면에서 게시글 제목 옆에 속이 찬 하트 모양이 보인다.<br /> 
사용자가 속이 찬 하트를 클릭하면 에이잭스로 좋아요 테이블에서 해당 데이터를 삭제한다.<br />
삭제가 성공하면 화면에서 속이 찬 하트는 속이 빈 하트로 바꾼다.<br />
속이 빈 하트는 사용자가 좋아하지 않음을 의미한다.<br /> 
사용자가 속이 빈 하트를 클릭하면 에이잭스로 좋아요 테이블에 데이터를 인서트한다.<br />
인서트가 성공하면 화면에서 속이 빈 하트를 속이 찬 하트로 바꾼다.
</p>

<h3>예제로 구현한 내용</h3>

<p>
간단하게 구현하기 위해 데이터베이스를 사용하지 않았다.<br />
대신 서블릿 컨텍스트에 좋아요 데이터를 담을 리스트를 생성했다.<br />
리스트를 생성할 때 '1111/'John Doe' 데이터를 만들어 담았다.<br /> 
따라서 처음 페이지가 로드될 때 속이 찬 하트가 보인다.
</p>

</article>
