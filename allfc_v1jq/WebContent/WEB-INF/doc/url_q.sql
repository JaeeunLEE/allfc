1. notice 테이블 구조 
>>>>> /WebContent/WEB-INF/doc/url_q.sql 
--------------------------------------------------------------------
1. notice 테이블의 생성 
   - PRIMARY KEY(noticeno): noticeno컬럼의 값이 2번이상 등록되는 것을 차단, 중복 제거
 
   CREATE TABLE url( 
     urlno  INT                 NOT NULL AUTO_INCREMENT, -- URL 번호
     title    VARCHAR(100)  NOT NULL, -- 웹 사이트 제목
     web    VARCHAR(200)  NOT NULL, -- URL 주소
     cnt     INT                 NOT NULL, -- 방문자 수 
     rdate  DATETIME        NOT NULL, -- 등록일
     PRIMARY KEY(urlno)
   );  
   
2. 테이블 삭제
	DROP TABLE url;
 
3. 등록
 INSERT INTO url(title, web, rdate)
 values('다음', 'daum.net', now());

   
4. 목록
	SELECT urlno, title, web, cnt, rdate
	FROM url
	ORDER BY urlno DESC;
	

5. 조회
	SELECT urlno, title, web, rdate
	FROM url
	WHERE urlno = 1;
 
  

6. 수정 처리

UPDATE url
SET title = '자바 소식', web = '투투'
WHERE urlno = 1;

 
7. 삭제
1) 하나의 레코드 삭제

 DELETE FROM url
 WHERE urlno = 1;
 
2) 모든 레코드 삭제(주의)
 DELETE FROM url;