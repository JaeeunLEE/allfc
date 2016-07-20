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
 
<DIV class="title" style='width: 20%;'>수정 결과</DIV>
 
<DIV class='message'>
<%
// request 접근 여부
// out.println("title: " + request.getParameter("title"));
 
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************

 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, Byte, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);
 
col = upload.encodeFileUpload12(Tool.checkNull(upload.getParameter("col")));
word = upload.encodeFileUpload12(Tool.checkNull(upload.getParameter("word")));

int reviewno = Integer.parseInt(upload.getParameter("reviewno"));
String title = upload.encodeFileUpload12(upload.getParameter("title"));
String content = upload.encodeFileUpload12(upload.getParameter("content"));
String url1 = upload.getParameter("url1");
String url2 = upload.getParameter("url2");
String rname = upload.encodeFileUpload12(upload.getParameter("rname"));
String email = upload.encodeFileUpload12(upload.getParameter("email"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));
String map = upload.encodeFileUpload12(upload.getParameter("map"));
int count = 0; // 처리된 레코드 수
 
if (reviewDAO.passwordCheck(reviewno, passwd) == 1){
  ReviewVO vo = new ReviewVO();
  vo.setReviewno(reviewno);
  vo.setTitle(title);
  vo.setContent(content);
  vo.setUrl1(url1);
  vo.setUrl2(url2);
  vo.setRname(rname);
  vo.setEmail(email);
  vo.setPasswd(passwd);
  vo.setMap(map);
 
  ReviewVO oldVO = reviewDAO.read(reviewno); // 기존에 등록된 정보 취득
 
  // 파일 객체 추출 <input type='file1' name='file1' size='60'>
  FileItem fileItem1 = upload.getFileItem("file1");
  FileItem fileItem2 = upload.getFileItem("file2");
  FileItem fileItem3 = upload.getFileItem("file3");
 
  String file1 = "";
  String file2 = "";
  String file3 = "";
  long size1 = 0;
  long size2 = 0;
  long size3 = 0;
 
  // 파일1=================================================
  if (fileItem1 != null){
    size1 = fileItem1.getSize(); // 파일 크기

  
    if (size1 > 0){
      if (size1 < 104857600){ // 10 MB 이하
        // 기존 파일 삭제
        upload.deleteFile(upDir, oldVO.getFile1());
        upload.deleteFile(upDir, oldVO.getThumb());
      
        file1 = upload.saveFile(fileItem1, upDir); // 파일 저장
        vo.setThumb(Tool.preview(upDir, file1, 200, 150));
        vo.setFile1(file1);
        vo.setSize1(size1);

      
        count = reviewDAO.update(vo);
        if (count == 1){
%>  
          <SPAN class='info'>자료 <%=count %> 건을 수정했습니다.</SPAN><br>
          
                  <%
        if(vo.getSize1() > 0){%>
          파일명: <%=file1 %> / 파일 사이즈: <%=Tool.unit(size1) %><br> 
          <%} %>
          

          <%
 if(Tool.isImage(vo.getFile1())){
   %>
      <IMG id='file1' src='./storage/<%=vo.getFile1() %>' width='100%'><%} %><br>

          
          
          
          
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
      vo.setThumb(oldVO.getThumb());
      
      
      count = reviewDAO.update(vo);
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
  
  
  
  //===파일2================================================================
  
  if (fileItem2 != null){
    size2 = fileItem2.getSize(); // 파일 크기

  
    if (size2 > 0){
      if (size2 < 10485760){ // 10 MB 이하
        // 기존 파일 삭제
        upload.deleteFile(upDir, oldVO.getFile2());

      
        file2 = upload.saveFile(fileItem2, upDir); // 파일 저장

        vo.setFile2(file2);
        vo.setSize2(size2);

      
        count = reviewDAO.update(vo);
        if (count == 1){
%>  
         <br>
          
                  <%
        if(vo.getSize2() > 0){%>
          파일명: <%=file2 %> / 파일 사이즈: <%=Tool.unit(size2) %><br> 
          <%} %>
          

          <%
 if(Tool.isImage(vo.getFile2())){
   %>
      <IMG id='file2' src='./storage/<%=vo.getFile2() %>' width='100%'><%} %><br>

          
          
          
          
<%   }else{
  
%>
          <SPAN class='warning'>자료 수정에 실패했습니다.</SPAN>
<% 
        }
      }else{
%>
        <SPAN class='warning'>
          전송하려는 파일 크기가 10MB를 넘어갔습니다. (<%=size2/1024/1024 %> MB)
        </SPAN>
<%
      }
    }else{

      vo.setFile2(oldVO.getFile2());
      vo.setSize2(oldVO.getSize2());

      count = reviewDAO.update(vo);
      if (count == 1){
%>
      <br>
<% }else{
%>
        <SPAN class='warning'>자료 수정에 실패했습니다.</SPAN>
<% 
      }
    }
  } // fileItem 객체 존재 여부
  
  //파일3=================================================
  
  
  if (fileItem3 != null){
    size3 = fileItem3.getSize(); // 파일 크기

  
    if (size3 > 0){
      if (size3 < 10485760){ // 10 MB 이하
        // 기존 파일 삭제
        upload.deleteFile(upDir, oldVO.getFile3());

      
        file3 = upload.saveFile(fileItem3, upDir); // 파일 저장

        vo.setFile3(file3);
        vo.setSize3(size3);

      
        count = reviewDAO.update(vo);
        if (count == 1){
%>  
        <br>
          
                  <%
        if(vo.getSize3() > 0){%>
          파일명: <%=file3 %> / 파일 사이즈: <%=Tool.unit(size3) %><br> 
          <%} %>
          

          <%
 if(Tool.isImage(vo.getFile3())){
   %>
      <IMG id='file3' src='./storage/<%=vo.getFile3() %>' width='100%'><%} %><br>

          
          
          
          
<%   }else{
  
%>
          <SPAN class='warning'>자료 수정에 실패했습니다.</SPAN>
<% 
        }
      }else{
%>
        <SPAN class='warning'>
          전송하려는 파일 크기가 10MB를 넘어갔습니다. (<%=size3/1024/1024 %> MB)
        </SPAN>
<%
      }
    }else{

      vo.setFile3(oldVO.getFile3());
      vo.setSize3(oldVO.getSize3());
      count = reviewDAO.update(vo);
      if (count == 1){
%>
       <br>
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
      <button type='button' onclick="location.href='./read.jsp?reviewno=<%=reviewno %>&col=<%=col %>&word=<%=word %>&nowPage=1'" >
        수정 확인
      </button>
    <%
    }else{
    %>
      <button type='button' onclick="history.back()" >다시 시도</button>    
    <%
    }
    %> 
    <button type='button' onclick="location.href='./list_table2.jsp?col=<%=col %>&word=<%=word %>'" >
      목록
    </button>               
               
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- *********************************************** -->
</html> 