<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//몇번 상품 몇개인지를 HttpServletRequest객체를 이용해서 얻어낸 다음
//아래의 html요소에 출력해보세요.
%>
<%
//요청 인코딩 설정(한글 깨지지 않도록)
request.setCharacterEncoding("utf-8");
// 요청 파라미터 추출
int num = Integer.valueOf(request.getParameter("num"));
int amount = Integer.valueOf(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>
		<strong><%=num%></strong>번 상품 <strong><%=amount%></strong>개를 주문했습니다.
	</p>
</body>
</html>