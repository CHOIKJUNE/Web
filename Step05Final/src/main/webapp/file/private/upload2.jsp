<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //파일을 DB에 추가하는게 최종 목적이다.

   //파일 시스템 상에서 서버로의 절대경로를 얻어낸다.
   String realPath = application.getRealPath("/upload");

   File f = new File(realPath);
   if(!f.exists()) {
	   f.mkdir();
   }
   
   MultipartRequest mr=new MultipartRequest(request, //내부적으로 필요한 HttpServletRequest 객체 전달
			realPath,                       //업로드된 파일을 저장할 경로
			1024*1024*100,                  //최대 업로드 사이즈 제한
			"utf-8",                        //한글 파일명 깨지지 않도록
			new DefaultFileRenamePolicy()); //동일한 파일이 존재하면 자동으로 파일을 rename 해서 저장하도록
	
			//우리가 만든 File insert 메서드는 writer, title, orgFileName, saveFileName, filesize, regdate가 필요하다
			String writer = (String)session.getAttribute("id");
			String title = mr.getParameter("title");
			String orgFileName=mr.getOriginalFileName("myFile");
			String saveFileName=mr.getFilesystemName("myFile");
			long fileSize=mr.getFile("myFile").length();
			
			//이제 dto에 담는 과정
			FileDto dto = new FileDto();
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
			FileDao dao = FileDao.getInstance();
			boolean isSuccess = dao.insert(dto);
%>
{"isSuccess":<%=isSuccess %>, "saveFileName":"<%=saveFileName %>"}