<%@page import="test.member.dto.todoDto"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //MemberDao 객체의 참조값 얻어오기
	MemberDao dao=MemberDao.getInstance();
	//회원 목록얻어오기
	List<todoDto> list2= dao.getTodoList();
	%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<title>todolist</title>
<style>
tr {
text-align: center;
}
</style>
</head>
<body>
	<h1>할일 목록입니다.</h1>
	<div class="text-end">
		<a href="listinsertform.jsp">추가하기</a>
	</div>
	<table class="table table-success table-striped">
		<thead>
			<tr>
				<th>오늘의 할일</th>
				<th>완료</th>
			</tr>
		</thead>
		<tbody>
					<%for(todoDto tmp : list2) {%>
			<tr>
				<td><%=tmp.getTodo()%></td>
				<td></td>
			</tr>
			<%};%>
		</tbody>
	</table>
</body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        