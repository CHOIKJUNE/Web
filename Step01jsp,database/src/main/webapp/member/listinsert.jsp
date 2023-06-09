<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.todoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%//1. post 방식으로 전송되는 할일을 추출한다.
	request.setCharacterEncoding("utf-8");
    String todo = request.getParameter("todo");
      //2. 추가할 todo를 MemberDto 객체에 담는다.
      todoDto dto = new todoDto();
      dto.setTodo(todo);
      //3. DB 에 연결하고 저장 후 응답한다.
      MemberDao dao = MemberDao.getInstance();
      boolean isSuccess = dao.alterInsert(dto);
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listinsert.jsp</title>
</head>
<body>
	<p>알림</p>
	<%if(isSuccess) {%>
	<strong><a href="todolist.jsp">돌아가기</a></strong>
	<%}%>
</body>
</html>