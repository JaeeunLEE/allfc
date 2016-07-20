package web.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import web.pds3.Pds3VO;
import web.tool.DBClose;
import web.tool.DBOpen;

public class ReviewDAO {
  Connection con = null; // DBMS 연결
  PreparedStatement pstmt = null; // SQL 실행
  ResultSet rs = null; // SELECT 결과 저장
  StringBuffer sql = null; // SQL 문장
  int count = 0;
  
  DBOpen dbopen = null;
  DBClose dbclose = null;
  
  public ReviewDAO(){ // 생성자, 기본값 할당
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }
  
  public int insert(ReviewVO vo) {
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url1, url2,");
      sql.append(" file1, file2, file3, size1, size2, size3, map, ip, thumb)");
      sql.append(" VALUES(?, ?, ?, ?, ?, 0, now(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getRname());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getTitle());
      pstmt.setString(4, vo.getContent());
      pstmt.setString(5, vo.getPasswd());
      pstmt.setString(6, vo.getUrl1());
      pstmt.setString(7, vo.getUrl2());
      pstmt.setString(8, vo.getFile1());
      pstmt.setString(9, vo.getFile2());
      pstmt.setString(10, vo.getFile3());
      pstmt.setLong(11, vo.getSize1());
      pstmt.setLong(12, vo.getSize2());
      pstmt.setLong(13, vo.getSize3());
      pstmt.setString(14, vo.getMap());
      pstmt.setString(15, vo.getIp());
      pstmt.setString(16, vo.getThumb());
//      pstmt.setString(15, vo.getIp());
//      pstmt.setString(16, vo.getViewyn());
      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

    return count;
  }
  
  
  
  public ArrayList<ReviewVO> list() {
    ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
      sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
      sql.append(" FROM review");
      sql.append(" ORDER BY reviewno DESC");

      pstmt = con.prepareStatement(sql.toString());
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        ReviewVO vo = new ReviewVO();

        vo.setReviewno(rs.getInt("reviewno")); // Record -> 자바 객체
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl1(rs.getString("url1"));
        vo.setUrl2(rs.getString("url2"));
        vo.setFile1(rs.getString("file1"));
        vo.setFile2(rs.getString("file2"));
        vo.setFile3(rs.getString("file3"));
        vo.setSize1(rs.getLong("size1"));
        vo.setSize2(rs.getLong("size2"));
        vo.setSize3(rs.getLong("size3"));
        vo.setMap(rs.getString("map"));
        vo.setIp(rs.getString("ip"));
        vo.setVisible(rs.getString("visible"));
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
  
  

  /**
   * 검색 목록을 추출합니다
   * col: 검색컬럼
   * word: 검색어
   * 
   * @return : 검색된 레코드 목록
   */
  public ArrayList<ReviewVO> list(String col, String word) {
    ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법
      sql = new StringBuffer();

      if(col.equals("none")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
      }else if(col.equals("rname")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE rname LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title_content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ? OR content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
      }
      
      
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        ReviewVO vo = new ReviewVO();

        vo.setReviewno(rs.getInt("reviewno")); // Record -> 자바 객체
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl1(rs.getString("url1"));
        vo.setUrl2(rs.getString("url2"));
        vo.setFile1(rs.getString("file1"));
        vo.setFile2(rs.getString("file2"));
        vo.setFile3(rs.getString("file3"));
        vo.setSize1(rs.getLong("size1"));
        vo.setSize2(rs.getLong("size2"));
        vo.setSize3(rs.getLong("size3"));
        vo.setMap(rs.getString("map"));
        vo.setIp(rs.getString("ip"));
        vo.setVisible(rs.getString("visible"));
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
  
  
  /**
   * 검색 목록을 가져옵니다.
   * @param col 검색 컬럼
   * @param word 검색어
   * @param nowPage 현재 페이지
   * @return 검색된 목록
   */
  public ArrayList<ReviewVO> list(String col, String word, int nowPage, int recordPerPage){ 
    ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
    
//  int recordPerPage = 4; // 한페이지에 n개씩 출력
  int offset = (nowPage -1) * recordPerPage; //페이지당 skip할 레코드 갯수

 

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법
      sql = new StringBuffer();

      if(col.equals("none")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
      }else if(col.equals("rname")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE rname LIKE ?");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ?");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title_content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ? OR content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");
        sql.append(" LIMIT " + offset + ", " + recordPerPage);

        pstmt = con.prepareStatement(sql.toString());
      }
      
      
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        ReviewVO vo = new ReviewVO();

        vo.setReviewno(rs.getInt("reviewno")); // Record -> 자바 객체
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl1(rs.getString("url1"));
        vo.setUrl2(rs.getString("url2"));
        vo.setFile1(rs.getString("file1"));
        vo.setFile2(rs.getString("file2"));
        vo.setFile3(rs.getString("file3"));
        vo.setSize1(rs.getLong("size1"));
        vo.setSize2(rs.getLong("size2"));
        vo.setSize3(rs.getLong("size3"));
        vo.setMap(rs.getString("map"));
        vo.setIp(rs.getString("ip"));
        vo.setVisible(rs.getString("visible"));
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
  
  
  
  
  public void increaseCnt(int reviewno) {  //조회수 증가 메서드
    // 처리된 레코드 갯수

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" UPDATE review");
      sql.append(" SET cnt = cnt + 1");
      sql.append(" WHERE reviewno=?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, reviewno);

      count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      // rs = pstmt.executeQuery(); // SELECT

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt);
    }

  }
  
  public ReviewVO read(int reviewno){ //조회 메서드
    ReviewVO vo = new ReviewVO();
    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법

      sql = new StringBuffer();
      sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
      sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
      sql.append(" FROM review");
      sql.append(" WHERE reviewno = ?");

      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, reviewno);
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT
      

      if (rs.next() == true) {

        
        vo.setReviewno(rs.getInt("reviewno")); // Record -> 자바 객체
        vo.setRname(rs.getString("rname"));
        vo.setEmail(rs.getString("email"));
        vo.setTitle(rs.getString("title"));
        vo.setContent(rs.getString("content"));
        vo.setPasswd(rs.getString("passwd"));
        vo.setCnt(rs.getInt("cnt"));
        vo.setRdate(rs.getString("rdate"));
        vo.setUrl1(rs.getString("url1"));
        vo.setUrl2(rs.getString("url2"));
        vo.setFile1(rs.getString("file1"));
        vo.setFile2(rs.getString("file2"));
        vo.setFile3(rs.getString("file3"));
        vo.setSize1(rs.getLong("size1"));
        vo.setSize2(rs.getLong("size2"));
        vo.setSize3(rs.getLong("size3"));
        vo.setMap(rs.getString("map"));
        vo.setIp(rs.getString("ip"));
        vo.setVisible(rs.getString("visible"));
        vo.setThumb(rs.getString("thumb"));

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return vo;
  }
  
  public int passwordCheck(int reviewno, String passwd){
    try{
      con = dbopen.getConnection();
      
      sql = new StringBuffer();
      sql.append(" SELECT COUNT(*) as cnt");
      sql.append(" FROM review ");
      sql.append(" WHERE reviewno=? AND passwd=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setInt(1, reviewno);
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
  
  public int update(ReviewVO vo){
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE review");
      sql.append(" SET rname=?, email=?, title=?, content=?,");
      sql.append(" url1=?, url2=?, file1=?, file2=?,");
      sql.append(" file3=?, size1=?, size2=?, size3=?, map=?, ip=?, thumb=?");
      sql.append(" WHERE reviewno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, vo.getRname());
      pstmt.setString(2, vo.getEmail());
      pstmt.setString(3, vo.getTitle());       
      pstmt.setString(4, vo.getContent());  
      pstmt.setString(5, vo.getUrl1());
      pstmt.setString(6, vo.getUrl2());
      pstmt.setString(7, vo.getFile1());
      pstmt.setString(8, vo.getFile2());
      pstmt.setString(9, vo.getFile3());
      pstmt.setLong(10, vo.getSize1());
      pstmt.setLong(11, vo.getSize2());
      pstmt.setLong(12, vo.getSize3());
      pstmt.setString(13, vo.getMap());
      pstmt.setString(14, vo.getIp());
      pstmt.setString(15, vo.getThumb());
      pstmt.setInt(16, vo.getReviewno());
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  public int delete(int reviewno){
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" DELETE FROM review");
      sql.append(" WHERE reviewno=?");
      
      pstmt = con.prepareStatement(sql.toString());

      pstmt.setInt(1, reviewno);
      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
 
    return count;
  }
  
  public void visible(int reviewno, String visible){
    try{
      con = dbopen.getConnection();
 
      sql = new StringBuffer();
      sql.append(" UPDATE review");
      sql.append(" SET visible=?");
      sql.append(" WHERE reviewno=?");
      
      pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(1, visible);
      pstmt.setInt(2, reviewno);

      
      count = pstmt.executeUpdate();
      
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      dbclose.close(con, pstmt);
    }
  }
 
  
  /**검색된 레코드 갯수를 구합니다
  *
  * 
  * return 검색된 갯수
  */
 
 public int count(String col, String word){
    int count=0;

    try {
      con = new DBOpen().getConnection(); // 객체를 만들어 메소드를 하나만 호출할 때 쓰는방법
      sql = new StringBuffer();

      if(col.equals("none")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
      }else if(col.equals("rname")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE rname LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
      }else if(col.equals("title_content")){
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" WHERE title LIKE ? OR content LIKE ?");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
        pstmt.setString(1, "%"+word+"%");
        pstmt.setString(2, "%"+word+"%");
      }else{
        sql.append(" SELECT reviewno,rname,email, title, content, passwd, cnt, SUBSTRING(rdate, 1, 10) as rdate,");
        sql.append(" url1, url2, file1, file2, file3, size1, size2, size3, map, ip, visible, thumb");
        sql.append(" FROM review");
        sql.append(" ORDER BY reviewno DESC");

        pstmt = con.prepareStatement(sql.toString());
      }
      
      
      // count = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {

        count += 1;
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      new DBClose().close(con, pstmt, rs);
    }

    return count;
  }
}
