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
  <ASIDE style='float: left;'>부품리뷰 > 수정</ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list_table2.jsp?col=<%=col %>&word=<%=word %>'>목록</A> | 

    <A href='./create_form.jsp'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
<FORM name='frm' method='POST' action='./update_proc.jsp' 
            enctype='multipart/form-data'>
  <input type='hidden' name='reviewno' value='<%=reviewno %>'>
  
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
           
            
  <fieldset class='none_line'>
    <ul>
      <li>
        <label for='title'>제목: </label>
        <input type='text' name='title' id='title' size='50' value='<%=vo.getTitle() %>'>
      </li>
      <li>
        <label for='content'>내용: </label><br>
        <textarea name='content' id='content' rows='5' style='width: 100%;'><%=vo.getContent() %></textarea>
      </li>  
      <li>
        <label for='url'>WEB URL1: </label>
        <input type="url" name='url1' id='url1' size='50' value='<%=vo.getUrl1() %>'>
      </li>
            <li>
        <label for='url'>WEB UR2L: </label>
        <input type="url" name='url2' id='url2' size='50' value='<%=vo.getUrl2() %>'>
      </li>
      <li>
        <label for='file1'>참고 파일1: </label>
        <%
        if (vo.getFile1().length() > 1){
        %>
        <%
 if(Tool.isImage(vo.getFile1())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile1() %>' width='200px'><%} %>
   
        <%  
        }
        %>
        <input type="file" name='file1' id='file1' size='50'>
      </li>      
            <li>
        <label for='file2'>참고 파일2: </label>
        <%
        if (vo.getFile2().length() > 1){
        %>
        <%
 if(Tool.isImage(vo.getFile2())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile2() %>' width='200px'><%} %>

        <%  
        }
        %>
        <input type="file" name='file2' id='file2' size='50'>
      </li>   
            <li>
        <label for='file3'>참고 파일3: </label>
        <%
        if (vo.getFile3().length() > 1){
        %>
        <%
 if(Tool.isImage(vo.getFile3())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile3() %>' width='200px'><%} %>
    
        <%  
        }
        %>
        <input type="file" name='file3' id='file3' size='50'>
      </li>  
      <li>
        <label for='content'>지도: </label><br>
        <textarea name='map' id='map' rows='5' style='width: 100%;'><%=vo.getMap() %></textarea>
      </li>     
      <li>
        <label for='rname'>성명: </label>
        <input type='text' name='rname' id='rname' value='<%=vo.getRname() %>' size='10'>
 
        <label for='email'>이메일: </label>
        <input type='email' name='email' id='email' value='<%=vo.getEmail() %>' size='25'>
 
        <label for='passwd'>패스워드: </label>
        <input type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>
 
      <li class='right'>
        <button type="submit">저장</button>
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