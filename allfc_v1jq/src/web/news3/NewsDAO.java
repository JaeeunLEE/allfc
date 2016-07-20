package web.news3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;

public class NewsDAO {
  Connection con = null;          // DBMS ����
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null;            //SELECT ��� ����
  StringBuffer sql = null;                 // SQL ����
  int count = 0; 
  
  public int insert(NewsVO vo) {
    // ó���� ���ڵ� ����

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" INSERT INTO news(title, newsurl, rdate)");
      sql.append(" values(?, ?, now())");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getNewsurl());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  public ArrayList<NewsVO> list(){
    ArrayList<NewsVO> list = new ArrayList<NewsVO>();
    
    try{
      con = new DBOpen().getConnection(); //��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��
      
      sql = new StringBuffer();
      sql.append(" SELECT newsno, title, newsurl, rdate");
      sql.append(" FROM news");
      sql.append(" ORDER BY newsno DESC");

      pstmt = con.prepareStatement(sql.toString());
//       count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery();    // SELECT 
     
      while(rs.next() == true){
        
        NewsVO vo = new NewsVO();
        
        vo.setNewsno(rs.getInt("newsno"));  //Record -> �ڹ� ��ü
        vo.setTitle(rs.getString("title"));
        vo.setNewsurl(rs.getString("newsurl"));
        vo.setRdate(rs.getString("rdate").substring(0,10));
        
        list.add(vo);
        


      }

    }catch(Exception e){
      e.printStackTrace();
    }finally{
      new DBClose().close(con, pstmt, rs);
    }
    
    return list;
  }
  
  public NewsVO read(int newsno) {   //Call by Value
    // ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
    NewsVO vo = new NewsVO();
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" SELECT newsno, title, newsurl, rdate");
      sql.append(" FROM news");
      sql.append(" WHERE newsno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, newsno);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      if (rs.next() == true) {

        vo.setNewsno(rs.getInt("newsno")); // Record -> �ڹ� ��ü
        vo.setTitle(rs.getString("title"));
        vo.setNewsurl(rs.getString("newsurl"));
        vo.setRdate(rs.getString("rdate").substring(0, 10));

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return vo;
  }

  public int update(NewsVO vo) {  //Call by Reference
    // ó���� ���ڵ� ����

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" UPDATE news");
      sql.append(" SET title = ?, newsurl = ?");
      sql.append(" WHERE newsno = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getNewsurl());
      pstmt.setInt(3, vo.getNewsno());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  } 
  
  
  public int delete(int newsno) {  //Call by Value
    // ó���� ���ڵ� ����

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" DELETE FROM news");
      sql.append(" WHERE newsno = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, newsno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
}
