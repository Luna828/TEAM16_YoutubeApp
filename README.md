#TEAM16: YOUTUBE Clone APP PROJECT
> 앱 숙련 주차 팀 프로젝트 16조입니다
>
> 저희 팀은 YOUTUBE앱 만들기를 선택하여 진행하기로 하였습니다.
>
> 저희는 팀 역할을 총 4가지로 구성하였습니다.
>
> >김은경: 로그인/회원가입 구현
>
> >이한솔: 프로필(마이페이지) 구현
>
> >예성철: 메인페이지 구현
>
> >손영하: 디테일페이지 구현
>
> 개발기간: 2023/09/04 월요일 ~ 2023/09/08 금요일
>
> 발표: 2023/09/11 월요일
### Team Members
<table>
  <tbody>
    <tr>
     <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/Luna828">
       <img src="https://avatars.githubusercontent.com/u/93186591?v=4" width="100px;" alt="Luna828"/>
       <br />
         <sub>
           <b>김은경</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
     </td>
     <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/Sonyeongha">
       <img src="https://avatars.githubusercontent.com/u/139095805?v=4" width="100px;" alt="손영하"/>
       <br />
         <sub>
           <b>손영하</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
    </td>
      <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/Leehan-sol">
       <img src="https://avatars.githubusercontent.com/u/139109343?v=4" width="100px;" alt="Leehan-sol"/>
       <br />
         <sub>
           <b>이한솔</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
    </td>
      <td align="center" valign="top" width="14.28%">
       <a href="https://github.com/DearYesang">
       <img src="https://avatars.githubusercontent.com/u/139317652?v=4" width="100px;" alt="예성철"/>
       <br />
         <sub>
           <b>예성철</b>
         </sub>
       </a>
       <br />
       <sub>
           <b>iOS Developer</b>
       </sub>
       <br />
    </td>
  </tbody>
</table>

## 공지
### 우리조 S.A
[팀 스파르타 코딩 Notion](https://teamsparta.notion.site/16-S-A-f4295d96d7734331b805a79c95af2c12)
### Git Conventions
- Commit Message는 아래와 같은 규칙을 따릅니다.
    * [FEAT]: 새로운 기능을 추가
    * [FIX]: 잔잔바리 수정
    * [DESIGN]: UI 디자인 변경
    * [STYLE]: 코드 포맷 변경, 세미 콜론 누락, 코드 수정이 없는 경우
    * [DOCS]: 문서 수정, 필요한 주석 추가 및 변경
    * [RENAME]: 파일 혹은 폴더명을 수정하거나 옮기는 작업만인 경우
    * [REMOVE]: 파일을 삭제하는 작업만 수행한 경우
    * [MERGE] : 병합
    * [CONFLICT]: 병합 시 충돌 해결
    * [COMPLETION]: 작업을 완료하고 마지막 커밋을 작성하는 경우
    
- Pull Requests는 `Commit Message`와 동일하게 써서 올립니다.

## 와이어 프레임
- 로그인 페이지  <br />
<img width="280" height ="500" alt="image" src="https://github.com/Leehan-sol/TEAM16_YoutubeApp/assets/139109343/19a0a0d3-ff13-488a-b314-5a053bead9e6">
<img width="280" height ="500" alt="image" src="https://github.com/Leehan-sol/TEAM16_YoutubeApp/assets/139109343/66a66cac-41a3-489d-84b8-55968b94eccc">
 <br />
1. User Default 사용 <br /><br />
2. 회원가입 <br />
- 성은 빼고 이름만 작성  <br />
- 이메일 입력란  <br />
- 비밀번호 입력 + 재확인 입력  <br />
- 다음 버튼 → 회원가입완료 버튼으로 변경  <br />
<br />
<br />

- 마이 페이지  <br />
<img width="280" height ="500" alt="image" src="https://github.com/Leehan-sol/TEAM16_YoutubeApp/assets/139109343/68632327-1a06-4c21-aefa-bace9bbfbcf7">
<br />
1. 로그아웃 버튼 클릭 시 로그인 화면으로 이동 기능 구현 <br />
2. 영상 시청 시 기록에 추가되는 기능 구현 <br />
<br />
<br />

- 메인 페이지 <br />
<img width="280" height ="500" alt="image" src="https://github.com/Leehan-sol/TEAM16_YoutubeApp/assets/139109343/14b592ee-1563-46ac-84c5-8b5501ae633d"> <br />
<br />
1. 아래 프로필 버튼 누르면 마이페이지로 이동 <br />
2. + 버튼 누르면 영상 업로드 기능 구현  <br />
3. 로그인 전제 조건 하에 라이브러리에 좋아요한 영상 모아놓기 기능 구현(후순위) <br />
4. 메인페이지 하단부에 쇼츠 말고 다른 영상들이 나타날 수도 있음(TBD) <br />
<br />
<br />

- 디테일 페이지 <br />
<img width="500" height ="500" alt="image" src="https://github.com/Leehan-sol/TEAM16_YoutubeApp/assets/139109343/e45abe0a-6e3a-4913-b85e-4d1d83b6d10d"> <br/>
<br/>
<br/>

## 팀 규칙
1. 아래의 Git Convention 지켜서 commit과 PR 요청하기! <br />
git commit -m "[FEAT] : ⚙️ commit init" <br />
2. 스크럼: 오전 9시 30분 <br />
3. Pull Request: 오후 8시 <br />
4. 자리비울 때 말하기 (개인사정) <br />
5. 이슈 트랙킹/트러블슈팅시 질문하기 <br />
<br />

## 앱 시현 영상



<br />
## 프로젝트 주요 기능 <br />
- 김은경 <br />
1. 로그인 페이지:  <br />
* 이메일 기억하기 <br />
* 이메일 형식 + 비밀번호 대소문자,특수기호,8자이상이 들어가야 활성화되는 Login 버튼 <br />
<br />
2. 회원가입 페이지:  <br />
* 이메일 형식 + 비밀번호 대소문자,특수기호,8자이상 형식 비밀번호 <br />
* 비밀번호 암호화 보여주는 눈모양 버튼<br /> 
* 모든 형식을 다 맞춰야만 활성화되는 가입 버튼<br />
* UserDefault 모델링 + create 기능 추가<br />
<br />
3. YOUTUBE 페이지: <br />
* API 불러오기 (모델링/네트워킹기능설정)<br />
* collectionView로 썸네일과 타이틀 불러오기<br />
* 디테일 페이지로 화면전환 (webView로 뿌려줄 id 파라미터로 넘기기 설정)<br />
* 페이지네이션 (준비중..)<br />
<br />
4. Detail 페이지:<br />
* Youtube 페이지 cell 클릭시 youtube id 불러와서 유투브 웹뷰로 띄우기<br />
<br />

- 이한솔 <br />
프로필 페이지 : <br />
<br />
- 손영하 <br />
`WKWebView`를 사용하여 웹 페이지를 표시하는 `DetailPageViewController` 클래스를 구현했다. <br />
이 클래스를 특정 YouTube 비디오의 URL을 받아 해당 비디오를 표시하도록 했다. <br />
1. `DetailPageViewController` 클래스에 UIViewController`와 `WKWebView`를 import 해서 URL을 불러올 수 있도록 했다. <br />
2. 클래스 멤버 변수 및 초기화를 해서 <br />
   - `WKWebView` 인스턴스와 `videoId` 변수를 선언하고 <br />
   - `videoId` 변수는 `YoutubePage.swift` 파일의 90번째 줄에서 전달되는 파라미터로, YouTube 비디오의 ID를 나타내도록 했고 <br />
   - `init(videoId:)` 메서드는 `videoId`를 받아서 초기화할 수 있는 이니셜라이저를 입력했다. <br />
3. `loadView` 메서드로 뷰 컨트롤러의 뷰를 설정하는 역할을 사용해서 `WKWebViewConfiguration`을 생성하고, <br />
      이를 사용하여 `WKWebView` 인스턴스를 생성했다. <br />
  이 `WKWebView` 인스턴스를 뷰 컨트롤러의 `view` 프로퍼티로 설정했다. <br />
4. `loadUrl(_:)` 메서드로 URL 문자열을 받아와서 해당 URL을 로드하도록 했다. <br />
   - 주어진 URL 문자열을 `URL` 객체로 파싱하고, 이를 기반으로 `URLRequest`를 생성한 뒤 <br />
  `WKWebView`의 `load(_:)` 메서드를 사용하여 해당 URL을 로드하도록 했다. <br /> 
5. 뷰 컨트롤러가 처음 로딩될 때 실행되는 `viewDidLoad` 메서드로 뷰 컨트롤러가 로딩될 때, `loadView()` 메서드를 호출하여 `WKWebView`를 초기화하고 화면에 추가했다. <br />
   옵셔널 형태인 videoId`를 옵셔널 바인딩을 통해 `videoId`가 있는 경우에만 YouTube 비디오 페이지를 로드하도록 했다. <br />
6. `viewDidLoad` 메서드에서는 YouTube 비디오 페이지의 URL을 `https://youtu.be/VIDEO_ID` 형식으로 생성하여 `loadUrl` 메서드를 통해 `WKWebView`에 로드하게 되고 이렇게 해서`DetailPageViewController`가 화면에 나타날 때 해당 YouTube 비디오 페이지가 표시되도록 구현했다. <br />
<br />
- 예성철
 1. youtube로부터 api를 받아와서 조회수 기반 썸네일, 채널이름, 제목을 받아온다.
 2. 2. 썸네일, 채널이름, 제목이 들어간 콜렉션뷰를 클릭하면 디테일페이지로 넘어간다.

- 
## 프로젝트를 진행하면서 힘들었던점 및 느낀점 <br />
- 김은경 : 로그인과 회원가입 페이지가 UI 부분적으로는 매우 적은 것 같이 보이지만 생각보다 생각해야할 것, 정규 표현식 등 해야할 일이 많다고 느껴서 생각날때마다 계속 추가추가 한 점이 조금 힘들었다. 처음에 기능을 무엇을 넣을지 한번에 생각하지 못한 점이 아쉬웠던 것같다. <br />
 <br />
- 이한솔 : 테이블뷰에 셀을 두개 이상 써본게 처음이라서 셀을 세개로 구현하는게 새로웠고 셀에 있는 버튼을 눌렀을때 기능을 어떻게 작성해야할지 몰라서 튜터님께 여쭤보고 했는데, delegate 패턴을 이용해서 버튼의 기능 로직들은 뷰컨트롤러에 작성하는 방법도 공부가 많이 됐다. 또, 로그아웃 버튼을 누르면 스토리보드 레퍼런스로 로그인페이지로 이동하게 연결하는것도 처음 해봐서 재밌었다. 유튜브 API받아오는건 개인적으로 공부중인데 아직 어려워서 네트워킹에 대해 더 공부해봐야겠다는 생각이 들었다. <br />
 <br />
- 손영하 <br />
1. 팀원들과 작업하면서 느낀점 <br />
팀장님은 책임감을 가지고 잘 진행해 주셨다. 아침과 저녁시간 마다 모여서 팀회의를 했고 각자 맏은 부분에 대한 피드백과 진행해야 할 것 등의 방향 제시를  해주셨다. 특히 GIT에 관해서 커밋과 푸쉬가 잘되었는지 그리고 풀을 했을 때 문제가 없는지 시뮬은 잘 돌아가는지 꼼꼼히 체크해주신 점이 감사했다. <br />
한솔님께서는 맡으신 부분을 매끄럽게 잘 수행하시는 모습이 인상깊었다. 화면공유를 하면서 오류에 대한것을 팀장님과 함께 대화하면서 해결하고 현실적인 해결책이나 의견을 제시해 주셔서 도움이 많이 되었다. <br />
성철님은 나와 연결된 페이지를 구현하는 파트를 할 때 진행상황을 공유해 주신것과 팀회의를 할 때 새로운 의견이나 에러해결에 대한 다양한 방법들을 제시해주셔서 간접적으로 나마 여러가지의 방법이 있다는 것을 알게되었다. <br />
이번에 팀플을 시작하기 전에 미리 API에 관한 자료 깃컨벤션등을 올려주셔서 프로젝트 전 준비하면 좋은 것들에 대해서도 알게 되었다. <br />
이번주의 팀플을 끝으로 팀원분들이 알려주신 정보들을 하나하나 복기해보는 시간을 가져야겠다고 느꼈다. <br /> <br />
2. 힘든점 혹은 어려웠던 점 <br />
UI까지는 완성했지만 기능 수행에 있어서 어려움이 있었다. 특히 API 부분에 있어서 조원분들의 도움을 많이 받았다. <br />
인증과 API 키 관리나, API 문서를 읽고 YouTube API의 다양한 엔드포인트와 매개변수, 응답 형식 등을 이해해야 하는것,  데이터 파싱: API에서 반환되는 데이터는 일반적으로 JSON 형식이며, 이 데이터를 파싱하여 앱에서 사용 가능한 형태로 변환하는 법 등 동영상을 어플에 가저오는 과정들을 이해하는 것이 어려웠다. <br /> <br />
- 예성철  <br />
1. 협업하면서 버전 관리에 아직도 능숙하지 못하다. GUI 기반 프로그램들 덕분에 많은 도움을 받았다.<br />



