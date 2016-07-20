제목	[Chapter 02][PDS v3] 자료실 version 3.0, pds_v3jq, DBMS SQL, 사용 Query
[01] 자료실 version 3.0
      - Gallery, MP3, MP4, 도서 정보, 상품 정보, 펜션 정보등
        파일업로드가 사용되는 분야 

      - Eclipse Setting 
               type: Dynamic Web Project 
             name: pds_v3jq (v3: version 3.0, j: jsp, q: mysql)
          Package: web.pds3
            Library: /WEB-INF/lib/mysql-connector-java-5.1.37-bin.jar
            Folder: 파일 저장 폴더: /WebContent/file/storage   
                     전송시 임시 저장 폴더: /WebContent/file/temp

 


[02]  자료실의 제작 - Gallery
 
▷ /WebContent/WEB-INF/doc/pds3_q.sql 
--------------------------------------------------------------------
1. 게시판 테이블 구조 
 
DROP TABLE review; 
 
CREATE TABLE review ( 
  reviewno    MEDIUMINT      NOT NULL AUTO_INCREMENT,  -- 글 일련 번호 
  rname    VARCHAR(20)    NOT NULL,  -- 글쓴이
  email     VARCHAR(100)          NULL, -- 이메일  
  title       VARCHAR(200)  NOT NULL,  -- 제목(*) 
  content  VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)    NOT NULL,  -- 비밀 번호 
  cnt        SMALLINT        DEFAULT 0, -- 조회수, 기본값 사용 
  rdate     DATETIME        NOT NULL,  -- 등록 날짜, sysdate 
  url1        VARCHAR(100)        NULL,  -- URL1, 참고 주소
  url2        VARCHAR(100)        NULL,  -- URL2, 참고 주소
  file1       VARCHAR(100)         NULL, -- 파일명 1
  file2       VARCHAR(100)         NULL, -- 파일명 2
  file3       VARCHAR(100)         NULL, -- 파일명 3
  size1      BIGINT            DEFAULT 0, -- 파일 크기 1
  size2      BIGINT            DEFAULT 0, -- 파일 크기 2
  size3      BIGINT            DEFAULT 0, -- 파일 크기 3
  map        VARCHAR(1024)     NULL,
  ip         VARCHAR(15)       NULL,
  visible     CHAR(1)      DEFAULT 'Y'    NOT NULL,
  thumb  VARCHAR(100)    NULL,
  
  PRIMARY KEY (reviewno)  
); 
 
 
 
2. 글 추가(C: Create) 
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url1, url2,
              file1, file2, file3, size1, size2, size3, map, ip, viewyn)
VALUES('왕눈이', 'mail1@m.com', '하얀 동그라미 재판', '코카서스의 백묵원', '123', 0, now(),
            'http://art.incheon.go.kr', 'http://google.com', 'welcome.jpg', 'new.jpg',
            'a.jpg', 100, 200, 300, 'map123', '192.1.1.1', 'Y');
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('아로미', 'mail1', '하얀 동그라미 재판', '코카서스의 백묵원', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('베짱이', 'mail1', '하얀 동그라미 재판', '코카서스의 백묵원', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
3. 전체 글 목록(S:Total Select List), 최신글 먼저 출력 
   - ASC: 오름 차순, DESC: 내림 차순 
   
SELECT reviewno, rname, email, title, content, passwd, cnt, rdate, url1, url2,
file1, file2, file3, size1, size2, size3, map, ip, visible
FROM review
ORDER BY reviewno DESC;

1)list.jsp
SELECT pdsno, rname, title, cnt, rdate, url, file1, size1
FROM pds3
ORDER BY pdsno DESC;
 
2) substring(컬럼명, 시작위치, 길이), MySQL은 시작위치 1부터 시작
SELECT pdsno, rname, title, cnt, SUBSTRING(rdate, 1, 10), url, file1, size1
FROM pds3
ORDER BY pdsno DESC;

3) 컬럼 별명의 사용
 함수 사용시 컬럼명이 매우 길어지므로
 SUBSTRING(rdate, 1, 10) 문장을 as 키워드로 rdate로 변환합니다.

SELECT pdsno, rname, title, cnt, SUBSTRING(rdate, 1, 10) as rdate, url, file1, size1
FROM pds3
ORDER BY pdsno DESC;

4. 조회수 증가 
UPDATE review
SET cnt = cnt + 1
WHERE reviewno=1;

 
5. 1건의 글 보기(R:Read, PK 사용) 
SELECT reviewno, rname, email, title, content, passwd, cnt, rdate, url1, url2,
file1, file2, file3, size1, size2, size3, map, ip, visible
FROM review
WHERE reviewno=1;

 
6. 검색 글 목록(S:Search List), title 컬럼에 '제목'이란  
    단어가 들어가 있는 레코드 검색 
    - 목록은 재작시 검색을 기반으로 제작하며 전체 내용은
      전체 검색과도 같습니다.
   
    - rname, title, content 컬럼 대상
 
1) 이름이 '왕눈이'인 레코드 검색
- WHERE rname LIKE '아로미': WHERE rname = '아로미' 와 동일
 
 
- 검색 하지 않는 경우, 모든 레코드 출력
 
 
 
 
7. 페이징
   - 목록은 페이징 구현을 필수로 합니다.
   
1) 검색된 전체 레코드 수
 
        
   
2) 페이징
 
 
8. 패스워드 검사
   - COUNT(): 발생한 레코드의 수를 계산, 레코드가 없으면 0 출력
 
 
   
9. 글 수정(U:Update), PK는 레코드를 구분하는 고유 기능을 가지고 있음으로 
   수정하는 것은 권장하지 않음. 
    
1) 레코드 수정 
UPDATE review
SET rname='홍길동', email='a@a.com', title='테스트', content='내용',
url1='http://naver.com', url2='http://daum.net', file1='b.jpg', file2='new.jpg', 
file3='c.jpg', size1=150, size2=250, size3=350, 
map='map100', ip='127.0.0.1', viewyn='Y'
WHERE reviewno=1;
 
2) 변경 확인
 
 
 
10. 글 삭제(D:Delete) 
 DELETE FROM review
 WHERE reviewno=1;
                  
 
 컬럼추가:
 ALTER TABLE pds3
 ADD COLUMN visible CHAR(1) AFTER size1;
 
--------------------------------------------------------------------