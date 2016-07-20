<%@ page contentType="text/html; charset=UTF-8" %> 
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
 
 <DIV class='title'>등록</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./create_proc.jsp' method='POST'>
   <fieldset>
    <legend>공지사항 등록입니다.</legend>
    <ul>
     <li>
      <label>제목: </label>
      <input type='text' name='title' id='title' size='50'>
     </li>
     <li>
      <label>내용: </label>

      <textarea name='content' id='content' cols='100' rows='5'></textarea>
     </li>
     <li>
      <label>성명: </label>
      <input type='text' name='rname' id='rname'>

     </li>
      <li>

      <label>패스워드: </label>
      <input type='password' name='passwd' id='passwd'>
     </li>
     <li>
      <button type='submit'>등록</button>
      <button type='button' onclick="location.href='./list.jsp'">목록</button>
    </ul>
    
   </fieldset>
  </form>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 