<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msglist">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
   </ul>
   <script>
   		document.querySelector("#moreBtn").addEventListener("click", ()=>{
   			fetch("get_msg.jsp")
   			.then(res=>res.text())
   			.then((data)=>{
   				/*
   				    data는 
   				    "<li>어쩌구</li>
   				    <li>저쩌구</li>
   				    <li>이렇쿵</li>" 형식의 문자열이다.
   				*/
   				console.log(data);
   		document.querySelector("#msglist").insertAdjacentHTML("beforeend", data);
   			})
   		});
   		
  </script>
</body>
</html>