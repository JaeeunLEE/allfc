<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.notice4.*" %>

 
 
<% request.setCharacterEncoding("UTF-8"); %>
 
<%
NoticeDAO dao = new NoticeDAO();

//프로젝트를 실행하는 경로명(프로젝트명) 자동 산출
String root = request.getContextPath();
%>