
--한줄 삭제(잘라내기) ☞ shift + del
--윗줄 복제 ☞ ctrl + shift + d ☞ Ctrl + D
--주석 ☞ ctrl + shift + /

-----------------------------------------------------------------------------------------------
패스워드 기간(180일) 연장 : system으로 로그인 후 
-----------------------------------------------------------------------------------------------
--ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
--ALTER USER 사용자명 ACCOUNT UNLOCK;
--ALTER USER 사용자명 IDENTIFIED BY 0000;
--
--ALTER USER hr ACCOUNT UNLOCK;
--ALTER USER hr IDENTIFIED BY 0000;
--
--ALTER USER hanul ACCOUNT UNLOCK;
--ALTER USER hanul IDENTIFIED BY 0000;
--COMMIT;
-----------------------------------------------------------------------------------------------

※ pl/sql developer 사용자 환경 설정(도구탭 > 환경설정...)

UTF-8로 인코딩 : (검색어에 인코딩)
 - 도구 > 환경설정... > 제일위의 환경 > 인코딩의 UTF-8

SQL developer 창 초기화 : 
 창 > 팩토리 설정으로 창 재설정

SQL developer 도구 글꼴 변경 : (검색어에 글꼴)
 - 도구 > 환경설정... > 코드 편집기 > 글꼴 > 글꼴 크기

SQL developer에서 줄번호 보이게 설정 : (검색어에 행)
 - 도구 > 환경설정 > 코드 편집기 > 행 여백 > 행 번호 표시에 체크.

탭 설정 : (검색어에 들여쓰기 > 왼쪽 코드편집기 > 형식)
 - 도구 > 환경설정 > 코드 편집기 > 형식 > 들여쓰기 공간
 
SQL developer에서 글자색 바꾸기 : (검색어에 글꼴 > 왼쪽의 코드 편집기 > PL/SQL 구문색상)
 - 도구 > 환경설정 > 코드 편집기 > PL/SQL 구문색상 > 개별적으로 선택해서 전경색 바꾸기
  (기본 숫자, 기본 식별자, 기본 연산자, 기본 주석, 기본 중괄호, 기본 키워드)

새 탭에 질의 결과 표시 : (검색어에 질의 > 데이터베이스의 워크시트) 
 - 도구 > 환경설정... > 데이터베이스 > 워크시트 > 새 탭에 질의 결과 표시

테이블 한 번 눌러 객체 열기 해제 : (검색어에 객체)
 - 도구 > 환경설정... > 데이터베이스 > 객체 뷰어 > 한 번 눌러 객체 열기 해제

SQL Developer의 다른 탭에서 여러 테이블 열기 : (검색어에 객체뷰어)
 - 도구 > 환경설정... > 데이터베이스 > 객체 뷰어 > 객체 뷰어 창 자동 고정 체크

SQL Developer의 배경색을 사용하여 널 표시 : (검색어에 널 > 왼쪽의 데이터베이스의 고급)
 - 도구 > 환경설정... > 데이터베이스 > 고급 > 배경색을 사용하여 널 표시 > 오렌지 색깔 선택

한줄 삭제(잘라내기) ☞ shift + del
윗줄 복제 ☞ ctrl + shift + d ☞ Ctrl + D
주석 ☞ ctrl + shift + /

-----------------------------------------------------------------------------------------------