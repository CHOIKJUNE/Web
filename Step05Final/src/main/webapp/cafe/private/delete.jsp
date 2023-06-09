<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. num을 받아온다.
	int num = Integer.valueOf(request.getParameter("num"));

	//2. num을 이용해 CafeDao의 delete()메서드로 카페회원 정보를 삭제한다.
	boolean isSuccess = CafeDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/delete.jsp</title>
</head>
<body>
<script>
	<%if(isSuccess) {%>
	alert("삭제되었습니다.");
	location.href="${pageContext.request.contextPath}/cafe/list.jsp";
	<%}else{%>
	alert("삭제되지 않았습니다.");
	location.href="${pageContext.request.contextPath}/cafe/list.jsp";
	<%}%>
</script>
</body>
</html>