1. notice ���̺� ���� 
>>>>> /WebContent/WEB-INF/doc/url_q.sql 
--------------------------------------------------------------------
1. notice ���̺��� ���� 
   - PRIMARY KEY(noticeno): noticeno�÷��� ���� 2���̻� ��ϵǴ� ���� ����, �ߺ� ����
 
   CREATE TABLE url( 
     urlno  INT                 NOT NULL AUTO_INCREMENT, -- URL ��ȣ
     title    VARCHAR(100)  NOT NULL, -- �� ����Ʈ ����
     web    VARCHAR(200)  NOT NULL, -- URL �ּ�
     cnt     INT                 NOT NULL, -- �湮�� �� 
     rdate  DATETIME        NOT NULL, -- �����
     PRIMARY KEY(urlno)
   );  
   
2. ���̺� ����
	DROP TABLE url;
 
3. ���
 INSERT INTO url(title, web, rdate)
 values('����', 'daum.net', now());

   
4. ���
	SELECT urlno, title, web, cnt, rdate
	FROM url
	ORDER BY urlno DESC;
	

5. ��ȸ
	SELECT urlno, title, web, rdate
	FROM url
	WHERE urlno = 1;
 
  

6. ���� ó��

UPDATE url
SET title = '�ڹ� �ҽ�', web = '����'
WHERE urlno = 1;

 
7. ����
1) �ϳ��� ���ڵ� ����

 DELETE FROM url
 WHERE urlno = 1;
 
2) ��� ���ڵ� ����(����)
 DELETE FROM url;