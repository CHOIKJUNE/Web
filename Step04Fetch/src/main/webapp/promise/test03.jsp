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
			// resolve();
			reject();
			console.log("resolve호출됨");
		}).then(function(){console.log("then()안에 있는 함수 호출됨");
		}).catch(function(){console.log("catch()안에 있는 함수 호출됨");
		});
	</script>
</body>
</html>