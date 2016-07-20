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
 
 <%
 int noticeno = Integer.parseInt(request.getParameter("noticeno"));
 //out.println(noticeno);
 

 
 %>
 <DIV class='title'>공지사항 삭제</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./delete_proc.jsp' method='POST'>
  <input type='hidden' name='noticeno' id='noticeno' value='<%=noticeno %>'>
   <fieldset>
    <legend>공지사항 삭제</legend>
    <ul>
    <li>
    공지사항을 삭제하시겠습니까? 삭제하시면 복구할 수 없습니다.
    </li>
     <li>
      <label>비밀번호: </label>
      <input type='password' name='passwd' id='passwd' size='20'>
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

