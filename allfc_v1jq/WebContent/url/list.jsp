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

<DIV class='title'>즐겨찾기</DIV>
<DIV class='content'>
<table class='table'>
  <colgroup>
   <col style='width: 10%; '/>
   <col style='width: 50%; '/>

   <col style='width: 10%; '/>
   <col style='width: 15%; '/>
   <col style='width: 15%; '/>
  </colgroup>
 <tr>
  <th class='th'>NO</th>
  <th class='th'>제목</th>

  <th class='th'>접속수</th>
  <th class='th'>등록일</th>
  <th class='th'>기타</th>
 </tr>
 <%
 ArrayList<UrlVO> list = dao.list();
 
 
 for(int index=0; index<list.size(); index++){
   UrlVO urlvo = list.get(index);
%>
<tr>
 <td class='td'><%=urlvo.getUrlno() %></td>
 <td class='td'>
 <A href='./go.jsp?urlno=<%=urlvo.getUrlno() %>&web=<%=urlvo.getWeb() %>'>
 <%=Tool.convertChar(urlvo.getTitle()) %></A></td>
 
 
 <td class='td'><%=urlvo.getCnt() %></td>
 <td class='td'><%=urlvo.getRdate().substring(0,10) %></td>
 <td class='td'>
 <A href='./update_form.jsp?urlno=<%=urlvo.getUrlno() %>'>
 <img src='<%=root %>/menu/images/gear.png'>
 </A>
 
 <A href='./delete_form.jsp?urlno=<%=urlvo.getUrlno() %>'>
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
 <button type='button' onclick="location.href='./list.jsp'">목록</button>

</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 