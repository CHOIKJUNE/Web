<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
</head>
<body>
<h1>회원 등록 및 글추가 페이지</h1>
	<form action="${pageContext.request.contextPath}/guest/insert.jsp" method="post">
		<label for="writer">작성자명 </label> 
		<input type="text" name="writer" id="writer"><br>
		<label for="pwd">비밀번호 </label>
		<input type="password" name="pwd" id="pwd"><br>
		<label for="content">글내용</label><br>
		<textarea name = "content" id ="content" rows="10" cols="30" placeholder="내용을 입력해주세요..."></textarea><br>
		<button type="submit">확인</button>
	</form>
</body>
</html>