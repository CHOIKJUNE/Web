<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Promise테스트</h1>
	<script>
	new Promise(function(resolve, reject){
		//무언가 작업을 하고 결과 데이터가 있다면
		let data = {num: 1, name:"김구라"};
		//resolve혹은 reject함수를 호출하면서 전달할 수 있다.
		resolve(data);
		//reject();
		console.log("resolve호출됨");
	}).then(function(result){
		console.log(result);
		console.log("then()안에 있는 함수 호출됨");
	}).catch(function(){
		console.log("catch()안에 있는 함수 호출됨");
	});
	</script>
</body>
</html>