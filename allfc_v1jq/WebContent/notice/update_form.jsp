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
 
 NoticeVO vo = dao.read(noticeno);
 
   %>
 
 <DIV class='title'>수정</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./update_proc.jsp' method='POST'>
   <input type='hidden' name='noticeno' value='<%=vo.getNoticeno() %>'>
   <fieldset>
    <legend>공지사항 수정</legend>
    <ul>
     <li>
      <label>제목: </label>
      <input type='text' name='title' id='title' size='50' value='<%=vo.getTitle() %>'>
     </li>
         <li>
      <label>내용: </label>
      <textarea cols='100' rows='5' name='content' id='content' size='50'><%=vo.getContent() %>
      </textarea>
     </li>
     <li>
      <label>성명: </label>
      <input type='text' name='rname' id='rname'  value='<%=vo.getRname() %>'>
     </li>
     <li>
      <label>비밀번호: </label>
      <input type='password' name='passwd' id='passwd'>
     </li>
     <li>
      <button type='submit'>저장</button>
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

