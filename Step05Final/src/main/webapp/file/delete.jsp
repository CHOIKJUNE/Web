<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  int num = Integer.valueOf(request.getParameter("num"));
  String id = (String)session.getAttribute("id");
  FileDao dao = FileDao.getInstance();
  FileDto dto = dao.getData(num);
  if(!dto.getWriter().equals(id)) {
	  //에러 응답하기
	  response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우면 혼난다");
	  return;
  }
  //파일 시스템 상에서 webapp의 upload폴더까지의 절대경로를 얻어낸다.
  String realPath = application.getRealPath("/upload" + File.separator + dto.getOrgFileName());
  //해당 경로를 access할 수 있는 파일 객체 생성
  File f = new File(realPath);
  if(f.exists()) {
	  f.delete();
  }
  boolean isSuccess = dao.delete(num);
  if(isSuccess) {
  String cPath = request.getContextPath();
  response.sendRedirect(cPath + "/file/list.jsp");
  }
%>