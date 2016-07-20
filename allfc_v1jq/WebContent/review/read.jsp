<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>

 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 <script type="text/javascript">

 
//  HTML 로딩후 자동 호출되는 함수
window.onload = function(){
  var file1 = document.getElementById("file1");
  var file2 = document.getElementById("file2");
  var file3 = document.getElementById("file3");
  
  
  if(file1 != null){
   
    var width1 = file1.width;
    if(width1 > 300){
      file1.width = 300; 
    }else{
      //작은이미지는 그냥 출력
    }
  }
  
  if(file2 != null){
    
    var width2 = file2.width;
    if(width2 > 300){
      file2.width = 300;
    }else{
      //작은이미지는 그냥 출력
    }
  }
   
  if(file3 != null){
    
    var width3 = file3.width;
    if(width3 > 300){
      file3.width = 300; 
    }else{
      //작은이미지는 그냥 출력
    }
  }
 }
 </script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
 <%
 nowPage = Integer.parseInt(request.getParameter("nowPage"));
 int reviewno = Integer.parseInt(request.getParameter("reviewno"));
 reviewDAO.increaseCnt(reviewno);
 ReviewVO vo = reviewDAO.read(reviewno);
 %>
<DIV class='content'>
 
  <ASIDE style='float: left;'>부품리뷰 > 조회</ASIDE>
  <ASIDE style='float: right;'>
  <A href='./list_table2.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>목록</A> | 
  <A href='./create_form.jsp'>등록</A> |
  <A href='./update_form.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col%>&word=<%=word%>'>수정</A> |
  <A href='./delete_form.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col%>&word=<%=word%>'>삭제</A> |

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
    
      </li>
      <li>
      <div style='float: left; margin: 10px 10px 0px 0px'>
      
      <%
 if(Tool.isImage(vo.getFile1())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile1() %>' width='100%'><%} %>
      <%
 if(Tool.isImage(vo.getFile2())){
   %>
      <IMG id='file2' src='./storage/<%=vo.getFile2() %>' width='100%'><%} %>
      <%
 if(Tool.isImage(vo.getFile3())){
   %>
      <IMG id='file3' src='./storage/<%=vo.getFile3() %>' width='100%'><%} %>
      <br><br>
      </div>
        <div>내용: <%=Tool.convertChar(vo.getContent()) %> </div>
      
      
      
    
      </li>  

      <li>
      
        <%
        if(vo.getSize1() > 0){%>
<A href='<%=root %>/download?dir=/pdsv3jq/storage&filename=<%=vo.getFile1() %>'>
        <%=vo.getFile1() %></A>(<%=Tool.unit(vo.getSize1()) %>)<br>
         <%
        }
        %>
        
        <%
        if(vo.getSize2() > 0){%>
        <A href='<%=root %>/download?dir=/pdsv3jq/storage&filename=<%=vo.getFile2() %>'>
        <%=vo.getFile2() %></A>(<%=Tool.unit(vo.getSize2()) %>)<br>
         <%
        }
        %>
        
        
        <%
        if(vo.getSize3() > 0){%>
        <A href='<%=root %>/download?dir=/pdsv3jq/storage&filename=<%=vo.getFile3() %>'>
        <%=vo.getFile3() %></A>(<%=Tool.unit(vo.getSize3()) %>)<br>
        <%
        }
        %>
        
        
      </li>        
      <li>
        <label for='rname'>성명: </label>
        <%=vo.getRname() %><br>
 
        <label for='email'>이메일: </label>
        <%=vo.getEmail() %>
        <br>
        <label for='ip'>ip: </label>
        <%=vo.getIp() %><br>

      </li>
 <li>WEB URL1:
 <a href='<%=vo.getUrl1() %>'><%=vo.getUrl1() %></a>
 </li>
 <li>WEB URL2:
 <a href='<%=vo.getUrl2() %>'><%=vo.getUrl2() %></a>
 </li>
 

    </ul>
      </fieldset>
      <div>
지도:
<%=vo.getMap() %>
</div>

 
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
 