1. notice 테이블 구조 
>>>>> /WebContent/WEB-INF/doc/notice_q.sql 
--------------------------------------------------------------------
1. notice 테이블의 생성 
   - PRIMARY KEY(noticeno): noticeno컬럼의 값이 2번이상 등록되는 것을 차단, 중복 제거
 
   CREATE TABLE news(
   	newsno INT NOT NULL AUTO_INCREMENT COMMENT '번호',
   	title VARCHAR(100) NOT NULL COMMENT '내용',
   	newsurl VARCHAR(100) NOT NULL COMMENT 'URL',
   	rdate DATETIME NOT NULL COMMENT '등록일',
   	PRIMARY KEY(newsno)
   );
   
2. 테이블 삭제
	DROP TABLE news;
 
3. 등록
 INSERT INTO news(title, newsurl, rdate)
 values('내일은 구름 조금', 'naver.com', now());
 
 INSERT INTO news(title, newsurl, rdate)
 values('4월 개발 일정', 'daum.net', now());
 
 INSERT INTO news(title, newsurl, rdate)
 values('3월 급여 안내', 'google.com', now());
   
4. 목록
	SELECT newsno, title, newsurl, rdate
	FROM news
	ORDER BY newsno ASC;
	
   
5. 조회
	SELECT newsno, title, newsurl, rdate
	FROM news
	WHERE newsno = 1;
 
        

6. 수정

UPDATE news
SET title = '자바 소식', rname = '투투'
WHERE newsno = 1;

 
7. 삭제
1) 하나의 레코드 삭제

 DELETE FROM news
 WHERE newsno = 1;
 
2) 모든 레코드 삭제(주의)
 DELETE FROM news;