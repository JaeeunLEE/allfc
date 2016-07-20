package web.notice4;

public class NoticeVO {
//  noticeno INT NOT NULL AUTO_INCREMENT COMMENT '번호',
//  title VARCHAR(100) NOT NULL COMMENT '내용',
//  rname VARCHAR(15) NOT NULL COMMENT '성명',
//  rdate DATETIME NOT NULL COMMENT '등록일',
  
  private int noticeno;
  private String title;
  private String content;
  private String rname;
  private String passwd;
  private int cnt;
  private String rdate;
  
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRname() {
    return rname;
  }
  public void setRname(String rname) {
    this.rname = rname;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
