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

<DIV class='title'>등록 결과</DIV>
<DIV class='message'>

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
 
 int count = dao.insert(vo);
 if(count == 1){
   out.println("공지사항을 등록했습니다.");
 }else{
   out.println("공지사항 등록에 실패했습니다.");
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