<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       //session scope에 "nick"이라는 키값으로 저장된 문자열이 있는지 읽어와본다.
       String nick = (String)session.getAttribute("nick");
       //만일 저장된 값이 없다면(로그인하지 않았다면)
       if(nick==null) {
       	  //로그인 페이지로 redirect 이동(여기서는 그냥 index.jsp페이지로 이동)
       	  String cpath = request.getContextPath();
       	  response.sendRedirect(cpath + "/index.jsp");
       }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
<p><strong><%=nick%>님</strong>신나게 놀아 보아요!</p>
<a href="${pageContext.request.contextPath}/index.jsp">돌아가기</a>
</body>
</html>