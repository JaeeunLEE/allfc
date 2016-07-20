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
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
// out.println("pdsno: " + pdsno);
Pds3VO vo = pds3DAO.read(pdsno);
%>
<DIV class='content'>
  <ASIDE style='float: left;'>Gallery > 등록</ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list_table3.jsp'>목록형</A> | 
    <A href='./list_grid2.jsp'>앨범형</A> |
    <A href='./create_form.jsp'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
<FORM name='frm' method='POST' action='./update_proc.jsp' 
            enctype='multipart/form-data'>
  <input type='hidden' name='pdsno' value='<%=pdsno %>'>
            
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
        <label for='url'>WEB URL: </label>
        <input type="url" name='url' id='url' size='50' value='<%=vo.getUrl() %>'>
      </li>
      <li>
        <label for='file1'>참고 파일: </label>
        <%
        if (vo.getFile1().length() > 1){
        %>
        <%
 if(Tool.isImage(vo.getFile1())){
   %>
          <IMG src='./storage/<%=vo.getFile1() %>' width='200px'>
        <%  
 }
        }
        %>
        <input type="file" name='file1' id='file1' size='50'>
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