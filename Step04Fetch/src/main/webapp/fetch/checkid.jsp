<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. GET방식 파라미터로 전달되는 아이디 읽어내기
   String inputId = request.getParameter("inputId");
   //2. DB에 이미 존재하는 아이디인지 알아내서 사용가능 여부를 판정한다.
   boolean canUse = true;
   if(inputId.equals("gura") || (inputId.equals("monkey"))) {
	   canUse = false;
   }
   
   int idLength = inputId.length();
   boolean canUse2 = false;
   if(idLength>=4 && idLength<=10) {
	   canUse2 = true;
   }
   //3. json으로 사용가능 여부를 응답한다.
%>
{"canUse": <%=canUse%>, "canUse2": <%=canUse2%>}