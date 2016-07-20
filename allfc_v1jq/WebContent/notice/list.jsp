<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="./ssi.jsp" %>

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

<DIV class='title'>공지사항</DIV>
<DIV class='content'>

 <UL style='margin-left: 30px'>


 <%
 ArrayList<NoticeVO> list = dao.list();
 
 
 for(int index=0; index<list.size(); index++){
   NoticeVO noticevo = list.get(index);
%>
<LI>


 <a href='./read.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <%=Tool.convertChar(noticevo.getTitle()) %></a>

<%=noticevo.getRname() %>
 <%=noticevo.getCnt() %>
 <%=noticevo.getRdate().substring(0,10) %>

 <A href='./update_form.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <img src='<%=root %>/menu/images/gear.png'>
 </A>
 <A href='./delete_form.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <img src='<%=root %>/menu/images/cancel.png'>
 </A>
</LI>

<%
   }

 
 %>
 </table>
 
 </UL>
 </DIV>
 <DIV style='margin: 30px auto; text-align: center;'>
<%
if(Tool.isMaster(request) || Tool.isAdmin(request)){
%>


 <button type='button' onclick="location.href='./create_form.jsp'">등록</button>
 <%} %>
 <button type='button' onclick="location.href='./list.jsp'">목록</button>

</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 