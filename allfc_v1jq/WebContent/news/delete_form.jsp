<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../admin1/auth.jsp" %>
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
 
 <%
 int newsno = Integer.parseInt(request.getParameter("newsno"));
 //out.println(noticeno);

   %>
 
 
 <DIV class='title'>뉴스 삭제</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./delete_proc.jsp' method='POST'>
   <fieldset>
    <legend>뉴스 삭제</legend>
    <ul>
     <li>
      <label>번호: </label>
      <input type='text' name='newsno' id='newsno' size='20' value='<%=newsno%>' readonly>
     </li>
     
     <li>
      <button type='submit'>삭제 진행</button>
      <button type='button' onclick="history.back()">취소</button>
    </ul>
    
   </fieldset>
  </form>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
