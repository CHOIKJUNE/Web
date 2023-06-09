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
   			fetch("get_msg2.jsp")
   			.then(res=>res.json()) //서버에서 응답한 문자열이 json형식이면 res.json()으로 바꿔준다.
   			.then((data)=>{
   				//data는 ["어쩌구", "저쩌구", "이렇쿵"]형식의 실제 배열이다.
   				console.log(data);
   				for(let i=0; i<data.length; i++) {
   					let li=`<li>\${data[i]}</li>`;
   					document.querySelector("#msglist").insertAdjacentHTML("beforeend", li);
   				}
   			})
   			.catch((err)->{
   				console.log(err);
   			})
   		});
  </script>
</body>
</html>