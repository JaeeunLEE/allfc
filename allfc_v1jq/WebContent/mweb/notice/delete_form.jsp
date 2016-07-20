<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>

<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));

NoticeVO vo = noticeDAO.read(noticeno);

JSONObject obj = new JSONObject();
obj.put("noticeno", noticeno);
obj.put("title", vo.getTitle());
obj.put("content", vo.getContent());
obj.put("rname", vo.getRname());
obj.put("passwd", vo.getPasswd());
obj.put("cnt", vo.getCnt());
obj.put("rdate", vo.getRdate());

out.print(obj);
%>

