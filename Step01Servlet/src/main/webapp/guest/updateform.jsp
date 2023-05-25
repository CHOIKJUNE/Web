<%@page import="test.guest.dto.Guestdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
       request.setCharacterEncoding("utf-8");
       String pwd1 = request.getParameter("pwd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<body>
<p>비밀번호 확인</p>
	<form action="update.jsp" method="post">
		<label for="pwd">비밀번호</label> 
		<input type="password" name="pwd" id="pwd">
		<button type="submit">확인</button>
	</form>
</body>
</html>