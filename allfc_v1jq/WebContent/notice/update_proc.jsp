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
 
 int noticeno = Integer.parseInt(request.getParameter("noticeno"));
 String title = request.getParameter("title");
 String content = request.getParameter("content");
 String rname = request.getParameter("rname");
 String passwd = request.getParameter("passwd");
 
 
 NoticeVO vo = new NoticeVO();
 vo.setNoticeno(noticeno);
 vo.setTitle(title);
 vo.setContent(content);
 vo.setRname(rname);
 
 int count = dao.passwordCheck(noticeno, passwd);
 
 if(count == 1){
   int count1 = dao.update(vo);
   if(count1 == 1){
     out.println("공지사항을 변경했습니다.");
   }else{
     out.println("공지사항 변경에 실패했습니다.");
   }
   
 }else{
   out.println("비밀번호가 틀립니다.");
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