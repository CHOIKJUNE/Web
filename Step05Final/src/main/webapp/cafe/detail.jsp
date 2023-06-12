<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
    int num = Integer.valueOf(request.getParameter("num"));
    //2. num을 이용해 회원정보와 조회수를 업데이트한다.
    CafeDao dao = new CafeDao();
    boolean isSuccess = dao.addViewCount(num);
    CafeDto dto = dao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>/datail.jsp</title>
</head>
<body>
		<div>
		    <label for="writer">작성자</label>
		    <input type="text" name="writer" id="writer" value="<%=dto.getWriter()%>" readonly><br>
			<label for="title">제목</label> 
			<input type="text" name="title" id="title" value="<%=dto.getTitle()%>" readonly>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content" rows="10" readonly><%=dto.getContent()%></textarea><br>
			<label for="viewCount">조회수</label>
			<input type="text" name="viewCount" id="viewCount" value="<%if(isSuccess) out.print(dto.getViewCount());%>" readonly>
		</div>
		<div>
		</div>
</body>
</html>