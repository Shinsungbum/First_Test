--내장함수(COUNT, SUM, AVG, MAX, MIN)

DESC tblmember;


ALIAS ☞ 가명, 애칭, 약어
SELECT      COUNT(num) "인원 수" --num 필드의 갯수
FROM        tblmember;

SELECT      COUNT(*) cnt--4
FROM        tblmember;

SELECT      SUM(age) sum_age --age의 합계
FROM        tblmember;

SELECT      AVG(age) avg_age --age의 평균
FROM        tblmember;

SELECT      MAX(age) MAX_age --age의 최대값
FROM        tblmember;

SELECT      MIN(age) min_age --age의 최소값
FROM        tblmember;

--내년나이
SELECT      age"올해나이", age + 1"내년나이"
FROM        tblmember;

--서구에 사는 사람들의 나이 합계
SELECT      SUM(age) "나이합계"
FROM        tblmember
WHERE       addr LIKE '%서구%';

--기타연산
--num 이 1이거나 3인것의 레코드 검색
SELECT      *                      --3
FROM        tblmember              --1
WHERE       num = 1 OR num = 3;    --2


SELECT      *                      --3
FROM        tblmember              --1
WHERE       num IN(1, 3);          --2

--오늘날짜 출력, 날짜 서식은 '/'로만 출력
SELECT      SYSDATE --22/06/15
FROM        dual;   --가짜테이블

--날짜를 원하는 형태로 출력
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') today --2022-06-15
FROM        dual;

commit;

--tblpanme 테이블 생성
CREATE TABLE tblpanme(
    code VARCHAR2(10) PRIMARY KEY,
    part VARCHAR2(20),
    price NUMBER
);

--레코드 입력
INSERT INTO tblpanme(code, part, price) VALUES('001','A영업부',3000);
INSERT INTO tblpanme VALUES('002','B영업부',6000);
INSERT INTO tblpanme VALUES('003','A영업부',2000);
INSERT INTO tblpanme VALUES('004','B영업부',5000);
INSERT INTO tblpanme VALUES('005','C영업부',1000);
INSERT INTO tblpanme VALUES('006','D영업부',4000);



--전체레코드 검색
SELECT *
FROM tblpanme;



--작업확정
commit;



--각부서별 판매금액의 총합 구하여 출력
SELECT      part, sum(price) "판매금액 합계"
FROM        tblpanme
GROUP BY    part; --GROUP BY 에는 SELECT 절에서 그룹함수를 사용하지 않은 필드명을 지정해줘야 함



--각 부서별(GROUP BY)로 판매금액의 총합(SUM_PRICE)을 구하여 총합의 오름순(ORDER BY)으로 출력
SELECT      part,SUM(price)
FROM        tblpanme
--WHERE       조건절
GROUP BY    part
--HAVING      조건절
ORDER BY    sum(price) DESC; --정렬필드, ASC : 오름차순, 생략시기본값, DESC : 내림차순


--부서명 출력
SELECT      DISTINCT part --DISTINCT : 중복제거
FROM        tblpanme;

--부서의 갯수 출력
SELECT      count(DISTINCT part) cnt
FROM        tblpanme;


--각 부서별로 판매금액의 총합을 구하여 부서의 오름차순으로 정렬하여 출력
--단 부서가 2개 이상있는 부서만 대상으로 하시오
--A영업부, B영업부의 결과를 출력


--그룹 함수를 사용하지 말아야 할 곳에서 제거해야 합니다.
--1.WHERE절에서는 그룹함수 안됨(HAVING절 사용해야함)
--2.오라클 프로시저에서 SELECT에 MIN,MAX와 같은 그룹함수

SELECT      part,SUM(price)
FROM        tblpanme
--WHERE       조건    부서가 2개이상, WHERE 절에서는 그룹함수 사용불가, 일반조건만 가능
GROUP BY    part
HAVING      count(part) >= 2 --HAVING절에서는 그룹함수 사용가능, 일반 조건도 가능
                             --HAVING 사용하려면 반드시 GROUP BY 절이 먼저 지정되어야함
ORDER BY    part ASC;































