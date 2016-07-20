<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.*" %>
<%@ page import="web.tool.*" %>
 
<%@ include file="../admin1/auth.jsp" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
 
</style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<%
String qry = request.getParameter("qry")==null ? "" : request.getParameter("qry");
%>
<form name="frm" method="post" action="query.jsp">
<table style='width: 100%;'>
 <tr>
  <td width="10%">SQL:</td>
  <td>
    <textarea name="qry" id="qry" style="width:100%;height:100px;"><%=qry%></textarea>
  </td>
  <td><button type="submit">실행</button></td>
 </tr>
 <tr>
  <td colspan="3"> </td>
 </tr>
</table> 
</form>
<%
 ResultSet rs= null;
 if (!qry.equals("")){
  
  Connection con = null;
  PreparedStatement pstmt = null;
  String sys_info="";
  String strSQL="";
  strSQL=qry;
  
  try {
   con = new DBOpen().getConnection();
   pstmt = con.prepareStatement(strSQL);
   rs = pstmt.executeQuery();
   if (rs!=null){
    ResultSetMetaData rsmd = rs.getMetaData();
    int c_cnt = rsmd.getColumnCount();
%>
<table style='border: solid 1px #555555; margin: 2% auto; width: 100%;'>
 <tr>
  <% for (int i=1 ; i<=c_cnt ; i++) {%>
  <th style='border: solid 1px #555555;'><%=rsmd.getColumnName(i)%></th>
  <% } %>
 </tr>
 <%
    while(rs.next()){
 %>
 <tr>
  <% for (int i=1 ; i<=c_cnt ; i++) {%>
  <td style='border: solid 1px #555555;'><%=Tool.checkNull(rs.getString(rsmd.getColumnName(i)))%></td>
  <% } %>
 </tr>
 <%
    }
 %>
</table>
<%
   }
  }
  catch (Exception e) {
   out.println(e.toString());
  } finally {
    new DBClose().close(con, pstmt);
  }
  
 }
%>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 