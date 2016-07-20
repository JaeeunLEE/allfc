<%@ page contentType="text/html; charset=UTF-8" %>
<html><head>

</head>
<body>


<%
String root = request.getContextPath();
//out.println("root: "+ root);
%>
<!-- 화면 상단 메뉴 --> 
<DIV id='top_menu' style="background-size: 100% 100%; background-image: url('<%=root %>/menu/images/hardware1.jpg'); background-repeat:no-repeat;">
 <DIV class='top_menu_label'>Computer blog 0.6</DIV>
 <NAV class='top_menu_list'>
 
  <A class='menu_link' href='<%=root %>/'>HOME</A> |
   <A class='menu_link' href='<%=root %>/notice/list.jsp'>공지사항</A> |
   <A class='menu_link' href='<%=root %>/profile/profile.jsp'>프로필</A> |
   <A class='menu_link' href='<%=root %>/news/list.jsp'>조립PC 뉴스</A> |
   <A class='menu_link' href='<%=root %>/url/list.jsp'>즐겨찾기</A> |
   <A class='menu_link' href='<%=root %>/pdsv3/list_grid.jsp'>Gallery</A> |
   <A class='menu_link' href='<%=root %>/review/list_table2.jsp'>부품리뷰</A> |
<!--    <A class='menu_link' href='http://172.16.7.13:9090/blog_v2jq/'>Blog</A> | -->
   <A class='menu_link' href='http://cwest00.cafe24.com/'>Blog</A> |
   <a class='menu_link' href='<%=root %>/log/list.jsp'>Log</a> |
   <a class='menu_link' href='<%=root %>/query/query.jsp'>Query</a> |
   

      <%
      if (session.getAttribute("act") == null){
      %>
        <a class='menu_link' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a>
      <%
      }else{
      %>
        <a class='menu_link' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a> |
        <a class='menu_link' href='<%=root %>/admin1/list.jsp'>관리자</a> |
        
        
      <%
      }
      %>

   </NAV>
 </DIV>
<%
// String path = application.getRealPath(".");
// out.println(path + "<br>");
%>
</body>
</html>