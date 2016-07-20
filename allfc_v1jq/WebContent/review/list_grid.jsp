<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="./ssi.jsp" %>
<%
// ---------------------------------------------
// 페이징 관련 코드 시작
// ---------------------------------------------
int count = reviewDAO.count(col, word);
// 10: 한 페이지당 출력할 레코드 갯수 
String paging = new Paging().paging4(count, nowPage, recordPerPage, col, word, "list_grid.jsp");
// ---------------------------------------------
// 페이징 관련 코드 종료
// ---------------------------------------------
 
%>
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

<!-- <DIV class='title'>갤러리</DIV> -->
<DIV class='content'>
 
  <ASIDE style='float: left;'>부품리뷰</ASIDE>
  <ASIDE style='float: right;'>
  <A href='./list_table2.jsp'>목록형</A> | 
  <A href='./create_form.jsp'>등록</A></ASIDE>

 <DIV class='menu_line' style='clear:both';></DIV>

 <%
 ArrayList<ReviewVO> list = reviewDAO.list(col, word, nowPage, recordPerPage);
 
  
 for(int index=0; index<list.size(); index++){
   ReviewVO vo = list.get(index);
   String file1 = vo.getFile1();
   int reviewno = vo.getReviewno();
   String title = vo.getTitle();
   String rdate = vo.getRdate();
   String thumb = vo.getThumb();
   
   if(index != 0 && index % 4 == 0){ %>
     <DIV style='width: 100%; clear:both; height: 1px; border-top: dotted 1px #AAAAAA; margin: 10px auto'></DIV>
  <% }
   
%>
<tr>
 <DIV style='background-color: #EEEEEE; float: left; position: relative; left: 0%; margin: 1%; width: 23%;'>
<%
 if(Tool.isImage(vo.getFile1())){
   %>
<a href='./read.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>
 <IMG src='./storage/<%=thumb %>
 ' style='width: 100%; height: 150px;'>
 </a>

<%}else{%>
<a href='./read.jsp?reviewno=<%=reviewno %>' style='height: 130px; 
display: block; text-align: center;'><%=file1 %></a>
<%
}
%>
 <br>
 <a href='./read.jsp?reviewno=<%=reviewno %>'><%=Tool.trim(title, 16) %></a><br>
<%=rdate.substring(0,10) %>

</DIV>

<%



   }

 
 %>

 </DIV>
<DIV class='bottom'>
  <%=paging %>
</DIV>
<!-- <DIV style='margin: 30px auto; text-align: center;'> -->
<!-- <DIV class='bottom' style='clear: both; margin: 30px auto; text-align: center;'> -->
<!--  <button type='button' onclick="location.href='./create_form.jsp'">등록</button> -->
<!--  <button type='button' onclick="location.href='./list_table1.jsp'">목록</button> -->

<!-- </DIV> -->
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 