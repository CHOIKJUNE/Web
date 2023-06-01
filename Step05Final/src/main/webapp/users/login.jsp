<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 1. 폼전송되는 id, pwd를 읽어와서
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   // 2. UsersDto에 담아서
   UsersDto dto = new UsersDto();
   dto.setId(id);
   dto.setPwd(pwd);
   // 3. UsersDao에 전달해서 유효한 정보인지 확인하고
   boolean isValid = UsersDao.getinstance().isValid(dto);
   
   /*
      4. 유효한 정보이면 로그인 처리를 하고 응답한다.
         유효한 정보가 아니면 아이디 혹은 비밀번호가 틀려요 라고 응답한다.
         
         [로그인 처리]
          session scope에 "id"라는 키값으로 로그인된 아이디를 저장하면 된다.
          여기서 session scope란 HttpSession객체의 setAttribute()메서드를 이용해서
          값을 저장하는 영역을 말한다.
   */
   
   if(isValid) {
	   session.setAttribute("id", id);
   }
   
   //로그인 후 가야할 목적지 정보
     String url = request.getParameter("url");
   //로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<div class="container">
	<%if(isValid) {%>
	<p class="alert alert-success">
		<strong><%=dto.getId()%></strong>님 로그인되었습니다.
		<a href="<%=url%>">확인</a>
	</p>
	<%} else {%>
	<p class="alert alert-danger">
	<a href="${pageContext.request.contextPath}/users/loginform.jsp">다시 시도</a>
	</p>
	<%}%>
	</div>
</body>
</html>