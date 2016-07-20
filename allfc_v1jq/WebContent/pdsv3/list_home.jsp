<%@ page contentType="text/html; charset=UTF-8" %>
 
<%@ include file="./ssi.jsp" %>
 
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<script type="text/javascript" src="<%=root %>/js/tool.js"></script>
 
<script type="text/javascript">
$(function() {
  var width = 0;
  // A 태그중에 id 가 'img-'로 시작하는 태그 선택
  $("A[id*=img-]").on("click", function() {
    // alert( $(this).text()); // this: 이벤트가 발생된 태그, A 문자열 추출
    // alert($(this).attr('id'));  // 태그 아이디 추출, img-1
    // $(this): 이벤트가 발생된 태그
    var pdsno = $(this).attr('id').substring(4); // pdsno 번호 추출
    var params = 'pdsno=' + pdsno;
    $.post('<%=root %>/pdsv3/read_file1.jsp', params, file1_res, 'json');
  });
  
  // Layer click시 닫기
  $("#layer").on("click", function(){ $(this).hide(); });
});
 
/*
{"pdsno":1, "file1": "mount.jpg"}
*/
function file1_res(data){
  var src = "<%=root %>/pdsv3/storage/" + data.file1;
  var img = "<IMG id='layer_img' src='" + src + "'>"; // 문자열
  $('#layer_content').html(img); // 태그로 작동
 
  $('#layer_img').load(function(){ // 태그 메모리 상주후 작동
    width = this.width;
    
    if (width > 800){
      this.width = 800;  //px
    }
    
    show_layer(); // 레이어 출력
  });
  
}
 
</script>
 
<div id="layer" style='display:none; margin: 0px; padding: 0px;'>
  <div id='layer_content'></div>
</div>
 
<DIV style='text-align: center;'>
<TABLE style='margin: 0px auto; border-collapse: collapse;'>
  <TR>
<%
ArrayList<Pds3VO> list = pds3DAO.list(10); 
  
for(int index=0; index < list.size(); index++){
  Pds3VO vo = list.get(index);
  String file1 = vo.getFile1();
  int pdsno = vo.getPdsno();
  String title = vo.getTitle();
  String thumb = vo.getThumb(); 
%>
  <TD style='width: 90px; height: 60px;''>
    <A href='#' id='img-<%=vo.getPdsno() %>'><IMG src='<%=root %>/pdsv3/storage/<%=thumb %>' style='width: 100%; height: 100%;'></A>
  </TD>
<%
}
%>
</TR>
</TABLE>
</DIV>