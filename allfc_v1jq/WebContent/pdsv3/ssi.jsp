<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %> 

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.json.simple.*" %>

<%@ page import="web.tool.Upload" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.pds3.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String root = request.getContextPath();
Pds3DAO pds3DAO = new Pds3DAO();

String col = Tool.checkNull(request.getParameter("col"));
String word = Tool.checkNull(request.getParameter("word"));

// System.out.println("URL: " + request.getRequestURI());
// System.out.println("col: " + col);
// System.out.println("word: " + word);

int nowPage = 1; // 현재 페이지, 1부터 시작
int recordPerPage = 8; // 페이지당 레코드 수
if (request.getParameter("nowPage") != null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
  
}

//파일 전송시 사용할 임시 파일 저장소
String tempDir = application.getRealPath("/pdsv3/temp");

//최종 파일 저장소
String upDir = application.getRealPath("/pdsv3/storage");
%>



