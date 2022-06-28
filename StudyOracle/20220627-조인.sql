5장.  JOIN
오라클은 관계형 데이터베이스이다.
JOIN은 여러 테이블을 연결하여 데이터를 조회하는 방법이다.

: 하나의 테이블로부터 데이터를 조회할 수 없는 경우
  여러 테이블로 부터 데이터를 조회하여
  합쳐진 테이블의 데이터를 조회하기 위해 사용
  
5.1  Cartesian Product
JOIN조건을 기술하지 않았을 때는 잘못된 결과가 발생하는데 이것을 Cartesian Product라 한다.

사번, 성, 부서명 조회
SELECT  employee_id, last_name, department_name
FROM    employees, departments --조인
WHERE  

employees : 107
departments : 27
= 107 * 27 = 2889

5.2  EQUI JOIN
EQUI JOIN 은 WHERE 절에 동등 연산자 (=)를 사용하는 JOIN 형식이다.
JOIN조건은 같은 값을 가진 컬럼에 대해 테이블명.컬럼명 = 테이블명.컬럼명 을 사용한다.
--                                    ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣      


[예제 5-2] employees, departments 테이블을 사용하여 
사번, 이름, 부서명 정보를 조회한다.
SELECT  employee_id, first_name, department_name
FROM    employees, departments
WHERE   employees.department_id = departments.department_id;

ALIAS
SELECT  e.employee_id, e.first_name, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;

          ALIAS 가능
SELECT    O
FROM      O
WHERE     X
GROUP BY  X
HAVING    X
ORDER BY  O  

조인조건식 ☞ 테이블명.컬럼명 = 테이블명.컬럼명
             테이블명.FK     = 테이블명.PK
             

[예제 5-4] employees, jobs 테이블을 사용하여 
사번, 이름, 업무코드, 업무제목 정보를 조회한다.
SELECT  e.employee_id, e.frist_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id

사원들의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;

JOIN 하는 대상 테이블이 추가되면 JOIN조건을 추가한다.
[예제 5-5] employees, departments, jobs 테이블을 사용하여 
사번, 이름, 부서명, 업무제목을 조회한다.
SELECT  e.employee_id, e.first_name, 
        d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id;

WHERE 절에 JOIN 조건과 일반 조건을 함께 사용한다.

[예제 5-6] 사번이 101번인 사원의 
사번, 이름, 부서명, 업무제목 정보를 조회한다.
SELECT  e.employee_id, e.first_name, 
        d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     e.employee_id = 101;

5.3 NON-EQUI JOIN
NON-EQUI JOIN 은 비교연산자(<=, >=, <, >), 범위연산자(BETWEEN), IN연산자 등의
동등연산자 (=)   이외의 연산자를 사용하는 JOIN 형식이다.
JOIN 하는 컬럼이 일치하지 않게 사용하는 JOIN 조건으로 거의 사용하지 않는다.

5.4 OUTER JOIN
EQUI JOIN 쿼리문은 JOIN 하는 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환하는
만족

[예제 5-8] 모든 사원의 사번, 이름 ,급여, 부서코드, 부서명 정보를 조회한다.
SELECT      e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM        employees e, departments d
WHERE       e.department_id = d.department_id(+);

NULL  확인 방법 ☞ NULL 의 존재 유무, NULL의 개수 COUNT
e.department_id 의 NULL의 갯수
SELECT      COUNT(*)
FROM        employees
WHERE       department_id IS NULL;

d.department_id 의 NULL의 갯수
SELECT      COUNT(*)
FROM        departments
WHERE       department_id IS NULL;

d.department_id 의 NULL의 갯수 --PK이므로 NULL 이 존재할 수 없음
--------------------------------------------------------------------------------
 OUTER JOUN ☞ LEFT/RIGHT OUTER JOIN : 기준이 되는 테이블방향으로 조인한다.
 LEFT OUTER JOIN : 왼 쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 오른쪽에(+) 붙음)
--￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 RIGHT OUTER JOIN : 오른쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 왼 쪾에 (+) 붙음)
--------------------------------------------------------------------------------

02. 모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT      e.employee_id, e.last_name, e.job_id, j.job_title
FROM        employees e, jobs j
WHERE       e.job_id = j.job_id(+);

SELECT      COUNT(*) cnt
FROM        employees
WHERE       job_id IS NULL;


03. 모든 사원의 사번, 성, 부서명, 업무제목 조회
SELECT      e.employee_id, e.last_name, d.department_name, j.job_title
FROM        employees e, departments d, jobs j
WHERE       e.department_id = d.department_id(+)
AND         e.job_id = j.job_id;


03. 모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT      e.employee_id, e.last_name, e.department_id, d.department_name, l.location_id, l.city
FROM        employees e, departments d, locations l
WHERE       e.department_id = d.department_id(+)
AND         d.location_id = l.location_id(+);
☞ OUTER JOIN 된 테이블은 1개만 지정할 수 있음


5.5 SELF JOIN
SELF JOIN 은  하나의 테이블을 두 번 명시하여 동일한 테이블 두개로부터
JOIN을 통해 데이터를 조회하여 결과를 반환하다.
즉, 한테이블 내에서 두 데이터 컬럼이 연관관계가 있다.

[예제 5-10] 사원의 사번, 이름, 매니저사번, 매니저이름 정보를 조회한다.
SELECT      e.employee_id 사번, e.first_name 이름, e.manager_id 매니저사번, m.first_name "매니저 이름"
FROM        employees e, employees m
WHERE       e.manager_id = m.employee_id(+)
ORDER BY    e.employee_id;































