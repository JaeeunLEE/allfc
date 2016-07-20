1. ���̺� ����
- ���� ���Խ� Master�� ����, ���ĺ��� ������� ���� �����ϸ�
  Master������ �������ؾ� �α��� ����.
 
DROP TABLE admin1; 
 
CREATE TABLE admin1 (
  admin1no INT NOT NULL AUTO_INCREMENT, -- ������ ��ȣ, ���ڵ带 �����ϴ� �÷� 
  email       VARCHAR(50)  UNIQUE NOT NULL, -- �ߺ� �ȵ�  
  passwd    VARCHAR(20)  NOT NULL, -- �н�����, ������ ���� 
  auth         VARCHAR(20) NOT NULL, -- ����Ű, ABC + ����ð� 13��
  act           CHAR(1)         DEFAULT 'N' NOT NULL, -- M: ������, Y: �α��� ����, N: �α��� �Ұ�, H: ���� ���
  confirm    CHAR(1)         DEFAULT 'N' NOT NULL, -- �̸��� ��ũ Ŭ�� ����, Y:Ŭ��, N:Ŭ������
  mdate      DATETIME       NOT NULL, -- ������
  PRIMARY KEY (admin1no)                -- �ѹ� ��ϵ� email�� �ߺ� �ȵ� 
); 
 
 
�� ���� ���� 
- NOT NULL: INSERT SQL���� �÷��� �� �ʼ� �Է�. 
- UNIQUE  : �÷��� �ߺ��� ���� �� �� ����. 
- PRIMARY KEY (id): �⺻������ UNIQUE�� ������ �����ϸ鼭 
  ���ڵ带 �����ϴ� ���� �÷��� ��. 
 
 
 
2. INSERT, ���� ������ �߰� 
- Duplicate entry 'test1@mail.com' for key 'email': �̸��� �ߺ� ��� �Ұ���
 
1) �ߺ� �̸��� �˻� ���� SQL 
    -- 0: �ߺ� �ƴ�, 1: �ߺ�  
    SELECT COUNT(email) as cnt
    FROM admin1
    WHERE email = 'test10@mail.com';
 
    cnt
    ---
     1
 
     
2) MASTER ������ ��ȸ
    SELECT COUNT(admin1no) as cnt
    FROM admin1
    WHERE act = 'M';
 
    cnt
    ---
    0
 
3) ������ ���   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test1@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
 
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test2@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test3@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
 
4) �̸��� ����
UPDATE admin1
SET confirm = 'Y'
WHERE email='testcell2013@gmail.com' AND auth='AXD0123456789012';
 
    
3. ���
SELECT * FROM admin1;
 
1) ȸ�� ��ü ��� 
   SELECT admin1no, email, auth, act, confirm, mdate
   FROM admin1
   ORDER BY email ASC;
 
    admin1no email                  auth             act confirm mdate
 -------- ---------------------- ---------------- --- ------- ---------------------
        7 testcell2013@gmail.com UOI1450064874844 M   Y       2015-12-14 12:47:54.0
 
        
   SELECT admin1no as '��ȣ', email as '�̸���', auth as '����Ű',
              act as '����', confirm as '�̸���Ȯ��', mdate as '�����'
   FROM admin1
   ORDER BY email ASC;
   
 ��ȣ �̸���                    ����Ű              ���� �̸���Ȯ�� �����
 -- ---------------------- ---------------- -- ----- ---------------------
  7 testcell2013@gmail.com UOI1450064874844 M  Y     2015-12-14 12:47:54.0
 
 
2) ������ ����(Admin1DAO: int updateAct(int admin1no, String act))
UPDATE admin1 
SET  act='Y'
WHERE admin1no=1;
 
 
5. �˻��� ��ü ���ڵ� ��
   - LIKE    : ��Ȯ�ϰ� ��ġ���� �ʾƵ� ��� 
   - =(equal): ��Ȯ�ϰ� ��ġ�ؾ� ��� 
   - �˻��� ���� �ʴ� ���, ��ü ��� ��� 
 
      
6. �˻� ���(S:Search List)  
 
 
7. ����¡
   - ����� ����¡ ������ �ʼ��� �մϴ�.
 
 
8. ȸ�� ���� ���� 
   SELECT admin1no, email, passwd, auth, act, confirm, mdate
   FROM admin1
   WHERE admin1no = 1;
   
 
9. �н����� ����
1) ���� �н����� �˻�
- DAO: public int countPasswd(int admin1no, String passwd){ ... }
SELECT count(*) as cnt
FROM admin1
WHERE admin1no = 1 AND passwd='123';
 
2) �н����� ����
- DAO: public int updatePasswd(int admin1no, String passwd){ ... }
UPDATE admin1
SET passwd=''
WHERE admin1no=1;
 
 
10.  ȸ�� ���� ���� 
 
UPDATE admin1
SET email=''
WHERE admin1no = 1;
 
 
11. 'admin1' ȸ�� ���� 
DELETE FROM admin1;
 
DELETE FROM admin1
WHERE admin1no = 1;
 
 
12. �α��� ���� SQL 
 

- DAO: public int login(String email, String passwd){ ... }
 
SELECT count(*) as cnt
FROM admin1
WHERE email = 'gtawest00@gmail.com' AND passwd='1234';


--------------------------------------------------------------------