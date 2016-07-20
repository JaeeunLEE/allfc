<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="web.tool.*" %>

<%@ page import="web.notice4.*" %>

<% request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지 %> 

<%
NoticeDAO noticeDAO = new NoticeDAO();

// 프로젝트를 실행하는 경로명(프로젝트명) 자동 산출
String root = request.getContextPath(); 
%>





