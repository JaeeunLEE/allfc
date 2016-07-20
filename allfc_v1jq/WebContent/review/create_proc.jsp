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
   var file2 = document.getElementById("file2");
   var file3 = document.getElementById("file3");
   
   
   if(file1 != null){
    
     var width1 = file1.width;
     if(width1 > 500){
       file1.width = 500; 
     }else{
       //작은이미지는 그냥 출력
     }
   }
   
   if(file2 != null){
     
     var width2 = file2.width;
     if(width2 > 500){
       file2.width = 500;
     }else{
       //작은이미지는 그냥 출력
     }
   }
    
   if(file3 != null){
     
     var width3 = file3.width;
     if(width3 > 500){
       file3.width = 500; 
     }else{
       //작은이미지는 그냥 출력
     }
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

 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);
 
// String title = upload.encodeFileUpload12(upload.getParameter("title"));

ReviewVO vo = new ReviewVO();
// 파일 객체 추출 <input type='file' name='file1' size='60'>
FileItem fileItem1 = upload.getFileItem("file1");
FileItem fileItem2 = upload.getFileItem("file2");
FileItem fileItem3 = upload.getFileItem("file3");
 
String filename1 = "";
String filename2 = "";
String filename3 = "";
String ip = request.getRemoteAddr();
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
String map = upload.encodeFileUpload12(upload.getParameter("map"));
String url1 = upload.getParameter("url1");  //영어라서 인코딩 바꿀필요 없음
String url2 = upload.getParameter("url2");  //영어라서 인코딩 바꿀필요 없음

// pstmt.setString(1, vo.getRname());
// pstmt.setString(2, vo.getEmail());
// pstmt.setString(3, vo.getTitle());
// pstmt.setString(4, vo.getContent());
// pstmt.setString(5, vo.getPasswd());
// pstmt.setString(6, vo.getUrl());
// pstmt.setString(7, vo.getFile1());
// pstmt.setLong(8, vo.getSize1());
long filesize1 = 0;
long filesize2 = 0;
long filesize3 = 0;
 
if (fileItem1 != null){
  filesize1 = fileItem1.getSize();
  filesize2 = fileItem2.getSize();
  filesize3 = fileItem3.getSize();
  
  if (filesize1 > 0){
    if(filesize1 < 104857600){ //10m이하
      filename1 = upload.saveFile(fileItem1, upDir); // 파일 저장
      filename2 = upload.saveFile(fileItem2, upDir); // 파일 저장
      filename3 = upload.saveFile(fileItem3, upDir); // 파일 저장
//       title = upload.encodeFileUpload12(upload.getParameter("title")); // 일반적인 폼 태그
      %>

      
      <%
      vo.setThumb(Tool.preview(upDir, filename1, 200, 150));
      
      vo.setRname(rname);
      vo.setEmail(email);
      vo.setTitle(title);
      vo.setContent(content);
      vo.setPasswd(passwd);
      vo.setUrl1(url1);
      vo.setUrl2(url2);
      vo.setFile1(filename1);
      vo.setSize1(filesize1);
      vo.setFile2(filename2);
      vo.setSize2(filesize2);
      vo.setFile3(filename3);
      vo.setSize3(filesize3);
      vo.setMap(map);
      vo.setIp(ip);
      
      int count = reviewDAO.insert(vo);
      if(count == 1){
      %>
       <SPAN class='info'>자료 <%=count %>건을 등록했습니다.</SPAN><br>
       
          <%
        if(vo.getSize1() > 0){%>
       파일명: <%=filename1 %> / 파일사이즈: 
       <%=Tool.unit(vo.getSize1()) %><br>
       <%
        }
        %>
       
          <%
        if(vo.getSize2() > 0){%>
       파일명: <%=filename2 %> / 파일사이즈: 
       <%=Tool.unit(vo.getSize2()) %><br>
       <%
        }
        %>
       
       <%
        if(vo.getSize3() > 0){%>
       파일명: <%=filename3 %> / 파일사이즈: 
       <%=Tool.unit(vo.getSize3()) %><br>
       <%
        }
        %>
       
       
<%
 if(Tool.isImage(vo.getFile1())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile1() %>' width='100%'><%} %><br>
      <%
 if(Tool.isImage(vo.getFile2())){
   %>
      <IMG id='file2' src='./storage/<%=vo.getFile2() %>' width='100%'><%} %><br>
      <%
 if(Tool.isImage(vo.getFile3())){
   %>
      <IMG id='file3' src='./storage/<%=vo.getFile3() %>' width='100%'><%} %>
      <%
      }else{
        %>
        <SPAN class='warning'>자료 등록에 실패했습니다.</SPAN>
        <%
      }
    }else{
      %>
      <SPAN class='warning'>전송하려는 파일크기가 10MB를 넘어갔습니다. (<%=filesize1/1024/1024 %>MB)</SPAN>
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
    <button type='button' onclick="location.href='./list_table2.jsp'">목록</button>
</DIV>
  </DIV>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

<!-- *********************************************** -->
</html> 