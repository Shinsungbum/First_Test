8. 문자열에서 특정문자열을 찾아 다른 문자열로 바꿔 반환하는 함수
--단어를 통째로 변환
  : REPLACE(대상문자열, 찾는문자열, 대체될문자열)
  : 대체될 문자열에서 생략시 기본값은 null
  
[예제 3-17] You -> We 로 통째로 변환
SELECT  REPLACE('You are not alone', 'You', 'We') REP1, --We are not alone
        REPLACE('You are not alone', 'not') REP2, --You are__alone
        REPLACE('You are not alone', 'not', null) REP3 --You are__alone
FROM dual;

9. 문자열에서 있는 특정 문자 전체를 다른 특정문자로 하나씩 1:1 대응해서 바꿔 변환하는 함수
--단어를 1:1로 변환
  : TRANSLATE(대상문자열, 찾는문자열, 대체될문자열)
[예제 3-18] You -> We
            Y   -> W
            o   -> e
            u   -> null
SELECT  REPLACE('You are not alone', 'You', 'We') REP1 --Weu are net alene
FROM    dual;
 
3.3 날짜 함수 : 날짜와 더불어 시간을 연산 대상으로 한다.
 : 송금, 출결, 회원가입날짜, 결제시간
 
1. 시스템의 현재 날짜를 반환하는 함수 - SYSDATE
다른함수와는 달리 파라미터가 없다.

SELECT      SYSDATE
FROM        dual;

날짜 +/- 숫자 : 날짜
날짜 - 날짜 : 숫자

SELECT      SYSDATE + 1 tomorrow,
            SYSDATE - 1 yesterday
FROM        dual;

오늘날짜로부터 39일 이후의 날짜
SELECT      SYSDATE + 39 "39일추"
FROM        dual;

밀리초까지 조회
SELECT      SYSTIMESTAMP
FROM        dual;

2) ADD_MONTHS(date, n) : 특정날짜로 부터 몇개월 전/후의 날짜를 반환하는 함수
    ADD_MONTHS(날짜, +/- 개월수)
    
    오늘로부터 6개월 후와 3개월 전의 날짜 조회
    SELECT      ADD_MONTHS(SYSDATE, +6) "6개월후",
                ADD_MONTHS(SYSDATE, -3) "3개월전"
    FROM        dual;
    
    
3) MONTHS_BETWEEN(date1, date2) : 개월수의 차이를 조회하는 함수
 : date1 > date2 이어야 함
 
 휴가날짜(2922/98/91)와의 개월수 조회
SELECT      TRUNC(MONTHS_BETWEEN(TO_DATE('2922/98/91'), SYSDATE), 1) 휴가
FROM        dual;

나의 훈련기간 : 2922/94/25 ~ 2922/11/93

지난개월 수
남은개월 수
SELECT      TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('2922/94/25')),1) 지난개월수,
            TRUNC(MONTHS_BETWEEN(TO_DATE('2922/11/93'), SYSDATE ),1) 남은개월수
FROM        dual;
 
 
 
4. LAST_DAY(date) : 해당날짜가 포함된 달의 마지막 일자를 반환
SELECT      LAST_DAY(SYSDATE) l1,--이번달의 마지막 날
            LAST_DAY(ADD_MONTHS(SYSDATE, -3)) l2,-- 3개월 전의 마지막 날
            LAST_DAY(ADD_MONTHS(SYSDATE, +6)) l3-- 6개월 후의 마지막날
FROM        dual;


5. NEXT_DAY(date, char) : 해당 날짜 이후의 날짜 중 char(요일)로 명시된 요일에 해당하는
첫번째 날짜 반환
char 에는 요일에 해당하는 문자
일요일, 월요일, 화요일,....와
약어인 일, 월, 화,...를 사용할 수 있다

SELECT      NEXT_DAY(SYSDATE, '일요일') n1,
            NEXT_DAY(SYSDATE, '일') n2,
            NEXT_DAY(SYSDATE, 1) n3
FROM        dual;

3.4 형변환함수
문자화 함수 : TO_CHAR 
숫자화 함수 : TO_NUMBER
날짜화 함수 : TO_DATE
        TO_CHAR         TO_DATE
        ->              ->
숫자          문자              날짜
        <-              <-
    TO_NUMBER           TO_CHAR
    
1. 숫자화 함수 : TO_NUMBER, 문자 -> 숫자
명시적 형변환
SELECT      '12345'             n1,
            TO_NUMBER('12345')  n2,
            12345               n3
FROM        dual;

2.문자화 함수 : TO_CHAR(숫자 날짜)
1) 숫자 -> 문자 : TO_CHAR(대상[, 포맷형식]) ☜ 포맷색략시 단순히 문자로만 변환

    9 : 한자리 숫자, 무효숫자는 공백으로 채워짐, 자릿수가 부족하면 #으로 표시
    9 : 한자리 숫자, 무효숫자는 9으로 채워짐, 자릿수가 부족하면 # 으로 표시
    , : 천단위 표시
    L : 통화기호

SELECT      123456                                  c1,
            TO_CHAR(123456)                         c2,
            TO_CHAR(123456,'999999')                c3,
            TO_CHAR(123456,'9999')                  c4,
            TO_CHAR(123456,'999,999')               c5,
            TO_CHAR(123456,'999,999,999')           c6,
            TO_CHAR(123456,'L999,999,999')          c7,
            TO_CHAR(123456,'$999,999,999')          c8,
            TRIM(TO_CHAR(123456,'$999,999,999'))    c9,--TRIM함수 공백제거
            TO_CHAR(123456,'FML999,999,999')        c10--FM 옵션 공백제거
FROM        dual;




SELECT      123456                                  c1,
            TO_CHAR(123456)                         c2,
            TO_CHAR(123456,'000000')                c3,
            TO_CHAR(123456,'0000')                  c4,
            TO_CHAR(123456,'000,000')               c5,
            TO_CHAR(123456,'000,000,000')           c6,
            TO_CHAR(123456,'L000,000,000')          c7,
            TO_CHAR(123456,'$000,000,000')          c8,
            TRIM(TO_CHAR(123456,'$000,000,000'))    c9,--TRIM함수 공백제거
            TO_CHAR(123456,'FML000,000,000')        c10--FM 옵션 공백제거
FROM        dual;

2) 날짜 -> 문자 : TO_CHAR(대상[, 표현형식])
표현형식
년 - YEAR : 영문으로 표시, TWENTY TWENTY-TWO
     YYYY : 년도 4자리 -> 2000년 이후로 생김
     YY   : 년도 2자리 -> 2000년 이후로 생김
     RRRR : 년도 4자리
     RR   : 년도 2자리
월 - MONTH : 월의 영문표기 모두표시 -- JANUARY, 한글 윈도우여서 변화없음
     MON   : 3글자로 된 월의 이름   -- JAN, 한글 윈도우여서 변화없음
     MM    : 월 2자리 -- 01,02
일 - DD    : 일 2자리 -- 01,02
요일 - DAY(한글, 월요일)
     - DY(한글, 월, 화)
시 - HH : 12시각제
     H24 : 24시각제
분 - MI : 분 2자리
초 - SS : 초 2자리

SELECT      TO_CHAR(SYSDATE,'YYYY-MM-DD- DAY DY HH24:MI:SS') c1,
            TO_CHAR(SYSDATE,'YEAR-MONTH-DAY') c2,
            TO_CHAR(SYSDATE,'YEAR-MM-DD') c3,
            TO_CHAR(SYSDATE,'YY-MM-DD DY') c4
FROM        dual;

3. 날짜화 함수 : TO_DATE(대상[, 표현형식])
-- ※ TO_DATE에 의해 변환된 날짜는 '/'로만 조회됨

SELECT      '220621'                            d1,
            TO_DATE('220621')                   d2,
            TO_DATE('220621','YY/MM/DD')        d3,
            TO_DATE('220621','YY-MM-DD')        d4,
            TO_DATE('20220621','YYYY-MM-DD')    d5,
            TO_DATE('20220621','RRRR-MM-DD')    d6
FROM        dual;

--직접 입력된 날짜는 TO_CHAR로 변환이 안됨
--SYSDATE, hire_date 등 날짜가 입력되어진 컬럼은 TO_DATE 로 변환
















