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
  DBOpen dbopen = null;  // 필드
  DBClose dbclose = null;
  
  Connection con = null; // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null; // SELECT 결과 저장
  StringBuffer sql = null; // SQL 문장
  int count = 0;
  
  public Admin1DAO(){ // 생성자, 기본값 할당, return type 생략, 클래스 이름과 동일
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  
  public int count(String col, String word){
    int count = 0;

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법
      sql = new StringBuffer();

      sql.append(" SELECT COUNT(*) as cnt");
      sql.append(" FROM admin1");
      sql.append(" WHERE "+ col + " = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, word);

      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      rs.next(); //첫 번째 레코드로 이동  , 0 or
      count = rs.getInt("cnt");


    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return count;
  }
  
  
  
  
  /**
   * 관리자 등록
   * @param vo 관리자 내용
   * @return 1: 등록 성공, 0: 등록 실패
   */
  public int insert(Admin1VO vo){
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

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
   * 사용자가 회원 가입 이메일 링크를 눌렀을 경우의 처리
   * @param email 이메일
   * @param auth 인증 코드
   * @return 처리된 레코드 갯수
   */
  public int confirm(String email, String auth){
    Connection con = null;  // DBMS 연결
    PreparedStatement pstmt = null; // SQL 실행
    StringBuffer sql = null; // SQL 문
    int count = 0;            // 처리된 레코드 갯수
 
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
   * 단순 목록을 구합니다.
   * @return 목록
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
   * 권한을 변경합니다.
   * @param admin1no 변경할 회원 번호
   * @param act 권한
   * @return 변경된 레코드 수
   */
  public int updateAct(int admin1no, String act){ 
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET  act=?");
      sql.append(" WHERE admin1no=?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, act);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  /**
   * 패스워드가 일치하는지 확인합니다.
   * @param admin1no 회원 번호
   * @param passwd 패스워드
   * @return 1: 일치, 0: 불일치
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
   * 패스워드를 변경합니다.
   * @param admin1no 변경할 회원 번호
   * @param passwd 번경할 패스워드
   * @return 1: 변경 성공, 2: 변경 실패
   */
  public int updatePasswd(int admin1no, String passwd){ 
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET passwd=?");
      sql.append(" WHERE admin1no=?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, passwd);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  
  
  /**
   * 회원 정보를 수정합니다.
   * @param admin1no 회원 번호
   * @param email 변경할 이메일
   * @return 변경된 레코드 갯수
   */
  public int update(int admin1no, String email){ 
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE admin1");
      sql.append(" SET email = ?");
      sql.append(" WHERE admin1no = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, email);
      pstmt.setInt(2, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  /**
   * 회원을 삭제합니다.
   * @param admin1no 삭제할 회원 번호
   * @return 삭데된 레코드 갯수
   */
  public int delete(int admin1no){
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" DELETE FROM admin1");
      sql.append(" WHERE admin1no = ?");


      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, admin1no);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE  //처리결과리턴
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
      

  /**
   * 로그인 처리
   * @param email 이메일
   * @param passwd 패스워드
   * @return 레코드 갯수
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
      rs.next();  // 첫번째 레코드로 이동, 0 or 
      count = rs.getInt("cnt");     
 
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt, rs);
    }
 
    return count;
  }
  
  
  
  /**
   * 한건의 레코드 조회
   * @param admin1no 조회할 번호
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
   * 로그인 권한 체크
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