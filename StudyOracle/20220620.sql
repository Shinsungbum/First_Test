3장. 기본 함수(단일결과행)
: 숫자함수, 문자함수, 날짜함수, 형변환함수, 일반함수
함수의 유형 : 단일(결과)행 함수, 다중(결과)행 함수☞ 복수행 함수
숫자함수 : ROUND, TRUNC, CEIL, FLOOR
문자함수 : UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD,
           SUBSTR, INSTR, REPLACE, TRANSLATE
날짜함수 : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
형변환함수 : TO_CHAR, TO_NUMBER, TO_DATE
일반함수 : NVL, NVL2, COALESCE, DECODE, CASE~END

3.1  숫자 함수
▎ABS(n)
ABS 함수는 n의 절대값을 반환하는 함수이다.

[예제 3-1] 
SELECT ABS(32), ABS(-32)
FROM dual;

SIGN 함수는 n이 양수인지 음수인지의 여부를 반환하는 함수이다. 
n이 양수이면 1을, n이 음수이면 –1을, 0이면 0을 반환한다. 

[예제 3-2] 
SELECT SIGN(32), SIGN(-32), SIGN(0)
FROM dual;

1) 반올림 함수 : ▎ROUND(n [, i]), ROUND(숫자, 소수이하/소수이상 자릿수)
소수이하/소수이상 자릿수 : 음수지정가능, 생략시 default 0 -> 정수로 표현
소수이하 둘째자리까지 표현 : ROUND(1234.56789, 2) -> 1234.57
소수이하/이상자리수    -3-2-1 0   1 2 3 
                        1 2 3 4 . 5 6 7 8 9 

SELECT  ROUND(1234.56789, 2)    r1, --1234.57
        ROUND(1234.56789, 1)    r2, --1234.6
        ROUND(1234.56789, 0)    r3, --1235
        ROUND(1234.56789)       r4, --1235 : 정수로 표현, 일단위로 표현
        ROUND(1234.56789, -1)   r5, --1230 : -1이면 0이 1개, 십단위로 표현
        ROUND(1234.56789, -2)   r6, --1200 : -2이면 0이 2개, 백단위로 표현
        ROUND(1234.56789, -3)   r7 --1000  : -3이면 0이 3개, 천단위로 표현
FROM    dual;

2) 무조건 버림함수 : ▎TRUNC(n [, i]), TRUNC(숫자, 소수이하/소수이상 자릿수)
소수이하/소수이상 자릿수 : 음수지정가능, 생략시 default 0 -> 정수로 표현
소수이하 둘째자리까지 표현 : TRUNC(1234.56789, 2) -> 1234.56
소수이하/이상자리수    -3-2-1 0   1 2 3 
                        1 2 3 4 . 5 6 7 8 9 

SELECT  TRUNC(1234.56789, 2)    t1, --1234.56
        TRUNC(1234.56789, 1)    t2, --1234.5
        TRUNC(1234.56789, 0)    t3, --1234
        TRUNC(1234.56789)       t4, --1234 : 정수로 표현, 일단위로 표현
        TRUNC(1234.56789, -1)   t5, --1230 : -1이면 0이 1개, 십단위로 표현
        TRUNC(1234.56789, -2)   t6, --1200 : -2이면 0이 2개, 백단위로 표현
        TRUNC(1234.56789, -3)   t7 --1000  : -3이면 0이 3개, 천단위로 표현
FROM    dual;

3) 숫자보다 같거나 큰 정수를 반환하는 함수 : CEIL(n) - 무조건 올림 정수
게시판에서 페이지 나눌때(☞ 페이징처리) 페이지당 10개씩 출력시
0~1 사이에는 무수히 많은 실수
CEIL(0.99999999999999999999999999999)  -> 1
CEIL(0.00000000000000000000000000001)  -> 1
CEIL(0)                                -> 0
CEIL(12.1)                             -> 13

4) 숫자보다 같거나 작은 정수를 반환하는 함수 : FLOOR(n) - 무조건 내림 정수
게시판에서 페이지 나눌때(☞ 페이징처리) 페이지당 10개씩 출력시
0~1 사이에는 무수히 많은 실수
FLOOR(0.99999999999999999999999999999)  -> 0
FLOOR(0.00000000000000000000000000001)  -> 0
FLOOR(0)                                -> 0
FLOOR(12.1)                             -> 12

숫자 데이터를 표현할 수 있는 함수 : ROUND, TRUNC, CEIL, FLOOR
소수점 데이터를 표현할 수 있는 함수 : ROUND, TRUNC
정수 데이터를 표현할 수 있는 함수 : CEIL, FLOOR, ROUND/TRUNC(2번째 파라미터가 0일때)

5) 나머지를 반환하는 함수 : MOD(m,n) MOD(숫자, 나눌숫자)
SELECT  MOD(17, 4)      m1, --1
        MOD(17, -4)     m2, --1
        MOD(-17, 4)     m3, --(-1)
        MOD(-17, -4)    m4, --(-1)
        MOD(17, 0)      m5 --17
FROM    dual;
                  값         젯수    몫             나머지
  17  /    4  :  17      =    4     4                1
  17  /   -4  :  17      =   -4    -4                1
 -17  /    4  : -17      =    4    -4               -1
 -17  /   -4  : -17      =   -4     4               -1
  17  /    0  :  17      =    0     54645645        17
 
 
 3.2 문자 함수
 1. 대/소문자 변환함수 : UPPER/LOWER(문자)
 
 01. 문자/ 날짜 데이터 표현 : ''(홑따옴표)로 묶음
 성이 King 인 사원들의 사번, 성, 명 조회
SELECT      employee_id, first_name, last_name
FROM        employees
--WHERE       last_name = INITCAP('king');
--WHERE       LOWER(last_name) = 'king';
WHERE       UPPER(last_name) = 'KING';


02. 성에 대소문자 무관하게 z가 포함되어있는 사원들의
사번, 성, 명 조회
SELECT      employee_id, first_name, last_name
FROM        employees
--WHERE     last_name LiKE '%z%'
--OR        last_name LIKE '%Z%';
--WHERE     LOWER(last_name) LiKE '%z%';
WHERE       UPPER(last_name) LIKE '%Z%';

2. 파라미터로 받은 문자열에서 알파벳 단어 단위로
첫글자를 대문자화, 나머지는 소문자화 하여 결과를 반환하는 함수 : INITCAP

SELECT      INITCAP('i am a boy') CAP1,
            UPPER('i am a boy') CAP2,
            LOWER('I AM A BOY') CAP3
FROM        dual;

SELECT      email, INITCAP(email) initcap,
            first_name, UPPER(first_name) UPPER, LOWER(first_name) lower
FROM        employees;

3. LPAD(char1, n [, char2]), RPAD(char1,n[,char2])
   LPAD(대상, 전체크기[, 채울문자]), RPAD(대상문자,전체크기[,채울문자])
   : 채울문자 생략시 기본값은 공백문자
   
SELECT      LPAD('abc', 5, '?') l1, --??abc
            LPAD('abc', 5)      l2,
            RPAD('abc', 5, '#') r1,
            RPAD('abc', 5)      r2
FROM        dual;

4. 문자 데이터에서 특정문자를 제거하고 반환하는 함수
: 제거할 문자는 한개만 지정가능 생략시 공백
: 파라미터 사이에 컴마 없음
: 제거할 위치 생략시 양쪽

 TRIM([LEADING, TRAILING, BOTH] [, trim_char] [FROM] char)
 TRIM([제거할위치[, 제거할문자] [FROM] 대상문자)
 TRIM([왼쪽, 오른쪽, 양쪽] [, 제거문자한개] [FROM] 대상문자)
 
 SELECT     TRIM('a' FROM 'abcdcbaaaaa')            t1,  --bcdcb
            TRIM(LEADING 'a' FROM 'abcdcbaaaaa')    t2,  --bcdcbaaaaa
            TRIM(TRAILING 'a' FROM 'abcdcbaaaaa')   t3,  --abcdcb
            TRIM(BOTH 'a' FROM 'abcdcbaaaaa')       t4,  --bcdcb
            '    abcdcbaaaaa   '                    t5,  --_____abcdcbaaaaa_____
            TRIM('    abcdcbaaaaa   ')              t6   --abcdcbaaaaa
 FROM       dual;

5. 문자 데이터에 특정문자를 제거하고 반환하는 함수
   : 제거할 문자를 여러개 지정 가능 ☜ trim함수와의 차이점
--   ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
LTRIM(char1 [, char2], RTRIM(char1 [, char2])
RTRIM(대상문자열 [, 제거할문자나열], RTRIM(대상문자열 [, 제거할문자나열])
: 제거할 문자열 생략시 공백문자

SELECT      LTRIM('abcdcba','a')     t1, --bcdcba
            LTRIM('abcdcba','ab')    t2, --cdcba
            LTRIM('abcdcba','ba')    t3, --cdcba
            RTRIM('abcdcba','acb')   t4, --abcd
            RTRIM('abcdcba','adb')   t5, --abcdc
            RTRIM('abcdcba','bc')    t6, --abcdcba
            RTRIM('    abcdcba    ') t7 --____abcdcba
FROM        dual;

6. 문자열에서 문자열의 일부를 반환(몇번째부터 몇글자)하는 함수
SUBSTR(char, position[, length])
SUBSTR(대상문자열, 시작위치[, 몇글자])
position : 음수지정가능 ☜ 오른쪽부터
length : 몇글자, 생략시, 문자열의 끝까지 반환

SELECT      SUBSTR('You are not alone', 5, 3) STR1, --are
            SUBSTR('You are not alone', 5)    STR2, --are not alone
            SUBSTR('You are not alone', 0, 5) STR3, -- You a
            SUBSTR('You are not alone', -5, 3) STR4, -- alo
            SUBSTR('You are not alone', -5) STR5    -- alone
FROM        dual;

7. 문자열에서 특정 문자열이 위치한 시작위치를 반환하는 함수
INSTR(char, search_string [, position] [ , _th])
INSTR(대상문자열, 찾을문자열 [, 문자열찾는시작위치] [ , _몇번째거])
문자열 찾는 시작위치 : 음수지정가능, 
    음수지정시 오른쪽부터 - 왼쪽방향으로 쭉쭉쭉 계속 진행
몇변째거 : 생략가능, 기본값 : 1
                    1     7  11 14 17 20
SELECT      INSTR('Every Sha-la-la-la-la', 'la')            i1, -- 11
            INSTR('Every Sha-la-la-la-la', 'la', 1, 2)      i2, --14 
            INSTR('Every Sha-la-la-la-la', 'la', 12, 2)     i3, --17 
            INSTR('Every Sha-la-la-la-la', 'la', 12, 4)     i4, --0 
            INSTR('Every Sha-la-la-la-la', 'la', 12)        i5, --14 
            INSTR('Every Sha-la-la-la-la', 'la', -3, 2)     i6, --14 
            INSTR('Every Sha-la-la-la-la', 'la', -10)       i7 --11 
FROM        dual;

jobs 테이블에서 업무코드, 업무제목, 직무, 직책 조회
직무와 직책은 업무코드에서 _ 를 기준으로 조회 (직무_직책)
SELECT      job_id, job_title
FROM        jobs;

--------------------------------------------------------------------------------
job_id, 직무, 직책, job_title
AD_PRES AD      PRES President
--------------------------------------------------------------------------------
SELECT      job_id, SUBSTR(job_id,1 ,INSTR(job_id, '_')-1) 직무,
            SUBSTR(job_id,INSTR(job_id, '_')+1) 직책,
            job_title
FROM        jobs;



--------------------------------------------------------------------------------
자기 이메일에서 id와 서비스제공자를 조회
hongildong@hanmail.net

나의이메일                   id             서비스제공자
hongildong@hanmail.net      hongildong      hanmail.net
--------------------------------------------------------------------------------

SELECT      SUBSTR('hongildong@hanmail.net', 0, INSTR('hongildong@hanmail.net', '@') -1) id,
            SUBSTR('hongildong@hanmail.net', INSTR('hongildong@hanmail.net', '@') +1) 서비스제공자
FROM        dual;




















