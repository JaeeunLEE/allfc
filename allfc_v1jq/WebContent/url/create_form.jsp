<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../admin1/auth.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
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
 
 <DIV class='title'>등록</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./create_proc.jsp' method='POST'>
   <fieldset>
    <legend>즐겨찾기 등록</legend>
    <ul>
     <li>
      <label>웹사이트 제목: </label>
      <input type='text' name='title' id='title' size='50'>
     </li>
     <li>
      <label>주소: </label>
      <input type='text' name='web' id='web' size='50'>
     </li>
     <li>
      <button type='submit'>등록</button>
    </ul>
    
   </fieldset>
  </form>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 