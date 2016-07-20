<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
ArrayList<NoticeVO> list = noticeDAO.list();
%>
<DIV class='content'>
  <fieldset style='border-left: none; border-right: none;'>
    <legend style='margin-left: 20px;'>공지사항 <A href='<%=root %>/notice/list.jsp'>More...</A></legend>

    <UL style='margin-left: 25px;'>
    <%
    for(int index=0; index < list.size(); index++){
      NoticeVO vo = list.get(index);
    %> 
      <LI>
        <A href='./read.jsp?noticeno=<%=vo.getNoticeno() %>'><%=Tool.convertChar(Tool.trim(vo.getTitle(), 20)) %></A>
        <%=vo.getRname() %>
        (<%=vo.getCnt() %>)
        <%=vo.getRdate().substring(0, 10) %>
        <A href='./update_form.jsp?noticeno=<%=vo.getNoticeno() %>'><IMG src='<%=root %>/notice/images/update.png' title='수정'></A>
        <A href='./delete_form.jsp?noticeno=<%=vo.getNoticeno() %>'><IMG src='<%=root %>/notice/images/delete.png' title='삭제'></A>
      </LI>
    <%
    }
    %>
    </UL>
  </fieldset>

</DIV>


