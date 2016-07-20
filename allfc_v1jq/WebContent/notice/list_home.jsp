<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="./ssi.jsp" %>



<DIV class='content'>
<fieldset style='border-left: none; border-right: none'>
<legend style='margin-left: 20px'>공지사항<a href='<%=root %>/notice/list.jsp'> More...</a></legend>


 <UL style='margin-left: 30px'>


 <%
 ArrayList<NoticeVO> list = dao.list();
 
 
 for(int index=0; index<list.size(); index++){
   NoticeVO noticevo = list.get(index);
%>
<LI>


 <a href='<%=root %>/notice/go.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <%=Tool.convertChar(noticevo.getTitle()) %></a>

<%=noticevo.getRname() %>
 <%=noticevo.getCnt() %>
 <%=noticevo.getRdate().substring(0,10) %>

 <A href='<%=root %>/notice/update_form.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <img src='<%=root %>/menu/images/gear.png'>
 </A>
 <A href='<%=root %>/notice/delete_form.jsp?noticeno=<%=noticevo.getNoticeno() %>'>
 <img src='<%=root %>/menu/images/cancel.png'>
 </A>
</LI>

<%
   }

 
 %>

 
 </UL>
 </fieldset>
 </DIV>

