4장.  그룹 함수

※ 그룹함수의 종류
 1. COUNT     : 입력되는 데이터의 총갯수를 출력
 2. SUM       : 입력되는 데이터의 합계를 출력
 3. AVG       : 입력되는 데이터의 평균를 출력
 4. MAX       : 입력되는 데이터의 최대값을 출력
 5. MIN       : 입력되는 데이터의 최소값을 출력
 
 6. ROLLUP    : 입력되는 데이터의 소계 및 총계값을 출력
 7. CUBE      : 입력되는 데이터의 소계 및 총계값을 출력(아래에 요약 추가)
 
 8. RANK      : 주어진 컬럼 값의 그룹에서 값의 순위를 계산한 후 순위를 출력
                1, 2, 2, 4
 9. DENSE_RANK: 주어진 컬럼 값의 그룹에서 값의 순위를 계산한 후 순위를 출력
                동일한 순위를 하나의 건수로 취급하므로 연속된 순위를 보여줌
                1, 2, 2, 3
 DENSE : 밀접한 

  쿼리문 해석순서                                          ALIAS 사용가능
5  SELECT  필드명1, 필드명2,...                             O       
1  FROM    테이블명                                         O    
2  WHERE   조건절(일반 조건만, 그룹함수 조건사용 불가)      X 
3  GROUP BY 그룹지을 필드명                                 X        
4  HAVING  조건절(일반조건, 그룹함수 조건 모두 사용가능)    X 
6  ORDER BY 정렬시킬필드명, 필드번호, ALIAS 명              O 

DISTINCT : SELECT 바로 다음에 쓰여 중복을 제거한 결과를 보여줌

부서를 파악
SELECT  DISTINCT department_id --107, DISTINCT : 중복제거
FROM    employees
--ORDER BY department_id ASC; --NULL이 마지막으로 조회
--ORDER BY department_id DESC;  --NULL이 첫번째로 조회

--ORDER BY department_id ASC NULLS first; --NULL이 마지막으로 조회
ORDER BY department_id DESC NULLS last;  --NULL이 첫번째로 조회


SELECT  department_id --27
FROM    departments;

4.2  그룹함수 :  여러 행으로부터 하나의 결과값을 반환
▎COUNT(컬럼명) ☞ NULL 제외, COUNT(*) ☞ NULL까지 포함

01. 우리 회사 사원의 수 를 조회
SELECT  COUNT(employee_id) 사원수 --107
FROM    employees;

SELECT  COUNT(department_id) 사원수 --106
FROM    employees;

SELECT  COUNT(*) 사원수 --107
FROM    employees;

02. 우리 회사 부서배치 받은 사원의 수 를 조회
SELECT  COUNT(department_id) 부서배치받은사원수 --106, COUNT(필드명)
FROM    employees;

SELECT  COUNT(*) 부서배치받은사원수 --106, COUNT(필드명)
FROM    employees
WHERE   department_id IS NOT NULL;


03. 우리회사 부서 조회
SELECT  DISTINCT department_id
FROM    employees
WHERE   department_id IS NOT NULL;

04. 우리회사 매니저인 사원들 조회
SELECT  DISTINCT manager_id
FROM    employees
WHERE   manager_id IS NOT NULL;

05. 우리회사 부서 수 조회
SELECT  COUNT(DISTINCT department_id) 부서수
FROM    employees;

06. clerk 종류의 업무를 하는 사원수
SELECT  COUNT(*) 사원수
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%';

▎SUM : 숫자데이터 컬럼의 전체 합계를 계산하여 그 결과를 반환

01. 우리회사 한달 급여 합계 조회
SELECT  TO_CHAR(SUM(salary),'FM$999,999,999') sum_sal
FROM    employees;

▎MAX 와 MIN
MAX 함수는 데이터 컬럼에서 가장 큰 값을 반환하고, 
MIN 함수는 가장 작은 값을 반환한다.
MAX, MIN 함수에는 모든 데이터유형을 사용할 수 있다.


1. 사원급여중 최대급여/최저급여 
SELECT  MAX(salary) max_sal, MIN(salary) min_sal
FROM    employees;

2. 사원입사일중 가장먼저/나중에 입사한날짜
SELECT  MIN(hire_date) min_hire, MAX(hire_date) max_hire
FROM    employees;

3. 사원성중 가장먼저/나중에 나오는 성
SELECT  MIN(last_name) min_name, MAX(last_name) max_name
FROM    employees;

▎AVG : 숫자만 가능
AVG 함수는 숫자데이터 컬럼의 평균값을 계산하여 그 결과를 반환한다.

1. 우리회사 사원들의 급여평균 조회
급여평균은 소수이하 2째자리까지 반올림해서 표현
SELECT  ROUND(AVG(salary),2) avg_sal
FROM    employees;

4.3  GROUP BY 절 : 특정기준을 두어 기준으로 그룹을 짓고, 그룹별로 하나의 결과를 조회

1. 우리회사 사원들의 사번, 성, 부서코드, 급여를 조회하여 부서코드순으로 조회
SELECT  employee_id, last_name, department_id, salary
FROM    employees
ORDER BY department_id;

2. 부서코드 50번 부서에 속한 사원들의 급여평균
SELECT  ROUND(AVG(salary), 2) avg_sal
FROM    employees
WHERE   department_id = 50;

3. 부서코드 50번 부서에 속한 사원들의
부서코드, 업무코드, 급여평균
SELECT  department_id, job_id, ROUND(AVG(salary), 2) avg_sal
FROM    employees
WHERE   department_id = 50
GROUP BY department_id, job_id;

SELECT 목록에 
       그룹함수를 사용한 표현(COUNT, MAX, MIN, AVG, SUM)과
       그룹함수를 사용하지 않은 표현(일반컬럼)이 함께 있다면
반드시 그룹함수를 사용하지 않은 표현(일반컬럼)에 대해서 
--                                   ￣￣￣￣￣￣￣￣￣       
    GROUP BY 절에 기준으로 명시해야 한다.
--  ￣￣￣￣￣￣￣￣￣￣￣￣￣￣

4. 우리회사 각 부서별 급여평균을 조회하고자 한다.
--각 부서별 부서코드, 급여 평균을 조회
각 부서별 급여 평균을 조회
SELECT  department_id, ROUND(AVG(salary), 2) avg_sal
FROM    employees
GROUP BY department_id
ORDER BY department_id;


4.4  HAVING 절
HAVING 절을 사용하여 그룹을 제한한다.
WHERE 절에서 사용하는 조건을 HAVING 절에 사용할 수도 있으나,
그룹함수가 포함된 조건은 HAVING 절에서만 사용할 수 있다.
SELECT
FROM
WHERE     : 조건절(일반조건만 가능)
GROUP BY  : 그룹지을 필드명
HAVING    : 조건절(일반조건 + 그룹함수 조건) 반드시 GROUP BY 절 명시된 후 사용가능
ORDER BY


1. 80번 부서의 부서와 급여평균 조회
SELECT  department_id, ROUND(AVG(salary), 2) avg_sal
FROM    employees
WHERE   department_id = 80
GROUP BY department_id;

SELECT  department_id, ROUND(AVG(salary), 2) avg_sal
FROM    employees
GROUP BY department_id
HAVING   department_id = 80;

2. 각 부서별로 소속된 사원의 수가 5명 이하인 부서와 그수를 조회
SELECT  department_id, COUNT(*) cnt
FROM    employees
GROUP BY department_id
HAVING   COUNT(*) <= 5
ORDER BY 1;








4.5  ROLLUP 과 CUBE
▪ ROLLUP 
GROUP BY 절에 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께 
단계별 소계, 총계 정보를 구할 수 있다.




[예제 4-13] 부서별 사원수와 급여합계, 총계를 조회한다.
SELECT  department_id, COUNT(*) 사원수, SUM(salary) 급여합계
FROM    employees
--GROUP BY department_id
GROUP BY ROLLUP(department_id) --총계까지 조회
ORDER BY department_id; 







[예제 4-14] 부서 내 업무별 사원수와 급여합계, 부서별 소계, 총계를 조회한다.
SELECT  department_id, job_id, COUNT(*) 사원수, SUM(salary) 급여합계
FROM    employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id;





▪ ROLLUP 
GROUP BY 절에 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께 
단계별 소계, 총계 정보를 구할 수 있다.





▪ CUBE
GROUP BY 절에 CUBE   함수를 사용하여 GROUP BY 구문에 의한 결과와 
모든 경우의 조합에 대한 소계, 총계 정보를 구할 수 있다.






[예제 4-15] 부서 내 업무별 사원수와 급여합계, 부서별 소계, 업무별 소계, 총계를 조회한다.
SELECT  department_id, job_id, COUNT(*) 사원수, SUM(salary) 급여합계
FROM    employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id;











