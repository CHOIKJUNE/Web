<%@page import="test.guest.dao.Guestdao"%>
<%@page import="test.guest.dto.Guestdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String pwd = request.getParameter("pwd"); 
    request.setCharacterEncoding("utf-8");
      String value = (String)session.getAttribute("inputvalue");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(value==pwd) {
     Guestdao dao = Guestdao.getInstance();
     boolean isSuccess = dao.delete(value);
     String cpath = request.getContextPath();
 	//리다이렉트 응답하기
 	response.sendRedirect(cpath+"/guest/list.jsp");
     }else{
    	 out.println("비밀번호가 틀립니다. 다시 입력해주세요");
    	 String cpath = request.getContextPath();
    	 	//리다이렉트 응답하기
    	 response.sendRedirect(cpath+"/guest/delete.jsp");
     }
     %>
</body>
</html>