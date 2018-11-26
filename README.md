- - ## 배달의 민족 반찬



    ### 팀구성

    ------

    이규현, ~~장은서~~

    ------



    ### 방법론

    ------

    #### 애자일 

    민첩하게 요구사항들을 충족, 개발하는 방법

    기능 단위의 프로토타입을 기반으로 개발 진행



    실행 방법 (도구 종류)

    - 스크럼 - 스프린트 기반으로 실행
    - ~~칸반 - Work In Process를 제한하여 실행~~

    [5팀, 우아한남매들 팀폴더](https://drive.google.com/drive/folders/11G4RB23L37wEOwIzHER1vC8MQox5YBLr)

    [5팀, 우아한남매들 애자일 시트](https://docs.google.com/spreadsheets/d/1NZddG2cmCmFJc0sHEVvw-G_QCOrEnMLaTG4FLJmY33Y/edit#gid=1844866790)



    #### 역활

    Product Owner (PO) - 이규현

    - 백로그를 작성하는 주체

      *백로그, 요구사항 리스트, 제품의 개발 대상 목록, 요구사항을 'User Story' 라고 부름

    - SW 개발에 대한 모든 요구사항에 대한 오너쉽을 가짐

    - 제품을 사용할 고객 또는 비즈니스 요구사항을 정의할 사람



    Scurm Master (SM) - 이규현

    - 스크럼 팀의 스크럼이 잘 수행할 수 있도록 도와주는 역활



    Team Member - 이규현

    - Cross-functional 한 롤을 가진 사람들로 이뤄짐

      *Cross-functional이란, 제품이 만들어지기 위해서 필요한 모든 인력 (개발자, 디자이너, 테스터)

    [참고 링크 - brunch.co.kr/@insuk](https://brunch.co.kr/@insuk/13)

    ------



    ### 프로젝트 관리

    ------

    #### Repository

    - 브랜치 관리
      - Master
        - 각 스프린트 완료 후 기능 테스트 통과 시
      - Dev
        - 각 스프린트 완료 시 
      - Environment 
        - cocoa pods : Alamofire, Realm, Lottie, SwiftLint, RxSwift(추후 구현을 위해 설치만)
        - 
      - SprintOne
        - 18.11.26 ~ 18.12.01 까지 작업 내용
      - SprintTwo
        - 18.12.03 ~ 18.12.08 까지 작업 내용
      - SprintThree
        - 18.12.10 ~ 18.12.15 까지 작업 내용
      - SprintForu
        - 18.12.17 ~ 18.12.20 까지 작업 내용



    #### 커밋 방법

    - [Init] — repository를 생성하고 최초에 파일을 업로드 할 때
    - [Add] — 신규 파일 추가
    - [Update] — 코드 변경이 일어날때
    - [Refactor] — 코드를 리팩토링 했을때 Refactor
    - [Fix] — 잘못된 링크 정보 변경, 필요한 모듈 추가 및 삭제
    - [Remove] — 파일 제거
    - [Style] — 디자인 관련 변경사항 Style

    f.g Update, 파일명 \n 상세내용

    ​	상세내용 : func xxx 코드 추가

    [참고 링크 - medium.com/@seungwongo](https://medium.com/returnvalues/우리는-github를-이렇게-사용한다-83789075e5b6)



    #### 코드 리뷰

    - GitHub Pull Request

      - 담당자 : qbbang23

      - 팀원 : qbbang

        fork origin : git@github.com:qbbang/iOS_WoowahanFresh.git

        upstream : https://github.com/ElegantSiblings/iOS.git



    #### 이슈 관리

    - Git Issues 
      - User Story



    ------

    ## 번외 

    ### 프로젝트 진행 시 사용한 Git 기능

    - git add 취소 

      ```git reset HEAD file명 or 명시 하지 않으면 모든 파일 ``` 

    - git commit 취소

      ```git reset --sofrt HEAD^```

      ```git reset --mixed HEAD^``` 


    - git commit 변경

      ```git commit --amend```


    [참고 링크 - gmlwjd9405.github.io](https://gmlwjd9405.github.io/2018/05/25/git-add-cancle.html)

