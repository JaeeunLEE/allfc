<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<DIV class='message2'>
<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String passwd = request.getParameter("passwd");

int count = 0; // 삭제된 레코드 갯수

if (noticeDAO.passwordCheck(noticeno, passwd) == 1){
  count = noticeDAO.delete(noticeno);
%>
  공지사항 <%=count %> 건을 삭제했습니다.
  <br><br>
  <button type='button' onclick="$('#layer').hide(); window.location.reload(true);">닫기</button>
 
<%  
}else{
%>
  패스워드가 일치하지 않습니다.<br><br>
  <br><br>
  <button type='button' onclick="$('#layer').hide(); $('#passwd').focus();">닫기</button>
<%  
};
%>
</DIV>
