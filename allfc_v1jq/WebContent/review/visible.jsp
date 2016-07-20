<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>파일 등록</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- *********************************************** -->
 
<DIV class="title" style='width: 20%;'>Visible</DIV>
 
<DIV class='message'>
<%

nowPage = Integer.parseInt(request.getParameter("nowPage"));
int reviewno = Integer.parseInt(request.getParameter("reviewno"));
String visible = request.getParameter("visible");
 
%>


<%
if(visible.equals("Y")){
  reviewDAO.visible(reviewno, "N");
}else{
  reviewDAO.visible(reviewno, "Y");
}


%>

    <%
    response.sendRedirect("./list_table2.jsp?col="+col+"&word="+word+"&nowPage="+nowPage);
    %>       
               
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- *********************************************** -->
</html> 