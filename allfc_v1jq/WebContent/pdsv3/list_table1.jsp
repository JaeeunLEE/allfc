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

<DIV class='title'>갤러리</DIV>
<DIV class='content'>
<table class='table'>
  <colgroup>
   <col style='width: 5%; '/>
   <col style='width: 50%; '/>
   <col style='width: 10%; '/>
   <col style='width: 5%; '/>
   <col style='width: 15%; '/>
   <col style='width: 15%; '/>
  </colgroup>
 <tr>
  <th class='th'>NO</th>
  <th class='th'>제목</th>
  <th class='th'>성명</th>
  <th class='th'>조회</th>
  <th class='th'>등록일</th>
  <th class='th'>기타</th>
 </tr>
 <%
 ArrayList<Pds3VO> list = pds3DAO.list(); 
 
  
 for(int index=0; index<list.size(); index++){
   Pds3VO vo = list.get(index);
%>
<tr>
 <td class='td'><%=vo.getPdsno() %></td>
 <td class='td'>
 <a href='./go.jsp?pdsno=<%=vo.getPdsno() %>'>
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

<DIV style='margin: 30px auto; text-align: center;'>
 <button type='button' onclick="location.href='./create_form.jsp'">등록</button>
 <button type='button' onclick="location.href='./list_table1.jsp'">목록</button>

</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 