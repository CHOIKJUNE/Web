<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. CafeDao의 getData()메서드를 호출한다.
	List<CafeDto> list = CafeDao.getInstance().getList();

	//* 수정, 삭제버튼이 writer명과 로그인한 id의 값이 같을 시 출력되야 한다.
	String id = (String)session.getAttribute("id");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
</head>
<body>
<div class="container">
	<h1>게시글 목록입니다</h1>
	<a href="private/insertform.jsp">글 작성</a>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(CafeDto tmp: list) {%>
			<tr>
				<td><%=tmp.getNum()%></td>
				<td><%=tmp.getWriter()%></td>
				<td><%=tmp.getTitle()%></td>
				<td><%=tmp.getViewCount()%></td>
				<td><%=tmp.getRegdate()%></td>
				<td>
				<%if(tmp.getWriter().equals(id)) {%>
					<a href="private/updateform.jsp?num=<%=tmp.getNum()%>">수정</a>
					<%}%>
				</td>
				<td>
				<%if(tmp.getWriter().equals(id)) {%>
					<a href="private/delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
				<%}%>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
</div>
</body>
</html>