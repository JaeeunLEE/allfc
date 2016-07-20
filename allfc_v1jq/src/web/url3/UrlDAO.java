package web.url3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class UrlDAO {
  Connection con = null;          // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null;            //SELECT 결과 저장
  StringBuffer sql = null;                 // SQL 문장
  int count = 0; 
  
  public int insert(UrlVO vo){
                        // 처리된 레코드 갯수
    
    try{
      con = new DBOpen().getConnection(); //객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" INSERT INTO url(title, web, cnt, rdate)");
      sql.append(" values(?, ?, 0, now())");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getWeb());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery();    // SELECT 
   
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      new DBClose().close(con, pstmt);
    }
    
    return count;
  }
  
  public ArrayList<UrlVO> list(){
    ArrayList<UrlVO> list = new ArrayList<UrlVO>();
    
    try{
      con = new DBOpen().getConnection(); //객체를 만들어 메소드를 하나만 호출할 때 쓰는방법
      
      sql = new StringBuffer();
      sql.append(" SELECT urlno, title, cnt, web, rdate");
      sql.append(" FROM url");
      sql.append(" ORDER BY urlno DESC");

      pstmt = con.prepareStatement(sql.toString());
//       count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery();    // SELECT 
     
      while(rs.next() == true){
        
        UrlVO vo = new UrlVO();
        
        vo.setUrlno(rs.getInt("urlno"));  //Record -> 자바 객체
        vo.setTitle(rs.getString("title"));
        vo.setWeb(rs.getString("web"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate").substring(0,10));
        
        list.add(vo);
        
//   <tr>
//    <td class='td'><%=rs.getInt("noticeno") %></td>
//    <td class='td'><%=rs.getString("title") %></td>
//    <td class='td'><%=rs.getString("rname") %></td>
//    <td class='td'><%=rs.getString("rdate").substring(0,10) %></td>
//    <td class='td'>
//    <A href='./update_form.jsp?noticeno=<%=rs.getInt("noticeno") %>'>수정</A>
//    <A href='./delete_form.jsp?noticeno=<%=rs.getInt("noticeno") %>'>삭제</A>
//   </td>


      }

    }catch(Exception e){
      e.printStackTrace();
    }finally{
      new DBClose().close(con, pstmt, rs);
    }
    
    return list;
  }
  
  public UrlVO read(int noticeno) {   //Call by Value
    // ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    UrlVO vo = new UrlVO();
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT urlno, title, cnt, web, rdate");
      sql.append(" FROM url");
      sql.append(" WHERE urlno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      if (rs.next() == true) {

        vo.setUrlno(rs.getInt("urlno")); // Record -> 자바 객체
        vo.setTitle(rs.getString("title"));
        vo.setWeb(rs.getString("web"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate").substring(0, 10));

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return vo;
  }

  public int update(UrlVO vo) {  //Call by Reference
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE url");
      sql.append(" SET title = ?, web = ?");
      sql.append(" WHERE urlno = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getWeb());
      pstmt.setInt(3, vo.getUrlno());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  public int delete(int urlno) {  //Call by Value
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" DELETE FROM url");
      sql.append(" WHERE urlno = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, urlno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  
  
  public void increaseCnt(int urlno) {  //조회수 증가 메서드
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE url");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE urlno=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, urlno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

  }
}
