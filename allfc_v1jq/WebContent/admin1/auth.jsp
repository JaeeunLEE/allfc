<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="web.tool.Tool" %>
 
<%
// ----------------------------------------------------------------------------
// 요청된 주소로 자동 이동
// ----------------------------------------------------------------------------
// String url= request.getRequestURL().toString();
// System.out.println("--> url: " + url);
// --> url: http://localhost:9090/artbox_v1jq/noticev3/update_form.jsp
 // getParameterNames(); <- 이전 JSP페이지의 FORM태그의 name 속성을 추출합니다
Enumeration<String> enumeration = request.getParameterNames();
String params = "";
 
while(enumeration.hasMoreElements()){
  // System.out.println("-->" + enumeration.nextElement());
  String name = enumeration.nextElement(); //태그 name
  String value = request.getParameter(name); //태그name에 해당하는 값 추출
  params = params + name + "=" + value + "&";
  // System.out.println("--> params: " + params);
}
 
//요청 주소와 Parameter bound
String url_address = request.getRequestURL() + "?" + params;
System.out.println("--> url_address: " + url_address);
//----------------------------------------------------------------------------
 
boolean sw = Tool.isMaster(request) || Tool.isAdmin(request);
// System.out.println("--> 인증: " + sw);
 
if (sw == false){
  String root = request.getContextPath();
  response.sendRedirect(root + "/admin1/login_ck_form.jsp?url_address=" + url_address);    
 
  return;
}
 
%>