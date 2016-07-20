package web.admin1;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.tool.DBClose;
import web.tool.DBOpen;
 
public class Admin1DAO {
  DBOpen dbopen = null;  // �ʵ�
  DBClose dbclose = null;
  
  Connection con = null; // DBMS ����
  PreparedStatement pstmt = null; // SQL ����
  ResultSet rs = null; // SELECT ��� ����
  StringBuffer sql = null; // SQL ����
  int count = 0;
  
  public Admin1DAO(){ // ������, �⺻�� �Ҵ�, return type ����, Ŭ���� �̸��� ����
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  
  public int count(String col, String word){
    int count = 0;

    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��
      sql = new StringBuffer();

      sql.append(" SELECT COUNT(*) as cnt");
      sql.append(" FROM admin1");
      sql.append(" WHERE "+ col + " = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, word);

      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      rs.next(); //ù ��° ���ڵ�� �̵�  , 0 or
      count = rs.getInt("cnt");


    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return count;
  }
  
  
  
  
  /**
   * ������ ���
   * @param vo ������ ����
   * @return 1: ��� ����, 0: ��� ����
   */
  public int insert(Admin1VO vo){
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)");
      sql.append(" values(?, ?, ?, ?, ?, now())");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getEmail());
      pstmt.setString(2, vo.getPasswd());
      pstmt.setString(3, vo.getAuth());
      pstmt.setString(4, vo.getAct());
      pstmt.setString(5, vo.getConfirm());

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  
 
  
  
  /**
   * ����ڰ� ȸ�� ���� �̸��� ��ũ�� ������ ����� ó��
   * @param email �̸���
   * @param auth ���� �ڵ�
   * @return ó���� ���ڵ� ����
   */
  public int confirm(String email, String auth){
    Connection con = null;  // DBMS ����
    PreparedStatement pstmt = null; // SQL ����
    StringBuffer sql = null; // SQL ��
    int count = 0;            // ó���� ���ڵ� ����
 
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET confirm = 'Y'");
      sql.append(" WHERE email=? AND auth=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, auth);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  
  
  
  /**
   * �ܼ� ����� ���մϴ�.
   * @return ���
   */
  public ArrayList<Admin1VO> list(){

    ArrayList<Admin1VO> list = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" ORDER BY email ASC");
        
      pstmt = con.prepareStatement(sql.toString());
      rs= pstmt.executeQuery();  // SELECT
      
      list = new ArrayList<Admin1VO>();
      while(rs.next() == true){
        Admin1VO vo = new Admin1VO();
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
        
        list.add(vo);
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return list;
  }
  
  
  
  
  /**
   * ������ �����մϴ�.
   * @param admin1no ������ ȸ�� ��ȣ
   * @param act ����
   * @return ����� ���ڵ� ��
   */
  public int updateAct(int admin1no, String act){ 
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET  act=?");
      sql.append(" WHERE admin1no=?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, act);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  /**
   * �н����尡 ��ġ�ϴ��� Ȯ���մϴ�.
   * @param admin1no ȸ�� ��ȣ
   * @param passwd �н�����
   * @return 1: ��ġ, 0: ����ġ
   */
  public int countPasswd(int admin1no, String passwd){ 
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT count(*) as cnt");
      sql.append(" FROM admin1");
      sql.append(" WHERE admin1no =? AND passwd=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);
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

  /**
   * �н����带 �����մϴ�.
   * @param admin1no ������ ȸ�� ��ȣ
   * @param passwd ������ �н�����
   * @return 1: ���� ����, 2: ���� ����
   */
  public int updatePasswd(int admin1no, String passwd){ 
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET passwd=?");
      sql.append(" WHERE admin1no=?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, passwd);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  
  
  /**
   * ȸ�� ������ �����մϴ�.
   * @param admin1no ȸ�� ��ȣ
   * @param email ������ �̸���
   * @return ����� ���ڵ� ����
   */
  public int update(int admin1no, String email){ 
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET email = ?");
      sql.append(" WHERE admin1no = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  /**
   * ȸ���� �����մϴ�.
   * @param admin1no ������ ȸ�� ��ȣ
   * @return �赥�� ���ڵ� ����
   */
  public int delete(int admin1no){
    try {
      con = new DBOpen().getConnection(); // ��ü�� ����� �޼ҵ带 �ϳ��� ȣ���� �� ���¹��

      sql = new StringBuffer();
      sql.append(" DELETE FROM admin1");
      sql.append(" WHERE admin1no = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //ó���������
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
      

  /**
   * �α��� ó��
   * @param email �̸���
   * @param passwd �н�����
   * @return ���ڵ� ����
   */
  public int login(String email, String passwd){
 
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE email=? AND passwd=?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setString(2, passwd);
      
      rs= pstmt.executeQuery();  // SELECT
      rs.next();  // ù��° ���ڵ�� �̵�, 0 or 
      count = rs.getInt("cnt");     
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }
  
  
  
  /**
   * �Ѱ��� ���ڵ� ��ȸ
   * @param admin1no ��ȸ�� ��ȣ
   * @return
   */
  public Admin1VO read(int admin1no){
    Admin1VO vo = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE admin1no = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);
      rs= pstmt.executeQuery();  // SELECT
      
      vo = new Admin1VO();
      if(rs.next() == true){
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return vo;
  }
  
  
  
  
  
  
  
  
  
  /*
   * �α��� ���� üũ
   */
  public Admin1VO read(String email){
    Admin1VO vo = null;
    
    try{
      con = dbopen.getConnection();
      sql = new StringBuffer();
      sql.append(" SELECT admin1no, email, passwd, auth, act, confirm, mdate ");
      sql.append(" FROM admin1 ");
      sql.append(" WHERE email = ?");
        
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      rs= pstmt.executeQuery();  // SELECT
      
      vo = new Admin1VO();
      if(rs.next() == true){
        vo.setAdmin1no(rs.getInt("admin1no"));
        vo.setEmail(rs.getString("email"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setAuth(rs.getString("auth"));
        vo.setAct(rs.getString("act"));
        vo.setConfirm(rs.getString("confirm"));
        vo.setMdate(rs.getString("mdate"));
      }
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return vo;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  public static void main(String[] args){
    Admin1DAO dao = new Admin1DAO();
//    System.out.println(dao.count("email","test1@mail.com"));
//    System.out.println("Master: "+ dao.count("act","M"));
  }
}