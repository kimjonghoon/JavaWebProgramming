<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
새 게시글을 등록하는 페이지로 모델 2에서는 삭제해야 할 페이지다.
-구현-
로그인이 되어 있지 않으면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "Not Login"); return;
로그인 체크를 통과하면
boardCd, title, content, attachFile 파라미터를 가지고 새글을 인서트한다.

form의 enctype 속성이 "multipart/form-data"인 경우 request.getParameter();로 파라미터의 값을 얻을 수 없다.
이 경우 프로그래밍을 손쉽게 하기 위해 아파치 commons-fileupload 또는 cos와 같은 외부 라이브러리를 이용한다.

새글을 등록한 후 목록의 첫번째 페이지로 되돌아가야 한다.
*/
response.sendRedirect("list.jsp?boardCd=free&curPage=1");
%>