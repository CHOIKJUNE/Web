<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //로그인을 했기 때문에 id를 얻어온다.
  String id = (String)session.getAttribute("id");
  //id를 이용해 회원정보를 가져온다.
  UsersDao dao = UsersDao.getinstance();
  UsersDto dto = dao.getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<style>
	#profileImage {
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm {
	display: none;
	}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<title>/users/private/updateform2.jsp</title>
</head>
<body>
	<h1>회원정보 수정 폼입니다.</h1>
	<a id="profileLink" href="javascript:">
	<%if(dto.getProfile()==null) {%>
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
	</svg>
	<%}else {%>
		<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile()%>">
		<%}%>
	</a>
	
	<form action="update.jsp" method="post">
		<input type="hidden" name="profile" 
				value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
		<div>
			<label for="id">아이디</label> 
			<input type="text" name="id" id="id" value="<%=dto.getId()%>" readonly>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="<%=dto.getEmail()%>">
		</div>
		<div>
			<button type="submit">수정하기</button>
			<button type="reset">취소</button>
		</div>
	</form>
	
	<form id="imageForm" action="profile_upload.jsp" method="post" enctype="multipart/form-data">
			프로필 사진
		<input type="file" id="image" name="image" accept=".jpg, .png, .gif, JPG, jpeg, JPEG"/>
		<button type="submit">업로드</button>
	</form>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
	//프로필 이미지를 클릭하면 id가 imageForm인 form의 파일고르기가 떠야함
	document.querySelector("#profileLink").addEventListener("click", ()=>{
		document.querySelector("#image").click();
	})
	
	//이제 이미지를 바꾸고 확인버튼을 누르면 기존에 있던 이미지가 새로운 이미지로 대체되야한다.(서버에는 적용x)
	document.querySelector("#image").addEventListener("change", ()=>{
		//ajax전송할 폼의 참조값 얻어오기
		const form = document.querySelector("#imageForm");
		//gura_util.js에 있는 함수 이용해 ajax전송하기
		ajaxFormPromise(form)
		.then(res=>res.json())
		.then((data)=>{
			// img 요소를 문자열로 작성한 다음 
			let img=`<img id="profileImage" 
				src="${pageContext.request.contextPath }\${data.imagePath}">`;
			//id 가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 
			//해석해 주세요 라는 의미 
			document.querySelector("#profileLink").innerHTML=img;
		})
	})
	</script>
	
	
</body>
</html>