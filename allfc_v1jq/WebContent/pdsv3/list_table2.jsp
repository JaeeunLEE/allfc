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

<!-- <DIV class='title'>갤러리</DIV> -->
<DIV class='content'>
 
  <ASIDE style='float: left;'>목록형 Gallery</ASIDE>
  <ASIDE style='float: right;'>
  <A href='./list_grid.jsp'>앨범형</A> | 
  <A href='./create_form.jsp'>등록</A></ASIDE>

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
 ArrayList<Pds3VO> list = pds3DAO.list(); 
 
  
 for(int index=0; index<list.size(); index++){
   Pds3VO vo = list.get(index);
%>
<tr>
 <td class='td'><%=vo.getPdsno() %></td>
 <td class='td'><A href='./read.jsp?pdsno=<%=vo.getPdsno() %>'>
 <A href='./read.jsp?pdsno=<%=vo.getPdsno() %>'><IMG src='./storage/<%=vo.getThumb() %>
 ' style='width: 100%; height: 100px;'></A></td>

 <td class='td'>
 <a href='./read.jsp?pdsno=<%=vo.getPdsno() %>'>
 <%=Tool.convertChar(vo.getTitle()) %></a>
 </td>
 <td class='td'><%=vo.getRname() %></td>
 <td class='td'><%=vo.getCnt() %></td>
 <td class='td'><%=vo.getRdate().substring(0,10) %></td>
 <td class='td'>
 <A href='./update_form.jsp?pdsno=<%=vo.getPdsno() %>'>
 <img src='<%=root %>/menu/images/gear.png'>
 </A>
 <A href='./delete_form.jsp?pdsno=<%=vo.getPdsno() %>'>
 <img src='<%=root %>/menu/images/cancel.png'>
 </A>
</td>

<%
   }

 
 %>
 </table>
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