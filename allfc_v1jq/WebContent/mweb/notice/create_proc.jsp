<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String rname = request.getParameter("rname");
String passwd = request.getParameter("passwd");

NoticeVO vo = new NoticeVO();
vo.setTitle(title);
vo.setContent(content);
vo.setRname(rname);
vo.setPasswd(passwd);

int count = noticeDAO.insert(vo);
%>
<DIV class='message2'>
  공지사항 <%=count %> 건을 등록했습니다.
  <br><br>
  <button type='button' onclick="$('#layer').hide(); window.location.reload(true);">닫기</button>
</DIV>





