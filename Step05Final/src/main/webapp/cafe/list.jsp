<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//DB에서 ROWNUM 1~5, 6~10사이의 값들을 가져와야함 

//한 페이지에 몇개씩 표시할 것인지
final int rowContent = 5;
//하단 페이지를 몇개씩 표시할 것인지
final int pageNumCount = 5;
//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
int pageNum = 1;
//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
String pagenum = request.getParameter("pageNum");
//만일 페이지 번호가 파라미터로 넘어 온다면
if(pagenum!=null) {
	pageNum = Integer.valueOf(pagenum);
}

//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*rowContent;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*rowContent;
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/pageNumCount)*pageNumCount;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+pageNumCount-1;

//전체 글의 갯수
int contentCount = CafeDao.getInstance().getCount();
//전체 페이지의 갯수 구하기
int totalPageCount = (int)Math.ceil(contentCount/(double)pageNumCount);
//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
if(endPageNum>totalPageCount) {
	endPageNum = totalPageCount;
}

//CafeDto 에 startRowNum 과 endRowNum 을 담아서 
	CafeDto dto = new CafeDto();
    dto.setStartRowNum(startRowNum);
    dto.setEndRowNum(endRowNum);
	//파일 목록을 얻어온다.
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	//로그인된 아이디( 로그인이 되어있지 않으면 null 이다)
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
				<th>좋아요</th>
				<th>싫어요</th>
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
				<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
				<td><%=tmp.getViewCount()%></td>
				<td><a href="<%=tmp.getLikeCount()%>"></td>
				<td><a href="<%=tmp.getHateCount()%>"></td>
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
	<ul class="pagination">
			<%--
				startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
			--%>
			<%if(startPageNum != 1){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<li class="page-item <%= i==pageNum ? "active":"" %>">
					<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
			<%--
				마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
			--%>
			<%if(endPageNum < totalPageCount){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
				</li>
			<%} %>
		</ul>
</div>
</body>
</html>