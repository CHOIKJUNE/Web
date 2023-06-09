<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 사용자가 입력한 내용들을 받아온다. + writer를 dto에 담기위해 session객체를 이용한다.
	String writer = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//2. dto에 해당 정보들을 담는다.
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	//3. dao로 DB에 접속하고 정보를 저장한 후 성공여부를 확인한다.
	CafeDao dao = CafeDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/insert.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess) {%>
		alert("글이 입력되었습니다.");
		location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		<%}else{%>
		alert("글 입력에 실패했습니다.");
		location.href="${pageContext.request.contextPath}/cafe/private/insertform.jsp";
		<%}%>
	</script>
</body>
</html>