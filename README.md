

## 배달의 민족 반찬  by 이규현

```html
<iframe width="872" height="491" src="https://www.youtube.com/embed/0xTYpg4B0pw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```
### [ API ⬌ iOS 구성 체크리스트 ]

#####[API 문서 URL](https://baeminchan-project.gitbook.io/project/)

##### MVP 선정 : 검색 / 장바구니 / 주문 

#####사용된 Pods : Alamofire, FSCalendar, FacebookCore, FacebookLogin

- 카테고리 조회 
  - [x] 카테고리 가져오기 : **[GET]** ⬌ requestCategory   
  - [x] 세부 카테고리 가져오기 : **[GET]** ⬌ requestCategory
- 아이템 조회
  - [x] 반찬 정보 상세보기 : **[GET]** ⬌ requestItem
- 장바구니
  - [x] 장바구니 조회 : **[GET]** ⬌ requestCart.hitsItem
  - [x] 장바구니 추가 : **[POST]** ⬌ requestCart.addItem
  - [ ] 장바구니 반찬 수량 변경 : **[PATCH]** ⬌ 미구현
  - [ ] 장바구니 반찬 삭제 : **[DELETE]** ⬌ 미구현
- 주문하기
  - [ ] 주문목록 조회 : **[GET]** ⬌ 미구현
  - [x] 주문하기 : **[POST]** ⬌ requestOrder
  - [ ] 특정 주문 조회하기 : **[GET]** ⬌ 미구현
- 검색하기
  - [x] 반찬 조회 : **[GET]** ⬌ requestSearch
- 댓글추가
  - [ ] 댓글 추가 : **[POST]** ⬌ 미구현
  - [ ] 댓글 조회 : **[GET]** ⬌ 미구현
- 찜하기 
  - [ ] 찜 목록 조회 : **[GET]**  ⬌ 미구현
  - [ ] 찜하기 : **[POST]** ⬌ 미구현
  - [ ] 찜 삭제 : **[DELETE]** ⬌ 미구현
- 회원관리
  - [x] 회원가입 : **[POST]**  ⬌ *이전 형태의 API 요청*, 
  - [x] 회원가입 중복체크 : **[POST]**  ⬌ 이전 형태의 API 요청
  - [x] 로그인 : **[POST]**  ⬌ 이전 형태의 API 요청
  - [ ] 소셜 로그인 : [POST]  ⬌ 미구현

----

###[ 주문 시나리오 ]

1. 마이페이지 회원가입 
2. 로그인
3. 검색 : 고기, 나물, 아이반찬
4. 밥죽면 선택 - 밥, 죽, 면 클릭
5. 뒤로 가서 아이반찬 클릭
6. 간식음료 클릭
7. 크림감자 궁중떡볶이 클릭
8. 썸네일 이미지 스크롤
9. 장바구니 담기 클릭
10. 장바구니 이동 클릭
11. 계속 쇼핑 클릭
12. 국찌개 클릭
13. 북어 콩나물국 장바구니 담기
14. 확인
15. 홈 탭 클릭
16. 홈 메뉴 스크롤
17. 홈 공지사항 스크롤
18. 카테고리 왼쪽 목록 여러개 클릭
19. 홈탭
20. 네비게이션 장바구니 클릭
21. 체크박스 한번씩 체크하고
22. 희망 배송일 체크
23. 날짜 12월 25일 체크하고 넘어가서 2019년 1월 10일 체크
24. 주문하기
25. 휴대폰 번호 입력하기
26. ''위례성대로 2'' 검색 주소 추가
27. 결제하기 클릭
28. 결제가 완료되었습니다. 



----



### 팀구성

이규현, 

~~장은서~~ : 프로젝트 시작 전 부재

------



### 방법론

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

- Git Issues, 이슈 관리자 qbbang23
- Assiness, 해당 작업 담당자 qbbang
- Labels, 해당 작업의 성격

  - User Story : 요구 사항, 요구 기능
- Milestone, 해당 작업이 속한 파트, Sprint1-4



#### CI Tool - Bitrise

- 월화수목금토, 매일 8:00 master 빌드
  - ~~tachikoma - cocoa pods 업데이트 시 자동 PR 설정~~
    - exec tachikoma - Run if previous Step failed
  - ~~Danger~~
    - Fail, Warning Rule 정해야함으로 패스
  - ~~houston - local Push Notifications~~
    - device_token print 안됨
    - 앱ID, APNs SSL 인증서 생성 [링크](https://docs.aws.amazon.com/ko_kr/pinpoint/latest/developerguide/apns-setup-appid.html)
    - capabilities ON [링크](https://stackoverflow.com/questions/40991477/didregisterforremotenotificationswithdevicetoken-not-getting-called-on-ios-10)
  - tenma - 릴리즈 자동화 툴
  - fastlane - 배포 자동화 툴, App Store 신청



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






