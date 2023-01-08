

# 🚗이차어때



Backend 4명의 팀원으로 구성된 팀프로젝트로 진행된 중고차 매매 사이트 개발


<br><br/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210262604-a9fd487f-c5ce-42ea-9ebe-7132d2cbb6fc.png"/>

<br><br/>

🔎Demo : https://www.kcar.com/


🔎Demo : http://www.encar.com/index.do


K카와 엔카 사이트를 참조하여 만든 사이트 입니다.


<br><br/>
## 개발 목표

Spring Framework를 사용하여 MVC패턴을 이해하고 다양한 API 사용해보기 그리고 팀원들과 협업하기에 의의를 두었습니다.


<br><br/>
## 프로젝트 정보

📌개발 인원 : Backend 4명


📌개발 기간 : 2022.08.29 ~ 2022.09.30 (1개월)


📌Backend : Java, spring, Oracle


📌Frontend : HTML/CSS, JS


📌Framework/ Library : SpringFramework, Mybatis


📌주요업무 및 상세역할
- 찜하기, 찜한 차량 비교하기, 결제하기, 주문내역, 이달의 딜러왕, 메인화면 구축 역할 담당
- 찜 버튼을 누르면, 원하는 상품을 위시리스트에 담도록 개발하였습니다.
- 사용자가 결제를 하기 전, 찜한 차량을 대상으로 비교를 해볼 수 있도록 기능 개발
- 결제시 아임포트 API를 사용하여 카카오페이 또는 신용카드로 결제 기능 구현하였습니다.
- 결제된 내역을 카운트하여 판매자의 판매수를 확인하여 판매한 딜러 순위 볼 수 있도록 구현
- Bootstrap templet 사용하여 메인화면을 구성하여 등록된 상품과 후기, 공지사항을 확인 할 수 있도록 구성하였습니다.


<br><br/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265505-5a1bb157-0e89-415f-8f7a-500c56c2a2a7.png"/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265637-a1d9123e-f1e9-415c-a18c-775a599c112e.png"/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265728-86e44cd9-a262-4d70-b974-b1f61e23e91c.png"/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265785-1aa9bd24-29de-44ac-a786-838790013ec9.png"/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265880-b4174ece-b064-44c8-989c-4918ef741452.png"/>

<img width="80%" src="https://user-images.githubusercontent.com/103451439/210265951-c411700c-729f-4bd6-899f-9a0100e5ea7f.png"/>

<br><br/>
## 개선사항 및 후기

찜할때, 찜한 상품이 저장되도록 DB를 설계 했었어야 했는데 설계하지 못하여 로그아웃을 할 경우 찜한 목록과 주문내역이 사라지게 됩니다.
기능 구현되어 작동하는 것에 몰두하여 그 부분을 놓친점이 매우 아쉽고 개발할때 DB테이블, column을 세부적으로 구성하는 작업의 중요함을 다시 한번 배우게 되었습니다.

외부 API를 요청하고 처리하면서 자바스크립트 callback 함수를 사용하여 비동기처리를 해보는 경험을 해보았습니다.


<br><br/><br><br/>
