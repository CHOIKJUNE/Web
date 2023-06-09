<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//요청 인코딩 설정(한글 깨지지 않도록)
request.setCharacterEncoding("utf-8");
// 요청 파라미터 추출
String msg3 = request.getParameter("msg3");
//콘솔창에 출력하기 (이클립스 버그 때문에 jsp페이지에서는 콘솔창에 문자열 출력 불가)
out.println("msg:" + msg3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>
<p>메세지 잘 받았어 클라이언트야</p>
<p>전달받은 메세지<strong><%=msg3%></strong></p>
</body>
</html>