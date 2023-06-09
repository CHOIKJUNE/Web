<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//회원이 작성한 글을 수정하려면 일단 회원의 정보가 필요하다. 따라서 회원의 id와 num이 필요하다.
//id로만 DB의 파라미터에 삽입하면 하나의 글을 수정하려다 같은 아이디를 지닌 회원의 모든 글이 수정될수가 있다.
String writer = (String)session.getAttribute("id");
int num = Integer.valueOf(request.getParameter("num"));

// dto에 담는다.
CafeDto dto = new CafeDto();
dto.setNum(num);
CafeDto dto2 = CafeDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/updateform.jsp</title>
</head>
<body>
	<h2>글 수정폼</h2>
	<form action="update.jsp?num=<%=dto2.getNum()%>" method="post">
	<label for="title">제목</label>
	<input type="text" name="title" id="title" value="<%=dto2.getTitle()%>"><br>
	<label for="content">글</label>
	<textarea name="content" id="content" rows="10"><%=dto2.getContent()%></textarea><br>
	<button type="submit">수정하기</button>
	<button type="reset">취소</button>
	</form>
</body>
</html>