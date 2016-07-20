<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>
 
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
<%
int reviewno = Integer.parseInt(request.getParameter("reviewno"));
// out.println("pdsno: " + pdsno);
ReviewVO vo = reviewDAO.read(reviewno);
%>
<DIV class='content'>
  <ASIDE style='float: left;'>부품리뷰 > 삭제</ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list_table2.jsp?col=<%=col%>&word=<%=word%>'>목록</A> | 

    <A href='./create_form.jsp'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
<FORM name='frm' method='get' action='./delete_proc.jsp' >
  <input type='hidden' name='reviewno' value='<%=reviewno %>'>

  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
       
  <fieldset>
  <legend>자료삭제 - 삭제 후 복구할 수 없습니다.</legend>
    <ul>
       
      <li>
        <label for='passwd'>패스워드: </label>
        <input type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>
 
      <li class='right'>
        <button type="submit">삭제</button>
        <button type="button" onclick="history.back();">취소</button>
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