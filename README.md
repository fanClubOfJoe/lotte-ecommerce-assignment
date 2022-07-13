# 🎥MOOBIT 
### 영화 예매사이트, MOOBIT!
![moobit](https://user-images.githubusercontent.com/21255149/178376969-acef4bc6-23cc-4801-af50-983842a544cb.png)

영화 정보를 한눈에 보고 영화를 예매할 수 있도록 하는 영화 예매 웹사이트입니다.

### 프로젝트 기간
2022.07.08 ~ 2022.07.12

<br/>

## Feature

- 로그인 및 회원가입 : 아이디 중복확인 / 비밀번호의 보안 강도 체크, 아이디 / 비밀번호 찾기
- 홈화면 : 캐러셀을 사용하여 3개의 최근 영화 소개, 영화 예매율 순위 top5 
- 예매 : 날짜 별 예매할 수 있는 영화 보여주기(개봉 후 7일 동안), 영화와 시간을 선택하여 예매하기
- 영화 : 최근 개봉하거나 개봉할 영화의 목록 확인, 영화 제목, 장르, 줄거리 검색 기능
- 마이페이지 : 회원 정보 조회 및 수정, 내가 예약한 예매정보와 내가 작성한 리뷰 보기

<br/><br/>

## :open_file_folder: Database

#### DB 설계
<img src="https://user-images.githubusercontent.com/49184115/178485861-213a59f2-98bd-4752-9b5c-ab8f81cda213.png" width="70%">

#### DB 구현
<img src="https://user-images.githubusercontent.com/49184115/178485878-66576f95-a25d-430c-9f9e-ec0b8bb61ef6.png" width="70%">

<br/><br/>

## 🛠 Stack
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"></a>
<img src="https://img.shields.io/badge/JSP-000000?style=for-the-badge&logo=JSP&logoColor=white"/></a>
<img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/></a>
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/></a>
<a href="https://www.mysql.com/" target="_blank"><img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white"/></a>

<br/><br/>

### 🚩Structure
| ![structure](https://user-images.githubusercontent.com/21255149/178444119-388058de-e294-49e1-9f5b-75638bd3e7b8.png) | 
| :--: |
| ![image](https://user-images.githubusercontent.com/49184115/178495285-99ef2b10-859a-4ec0-83ca-0b74a6d46102.png) |
| ![MVC2](https://user-images.githubusercontent.com/49184115/178566912-62b314d5-6d95-4d46-a886-5f6753680b04.png) |
| <img width="250" alt="jsp" src="https://user-images.githubusercontent.com/49184115/178567153-abe1df0e-8581-430d-a564-3b640a0ef950.png"><img width="230" alt="java" src="https://user-images.githubusercontent.com/49184115/178567161-8835fe4a-deb0-4bbd-b5bb-a6f06f3dc7d5.png"> <img width="400" alt="project 구조" src="https://user-images.githubusercontent.com/49184115/178573209-dc40c835-48c5-4cd5-ac22-81e985764874.png"> |



<br/><br/>

## 🌉 UI/UX

<br/>

### 메인화면

|![main_carousel](https://user-images.githubusercontent.com/21255149/178461083-2cc17e09-fdeb-4172-b8bc-40982d029ef1.gif) |
| :---: | 
| 캐러셀을 사용하여 3개의 영화 소개 | 

<br/><br/>

### 유저

| ![image](https://user-images.githubusercontent.com/72608849/178494043-220aceb8-494c-487f-afa6-c67afd0b17f0.png) |
| :--: | 
| 로그인 |
| ![image](https://user-images.githubusercontent.com/72608849/178493306-4de94e73-e5ff-4b00-ab30-6dfec4311ffd.png) |
| 회원가입 | 
| ![화면 기록 2022-07-12 오후 8 54 08](https://user-images.githubusercontent.com/72608849/178484729-fc76a795-50a6-456a-beb8-87a4fd5de237.gif) |
| 아이디 중복확인 / 비밀번호의 보안 강도 체크 | 
| ![](https://user-images.githubusercontent.com/72608849/178481348-546dddef-0703-4dfd-bdc6-fa513ebd58d9.png) |
| 아이디 찾기 | 
| ![](https://user-images.githubusercontent.com/72608849/178481446-fba4cdd5-da92-4b87-9e59-0141596ada96.png) |
| 비밀번호 찾기 | 

 <br/><br/>
 
#### 마이페이지 

| ![](https://user-images.githubusercontent.com/72608849/178485377-5c4bcf45-f126-40ae-987f-5a74599a1c24.png) | 
| :--: |
| ![](https://user-images.githubusercontent.com/72608849/178485534-e787cae4-de4d-43eb-853a-9079c262a5a3.png) | 
| 회원 정보 조회 및 수정 | 
| ![image](https://user-images.githubusercontent.com/49293971/178494212-675483bd-b6f3-4cfc-9f40-4c2976dd9d63.png) | 
| 내가 예약한 예매정보와 내가 작성한 리뷰 보기 |

<br/><br/>

### 예매

|![reserve](https://user-images.githubusercontent.com/72608849/178485153-b1e78b95-ce4f-471d-bd74-89a151e5a430.png) |
|:--:|
|날짜 별 예매할 수 있는 영화 보여주기(개봉 후 7일 동안) |
|![reservedetail](https://user-images.githubusercontent.com/21255149/178454497-9b3792c1-18b9-496e-b365-c3cb77673f34.png) |
|영화와 시간을 선택하여 예매하기(예매 가능 여부와 결제 방식 선택) |

<br/><br/>

### 영화

|![movielist](https://user-images.githubusercontent.com/21255149/178458392-0012de82-7489-4c46-a507-2406c27af9a1.png) |
|:--:|
| 영화 목록 보여주기 | 
|![movielist_search](https://user-images.githubusercontent.com/21255149/178459112-2ee1225f-9e6c-4906-9f41-74d090eae3c4.png)|
| 영화 검색하기(제목, 카테고리, 내용) | 
|![image](https://user-images.githubusercontent.com/49184115/178539221-49bc9cc5-fb19-4237-836c-e5ec653ed26d.png)|
| 영화 상세정보 페이지 |

### 리뷰

영화 상세정보 페이지에서 확인할 수 있는 영화 리뷰 목록 

| ![image](https://user-images.githubusercontent.com/49293971/178494386-d8064d79-56cb-4d6d-a861-2ab3e9d922e6.png) | 
|:--:|
| 리뷰 작성 |
| ![화면-기록-2022-07-12-오후-9 45 17](https://user-images.githubusercontent.com/51360315/178494990-52fab357-849a-43cb-8c8f-181e8ddd910c.gif)| 
| 리뷰 수정 / 삭제하기 |
| ![화면-기록-2022-07-12-오후-9 50 40](https://user-images.githubusercontent.com/51360315/178494903-0fe79ee9-110c-4a51-81a2-6f1b4f679c00.gif) |

<br/><br/>

## :hammer: 추가로 보완할 사항

영화관을 늘려서 다른 영화관 정보를 추가하기

<br/><br/>

## :books: Documentation
- [Wireframe](https://www.figma.com/file/8NEzmgLCKt5ItSjDZGlT8J/Lotte-CGV?node-id=0%3A1)
- [DB](https://kanamycine.notion.site/DB-f3a403c446a841b4845dd7ed94debcb7)

<br/><br/>
 
## 👩‍팀원
|  강예나  |  김은진  |  신은총  |  천예원 |  최규진  |  최진영  |
| :----------: |  :--------:  |  :---------: |  :---------: | :---------: | :---------: |
| [<img src="https://user-images.githubusercontent.com/62419355/178489222-02bfae9d-d535-4186-ae6c-737e6bfc86ad.png" width="100px" height="100px"><br/>Github](https://github.com/KangYena)| [<img src="https://user-images.githubusercontent.com/21255149/178378210-d036f6fd-311d-4891-b791-2e662c164e9c.jpg" width="100px" height="100px"><br/>Github](https://github.com/JiniEun) | [<img src="https://user-images.githubusercontent.com/21255149/178379443-7ead27aa-ec24-4e15-8935-750b1cafa08c.jpg" width="100px" height="100px"><br/>Github](https://github.com/chd830) | [<img src="https://user-images.githubusercontent.com/21255149/178380114-883584be-1c0f-44e6-90ed-c4ce3658c1c9.jpg" width="100px" height="100px"><br/>Github](https://github.com/jikimomo)| [<img src="https://user-images.githubusercontent.com/21255149/178379157-65dd719a-76db-4c2f-8881-ce9e43e9fed9.jpg" width="100px" height="100px"><br/>Github](https://github.com/kjchoi1997) | [<img src="https://user-images.githubusercontent.com/21255149/178440960-0432363d-cdef-4a8f-a917-4badaeb26571.jpg" width="100px" height="100px"><br/>Github](https://github.com/kanamycine) |
| UI,UX / 프론트 | 영화 / 리뷰 | 예매 | 크롤링 / 프론트 | 유저 | 유저 / 리뷰 |

