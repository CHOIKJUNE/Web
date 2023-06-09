<%@page import="java.util.Iterator"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
		<li>
		<%for(int i=0; i<list.size(); i++) {
		out.println(list.get(i));
		}%>
		</li>
	</ul>
</body>
</html>