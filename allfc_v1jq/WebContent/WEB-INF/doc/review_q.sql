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
 
DROP TABLE review; 
 
CREATE TABLE review ( 
  reviewno    MEDIUMINT      NOT NULL AUTO_INCREMENT,  -- �� �Ϸ� ��ȣ 
  rname    VARCHAR(20)    NOT NULL,  -- �۾���
  email     VARCHAR(100)          NULL, -- �̸���  
  title       VARCHAR(200)  NOT NULL,  -- ����(*) 
  content  VARCHAR(4000) NOT NULL,  -- �� ���� 
  passwd  VARCHAR(15)    NOT NULL,  -- ��� ��ȣ 
  cnt        SMALLINT        DEFAULT 0, -- ��ȸ��, �⺻�� ��� 
  rdate     DATETIME        NOT NULL,  -- ��� ��¥, sysdate 
  url1        VARCHAR(100)        NULL,  -- URL1, ���� �ּ�
  url2        VARCHAR(100)        NULL,  -- URL2, ���� �ּ�
  file1       VARCHAR(100)         NULL, -- ���ϸ� 1
  file2       VARCHAR(100)         NULL, -- ���ϸ� 2
  file3       VARCHAR(100)         NULL, -- ���ϸ� 3
  size1      BIGINT            DEFAULT 0, -- ���� ũ�� 1
  size2      BIGINT            DEFAULT 0, -- ���� ũ�� 2
  size3      BIGINT            DEFAULT 0, -- ���� ũ�� 3
  map        VARCHAR(1024)     NULL,
  ip         VARCHAR(15)       NULL,
  visible     CHAR(1)      DEFAULT 'Y'    NOT NULL,
  thumb  VARCHAR(100)    NULL,
  
  PRIMARY KEY (reviewno)  
); 
 
 
 
2. �� �߰�(C: Create) 
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url1, url2,
              file1, file2, file3, size1, size2, size3, map, ip, viewyn)
VALUES('�մ���', 'mail1@m.com', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'http://google.com', 'welcome.jpg', 'new.jpg',
            'a.jpg', 100, 200, 300, 'map123', '192.1.1.1', 'Y');
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('�Ʒι�', 'mail1', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
INSERT INTO review(rname, email, title, content, passwd, cnt, rdate, url, file1, size1)
VALUES('��¯��', 'mail1', '�Ͼ� ���׶�� ����', '��ī������ �鹬��', '123', 0, now(),
            'http://art.incheon.go.kr', 'welcome.jpg', 1000);
            
3. ��ü �� ���(S:Total Select List), �ֽű� ���� ��� 
   - ASC: ���� ����, DESC: ���� ���� 
   
SELECT reviewno, rname, email, title, content, passwd, cnt, rdate, url1, url2,
file1, file2, file3, size1, size2, size3, map, ip, visible
FROM review
ORDER BY reviewno DESC;

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
UPDATE review
SET cnt = cnt + 1
WHERE reviewno=1;

 
5. 1���� �� ����(R:Read, PK ���) 
SELECT reviewno, rname, email, title, content, passwd, cnt, rdate, url1, url2,
file1, file2, file3, size1, size2, size3, map, ip, visible
FROM review
WHERE reviewno=1;

 
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
UPDATE review
SET rname='ȫ�浿', email='a@a.com', title='�׽�Ʈ', content='����',
url1='http://naver.com', url2='http://daum.net', file1='b.jpg', file2='new.jpg', 
file3='c.jpg', size1=150, size2=250, size3=350, 
map='map100', ip='127.0.0.1', viewyn='Y'
WHERE reviewno=1;
 
2) ���� Ȯ��
 
 
 
10. �� ����(D:Delete) 
 DELETE FROM review
 WHERE reviewno=1;
                  
 
 �÷��߰�:
 ALTER TABLE pds3
 ADD COLUMN visible CHAR(1) AFTER size1;
 
--------------------------------------------------------------------