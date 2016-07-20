<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.news3.*" %>

 
 
<% 
String root = request.getContextPath();
request.setCharacterEncoding("UTF-8"); %>
 
<%
NewsDAO dao = new NewsDAO();
%>