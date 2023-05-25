<%@page import="test.guest.dao.Guestdao"%>
<%@page import="test.guest.dto.Guestdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%    
       Guestdao dao = Guestdao.getInstance();
    
       List<Guestdto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<title>방명록</title>
<style>

</style>
</head>
<body>
	<h1>방명록입니다.</h1>
	<div class="text-end">
		<a href="${pageContext.request.contextPath}/guest/insertform.jsp">글쓰기</a>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		<tbody>
		<%for(Guestdto tmp: list) {%>
		<tr>
			<td><%=tmp.getNum()%></td>
			<td><%=tmp.getWriter()%></td>
			<td><%=tmp.getContent()%></td>
			<td><%=tmp.getRegdate()%></td>
			<td><a href="updateform.jsp?pwd=<%=tmp.getPwd()%>">수정</a></td>
			<td><a href="delete.jsp?pwd=<%=tmp.getPwd()%>">삭제</a></td>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>