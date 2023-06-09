<%@page import="test.guest.dao.Guestdao"%>
<%@page import="test.guest.dto.Guestdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 회원이 입력한 정보를 추출해서
       request.setCharacterEncoding("utf-8");
       String writer = request.getParameter("writer");
       String pwd = request.getParameter("pwd");
       String content = request.getParameter("content");
    //Guestdto의 필드에 담는다.
       Guestdto dto = new Guestdto();
       dto.setWriter(writer);
       dto.setPwd(pwd);
       dto.setContent(content);
       
       Guestdao dao = Guestdao.getInstance();
       //dao.insert를 호출하고 true와 false여부를 알아야함
       boolean isSuccess = dao.insert(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성여부 확인페이지</title>
</head>
<body>
<p>작성 여부 확인</p>
<%--jsp주석--%>
<script>
<%if (isSuccess) {%>
	alert("글을 성공적으로 등록했습니다.");
	location.href = "list.jsp";
<%} else {%>
	alert("등록 실패");
	location.href = "insertform.jsp";
	<%}%>
		</script>
</body>
</html>