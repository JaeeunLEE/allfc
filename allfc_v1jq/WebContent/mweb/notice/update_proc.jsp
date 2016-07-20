<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<DIV class='message2'>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String rname = request.getParameter("rname");
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String passwd = request.getParameter("passwd");

NoticeVO vo = new NoticeVO();
vo.setTitle(title);
vo.setContent(content);
vo.setRname(rname);
vo.setNoticeno(noticeno);
vo.setPasswd(passwd);

int count = 0; // 변경된 레코드 갯수

if (noticeDAO.passwordCheck(noticeno, passwd) == 1){
  count = noticeDAO.update(vo);
%>
  공지사항 <%=count %> 건을 변경했습니다.<br><br>
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


