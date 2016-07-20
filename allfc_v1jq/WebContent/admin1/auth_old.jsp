<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="web.tool.Tool" %>
 
<%
boolean sw = Tool.isMaster(request) || Tool.isAdmin(request);
System.out.println("--> 인증: " + sw);
 
if (sw == false){
  String root = request.getContextPath();
  
  response.sendRedirect(root + "/admin1/login_form.jsp");
  return;
}
 
%>s