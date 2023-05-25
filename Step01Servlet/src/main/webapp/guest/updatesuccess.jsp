<%@page import="test.guest.dto.Guestdto"%>
<%@page import="test.guest.dao.Guestdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
       request.setCharacterEncoding("utf-8");
       String content = request.getParameter("content");
       Guestdto dto = new Guestdto();
       dto.setContent(content);
       //DB에 변경내용 저장
       Guestdao dao = Guestdao.getInstance();
       boolean isSuccess = dao.update(dto);
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>수정하였습니다.</p>
<a href="list.jsp">돌아가기</a>
</body>
</html>