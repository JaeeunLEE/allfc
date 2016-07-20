<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./auth.jsp" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
  window.onload = function(){
    find('email_dns').addEventListener('change', email_dns_p);
  }
   
  function email_dns_p(){
//     alert('변경됨' + find('email_dns').value);
//     find('email').value = find('email_dns').value;
    var email = find('email').value;
    var position = email.indexOf('@'); //test1@mail.com
    if(position >= 0){
      email = email.substring(0,position); //test1
    }
    var email_dns = find('email_dns').value;
    if(email_dns == 'none'){
      find('email').value = email + '@';
      find('email').focus(); //입력 커서 이동
    }else{
      find('email').value = email + '@' + email_dns;
    }
  }

  function email_duplicate(){
 
    var url = './email_proc.jsp?email=' + frm.email.value;
    var win = window.open(url, '중복 이메일 검사', 'width=500px, height=440px, scrollbars=no');
    
    var x = (screen.width - 500) / 2;
    var y = (screen.height - 440) / 2;
    
    win.moveTo(x, y); // 화면 이동
  }
  
 
  function send(){
    if (passwd_p() == false){
      id('passwd').focus();
      return false;
    }
    return true;
  }
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
 
<DIV class='content'>
<FORM name='frm' method='POST' action='./create_proc.jsp'
            onsubmit="return send();">
  <fieldset>
    <legend class='legend'>관리자 > 등록</legend>
    <ul>
      <li>
        <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' required="required" value='test@mail.com'>
        <select id='email_dns'>
          <option value='none'>직접 입력</option>
          <option value='gmail.com'>gmail.com</option>
          <option value='daum.net'>daum.net</option>
          <option value='naver.com'>naver.com</option>
          <option value='nate.com'>nate.com</option>
          <option value='hotmail.com'>hotmail.com</option>
        </select>
        <span class='link'><A href='javascript: email_duplicate();'>이메일 중복 검사</A></span> 
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <input type='password' name='passwd' id='passwd' value='1234'>
        <span id='passwd_panel'></span> 
      </li>
 
      <li class='center'>
        <button type='submit'>등록</button>
        <button type='button' onclick='history.back();'>취소</button>
        
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 