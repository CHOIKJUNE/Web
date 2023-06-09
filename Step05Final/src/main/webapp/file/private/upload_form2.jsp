<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form2.jsp</title>
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼2 입니다.</h3>
		
		<form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile"/>
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
	document.querySelector("#myForm").addEventListener("submit", (e)=>{
		//폼 제출을 막는다.
		e.preventDefault();
		
		const form = document.querySelector("#myForm");
		ajaxFormPromise(form)
		.then(res=>res.json)
		.then((data)=>{
			console.log(data);
		})
	})
	</script>
</body>
</html>
