<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>파일 등록</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
  // HTML 로딩후 자동 호출되는 함수
  window.onload = function(){
    var file1 = document.getElementById("file1");
    var width= file1.width;
    
    if (width > 600){
      file1.width = 600; // 큰이미지 축소
    }else{
      // 작은 이미지는 그냥 출력
    }
  }
</script>
 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- *********************************************** -->
 
<DIV class="title" style='width: 20%;'>전송 결과</DIV>
 
<DIV class='message'>
<%
// request 접근 여부
// out.println("title: " + request.getParameter("title"));
 
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
// 파일 전송시 사용할 임시 파일 저장소
tempDir = application.getRealPath("/pdsv3/temp");
 
// 최종 파일 저장소
upDir = application.getRealPath("/pdsv3/storage");
 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, Byte, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);
 
int pdsno = Integer.parseInt(upload.getParameter("pdsno"));
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String url = upload.getParameter("url");
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
int count = 0; // 처리된 레코드 수
 
if (pds3DAO.passwordCheck(pdsno, passwd) == 1){
  Pds3VO vo = new Pds3VO();
  vo.setPdsno(pdsno);
  vo.setTitle(title);
  vo.setContent(content);
  vo.setUrl(url);
  vo.setRname(rname);
  vo.setEmail(email);
  vo.setPasswd(passwd);
 
  Pds3VO oldVO = pds3DAO.read(pdsno); // 기존에 등록된 정보 취득
 
  // 파일 객체 추출 <input type='file1' name='file1' size='60'>
  FileItem fileItem = upload.getFileItem("file1");
 
  String file1 = "";
  long size1 = 0;
 
  if (fileItem != null){
    size1 = fileItem.getSize(); // 파일 크기
  
    if (size1 > 0){
      if (size1 < 104857600){ // 10 MB 이하
        // 기존 파일 삭제
        upload.deleteFile(upDir, oldVO.getFile1());
        upload.deleteFile(upDir, oldVO.getThumb());
      
        file1 = upload.saveFile(fileItem, upDir); // 파일 저장
        vo.setThumb(Tool.preview(upDir, file1, 200, 150));
        vo.setFile1(file1);
        vo.setSize1(size1);
      
        count = pds3DAO.update(vo);
        if (count == 1){
%>  
          <SPAN class='info'>자료 <%=count %> 건을 수정했습니다.</SPAN><br>
          파일명: <%=file1 %> / 파일 사이즈: <%=Tool.unit(size1) %><br> 
          <IMG id='file1' src='./storage/<%=file1 %>'>         
<%   }else{
%>
          <SPAN class='warning'>자료 수정에 실패했습니다.</SPAN>
<% 
        }
      }else{
%>
        <SPAN class='warning'>
          전송하려는 파일 크기가 10MB를 넘어갔습니다. (<%=size1/1024/1024 %> MB)
        </SPAN>
<%
      }
    }else{
      vo.setFile1(oldVO.getFile1());
      vo.setSize1(oldVO.getSize1());
      count = pds3DAO.update(vo);
      if (count == 1){
%>
        <SPAN class='info'>자료 <%=count %> 건을 수정했습니다.</SPAN><br>
<% }else{
%>
        <SPAN class='warning'>자료 수정에 실패했습니다.</SPAN>
<% 
      }
    }
  } // fileItem 객체 존재 여부
}else{%>
  <SPAN class='warning'>패스워드가 일치하지 않습니다.</SPAN>
<%  
} // 패스워드 일치 여부
%> 
</DIV>
 
<DIV class='bottom'>
    <%
    if (count == 1){
    %>
      <button type='button' onclick="location.href='./read.jsp?pdsno=<%=pdsno %>'" >
        수정 확인
      </button>
    <%
    }else{
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