<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insertform.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<div class="mb-1">
			<label for="name" class="form-label">이름 <input
				class="form-control" type="text" name="name" id="name">
			</label>
		</div><br>

		<div class="mb-1">
			<label for="addr" class="form-label">주소 <input
				class="form-control" type="text" name="addr" id="addr">
			</label>
		</div>
		<br>
		<button type="submit" class="btn btn-primary btn-sm">추가</button>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>
</body>
</html>