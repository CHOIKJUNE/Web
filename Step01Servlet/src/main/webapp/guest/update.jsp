<%@page import="test.guest.dao.Guestdao"%>
<%@page import="test.guest.dto.Guestdto"%>
<%@ include file="updateform.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       request.setCharacterEncoding("utf-8");
     //비밀번호 확인 페이지에서 사용자가 입력한 비밀번호
       String pwd2 = request.getParameter("pwd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>
</head>
<body>
<%if(pwd2==pwd1) {%>
<%} else {%>
<p>비밀번호가 틀립니다. 다시 입력해주세요.</p>
<a href="updateform.jsp">되돌아가기</a><%}%>
</body>
</html>