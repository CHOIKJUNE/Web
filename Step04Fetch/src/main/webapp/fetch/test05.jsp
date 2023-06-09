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
   			.then(res=>res.text())
   			.then((data)=>{
   				//data는 ["어쩌구", "저쩌구", "이렇쿵"]형식의 json문자열이다.
   				console.log(data);
   				//실제 배열(object)로 바꾸기(json형식에 어긋나면 에러가 발생한다.)
   				const list = JSON.parse(data);
   				for(let i=0; i<list.length; i++) {
   					let li=`<li>\${list[i]}</li>`;
   					document.querySelector("#msglist").insertAdjacentHTML("beforeend", li);
   				}
   			})
   		});
  </script>
</body>
</html>