<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>파일 등록</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- *********************************************** -->
 
<DIV class="title" style='width: 20%;'>삭제</DIV>
 
<DIV class='message'>
<%
// request 접근 여부
// out.println("title: " + request.getParameter("title"));
 
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************

 
// 최종 파일 저장소
upDir = application.getRealPath("/pdsv3/storage");
 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, Byte, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, upDir);
 
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
String passwd = request.getParameter("passwd");

int count = 0; // 처리된 레코드 수
 
if (pds3DAO.passwordCheck(pdsno, passwd) == 1){
 
  Pds3VO oldVO = pds3DAO.read(pdsno); // 기존에 등록된 정보 취득
 
  // 파일 객체 추출 <input type='file1' name='file1' size='60'>

  upload.deleteFile(upDir, oldVO.getFile1());
  upload.deleteFile(upDir, oldVO.getThumb());

  
 
  
  
      
        count = pds3DAO.delete(pdsno);
        if (count == 1){
%>  
          <SPAN class='info'>자료 <%=count %> 건을 삭제했습니다.</SPAN><br>
    
<%   }else{
%>
          <SPAN class='warning'>자료 삭제에 실패했습니다.</SPAN>
<% 
        }


}else{
%>
  <SPAN class='warning'>패스워드가 일치하지 않습니다.</SPAN>
<%  
} // 패스워드 일치 여부
%> 
</DIV>
 
<DIV class='bottom'>
    <%
    if (count != 1){
    %>
<button type='button' onclick="history.back()" >다시 시도</button>    
    <%
    }

    %> 
    <button type='button' onclick="location.href='./list_grid.jsp'" >
      목록
    </button>               
               
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- *********************************************** -->
</html> 