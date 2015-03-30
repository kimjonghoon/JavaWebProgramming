<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
첨부파일 삭제를 실행하는 페이지로 모델 2에서는 삭제해야 할 페이지이다.

-구현-
작성자인지를 검사하여 작성자가 아니면
response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자가 아닙니다"); return;
요청의 캐릭터셋을 UTF-8로 설정해야 한다.
요청에서 참조해야 하는 파라미터는
attachFileNo,articleNo,boardCd,curPage,searchWord 이다.
첨부파일를 삭제 후 상세보기를 돌아가기 위해선
searchWord를 URLEncoder의 encode 메소드로 UTF-8로 인코딩한다.
*/
response.sendRedirect("view.jsp?articleNo=5&boardCd=free&curPage=1&searchWord=무궁화꽃");
%>
