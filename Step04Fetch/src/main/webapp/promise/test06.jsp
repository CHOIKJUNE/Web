<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>promise테스트</h1>
	<script>

		function openDoor() {
			return new Promise(function(resolve) {
				setTimeout(function() {
					console.log("1초를 소모하면서 문을 열었습니다.");
					resolve();
				}, 1000);
			});
		}
		function putElephant() {
			return new Promise(function(resolve) {
				setTimeout(function() {
					console.log("3초를 소모하면서 코끼리를 집어 넣었습니다.");
					resolve();
				}, 3000);
			});
		}
		function closeDoor() {
			return new Promise(function(resolve) {
				setTimeout(function() {
					console.log("2초를 소모하면서 문을 닫았습니다.");
					resolve();
				}, 2000);
			});
		}
		
		opendoor().then(function(){
			return putElephant();
		}).then(function() {
			return closeDoor();
		}).then(function() {
			console.log("냉장고에 코끼리를 넣었습니다.");
		})
	</script>
</body>
</html>