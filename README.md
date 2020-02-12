# MVN_SPRNG_MVC_BRD
메이븐으로 빌드한 스프링  MVC 패턴 게시판 만들기

## 학습진행

### 2020.01.21
- 개발환경 세팅
- 실습 프로젝트 생성
- jsp utf-8 설정
- HTML 강의 

#### 2020.01.22 
- SQL 설치
- MVC의 컨트롤러 설정
- DB와 Spring 연동 

#### 2020.02.06
- MVC 재시작
- 09번까지 진행

#### 2020.02.07
- log4j 라이브러리 logback으로 변경
- mybatis 연동 후 테스트 완료 

#### 2020.02.10
- 게시글 조회 구현 완료
- 게시글 수정, 삭제 등 부분 정적 이전까지 완료(15번 포스트), 디버깅 하기

#### 2020.02.11
- 게시글 조회, 수정, 삭제 디버깅

#### 2020.02.11
- 16번 트랜잭션까지 설정 완료(pom.xml에 aspectJ runtime과 weaver 추가해야 정상 동작함)
  insertFail 추가하고 컨트롤러 등 자바 파일 수정함

#### 2020.02.12
- 17번까지 진행함, java 파일들 수정하고 CommonDto, CommonForm, PagingUtil, ResultUtil, BoardService 자바 파일들 추가함
- 에러는 aspectj pom.xml에 dependency 추가해서 해결했고, 리스트에서 글 하나 잘리는 오류와 리스트 버튼 색깔 변경 방법 찾아보기

#### 찾아보기
- Spring
    - 프레임워크는 이미 구현되어 있는 클래스와 인터페이스의 집합체에 사용자의 코드를 추가하여 동작함, 주도권이 사용자가 아닌 프레임워크에 있음.     
    개발할 때에 설계 기본이 되는 뼈대나 구조/환경을 의미함.(문제 영역을 해결한 재사용, 확장 가능한 라이브러리)
    - 라이브러리는 도구의 개념으로 이미 구현되어 있다는 점은 프레임워크랑 유사하지만, 사용자가 주도권을 가지고 라이브리의 메소드나 함수 등을 호출하여 사용한다.
    - 스프링은 자바의 웹 프레임워크이다. 다양한 플랫폼에서 종속돈 객체를 생성, 조립하는 등 관리를 쉽게 해 준다. 크기와 부하의 측면에서 경량이고, MVC 패턴을 사용한다.
- MVC 패턴
    - MVC란 Model, View, Controller의 약자로 클래스의 의존성을 제어하기 위해 사용하는 웹 프로그래밍에서 표준적인 디자인 패턴이다. 한 묶음으로 코드를 작성한다면 하나의 클래스를 수정할 때, 수정된 클래스에 의존하는 다른 코드들을 전부 수정해야 하는데, MVC 패턴을 사용하여 코드를 용도에 따라 분리한다. 사용자는 원하는 정보를 선택하기 위해서 직접 컨트롤러만 다룬다. 
    컨트롤러는 모델을 통제하여 모델 내부의 데이터 중에서 사용자가 요청한 데이터만을 선별한다. 모델은 출력을 위해 임시로 존재하는 뷰에 선택된 정보들을 출력하고, 뷰는 출력된 정보를 사용자에게 보여주는 역할만을 담당한다.
    여기서 철저한 분리를 위해서는 컨트롤러는 모델이나 뷰의 존재를 몰라야 하고, 뷰는 모델에서 제공받은 정보를 저장해서는 안 된다.
- BOARD의 MVC 요소들
    - Model은 애플리케이션의 비즈니스 로직과 사용되는 데이터를 다루는 영역으로, 데이터는 DBMS에 의해 관리되고 데이터를 다루는 연산은 SQL문을 통해 구현된다.
    - View 영역은 최종 사용자에게 보여줄 프리젠테이션 로직을 담당하는 영역으로, 자바 웹 애플리케이션에서는 jsp를 통해서 구현된다.
    - Controller 영역은 흐름을 관리하는 역할을 하며, 모델과 뷰 영역간에 조정 역할을 한다. 사용자의 요청을 받으면 이를 수행하기 위한 비즈니스 로직을 선택하고 호출하며, 결과를 뷰를 통해 보여준다
    - 본 프로젝트에서는 sontroller, dao, dto, form, service 폴더를 추가해서 mvc 패턴 파일을 그 폴더들에 추가함ㄴ
    - Controller는 DispatcherServlet에 의해 호출되어 사용자의 요청을 전달받고 요청의 처리를 담당하는 서비스 객체를 Spring으로부터 주입받아서(Dependency Injection)받아서, 그 서비스 객체에 처리를 위임하고, 처리 결과와 결과 화면에 대한 정보를 DispatcherServlet에게 반환한다. Controller의 @Controller, @RequestMapping, @aUTOWIRED 서비스 처리 결과를 MODEL에 담으면, 컨트롤러 클래스의 RequestMapping값을 기준으로 DispatcherServlet이 ViewResolver를 통해 화면 URL 생성한다.
    - Service는 controller에 의해 호출되고, 실제 비즈니스 로직과 트랜잭션을 처리한다. DB의 CRUD(생성, 읽기, 갱신, 삭제)를 담당하는 DAO 객체를 Spring으로부터 주입받아서, DAO에 DB CRUD처리를 위임하고 처리 결과를 cONTROLLER에 반환한다. Service @Service, @Transactional, @Autowired 비즈니스 로직과 트랜잭션 처리한다
    - DAO는 Service에 의해 호출되어 쿼리를 담당하는 SqlMapClientTemplate 객체를 Spring으로부터 주입받아서, SqlMapClient 객체에 쿼리 수행을 위힘하고, 처리 결과를 Service에게 반환한다. 
      Dao @Reposiroty, @Autowired @SqlMapClientTemplate을 통해 쿼리 수행 후 겨로가를 반환한다.
    - @Controler는 Presentation Layer에서 Controller를 명시하기 위해서 사용되고, @Service는 Business(Service) Layer는 Service를 명시하기 위해서, @Repository는 Persistence Layer에서 DAO를 명시하기 위해 사용.
    - https://postitforhooney.tistory.com/entry/Spring-MVC-%ED%8C%A8%ED%84%B4%EC%97%90%EC%84%9C%EC%9D%98-5%EA%B0%80%EC%A7%80-%EA%B3%84%EC%B8%B5%EC%97%90-%EB%8C%80%ED%95%9C-%EC%A0%95%EB%B3%B4-%ED%8D%BC%EC%98%B4 - 
    mvc 패턴에서의 5가지 계층에 대한 정보.


- 생활코딩 web1 HTML 
- mysql 포트 3308로 변경
- preparedStatement 찾아보기
- httpsrequest 찾아보기
- ajax, json
- 에러는 aspectj pom.xml에 dependency 추가해서 해결했고, 리스트에서 글 하나 잘리는 오류와 리스트 버튼 색깔 변경 방법 찾아보기
- html 태그 복습하고 스프링 구조, 게시판의 리스팅 로직 더 학습하기
