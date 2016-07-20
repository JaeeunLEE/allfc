<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">  
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>HTML5 개인 포트폴리오 홈페이지</title>
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="./menu/top_index.jsp" flush='false' />
<!-- ----------------------------------------- -->
  <div class="content" style='overflow-y: scroll; margin-bottom: 50px;'>
    <nav id='index_menu'>
      <ul>
        <li><A href='./notice/list.jsp'><img src='./menu/images/notice.png'><BR>공지사항</A></li>
        <li><A href=''><img src='./menu/images/news.png'><BR>뉴스</A></li>
        <li><A href=''><img src='./menu/images/url.png'><BR>즐겨 찾기</A></li>
      </ul>
      <ul>
        <li><A href=''><img src='./menu/images/gallery.png'><BR>갤러리</A></li>
        <li><A href=''><img src='./menu/images/travel.png'><BR>여행 일정</A></li>
        <li><A href='../index.jsp'><img src='./menu/images/blog.png'><BR>Desktop</A></li>
      </ul>
      <ul>
        <li><A href=''><img src='./menu/images/admin.png'><BR>관리자</A></li>
        <li><A href=''><img src='./menu/images/etc1.png'><BR>JAVA 자료실</A></li>
        <li><A href=''><img src='./menu/images/etc2.png'><BR>JSP 자료실</A></li>
      </ul>
      <ul>
        <li><A href=''><img src='./menu/images/etc3.png'><BR>Spring 자료실</A></li>
      </ul>

    </nav>  
  </div>

<!-- -------------------------------------------- -->
<jsp:include page="./menu/bottom_index.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>
