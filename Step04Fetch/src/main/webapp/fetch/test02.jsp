<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="msg" placeholder="메세지 입력...">
	<button id="sendBtn">전송</button>
	<script>
		//문자열을 입력하고 전송 버튼을 눌렀을 때 입력한 문자열을 읽어와서 send.jsp페이지로 전송이 되도록 하기
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			//입력한 문자열 읽어오기
			const msg = document.querySelector("#msg").value;
			//fetch함수를 호출하면서 GET방식 파라미터로 send.jsp페이지를 요청하면서 전달한다.
			fetch("send.jsp?msg=" + msg)
			.then((res)=>{
				return res.text();
			})
			.then((data)=>{
				console.log(data);
			});
		});
	</script>
</body>
</html>