<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. num과 id를 이용해 회원정보를 수정한다.
	int num = Integer.valueOf(request.getParameter("num"));
	String writer = (String)session.getAttribute("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess  = CafeDao.getInstance().upDate(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		<%if(isSuccess) {%>
		alert("글이 수정되었습니다.");
		location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		<%}else{%>
		alert("글이 수정되지 않았습니다.");
		location.href="${pageContext.request.contextPath}/cafe/private/updateform?num=<%=dto.getNum()%>.jsp";
		<%}%>
	</script>
</body>
</html>