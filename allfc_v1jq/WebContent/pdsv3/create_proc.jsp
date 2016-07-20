<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
  <script type="text/javascript">
 //HTML 로딩후 자동 호출되는 함수
 window.onload = function(){
   var file1 = document.getElementById("file1");
   var width = file1.width;
   
   if(width > 600){
     file1.width = 600; //600보다 큰 이미지는 600으로
   }else{
     //작은이미지는 그냥 출력
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
 
//request 접근여부
// out.println("title: "+request.getParameter("title"));

// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
// 파일 전송시 사용할 임시 파일 저장소
tempDir = application.getRealPath("/pdsv3/temp");
 
// 최종 파일 저장소
upDir = application.getRealPath("/pdsv3/storage");
 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);
 
// String title = upload.encodeFileUpload12(upload.getParameter("title"));

Pds3VO vo = new Pds3VO();
// 파일 객체 추출 <input type='file' name='file1' size='60'>
FileItem fileItem = upload.getFileItem("file1");
 
String filename = "";
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
String url = upload.getParameter("url");  //영어라서 인코딩 바꿀필요 없음

// pstmt.setString(1, vo.getRname());
// pstmt.setString(2, vo.getEmail());
// pstmt.setString(3, vo.getTitle());
// pstmt.setString(4, vo.getContent());
// pstmt.setString(5, vo.getPasswd());
// pstmt.setString(6, vo.getUrl());
// pstmt.setString(7, vo.getFile1());
// pstmt.setLong(8, vo.getSize1());
long filesize = 0;
 
if (fileItem != null){
  filesize = fileItem.getSize();
  
  if (filesize > 0){
    if(filesize < 104857600){ //10m이하
      filename = upload.saveFile(fileItem, upDir); // 파일 저장
//       title = upload.encodeFileUpload12(upload.getParameter("title")); // 일반적인 폼 태그
      %>

      
      <%
      vo.setThumb(Tool.preview(upDir, filename, 200, 150));
      
      vo.setRname(rname);
      vo.setEmail(email);
      vo.setTitle(title);
      vo.setContent(content);
      vo.setPasswd(passwd);
      vo.setUrl(url);
      vo.setFile1(filename);
      vo.setSize1(filesize);
      
      int count = pds3DAO.insert(vo);
      if(count == 1){
      %>
       <SPAN class='info'>자료 <%=count %>건을 등록했습니다.</SPAN><br>
       파일명: <%=filename %> / 파일사이즈: 
       <%=Tool.unit(vo.getSize1()) %><br>
       <IMG id='file1' src='./storage/<%=filename %>'>
      <%
      }else{
        %>
        <SPAN class='warning'>자료 등록에 실패했습니다.</SPAN>
        <%
      }
    }else{
      %>
      <SPAN class='warning'>전송하려는 파일크기가 10MB를 넘어갔습니다. (<%=filesize/1024/1024 %>MB)</SPAN>
      <%
    }
    
  }
}
// ****************************************************************
// 파일 업로드 관련 코드 종료
// ****************************************************************
%> 
 

 

  
 <DIV class='bottom'>
    <button type='button' onclick="location.href='./create_form.jsp'">계속 전송</button>
    <button type='button' onclick="location.href='./list_grid.jsp'">목록</button>
</DIV>
  </DIV>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

<!-- *********************************************** -->
</html> 