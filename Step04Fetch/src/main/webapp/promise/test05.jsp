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
	new Promise(function(resolve){
		resolve();
		console.log("resolve호출됨");
	}).then(function(){
		console.log("첫번째 then()안에 있는 함수 호출됨");
		//여기에서 다시 Promise객체를 리턴하게 되면 뒤에 다시 .then()을 호출할 수 있다.
		return new Promise(function(resolve) {
			resolve();
		})
	}).then(function() {
		console.log("두번째 then()안에 있는 함수 호출됨");
	})
	</script>
</body>
</html>