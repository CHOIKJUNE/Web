<%@page import="test.dto.Memberdto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/list.jsp</title>
</head>
<body>
	<%
	List<Memberdto> list = new ArrayList<>();
	list.add(new Memberdto(1, "김구라", "노량진"));
	list.add(new Memberdto(2, "해골", "행신동"));
	list.add(new Memberdto(3, "원숭이", "상도동"));
	Memberdto dto = new Memberdto();
	%>
	<table>
		<thead>
			<tr>
				<th><%="번호"%></th>
				<th><%="이름"%></th>
				<th><%="주소"%></th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Memberdto tmp : list) {
			%>
			<tr>
				<td>
					<%
					out.print(tmp.getNum());
					%>
				</td>
				<td>
					<%
					out.print(tmp.getName());
					%>
				</td>
				<td>
					<%
					out.print(tmp.getAddr());
					%>
				</td>
				<%
				}
				%>
			</tr>
		</tbody>

	</table>
</body>
</html>