<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>/fortune.jsp</title>
</head>
<body>
	<%//자바영역
String[] fortune = {"동쪽으로 가면 귀인을 만나요",
		"오늘은 집에만 계세요",
		"너무 멀리가지 마세요",
		"오늘은 뭘해도 되는 날이에요",
		"로또가 당첨되요"
};
Random ran = new Random();
int num = ran.nextInt(0, 5);
%>
	<p>
		<%out.print(fortune[num]);%>
	</p>
	<p><%=10%></p>
	<p><%= true%></p>
	<p><%="김"%></p>
	<p><%=fortune[0]%></p>
</body>
</html>