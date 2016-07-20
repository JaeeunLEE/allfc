- 기존의 테이블 삭제
     DROP TABLE notice;
   
   CREATE TABLE notice( 
     noticeno INT                 NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 공지사항 번호
     title        VARCHAR(100)  NOT NULL, -- 제목
     content  VARCHAR(4000)  NOT NULL, -- 내용
     rname    VARCHAR(15)    NOT NULL, -- 등록자
     passwd  VARCHAR(15)    NOT NULL, -- 패스워드
     cnt        INT                    NOT NULL, -- 조회수
     rdate     DATETIME         NOT NULL  -- 등록일
   );  
 
    
2) 테이블 삭제
   DROP TABLE notice;
 
 
3) 등록
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('내일은 구름 조금', '내용', '왕눈이', '1234', 0, now());
 
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('맑은 날이 좋아', '내용', '왕눈이', '1234', 0, now()); 
   
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('주말에 하루는 복습', '내용', '왕눈이', '1234', 0, now()); 
 
   
4) 목록
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice 
   ORDER BY noticeno ASC;
   
 noticeno title      content rname passwd cnt rdate
 -------- ---------- ------- ----- ------ --- ---------------------
        1 내일은 구름 조금  내용      왕눈이   123      0 2015-11-12 14:45:56.0
        2 맑은 날이 좋아   내용      왕눈이   123      0 2015-11-12 14:45:57.0
        3 주말에 하루는 복습 내용      왕눈이   123      0 2015-11-12 14:45:58.0
 
 
 
 
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice 
   ORDER BY noticeno DESC;
 
    noticeno title      content rname passwd cnt rdate
 -------- ---------- ------- ----- ------ --- ---------------------
        3 주말에 하루는 복습 내용      왕눈이   123      0 2015-11-12 14:45:58.0
        2 맑은 날이 좋아   내용      왕눈이   123      0 2015-11-12 14:45:57.0
        1 내일은 구름 조금  내용      왕눈이   123      0 2015-11-12 14:45:56.0
 
 
   
5) 조회
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice
   WHERE noticeno = 1;
   
 noticeno title     content rname passwd cnt rdate
 -------- --------- ------- ----- ------ --- ---------------------
        1 내일은 구름 조금 내용      왕눈이   123      0 2015-11-12 14:45:56.0
 

6) 패스워드 검사
   SELECT COUNT(*) as cnt From notice
   WHERE noticeno=1 AND passwd='1234';

   - SQL에 대응하는 메소드
     public int passwordCheck(int noticeno, String passwd){ ... }

     1: 패스워드 일치, 0: 패스워드 일치하지 않음.

 
7) 수정
   UPDATE notice
   SET title = '자바 소식', content = '내용 2', rname = '아로미' 
   WHERE noticeno = 1;

   - SQL에 대응하는 메소드
     public int update(NoticeVO vo){ ... }

 
8) 삭제
① 하나의 레코드 삭제
    DELETE FROM notice
    WHERE noticeno = 1;
 
 
② 모든 레코드 삭제(주의)
    DELETE FROM notice4;
   
 
9) 조회수 증가
UPDATE notice
SET cnt = cnt + 1
WHERE noticeno=2;
















============================================================================

1. notice 테이블 구조 
>>>>> /WebContent/WEB-INF/doc/notice_q.sql 
--------------------------------------------------------------------
1. notice 테이블의 생성 
   - PRIMARY KEY(noticeno): noticeno컬럼의 값이 2번이상 등록되는 것을 차단, 중복 제거
 
   CREATE TABLE notice(
   	noticeno INT NOT NULL AUTO_INCREMENT COMMENT '번호',
   	title VARCHAR(100) NOT NULL COMMENT '내용',
   	rname VARCHAR(15) NOT NULL COMMENT '성명',
   	rdate DATETIME NOT NULL COMMENT '등록일',
   	PRIMARY KEY(noticeno)
   );
   
2. 테이블 삭제
	DROP TABLE notice;
 
3. 등록
 INSERT INTO notice(title, rname, rdate)
 values('내일은 구름 조금', '왕눈이', now());
 
 INSERT INTO notice(title, rname, rdate)
 values('4월 개발 일정', '아로미', now());
 
 INSERT INTO notice(title, rname, rdate)
 values('3월 급여 안내', '왕눈이', now());
   
4. 목록
	SELECT noticeno, title, rname, rdate
	FROM notice
	ORDER BY noticeno DESC;
	

5. 조회
	SELECT noticeno, title, rname, rdate
	FROM notice
	WHERE noticeno = 1;
 
  

6. 수정 처리

UPDATE notice
SET title = '자바 소식', rname = '투투'
WHERE noticeno = 1;

 
7. 삭제
1) 하나의 레코드 삭제

 DELETE FROM notice
 WHERE noticeno = 1;
 
2) 모든 레코드 삭제(주의)
 DELETE FROM notice;