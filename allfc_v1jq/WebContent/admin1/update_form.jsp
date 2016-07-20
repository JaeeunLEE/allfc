<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
String email = request.getParameter("email");
%>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
window.onload = function(){
  frm.email.focus();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV class='content'>
<FORM name='frm' method='POST' action='./update_proc.jsp'>
  <input type='hidden' name='admin1no' value='<%=admin1no %>'>    
        
  <fieldset class='fieldset'>
    <legend class='legend'>관리자 > 회원 정보 변경</legend>
    <ul>
      <li>
       <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' required="required" value="<%=email %>" size=30>
      </li>
      <li class='center'>
        <button type="submit">변경 적용</button>
        <button type='button' id='close' onclick='window.close()'>닫기</button> 
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>
 
</body>
<!-- -------------------------------------------- -->
</html> 
 