<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
      List<String> list = (List<String>)request.getAttribute("list");
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend.jsp</title>
</head>
<body>
<h3>친구 목록입니다.</h3>
<ul>
<li><%for(int i=0; i<list.size(); i++) {
	out.println(list.get(i));
}%>
</li>
</ul>
</body>
</html>