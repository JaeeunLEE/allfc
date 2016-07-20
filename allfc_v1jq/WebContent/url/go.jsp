<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="./ssi.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%
int urlno = Integer.parseInt(request.getParameter("urlno"));
String web = request.getParameter("web");



dao.increaseCnt(urlno);
 
response.sendRedirect(web);  // 주소 자동 이동
%>