<%@ page contentType="text/html; charset=UTF-8" %>
<%
String root = request.getContextPath();
//out.println("root: "+ root);
%>
<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="<%=root %>/css/styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="<%=root %>/menu/script.js"></script>
</head>
<body>

<!-- 화면 상단 메뉴 --> 

<img src='<%=root %>/menu/images/logo3.jpg' width=120px>


 <DIV id='cssmenu'>
<ul>
 
 <li> <A href='<%=root %>/'>HOME</A></li>
    <li> <A href='<%=root %>/notice/list.jsp'>공지사항</A></li>
  <li>   <A  href='<%=root %>/profile/profile.jsp'>프로필</A></li>
   <li>  <A href='<%=root %>/news/list.jsp'>조립PC 뉴스</A></li>
   <li>  <A  href='<%=root %>/url/list.jsp'>즐겨찾기</A></li>
   <li>  <A  href='<%=root %>/pdsv3/list_grid.jsp'>Gallery</A></li>
   <li>  <A href='<%=root %>/review/list_table2.jsp'>부품리뷰</A></li>
<!--    <A class='menu_link' href='http://172.16.7.13:9090/blog_v2jq/'>Blog</A> | -->
  <li>   <A href='http://cwest00.cafe24.com/'>Blog</A></li>
   <li>  <a href='<%=root %>/log/list.jsp'>Log</a></li>
   <li>  <a href='<%=root %>/query/query.jsp'>Query</a></li>
   

      <%
      if (session.getAttribute("act") == null){
      %>
      <li>    <a href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a></li>
      <%
      }else{
      %>
       <li>   <a href='<%=root %>/admin1/logout_proc.jsp'>Logout</a></li>
       <li>   <a href='<%=root %>/admin1/list.jsp'>관리자</a></li>
        
        
      <%
      }
      %>

  </ul>
   </DIV>

<%
// String path = application.getRealPath(".");
// out.println(path + "<br>");
%>

</body>
<html>
