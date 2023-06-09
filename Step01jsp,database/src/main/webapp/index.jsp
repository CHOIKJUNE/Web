<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     //최상위 폴더 capth
      String cpath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="fortune">오늘의 운세보기</a></li>
			<li><a href="fortune.jsp">오늘의 운세보기2</a></li>
			<li><a href="friend/list">친구 목록보기</a></li>
			<li><a href="/Step01Servlet/friend/list">친구 목록보기</a></li>
			<li><a href="member/list">회원 목록보기</a></li>
			<li><a href="member/list.jsp">회원 목록보기2</a></li>
			<li><a href="${pageContext.request.contextPath}/guest/list.jsp">방명록 목록보기</a></li>
		</ul>
</div>
</body>
</html>