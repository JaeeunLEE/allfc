<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 <script type="text/javascript">
 //HTML 로딩후 자동 호출되는 함수
 window.onload = function(){
   var file1 = document.getElementById("file1");
   var width = file1.width;
   
   if(width > 600){
     file1.width = 600; //600보다 큰 이미지는 600으로
   }else{
     //작은이미지는 그냥 출력
   }
 }
 </script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
 <%
 int pdsno = Integer.parseInt(request.getParameter("pdsno"));
 pds3DAO.increaseCnt(pdsno);
 Pds3VO vo = pds3DAO.read(pdsno);
 %>
<DIV class='content'>
 
  <ASIDE style='float: left;'>Gallery > 조회</ASIDE>
  <ASIDE style='float: right;'>
  <A href='./list_table2.jsp'>목록형</A> | 
  <A href='./list_grid.jsp'>앨범형</A> |
  <A href='./create_form.jsp'>등록</A> |
  <A href='./update_form.jsp?pdsno=<%=vo.getPdsno() %>'>수정</A> |
  <A href='./delete_form.jsp?pdsno=<%=vo.getPdsno() %>'>삭제</A> |
  <A href='<%=root %>/download?dir=/pdsv3jq/storage&filename=<%=vo.getFile1() %>'>파일 다운로드</A>
  </ASIDE>

 <DIV class='menu_line' style='clear:both';></DIV>
<FORM name='frm' method='POST'>
  <fieldset class='none_line'>
  
    <ul>
      <li>
      <span style='font-weight: bold;'>
        제목: 
        
        <%=vo.getTitle() %> (<%=vo.getRdate() %>)
        조회수: <%=vo.getCnt() %></span><br>
        <%=vo.getFile1() %> (<%=Tool.unit(vo.getSize1()) %>)
      </li>
      <li>
      <div style='float: left; margin: 10px 10px 0px 0px'>
      <%
 if(Tool.isImage(vo.getFile1())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile1() %>' width='100%'><%} %>
      </div>
        <div>내용: <%=Tool.convertChar(vo.getContent()) %> </div>
      
      
      
    
      </li>  

      <li>
<A href='<%=root %>/download?dir=/pdsv3jq/storage&filename=<%=vo.getFile1() %>'>
        <%=vo.getFile1() %></A>
      </li>        
      <li>
        <label for='rname'>성명: </label>
        <%=vo.getRname() %><br>
 
        <label for='email'>이메일: </label>
        <%=vo.getEmail() %>
 

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
 