1. notice ���̺� ���� 
>>>>> /WebContent/WEB-INF/doc/notice_q.sql 
--------------------------------------------------------------------
1. notice ���̺��� ���� 
   - PRIMARY KEY(noticeno): noticeno�÷��� ���� 2���̻� ��ϵǴ� ���� ����, �ߺ� ����
 
   CREATE TABLE news(
   	newsno INT NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
   	title VARCHAR(100) NOT NULL COMMENT '����',
   	newsurl VARCHAR(100) NOT NULL COMMENT 'URL',
   	rdate DATETIME NOT NULL COMMENT '�����',
   	PRIMARY KEY(newsno)
   );
   
2. ���̺� ����
	DROP TABLE news;
 
3. ���
 INSERT INTO news(title, newsurl, rdate)
 values('������ ���� ����', 'naver.com', now());
 
 INSERT INTO news(title, newsurl, rdate)
 values('4�� ���� ����', 'daum.net', now());
 
 INSERT INTO news(title, newsurl, rdate)
 values('3�� �޿� �ȳ�', 'google.com', now());
   
4. ���
	SELECT newsno, title, newsurl, rdate
	FROM news
	ORDER BY newsno ASC;
	
   
5. ��ȸ
	SELECT newsno, title, newsurl, rdate
	FROM news
	WHERE newsno = 1;
 
        

6. ����

UPDATE news
SET title = '�ڹ� �ҽ�', rname = '����'
WHERE newsno = 1;

 
7. ����
1) �ϳ��� ���ڵ� ����

 DELETE FROM news
 WHERE newsno = 1;
 
2) ��� ���ڵ� ����(����)
 DELETE FROM news;