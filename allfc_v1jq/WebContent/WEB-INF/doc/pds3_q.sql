����	[Chapter 02][PDS v3] �ڷ�� version 3.0, pds_v3jq, DBMS SQL, ��� Query
[01] �ڷ�� version 3.0
      - Gallery, MP3, MP4, ���� ����, ��ǰ ����, ��� ������
        ���Ͼ��ε尡 ���Ǵ� �о� 

      - Eclipse Setting 
               type: Dynamic Web Project 
             name: pds_v3jq (v3: version 3.0, j: jsp, q: mysql)
          Package: web.pds3
            Library: /WEB-INF/lib/mysql-connector-java-5.1.37-bin.jar
            Folder: ���� ���� ����: /WebContent/file/storage   
                     ���۽� �ӽ� ���� ����: /WebContent/file/temp

 


[02]  �ڷ���� ���� - Gallery
 
�� /WebContent/WEB-INF/doc/pds3_q.sql 
--------------------------------------------------------------------
1. �Խ��� ���̺� ���� 
 
DROP TABLE pds3; 
 
CREATE TABLE pds3 ( 
  pdsno    MEDIUMINT      NOT NULL AUTO_INCREMENT,  -- �� �Ϸ� ��ȣ 
  rname    VARCHAR(20)    NOT NULL,  -- �۾���
  email     VARCHAR(100)          NULL, -- �̸���  
  title       VARCHAR(200)  NOT NULL,  -- ����(*) 
  content  VARCHAR(4000) NOT NULL,  -- �� ���� 
  passwd  VARCHAR(15)    NOT NULL,  -- ��� ��ȣ 
  cnt        SMALLINT        DEFAULT 0, -- ��ȸ��, �⺻�� ��� 
  rdate     DATETIME        NOT NULL,  -- ��� ��¥, sysdate 
  url        VARCHAR(100)        NULL,  -- URL, ���� �ּ�
  file1       VARCHAR(100)         NULL, -- ���ϸ� 1
  size1      BIGINT            DEFAULT 0, -- ���� ũ�� 1
  thumb  VARCHAR(100)    NULL,
  PRIMARY KEY (pdsno)  
); 
 
 
 
2. �� �߰�(C: Create) 
            
INSERT INTO pds3(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('�մ���', 'mail1', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
INSERT INTO pds3(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('�Ʒι�', 'mail1', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
INSERT INTO pds3(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('��¯��', 'mail1', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
3. ��ü �� ���(S:Total Select List), �ֽű� ���� ��� 
   - ASC: ���� ����, DESC: ���� ���� 
   
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1
FROM pds3
ORDER BY pdsno DESC;

1)list.jsp
SELECT pdsno, rname, title, cnt, rdate, url, file1, size1
FROM pds3
ORDER BY pdsno DESC;
 
2) substring(�÷���, ������ġ, ����), MySQL�� ������ġ 1���� ����
SELECT pdsno, rname, title, cnt, SUBSTRING(rdate, 1, 10), url, file1, size1
FROM pds3
ORDER BY pdsno DESC;

3) �÷� ������ ���
 �Լ� ���� �÷����� �ſ� ������Ƿ�
 SUBSTRING(rdate, 1, 10) ������ as Ű����� rdate�� ��ȯ�մϴ�.

SELECT pdsno, rname, title, cnt, SUBSTRING(rdate, 1, 10) as rdate, url, file1, size1
FROM pds3
ORDER BY pdsno DESC;

4. ��ȸ�� ���� 
UPDATE pds3
SET cnt = cnt + 1
WHERE pdsno=1;

 
5. 1���� �� ����(R:Read, PK ���) 
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1
FROM pds3
WHERE pdsno=1;

 
6. �˻� �� ���(S:Search List), title �÷��� '����'�̶�  
    �ܾ �� �ִ� ���ڵ� �˻� 
    - ����� ���۽� �˻��� ������� �����ϸ� ��ü ������
      ��ü �˻����� �����ϴ�.
   
    - rname, title, content �÷� ���
 
1) �̸��� '�մ���'�� ���ڵ� �˻�
- WHERE rname LIKE '�Ʒι�': WHERE rname = '�Ʒι�' �� ����
 
 
- �˻� ���� �ʴ� ���, ��� ���ڵ� ���
 
 
 
 
7. ����¡
   - ����� ����¡ ������ �ʼ��� �մϴ�.
   
1) �˻��� ��ü ���ڵ� ��
 
        
   
2) ����¡
 
 
8. �н����� �˻�
   - COUNT(): �߻��� ���ڵ��� ���� ���, ���ڵ尡 ������ 0 ���
 
 
   
9. �� ����(U:Update), PK�� ���ڵ带 �����ϴ� ���� ����� ������ �������� 
   �����ϴ� ���� �������� ����. 
    
1) ���ڵ� ���� 
UPDATE pds3
SET rname='����', email='mail@mail.com', title='���񺯰�', 
content='���뺯��', url='http://www.kma.go.kr', file1='test1.jpg', size1=123
WHERE pdsno=1;
 
2) ���� Ȯ��
 
 
 
10. �� ����(D:Delete) 
 DELETE FROM pds3
 WHERE pdsno=1;
                  
 
 ����� �÷� �߰�
 ALTER TABLE pds3
 ADD COLUMN thumb VARCHAR(100) AFTER size1;
                  
 
 --------------------------------------------------------------------
 
 �̸��� �մ����� ���ڵ� �˻�
    - WHERE rname LIKE '�մ���'
       rname �÷��� ���� '�մ���'�� ���ڵ� ���� ���
 
    - WHERE rname LIKE '%�մ���%'
      rname �÷��� ���� '�մ���'�� �� ���ڵ� ���� ���
 
    - WHERE rname LIKE '�մ���%'
      rname �÷��� ���� '�մ���'�� �����ϴ� ���ڵ� ���� ���
 
    - WHERE rname LIKE '%�մ���'
      rname �÷��� ���� '�մ���'�� �����ϴ� ���ڵ� ���� ���
 
      
      
   ��� ���ڵ� ���
   SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb
FROM pds3
ORDER BY pdsno DESC;

�̸����� �˻�
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb
FROM pds3
WHERE rname LIKE %�Ʒι�%
ORDER BY pdsno DESC;

�������� �˻�
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb
FROM pds3
WHERE title LIKE %�Ʒι�%
ORDER BY pdsno DESC;

�������� �˻�
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb
FROM pds3
WHERE content LIKE %�Ʒι�%
ORDER BY pdsno DESC;

���� �Ǵ� �������� �˻�
SELECT pdsno, rname, email, title, content, passwd, cnt, rdate, url, file1, size1, thumb
FROM pds3
WHERE title LIKE %�Ʒι�% OR content LIKE %�Ʒι�%
ORDER BY pdsno DESC;