<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.url3.*" %>

 
 
<% 
String root = request.getContextPath();
request.setCharacterEncoding("UTF-8"); %>
 
<%
UrlDAO dao = new UrlDAO();
%>