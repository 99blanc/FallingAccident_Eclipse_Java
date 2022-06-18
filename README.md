 # (한이음 병행) 노인복지(낙상방지) 프로그램
 ##### - (낙상 방지, 온도, 심박수 등)
---
> 최초 수정일 : 22.03.28
>> 수정일 : 22.06.16
>>> 최종 수정일 : 22.06.17
---
### 개발 언어 : Java(자바)
### 개발 도구 : Eclipse(이클립스)
### DB 서버 : MSSQL(마이크로소프트 SQL)
### 개발 환경 : Windows 10(윈도우 10)
---
##### 개발 담당 : 김세현, 노윤호
---
> 수정일 22.03.28
##### - 낙상방지 프로그램에 관한 프로젝트 확인
##### - 아두이노 관련 소스코드 지급
> 수정일 22.04.21
##### - 낙상방지 프로젝트 명칭 변경 -> 노인복지(낙상방지) 프로그램
##### - 아두이노 관련 소스코드와 조언
##### - 교수 면담
> 수정일 22.06.06
##### - DB 서버 선택 MSSQL, JDBC
> 수정일 22.06.07
##### - 자바 환경 Java 17(17.0.3-)으로 변경
> 수정일 2022.06.16
##### - 아두이노 시리얼 연결을 통해 자바와 연결 성공(rxtxComm.jar) 클래스 연동
##### - 아두이노에서 자바로 데이터 수신 값 처리 
##### - MSSQL 서버 연동 데이터베이스 이름, 유저 아이디와 패스워드 입력받아 낙상방지
#####   전용 데이터 입력(가상 데이터 대체)
---
> 수정일 2022.06.17
##### - SQLServer.java 개발 insert, delete, update 처리 메소드와 download 메소드 구현
##### - List.java와 Database.java로 클래스 객체를 선언하여 구조체로 변환 성공
##### - LoginGUI.java 자바 스윙 컴포넌트를 이용하여 GUI 개발
---
> 수정일 2022.06.18
##### - 사용자와 관리자 매핑 각각 구현
##### - GUI가 새로고침 또는 로드 될 때마다 DB 최신화 성공
##### - 사용자와 관리자 정보 수정 추가
##### - GUI 매핑으로 사용자와 관리자 정보를 직접 받아올 수 있게 구현
---
> 수정일 2022.06.19
##### - 회원 상태와 정보 페이징 처리 구현
##### - 예외 처리 추가
##### - 회원 상태를 정상, 주의, 위험으로 가시화
##### - GUI JFrame 디자인 전면 수정
##### - 사용자와 관리자 정보 수정 해결
##### - 메소드 최적화
##### - MSSQL 서버에서 바로 데이터 삽입이 일어날 경우 GUI에서도 데이터 로드 구현
##### - 오류 테스트(김세현, 노윤호 각각 실시)
##### - 사용자에서 관리자로의 변환 
---
