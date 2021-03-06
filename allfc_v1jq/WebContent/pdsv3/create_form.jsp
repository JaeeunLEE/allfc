<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../admin1/auth.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='content' style='width: 100%;'>
 
  <ASIDE style='float: left;'>Gallery > 등록</ASIDE>
  <ASIDE style='float: right;'>
  <A href='./list_table2.jsp'>목록형</A> | 
  <A href='./list_grid.jsp'>앨범형</A></ASIDE>

 <DIV class='menu_line' style='clear:both';></DIV>
<FORM name='frm' method='POST' action='./create_proc.jsp' enctype='multipart/form-data'>
  <fieldset class='top'>
  
    <ul>
      <li>
        <label for='title'>제목: </label>
        <input type='text' name='title' id='title' size='50' value='파일테스트'>
      </li>
      <li>
        <label for='content'>내용: </label><br>
        <textarea name='content' id='content' rows='5' style='width: 100%;'>테스트</textarea>
      </li>  
      <li>
        <label for='url'>WEB URL: </label>
        <input type="url" name='url' id='url' size='50' value='http://www.daum.net'>
      </li>
      <li>
        <label for='file1'>참고 파일: </label>
        <input type="file" name='file1' id='file1' size='50'>
      </li>        
      <li>
        <label for='rname'>성명: </label>
        <input type='text' name='rname' id='rname' value='왕눈이' size='10'>
 
        <label for='email'>이메일: </label>
        <input type='email' name='email' id='email' value='mail1@mail.com' size='25'>
 
        <label for='passwd'>패스워드: </label>
        <input type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>
 
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="history.back();">목록</button>
      </li>    
    </ul>
  </fieldset>
 
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
 