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
ArrayList<NoticeVO> list = noticeDAO.list();
%>
<DIV class='title'>목록</DIV>

<TABLE class='table'>
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 45%;'>제목</TH>
    <TH class='th' style='width: 10%;'>성명</TH>
    <TH class='th' style='width: 10%;'>조회</TH>
    <TH class='th' style='width: 20%;'>등록일</TH>
    <TH class='th' style='width: 5%;'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    NoticeVO vo = list.get(index);

%> 
  <TR>
    <TD class='td'><%=vo.getNoticeno() %></TD>
    <TD class='td_l'>
      <A href='./read.jsp?noticeno=<%=vo.getNoticeno() %>'><%=Tool.convertChar(Tool.trim(vo.getTitle(), 10)) %></A></TD>
    <TD class='td'><%=vo.getRname() %></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getRdate().substring(0, 10) %></TD>
    <TD class='td'>
      <A href='./update_form.jsp?noticeno=<%=vo.getNoticeno() %>'><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?noticeno=<%=vo.getNoticeno() %>'><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' 
             onclick="location.href='./create_form.jsp'">등록</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



