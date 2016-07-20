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
 
  NewsVO vo = dao.read(newsno);
   %>
 
 
 <DIV class='title'>수정</DIV>
 
 
<DIV class='content'>
  <form name='frm' action='./update_proc.jsp' method='POST'>
  <input type='hidden' name='newsno' value='<%=newsno %>'>
   <fieldset>
    <legend>뉴스 수정</legend>
    <ul>
     <li>
      <label>제목: </label>
      <input type='text' name='title' id='title' size='50' value='<%=vo.getTitle()%>'>
     </li>
     <li>
      <label>URL: </label>
      <input type='text' name='newsurl' id='newsurl' size='50' value='<%=vo.getNewsurl()%>'>
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

