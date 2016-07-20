<%@ page contentType="text/html; charset=UTF-8" %>
<%--JAVA API --%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FilenameFilter" %>

<%--Third party API--%>
<%@ page import="java.util.*, java.io.*, javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%--Project API--%>
<%@ page import="web.tool.*" %>

<%@ page import="web.admin1.*" %>
 
<% request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지 %> 
 
<%
//프로젝트 경로 자동 추출, Context root 명 자동 추출
///ws_web/pds_v3jq -> /pds_v3jq
// http://localhost:9090/pds_v3jq/pdsv3/list2.jsp
String root = request.getContextPath(); 

%>