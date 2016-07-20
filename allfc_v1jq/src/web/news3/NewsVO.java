package web.news3;

public class NewsVO {
//  CREATE TABLE news(
//      newsno INT NOT NULL AUTO_INCREMENT COMMENT '번호',
//      title VARCHAR(100) NOT NULL COMMENT '내용',
//      newsurl VARCHAR(100) NOT NULL COMMENT 'URL',
//      rdate DATETIME NOT NULL COMMENT '등록일',
//      PRIMARY KEY(newsno)
//     );
  
  private int newsno;
  private String title;
  private String newsurl;
  private String rdate;
  
  
  public int getNewsno() {
    return newsno;
  }
  public void setNewsno(int newsno) {
    this.newsno = newsno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getNewsurl() {
    return newsurl;
  }
  public void setNewsurl(String newsurl) {
    this.newsurl = newsurl;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}
