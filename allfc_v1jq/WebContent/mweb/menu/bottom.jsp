<%@ page contentType="text/html; charset=UTF-8" %>
<%
String root = request.getContextPath();
// out.println("root: " + root);top_index.jsp
%>

<footer class='footer_content' style="background-size: 100% 100%; background-image: url('<%=root %>/mweb/menu/images/bg.jpg');">
  <nav id='footer_menu'>
    <ul>
      <li><A href='../notice/list.jsp'><img src='../menu/images/notice.png'></A></li>
      <li><A href=''><img src='../menu/images/news.png'></A></li>
      <li><A href=''><img src='../menu/images/url.png'></A></li>
      <li><A href=''><img src='../menu/images/gallery.png'></A></li>
      <li><A href=''><img src='../menu/images/travel.png'></A></li>
      <li><A href='../index.jsp'><img src='../menu/images/blog.png'></A></li>
      <li><A href=''><img src='../menu/images/admin.png'></A></li>
      <li><A href=''><img src='../menu/images/etc1.png'></A></li>
      <li><A href=''><img src='../menu/images/etc2.png'></A></li>
      <li><A href=''><img src='../menu/images/etc3.png'></A></li>
    </ul>
  </nav>
</footer>
