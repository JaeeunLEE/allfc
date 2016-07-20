<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Log 목록</title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<style type="text/css">
 
</style>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='content'>
  <ASIDE style='float: left;'> Log </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.jsp'>목록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  <form name='frm' action='' method='POST'>
  <OL>
  <%
  // File folder = new File(".");
  // out.println(folder.getAbsolutePath()); // C:\iot1\eclipse_luna\. 
  String path = request.getServletContext().getRealPath("/log");
  // out.println(path); // C:\iot1\ws_web\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\admin_v1jq\WEB-INF\classes\web\tool 
  File folder = new File(path);
  // File[] files = folder.listFiles(); // 모든 파일 목록 추출
  
  // Filter를 이용한 txt 파일만 추출 
  File[] files = folder.listFiles(new FilenameFilter(){
    @Override
    public boolean accept(File dir, String name){
      return name.endsWith(".txt");
    }
  }); 
  
  for(int index=0; index < files.length; index++){
    File file = files[index];
    String fname = file.getName();
    out.println("<LI style='margin-left: 10%;'>");
    String atag_fname = root + "/log/" + fname; // 폴더+파일명
    out.println("<A href='"+atag_fname +"'>"  + fname + "</A>");
    out.println("</LI><br>");
    
  }
  
  %>
  </OL>
  </form>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 