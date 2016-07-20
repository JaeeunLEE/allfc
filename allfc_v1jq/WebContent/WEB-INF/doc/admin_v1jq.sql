1. 테이블 구조
- 최초 가입시 Master로 가입, 이후부터 인증대기 모드로 진입하며
  Master계정이 인증을해야 로그인 가능.
 
DROP TABLE admin1; 
 
CREATE TABLE admin1 (
  admin1no INT NOT NULL AUTO_INCREMENT, -- 관리자 번호, 레코드를 구분하는 컬럼 
  email       VARCHAR(50)  UNIQUE NOT NULL, -- 중복 안됨  
  passwd    VARCHAR(20)  NOT NULL, -- 패스워드, 영숫자 조합 
  auth         VARCHAR(20) NOT NULL, -- 가입키, ABC + 현재시간 13자
  act           CHAR(1)         DEFAULT 'N' NOT NULL, -- M: 마스터, Y: 로그인 가능, N: 로그인 불가, H: 인증 대기
  confirm    CHAR(1)         DEFAULT 'N' NOT NULL, -- 이메일 링크 클릭 여부, Y:클릭, N:클릭안함
  mdate      DATETIME       NOT NULL, -- 가입일
  PRIMARY KEY (admin1no)                -- 한번 등록된 email은 중복 안됨 
); 
 
 
※ 제약 조건 
- NOT NULL: INSERT SQL에서 컬럼의 값 필수 입력. 
- UNIQUE  : 컬럼에 중복된 값이 올 수 없음. 
- PRIMARY KEY (id): 기본적으로 UNIQUE의 성질을 포함하면서 
  레코드를 구분하는 기준 컬럼의 값. 
 
 
 
2. INSERT, 기초 데이터 추가 
- Duplicate entry 'test1@mail.com' for key 'email': 이메일 중복 등록 불가능
 
1) 중복 이메일 검사 관련 SQL 
    -- 0: 중복 아님, 1: 중복  
    SELECT COUNT(email) as cnt
    FROM admin1
    WHERE email = 'test10@mail.com';
 
    cnt
    ---
     1
 
     
2) MASTER 계정의 조회
    SELECT COUNT(admin1no) as cnt
    FROM admin1
    WHERE act = 'M';
 
    cnt
    ---
    0
 
3) 관리자 등록   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test1@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
 
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test2@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
   
   INSERT INTO admin1(email, passwd, auth, act, confirm, mdate)   
   VALUES('test3@mail.com', '1234', 'AXD0123456789012', 'N', 'N', now());
 
4) 이메일 인증
UPDATE admin1
SET confirm = 'Y'
WHERE email='testcell2013@gmail.com' AND auth='AXD0123456789012';
 
    
3. 목록
SELECT * FROM admin1;
 
1) 회원 전체 목록 
   SELECT admin1no, email, auth, act, confirm, mdate
   FROM admin1
   ORDER BY email ASC;
 
    admin1no email                  auth             act confirm mdate
 -------- ---------------------- ---------------- --- ------- ---------------------
        7 testcell2013@gmail.com UOI1450064874844 M   Y       2015-12-14 12:47:54.0
 
        
   SELECT admin1no as '번호', email as '이메일', auth as '인증키',
              act as '권한', confirm as '이메일확인', mdate as '등록일'
   FROM admin1
   ORDER BY email ASC;
   
 번호 이메일                    인증키              권한 이메일확인 등록일
 -- ---------------------- ---------------- -- ----- ---------------------
  7 testcell2013@gmail.com UOI1450064874844 M  Y     2015-12-14 12:47:54.0
 
 
2) 권한의 변경(Admin1DAO: int updateAct(int admin1no, String act))
UPDATE admin1 
SET  act='Y'
WHERE admin1no=1;
 
 
5. 검색된 전체 레코드 수
   - LIKE    : 정확하게 일치하지 않아도 출력 
   - =(equal): 정확하게 일치해야 출력 
   - 검색을 하지 않는 경우, 전체 목록 출력 
 
      
6. 검색 목록(S:Search List)  
 
 
7. 페이징
   - 목록은 페이징 구현을 필수로 합니다.
 
 
8. 회원 정보 보기 
   SELECT admin1no, email, passwd, auth, act, confirm, mdate
   FROM admin1
   WHERE admin1no = 1;
   
 
9. 패스워드 변경
1) 기존 패스워드 검사
- DAO: public int countPasswd(int admin1no, String passwd){ ... }
SELECT count(*) as cnt
FROM admin1
WHERE admin1no = 1 AND passwd='123';
 
2) 패스워드 변경
- DAO: public int updatePasswd(int admin1no, String passwd){ ... }
UPDATE admin1
SET passwd=''
WHERE admin1no=1;
 
 
10.  회원 정보 수정 
 
UPDATE admin1
SET email=''
WHERE admin1no = 1;
 
 
11. 'admin1' 회원 삭제 
DELETE FROM admin1;
 
DELETE FROM admin1
WHERE admin1no = 1;
 
 
12. 로그인 관련 SQL 
 

- DAO: public int login(String email, String passwd){ ... }
 
SELECT count(*) as cnt
FROM admin1
WHERE email = 'gtawest00@gmail.com' AND passwd='1234';


--------------------------------------------------------------------