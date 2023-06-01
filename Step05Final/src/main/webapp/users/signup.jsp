<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  // 1. 폼 전송되는 회원가입 정보를 읽어와서
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
  String email = request.getParameter("email");
  // 2. Dto에 담아서
  UsersDto dto = new UsersDto();
  dto.setId(id);
  dto.setPwd(pwd);
  dto.setEmail(email);
  // 3. Dao를 이용해서 DB에 저장하고
  UsersDao dao = UsersDao.getinstance();
  boolean isSuccess = dao.insert(dto);
  // 4. 응답한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/signup.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
	<h1>알림</h1>
	<%if(isSuccess) {%>
	<p>
		<strong><%=id%></strong>님 가입되었습니다.
		<a href="${pageContext.request.contextPath}/index.jsp">목록보기</a>
	</p>
	<%} else{%>
	<p>
		가입에 실패했습니다.
		<a href="signup_form.jsp">다시 가입하러 가기</a>
	</p>
		<%}%>
	</div>
</body>
</html>