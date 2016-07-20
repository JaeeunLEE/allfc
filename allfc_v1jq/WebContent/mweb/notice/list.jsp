<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/javascript">
$(function(){  // HTML 페이지가 실행된 후에 자동으로 실행
  $('#title').focus();
  $('#button_panel').html("<button type='button' onclick='create();'>등록</button>");
  
});

function create(){
  var params = $('#frm').serialize();
  // alert(params);
  // return;
  $.post('./create_proc.jsp', params, create_res, 'html');
}

function create_res(data){
  // alert(data);
  $('#layer_content').html(data);
  show_layer();

}

function update_form(noticeno){
  var params = 'noticeno=' + noticeno;
  $.post('./update_form.jsp', params, update_form_res, 'json');
}

function update_form_res(data){
  $('#noticeno').val(data.noticeno);
  $('#title').val(data.title);
  $('#content').val(data.content);
  $('#rname').val(data.rname);
  $('#passwd').val('');
  $('#title').focus();
  $('#button_panel').html("<button type='button' onclick='update_proc();'>저장</button> <button type='button' onclick='update_cancel();'>취소</button>");

}

function update_form_cancel(){
  $('#button_panel').html("<button type='button' onclick='create();'>등록</button>");
  $('#title').val('');
  $('#content').val('');
  $('#rname').val('');
  $('#passwd').val('');
}

function update_proc(){
  var params = $('#frm').serialize();
  $.post('./update_proc.jsp', params, update_proc_res, 'html');
}

function update_proc_res(data){
  $('#layer_content').html(data);
  show_layer();
}

function delete_form(noticeno){
  var params = 'noticeno=' + noticeno;
  $.post('./delete_form.jsp', params, delete_form_res, 'json');
}

function delete_form_res(data){
  $('#noticeno').val(data.noticeno);
  $('#title').val(data.title);
  $('#content').val(data.content);
  $('#rname').val(data.rname);
  $('#passwd').val('');
  $('#passwd').focus();
  $('#button_panel').html("<button type='button' onclick='delete_proc();'>삭제</button> <button type='button' onclick='delete_form_cancel();'>취소</button>");

}

function delete_form_cancel(){
  $('#button_panel').html("<button type='button' onclick='create();'>등록</button>");
  $('#title').val('');
  $('#content').val('');
  $('#rname').val('');
  $('#passwd').val('');
}

function delete_proc(){
  var params = $('#frm').serialize();
  $.post('./delete_proc.jsp', params, delete_proc_res, 'html');
}

function delete_proc_res(data){
  $('#layer_content').html(data);
  show_layer();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="../menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<div id="layer" style='display:none; width: 100%; height: 200px;'>
  <div id='layer_content' style='background: rgba(0, 200, 0, 0.8); color: white;'></div>
</div>
  
<%
ArrayList<NoticeVO> list = noticeDAO.list();
%>

<DIV class='content'>
<FORM name='frm' id='frm'>
  <input type='hidden' name='noticeno' id='noticeno'  value=''>
  <fieldset>
    <ul>
      <li>
        <input type='text' name='title' id='title' placeholder="제목" required="required">
        <textarea name='content' id='content' rows='3' style='width: 100%;'></textarea>
      </li>
      <li>
        <input type='text' name='rname' id='rname' value='' placeholder="성명" required="required">        
        <input type='password' name='passwd' id='passwd' value='' placeholder ='패스워드' required="required">
        <span id='button_panel' style='float: right;'></span>
      </li>
    </ul>
  </fieldset>

</FORM>
</DIV>

<DIV class='content'>
  <UL style='margin-left: 25px;'>
<%
  for(int index=0; index < list.size(); index++){
    NoticeVO vo = list.get(index);
%> 
    <LI>
      <A href='./read.jsp?noticeno=<%=vo.getNoticeno() %>'><%=Tool.convertChar(Tool.trim(vo.getTitle(), 20)) %></A>
      <%=vo.getRname() %>
      (<%=vo.getCnt() %>)
      <%=vo.getRdate().substring(0, 10) %>
      <A href='javascript: update_form(<%=vo.getNoticeno() %>)'><IMG src='update.png' title='수정'></A>
      <A href='javascript: delete_form(<%=vo.getNoticeno() %>)'><IMG src='delete.png' title='삭제'></A>
    </LI>
<%
  }
%>
  </UL>
</DIV>

<DIV class='bottom'>
  <%
  if (Tool.isMaster(request) || Tool.isAdmin(request)){
  %>
  <button type='button' 
             onclick="location.href='./create_form.jsp'">등록</button>
  <%
  }
  %>             
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



