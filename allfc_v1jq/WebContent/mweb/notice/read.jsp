<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));

NoticeVO vo = noticeDAO.read(noticeno);
noticeDAO.increaseCnt(noticeno); // 조회수 증가
%>

<DIV class='content'>
<FORM name='frm' method='POST' action='./create_proc.jsp'>
  <fieldset>
    <ul>
      <li>
        <label for='title'>제목: </label>
        <span id="title"><%=vo.getTitle() %> (<%=vo.getRdate() %>)</span>
      </li>
      <li>
        <label for='content'>내용: </label><br>
        <div id='content'>
          <%=Tool.convertChar(vo.getContent()) %>
        </div>
      </li>
      
      <li>
        <label for='rname'>성명: </label>
        <span id='rname'><%=vo.getRname() %></span>
      </li>
      <li class='right'>
        <button type="button" onclick="location.href='./list.jsp'">목록</button>
        <button type="button" onclick="location.href='./update_form.jsp?noticeno=<%=noticeno %>'">수정</button>
        <button type="button" onclick="location.href='./delete_form.jsp?noticeno=<%=noticeno %>'">삭제</button>
      </li>    
    </ul>
  </fieldset>

</FORM>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

