<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
 
</style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>처리 결과</DIV>
<DIV class='message'>

 <%
 int urlno = Integer.parseInt(request.getParameter("urlno"));
 String title = request.getParameter("title");
 String web = request.getParameter("web");
 
 UrlVO vo = new UrlVO();
 vo.setUrlno(urlno);
 vo.setTitle(title);
 vo.setWeb(web);
 
 int count = dao.update(vo);
 if(count == 1){
   out.println("공지사항을 변경했습니다.");
 }else{
   out.println("공지사항 변경에 실패했습니다.");
 }
 
 %>
 </DIV>

<DIV style='margin: 30px auto; text-align: center;'>
 <button type='button' onclick="location.href='./list.jsp'">목록</button>

</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 