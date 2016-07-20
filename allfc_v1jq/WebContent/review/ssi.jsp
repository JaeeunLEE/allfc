<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.review.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% 
String root = request.getContextPath();
ReviewDAO reviewDAO = new ReviewDAO();

String col = Tool.checkNull(request.getParameter("col"));
String word = Tool.checkNull(request.getParameter("word"));



int nowPage = 1; // 현재 페이지, 1부터 시작
int recordPerPage = 8;
if (request.getParameter("nowPage") != null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
}



//파일 전송시 사용할 임시 파일 저장소
String tempDir = application.getRealPath("/review/temp");

//최종 파일 저장소
String upDir = application.getRealPath("/review/storage");
%>



