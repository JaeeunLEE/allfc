<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="./ssi.jsp" %>
<%
// ---------------------------------------------
// 페이징 관련 코드 시작
// ---------------------------------------------
int count = reviewDAO.count(col, word);
// 10: 한 페이지당 출력할 레코드 갯수 
String paging = new Paging().paging4(count, nowPage, recordPerPage, col, word, "list_table2.jsp");
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
<DIV class='content' >
<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='./list_table2.jsp'>
  <ASIDE style='float: left;'>목록형 Gallery (<%=count %>)</ASIDE>
  <ASIDE style='float: right;'>
  
  <SELECT name='col'> <!-- 검색 컬럼 -->
   <OPTION value='none' <%=(col.equals("none"))?"selected='selected'":"" %>)>전체목록</OPTION>
   <OPTION value='rname' <%=(col.equals("rname"))?"selected='selected'":"" %>)>이름</OPTION>
   <OPTION value='title' <%=(col.equals("title"))?"selected='selected'":"" %>)>제목</OPTION>
   <OPTION value='content' <%=(col.equals("content"))?"selected='selected'":"" %>)>내용</OPTION>
   <OPTION value='title_content' <%=(col.equals("title_content"))?"selected='selected'":"" %>)>제목+내용</OPTION>
  </SELECT> 
 <INPUT TYPE='text' name='word' placeholder="검색어"  value=<%=(word.length() > 0)?word:"" %>>
  <button type='submit'>검색</button>
  
  <%
  if(word.length() > 0){
    %>
    <A href='./list_table2.jsp'>전체목록</A>
    <%
  }
  %>
  <A href='./list_grid.jsp'>앨범형</A> | 
  <A href='./create_form.jsp'>등록</A>
  
  </ASIDE>
  </FORM>
</DIV>
 <DIV class='menu_line' style='clear:both';></DIV>
<table class='table'>

 <tr>
  <th class='th' style='width: 5%;'>NO</th>
  <th class='th' style='width: 10%;'>파일</th>
  <th class='th' style='width: 40%;'>제목</th>
  <th class='th' style='width: 10%;'>성명</th>
  <th class='th' style='width: 5%;'>조회</th>
  <th class='th' style='width: 20%;'>등록일</th>
  <th class='th' style='width: 10%;'>기타</th>
 </tr> 
 <%

 

 ArrayList<ReviewVO> list = reviewDAO.list(col, word, nowPage, recordPerPage);
 
  
 for(int index=0; index<list.size(); index++){
   ReviewVO vo = list.get(index);
%>
<tr>
 <td class='td'><%=vo.getReviewno() %></td>
 <td class='td'>
 <a href='./read.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>
 <%
 if(Tool.isImage(vo.getFile1())){
   %>
 <IMG src='./storage/<%=vo.getThumb() %>
 ' style='width: 100%; height: 80px;'><%} %></a>
 
 </td>
 <td class='td'>
 <a href='./read.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>
 <%=Tool.convertChar(vo.getTitle()) %></a>
 </td>
 <td class='td'><%=vo.getRname() %></td>
 <td class='td'><%=vo.getCnt() %></td>
 <td class='td'><%=vo.getRdate().substring(0,10) %></td>
 <td class='td'>
 <A href='./visible.jsp?reviewno=<%=vo.getReviewno() %>&visible=<%=vo.getVisible()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>
 <%=vo.getVisible() %>
 </A>
 <A href='./update_form.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col %>&word=<%=word %>'>
 <img src='<%=root %>/menu/images/gear.png'>
 </A>
 <A href='./delete_form.jsp?reviewno=<%=vo.getReviewno() %>&col=<%=col %>&word=<%=word %>'>
 <img src='<%=root %>/menu/images/cancel.png'>
 </A>
</td>

<%
   }

 
 %>
 </table>
 </DIV>
<DIV class='bottom'>
  <%=paging %>
</DIV>
<!-- <DIV style='margin: 30px auto; text-align: center;'> -->
<!--  <button type='button' onclick="location.href='./create_form.jsp'">등록</button> -->
<!--  <button type='button' onclick="location.href='./list_table1.jsp'">목록</button> -->

<!-- </DIV> -->
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 