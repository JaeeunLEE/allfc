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
 
 dao.increaseCnt(noticeno);
 NoticeVO vo = dao.read(noticeno);
 
   %>
 
 <DIV class='title'>조회</DIV>
 
 
<DIV class='content'>
  <form name='frm' method='POST'>
   <input type='hidden' name='noticeno' value='<%=vo.getNoticeno() %>'>
   <fieldset>
    <legend>공지사항 조회</legend>
    <ul>
     <li>
      <label>제목: </label><%=vo.getTitle() %>
     </li>
     <li>
      <label>내용: </label><br>
      <%=Tool.convertChar(vo.getContent()) %>
     </li>
     <li>
      <label>성명: </label>
      <%=vo.getRname() %>
     </li>
     
     <li class='right'>
      <button type='button' onclick="location.href='./list.jsp'">목록</button>
       <button type='button' onclick="location.href='./update_form.jsp?noticeno=<%=noticeno %>'">수정</button>
        <button type='button' onclick="location.href='./delete_form.jsp?noticeno=<%=noticeno %>'">삭제</button>
      </li>
    </ul>
    
   </fieldset>
  </form>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 