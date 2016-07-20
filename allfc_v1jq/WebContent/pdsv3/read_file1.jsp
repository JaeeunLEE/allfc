<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>
 
<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
// out.println("pdsno: " + pdsno);
Pds3VO vo = pds3DAO.read(pdsno);
// pdsno, file1
JSONObject obj = new JSONObject();
obj.put("pdsno", vo.getPdsno()); 
obj.put("file1", vo.getFile1());
 
out.print(obj); // {"pdsno":29,"file1":"ro17.jpg"} 
%>