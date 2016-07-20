package web.url3;

public class UrlVO {
//  urlno  INT                 NOT NULL AUTO_INCREMENT, -- URL 번호
//  title    VARCHAR(100)  NOT NULL, -- 웹 사이트 제목
//  web    VARCHAR(200)  NOT NULL, -- URL 주소
//  cnt     INT                 NOT NULL, -- 방문자 수 
//  rdate  DATETIME        NOT NULL, -- 등록일
//  PRIMARY KEY(urlno)
  
  private int urlno;
  private String title;
  private String web;
  private int cnt;
  private String rdate;
  
  public int getUrlno() {
    return urlno;
  }
  public void setUrlno(int urlno) {
    this.urlno = urlno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getWeb() {
    return web;
  }
  public void setWeb(String web) {
    this.web = web;
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
