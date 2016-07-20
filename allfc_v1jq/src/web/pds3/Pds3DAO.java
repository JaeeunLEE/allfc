package web.pds3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.tool.DBClose;
import web.tool.DBOpen;
import web.tool.Log;

public class Pds3DAO {
  Connection con = null; // DBMS ����
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null; // SELECT ��� ����
  StringBuffer sql = null; // SQL ����
  int count = 0;
  
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  public Pds3DAO(){ // ������, �⺻�� �Ҵ�
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  public int insert(Pds3VO vo) {
    // ó���� ���ڵ� ����

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" INSERT INTO pds3(rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb)");
      sql.append(" values(?, ?, ?, ?, ?, 0, now(), ?, ?, ?, ?)");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getRname());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getTitle());
      pstmt.setString(4, vo.getContent());
      pstmt.setString(5, vo.getPasswd());
      pstmt.setString(6, vo.getUrl());
      pstmt.setString(7, vo.getFile1());
      pstmt.setLong(8, vo.getSize1());
      pstmt.setString(9, vo.getThumb());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      Log.w(e.toString());  //�α����Ͽ� ���
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
//list home list
  public ArrayList<Pds3VO> list(int count) {
    ArrayList<Pds3VO> list = new ArrayList<Pds3VO>();

    try {
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" SELECT pdsno, rname, title, cnt, SUBSTRING(rdate, 1, 10) as rdate, url, file1, size1, thumb");
      sql.append(" FROM pds3 ");
      sql.append(" Where visible = 'Y' ");
      sql.append(" ORDER BY pdsno DESC");
      sql.append(" LIMIT 0, 10");

      pstmt = con.prepareStatement(sql.toString());
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {
        Pds3VO vo = new Pds3VO();
        vo.setPdsno(rs.getInt("pdsno")); // DBMS -> JAVA ��ü
        vo.setRname(rs.getString("rname"));
        vo.setTitle(rs.getString("title"));
        vo.setCnt(rs.getInt("cnt"));

        vo.setUrl(rs.getString("url"));
        vo.setFile1(rs.getString("file1"));
        vo.setSize1(rs.getLong("size1"));
        vo.setThumb(rs.getString("thumb"));


        list.add(vo);
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }

    return list;
  }
  
  
  public ArrayList<Pds3VO> list() {
    ArrayList<Pds3VO> list = new ArrayList<Pds3VO>();

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" SELECT pdsno, rname, email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate, url, file1, size1, thumb");
      sql.append(" FROM pds3");
      sql.append(" ORDER BY pdsno DESC");

      pstmt = con.prepareStatement(sql.toString());
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        Pds3VO vo = new Pds3VO();

        vo.setPdsno(rs.getInt("pdsno")); // Record -> �ڹ� ��ü
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl(rs.getString("url"));
        vo.setFile1(rs.getString("file1"));
        vo.setSize1(rs.getLong("size1"));
        vo.setThumb(rs.getString("thumb"));

        list.add(vo);

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return list;
  }
  
  
  
  
  
  
  
  
  public void increaseCnt(int pdsno) {  //��ȸ�� ���� �޼���
    // ó���� ���ڵ� ����

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" UPDATE pds3");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE pdsno=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

  }
  
  public Pds3VO read(int pdsno){ //��ȸ �޼���
    Pds3VO vo = new Pds3VO();
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" SELECT pdsno, rname, email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate, url, file1, size1, thumb");
      sql.append(" FROM pds3");
      sql.append(" WHERE pdsno=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT
      

      if (rs.next() == true) {

        

        vo.setPdsno(rs.getInt("pdsno")); // Record -> �ڹ� ��ü
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl(rs.getString("url"));
        vo.setFile1(rs.getString("file1"));
        vo.setSize1(rs.getLong("size1"));
        vo.setThumb(rs.getString("thumb"));

       
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return vo;
  }
  
  public int passwordCheck(int pdsno, String passwd){
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt");
      sql.append(" FROM pds3 ");
      sql.append(" WHERE pdsno=? AND passwd=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, pdsno);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
     
      if(rs.next() == true){ 
        count = rs.getInt("cnt");
      }
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }
  
  public int update(Pds3VO vo){
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE pds3");
      sql.append(" SET rname=?, email=?, title=?,");
      sql.append("       content=?, url=?,");
      sql.append("       file1=?, size1=?, thumb=?");
      sql.append(" WHERE pdsno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getRname());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getTitle());       
      pstmt.setString(4, vo.getContent());  
      pstmt.setString(5, vo.getUrl());
      pstmt.setString(6, vo.getFile1());
      pstmt.setLong(7, vo.getSize1());
      pstmt.setString(8, vo.getThumb());
      pstmt.setInt(9, vo.getPdsno());
      
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  public int delete(int pdsno){
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" DELETE FROM pds3");
      sql.append(" WHERE pdsno=?");
      
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setInt(1, pdsno);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
}
