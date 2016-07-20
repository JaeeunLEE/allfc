<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
int admin1no = Integer.parseInt(request.getParameter("admin1no"));
String act = request.getParameter("act"); //선택된 권한
%>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
<%
admin1DAO.updateAct(admin1no, act);
%>
<script type="text/javascript">
  opener.location.reload(); //호출한 부모 윈도우 사용
  window.close(); //현재 창 닫기
</script>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 