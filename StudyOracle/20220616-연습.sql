사원테이블에서 모든 컬럼 조회
SELECT      *
FROM        employees;


사원테이블에서 사번, 이름, 성 조회
SELECT      employee_id, first_name||' '||last_name name
FROM        employees;


사원들에 대한 사번, 이름, 성, 부서코드, 입사일자, 업무코드, 급여 조회
SELECT      employee_id, first_name||' '||last_name name, department_id, hire_date, job_id
FROM        employees;


01. 80번 부서의 사원의 사번, 성, 급여, 한 해 동안 받은 급여(연봉) 조회
SELECT      employee_id,  first_name||' '||last_name name, salary 급여, salary *12 연봉
FROM        employees
WHERE       department_id = 80;


02. 연봉이 150000 이상인 사원들의
SELECT      *
FROM        employees
WHERE       salary * 12 >= 150000;


01. 사번이 101번인 사원의 사번, 성명을 조회
성명은 이름과 성을 합해서 사용한다.
SELECT      first_name||' '||last_name name
FROM        employees
WHERE       employee_id = 101;


02. 성명이 'StevenKing' 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드 조회
성명은 이름과 성을 합해서 사용한다.
SELECT      employee_id,first_name||' '||last_name name, job_id, salary, department_id
FROM        employees
WHERE       first_name||last_name = 'StevenKing';


03. 성명이 'Steven King' 인 사원의 
사번, 성명, 업무코드, 급여, 부서코드(dept_id로 ALIAS) 조회
성명은 이름과 성을 합해서 사용(name으로 ALIAS)한다.
SELECT      employee_id,first_name||' '||last_name name, job_id, salary, department_id dept_id
FROM        employees
WHERE       first_name||last_name = 'StevenKing';


04. 사번이 101번인 사원의 사번, 성명을 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      employee_id, first_name||' '||last_name name
FROM        employees
WHERE       employee_id = 101;



05. 사번이 101번인 사원의 성명과 한 해 동안 받은 급여를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
연봉은 'annual salary'로 별명한다.
SELECT      first_name||' '||last_name name, salary * 12 "annual salary"
FROM        employees
WHERE       employee_id = 101;


01. 급여가 3000 이하인 사원의 
사번, 성, 급여, 부서코드, 업무코드를 조회한다.
SELECT      employee_id, first_name, salary, department_id, job_id
FROM        employees
WHERE       salary <= 3000;



02. 부서코드가 80 초과인 사원의 
사번, 성, 급여, 부서코드를 조회한다.
SELECT      employee_id, first_name, department_id
FROM        employees
WHERE       department_id > 80;



03. 부서코드가 90인 부서에 속한 사원들의
사번, 이름, 성, 부서코드, 업무코드 조회
SELECT      employee_id, last_name, first_name, department_id, job_id
FROM        employees
WHERE       department_id = 90;


04. 급여가 17000 인 사원들의
사번, 이름, 성, 부서코드, 급여 조회
SELECT      employee_id, last_name, first_name, department_id, salary
FROM        employees
WHERE       salary = 17000;



05. 급여가 3000 이하인 사원들의 
사번, 이름, 성, 업무코드, 급여, 입사일자 조회
SELECT      employee_id, last_name, first_name, job_id, hire_date
FROM        employees
WHERE       salary < 3000;


06. 급여가 15000 이상인 사원들의
사번, 이름, 성, 업무코드, 급여 조회
SELECT      employee_id, last_name, first_name, job_id, salary
FROM        employees
WHERE       salary >= 15000;



07. 성이 King 인 사원들의
사번, 이름, 성, 부서코드 조회
SELECT      employee_id, first_name, last_name, department_id
FROM        employees
WHERE       last_name = 'King';



--오늘 날짜 조회, dual : 가라 데이터, 가짜 데이터
 
--날짜 포맷을 사용하여 사용자가 원하는 형태의 문자로 바꿔 반환
08. 입사일이 2004년 1월 1일 이전(2003년까지)인 사원의 
사원코드, 성, 입사일자를 조회
SELECT      employee_id, last_name, hire_date
FROM        employees
WHERE       hire_date < '2004/01/01';




01. 30번 부서 사원 중 급여가 10000 이하인 사원의 
사원코드, 성명, 급여, 부서코드를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      employee_id, first_name||' '||last_name name, salary, department_id
FROM        employees
WHERE       department_id = 30
AND         salary <= 10000;





02. 30번 부서에서 급여가 10000 이하이면서 2005년 이전(2004년까지)에 입사한 사원의 
사원번호, 성명, 급여, 부서코드, 입사일자를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      
FROM        employees
WHERE       






03. 부서코드가 10 이상 30 이하인 사원들의
사번, 성명, 부서코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      
FROM        employees
WHERE       




04. 급여가 10000 이상 15000 이하인 사원들의
사번, 성명, 급여, 업무코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      
FROM        employees
WHERE       






05. 부서가 60인 부서에서 급여가 5000 이상인 사원들의
사번, 성명, 부서코드, 급여 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      
FROM        employees
WHERE       


06. 부서코드가 60 이하이면서 2003년 6월 17일 이전에 입사한 사원들의 
사번, 성명, 입사일자 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT      
FROM        employees
WHERE       



07. 30번 부서나 60번 부서에 속한 사원의 
사번, 성명, 급여, 부서코드를 조회한다
SELECT      
FROM        employees
WHERE       


08. 부서코드가 10, 20, 30인 부서에 속한 사원들의
사번, 성명, 부서코드, 업무코드 조회
SELECT      
FROM        employees
WHERE       


09. 사번이 150, 170, 190 인 사원들의
사번, 성명, 부서코드, 업무코드, 입사일자 조회

4.3 AND 연산자와 OR 연산자를 혼합하여 문장을 작성한다.

10. 30번 부서의 급여가 10000미만인 사원과 60번 부서의 급여가 5000이상인 사원의
성명, 급여, 부서코드 정보를 조회한다.

11. 부서코드가 30인 부서의 급여 10000 미만인 사원들과
부서코드가 60인 부서의 급여 5000 이상인 
사원들의 사번, 성명, 부서코드, 급여 조회


5. 범위 조건 연산자 BETWEEN
BETWEEN 시작값 AND 마지막값 은 시작값 이상 마지막값 이하 와 같다.
★ BETWEEN 이나 관계연산자로 비교할 수 있는 값은 숫자데이터, 문자데이터, 날짜데이터
A이상 B이하: 컬럼명 BETWEEN A AND B
A미만 B초과: 컬럼명 NOT BETWEEN A AND B
             NOT 컬럼명 BETWEEN A AND B
NOT 연산자는 BETWEEN 연산자 바로 앞이나 컬럼명 앞에 붙여 사용할 수 있으며, 두 경우 모두 같은 결과가 조회된다.
            
01. 사번 110번 부터 120번 까지의 
사원번호, 성명, 급여, 부서코드를 조회한다.

02. 사번이 110번 미만 120번 초과인 사원의 
사원번호, 성명, 급여, 부서코드를 조회한다.

03. 논리연산자를 사용해
부서코드가 10 미만 40 초과인 사원들의 
사번, 성명, 부서코드 조회

04. 사번이 110에서 120인 사원 중 급여가 5000에서 10000사이의 
사번, 성명, 급여, 부서코드를 조회한다.

05. 2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원의
사번, 성명, 급여, 입사일자 정보를 조회한다.

06. 입사일자가 2003년 8월 1일 부터 2005년 7월 31일 에 해당하는 사원들의
사번, 성명, 급여, 입사일자 조회

07. 부서코드가 20,30,40,60,100,110 인 부서에 속한 사원들의 
사번, 성명, 부서코드 조회

6. IN 조건 연산자
여러 개의 값 중에 일치하는 값이 있는지 비교할 때는 IN (값1, 값2, 값3 ...) 의 형태로
비교하는 값의 목록을 나열한다.
동일한 컬럼표현에 대해 동등 비교한 형태의 조건식을 OR 로 나열한 형태
     컬럼표현 IN (동등 비교할 데이터값 목록)
 <-> 컬럼표현 NOT IN (동등 비교할 데이터값 목록)
     NOT 컬럼표현 IN (동등 비교할 데이터값 목록)

IN 연산자는 OR 연산자와 동일한 기능을 수행
비교할 값들이 많을 때 OR 연산자를 사용하면 SQL 문장이 길고 복잡해지는데 
IN 연산자를 사용하면 문장이 깔끔해지고 가독성이 높아진다.
IN 연산자 바로 앞이나 컬럼명 앞에 NOT 연산자를 두어 반대되는 조건을 만든다.

01. 30번 부서원 또는 60번 부서원 또는 90번 부서원의 
사번, 성명, 급여, 부서코드를 조회한다.


02. 30번 부서, 60번 부서, 90번 부서 이외의 부서에 속한 사원들의 
사번, 성명, 급여, 부서코드정보를 조회한다.