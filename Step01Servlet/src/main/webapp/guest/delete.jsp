<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String pwd1 = request.getParameter("pwd");
    session.setAttribute("inputValue", pwd1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<p>비밀번호 확인</p>
<form action="deletesuccess.jsp" method="post">
    <label for="pwd">비밀번호</label>
    <input type="password" name="pwd" id="pwd">
    <input type="submit" value="확인">
</form>
</body>
</html>
