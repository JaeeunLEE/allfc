package web.notice4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class NoticeDAO {
  Connection con = null; // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null; // SELECT 결과 저장
  StringBuffer sql = null; // SQL 문장
  int count = 0;

  public int insert(NoticeVO vo) {
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" INSERT INTO notice(title, content, rname, passwd, cnt, rdate)");
      sql.append(" values(?, ?, ?, ?, 0, now())");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getRname());
      pstmt.setString(4, vo.getPasswd());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }

  public ArrayList<NoticeVO> list() {
    ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, cnt, rdate");
      sql.append(" FROM notice");
      sql.append(" ORDER BY noticeno DESC");

      pstmt = con.prepareStatement(sql.toString());
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        NoticeVO vo = new NoticeVO();

        vo.setNoticeno(rs.getInt("noticeno")); // Record -> 자바 객체
        vo.setTitle(rs.getString("title"));
        vo.setRname(rs.getString("rname"));
        vo.setContent(rs.getString("content"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate").substring(0, 10));

        list.add(vo);

        // <tr>
        // <td class='td'><%=rs.getInt("noticeno") %></td>
        // <td class='td'><%=rs.getString("title") %></td>
        // <td class='td'><%=rs.getString("rname") %></td>
        // <td class='td'><%=rs.getString("rdate").substring(0,10) %></td>
        // <td class='td'>
        // <A href='./update_form.jsp?noticeno=<%=rs.getInt("noticeno")
        // %>'>수정</A>
        // <A href='./delete_form.jsp?noticeno=<%=rs.getInt("noticeno")
        // %>'>삭제</A>
        // </td>

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return list;
  }

  public NoticeVO read(int noticeno) { // Call by Value
    // ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    NoticeVO vo = new NoticeVO();
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT noticeno, title, content, rname, passwd, cnt, rdate");
      sql.append(" FROM notice");
      sql.append(" WHERE noticeno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      if (rs.next() == true) {

        vo.setNoticeno(rs.getInt("noticeno")); // Record -> 자바 객체
        vo.setTitle(rs.getString("title"));
        vo.setRname(rs.getString("rname"));
        vo.setContent(rs.getString("content"));
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

  public int update(NoticeVO vo) { // Call by Reference
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE notice");
      sql.append(" SET title = ?, content = ?, rname = ?");
      sql.append(" WHERE noticeno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getRname());
      pstmt.setInt(4, vo.getNoticeno());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }

  public int delete(int noticeno) { // Call by Value
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" DELETE FROM notice");
      sql.append(" WHERE noticeno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }

  public int passwordCheck(int noticeno, String passwd) {
    // ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
//    NoticeVO vo = new NoticeVO();
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt From notice");
      sql.append(" WHERE noticeno=? AND passwd=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);
      pstmt.setString(2, passwd);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT
      
      if (rs.next() == true) {
        count = rs.getInt("cnt");
      }else{
        count = 0;
      }
     

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;

  }
  
  
  
  
  
  
  public void increaseCnt(int noticeno) {  //조회수 증가 메서드
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE notice");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE noticeno=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, noticeno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

  }
}
