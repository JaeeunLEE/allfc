- ������ ���̺� ����
     DROP TABLE notice;
   
   CREATE TABLE notice( 
     noticeno INT                 NOT NULL AUTO_INCREMENT PRIMARY KEY, -- �������� ��ȣ
     title        VARCHAR(100)  NOT NULL, -- ����
     content  VARCHAR(4000)  NOT NULL, -- ����
     rname    VARCHAR(15)    NOT NULL, -- �����
     passwd  VARCHAR(15)    NOT NULL, -- �н�����
     cnt        INT                    NOT NULL, -- ��ȸ��
     rdate     DATETIME         NOT NULL  -- �����
   );  
 
    
2) ���̺� ����
   DROP TABLE notice;
 
 
3) ���
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('������ ���� ����', '����', '�մ���', '1234', 0, now());
 
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('���� ���� ����', '����', '�մ���', '1234', 0, now()); 
   
   INSERT INTO notice(title, content, rname, passwd, cnt, rdate)
   VALUES('�ָ��� �Ϸ�� ����', '����', '�մ���', '1234', 0, now()); 
 
   
4) ���
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice 
   ORDER BY noticeno ASC;
   
 noticeno title      content rname passwd cnt rdate
 -------- ---------- ------- ----- ------ --- ---------------------
        1 ������ ���� ����  ����      �մ���   123      0 2015-11-12 14:45:56.0
        2 ���� ���� ����   ����      �մ���   123      0 2015-11-12 14:45:57.0
        3 �ָ��� �Ϸ�� ���� ����      �մ���   123      0 2015-11-12 14:45:58.0
 
 
 
 
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice 
   ORDER BY noticeno DESC;
 
    noticeno title      content rname passwd cnt rdate
 -------- ---------- ------- ----- ------ --- ---------------------
        3 �ָ��� �Ϸ�� ���� ����      �մ���   123      0 2015-11-12 14:45:58.0
        2 ���� ���� ����   ����      �մ���   123      0 2015-11-12 14:45:57.0
        1 ������ ���� ����  ����      �մ���   123      0 2015-11-12 14:45:56.0
 
 
   
5) ��ȸ
   SELECT noticeno, title, content, rname, passwd, cnt, rdate
   FROM notice
   WHERE noticeno = 1;
   
 noticeno title     content rname passwd cnt rdate
 -------- --------- ------- ----- ------ --- ---------------------
        1 ������ ���� ���� ����      �մ���   123      0 2015-11-12 14:45:56.0
 

6) �н����� �˻�
   SELECT COUNT(*) as cnt From notice
   WHERE noticeno=1 AND passwd='1234';

   - SQL�� �����ϴ� �޼ҵ�
     public int passwordCheck(int noticeno, String passwd){ ... }

     1: �н����� ��ġ, 0: �н����� ��ġ���� ����.

 
7) ����
   UPDATE notice
   SET title = '�ڹ� �ҽ�', content = '���� 2', rname = '�Ʒι�' 
   WHERE noticeno = 1;

   - SQL�� �����ϴ� �޼ҵ�
     public int update(NoticeVO vo){ ... }

 
8) ����
�� �ϳ��� ���ڵ� ����
    DELETE FROM notice
    WHERE noticeno = 1;
 
 
�� ��� ���ڵ� ����(����)
    DELETE FROM notice4;
   
 
9) ��ȸ�� ����
UPDATE notice
SET cnt = cnt + 1
WHERE noticeno=2;
















============================================================================

1. notice ���̺� ���� 
>>>>> /WebContent/WEB-INF/doc/notice_q.sql 
--------------------------------------------------------------------
1. notice ���̺��� ���� 
   - PRIMARY KEY(noticeno): noticeno�÷��� ���� 2���̻� ��ϵǴ� ���� ����, �ߺ� ����
 
   CREATE TABLE notice(
   	noticeno INT NOT NULL AUTO_INCREMENT COMMENT '��ȣ',
   	title VARCHAR(100) NOT NULL COMMENT '����',
   	rname VARCHAR(15) NOT NULL COMMENT '����',
   	rdate DATETIME NOT NULL COMMENT '�����',
   	PRIMARY KEY(noticeno)
   );
   
2. ���̺� ����
	DROP TABLE notice;
 
3. ���
 INSERT INTO notice(title, rname, rdate)
 values('������ ���� ����', '�մ���', now());
 
 INSERT INTO notice(title, rname, rdate)
 values('4�� ���� ����', '�Ʒι�', now());
 
 INSERT INTO notice(title, rname, rdate)
 values('3�� �޿� �ȳ�', '�մ���', now());
   
4. ���
	SELECT noticeno, title, rname, rdate
	FROM notice
	ORDER BY noticeno DESC;
	

5. ��ȸ
	SELECT noticeno, title, rname, rdate
	FROM notice
	WHERE noticeno = 1;
 
  

6. ���� ó��

UPDATE notice
SET title = '�ڹ� �ҽ�', rname = '����'
WHERE noticeno = 1;

 
7. ����
1) �ϳ��� ���ڵ� ����

 DELETE FROM notice
 WHERE noticeno = 1;
 
2) ��� ���ڵ� ����(����)
 DELETE FROM notice;