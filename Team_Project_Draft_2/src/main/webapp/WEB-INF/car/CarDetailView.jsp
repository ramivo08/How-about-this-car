<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp"%>
<link rel="stylesheet" type="text/css"
   href="//image.bobaedream.co.kr/renew2017/assets/css/bobae.common.css?v=191017">
<link rel="stylesheet" type="text/css"
   href="//image.bobaedream.co.kr/renew2017/assets/css/b_content.css?v=20022">
<link rel="stylesheet" type="text/css"
   href="//image.bobaedream.co.kr/renew2017/assets/css/b_comm.css?v=190533">


<style>

body{
   overflow : hidden !important;
}

#detailView {
   min-height: 100%;
   position: relative;
   padding-bottom: 60px;
}

#detailContainer {
   min-height: 100%;
   width: 1080;
   position: relative;
}

#price {
   float: right;
}

#MainImage {
   width: 100%;
   height: 600;
   position: relative;
}

.progress-bar {
   width: 100%;
   height: 30px;
   background-color: #dedede;
   font-weight: 600;
   font-size: .8rem;
}

.progress-bar .progress {
   height: 30px;
   padding: 0;
   text-align: center;
   background-color: #4c4c4c;
   color: #111;
}

.content { /*컨텐츠 넓이지정*/
   position: relative;
   left: 200;
   top: 100;
   width: 1080;
}

.slides { /*슬라이드 아이템이 나올 뼈대 지정*/
   padding: 180;
   left: 200;
   width: 100%;
   height: 600;
   position: absolute;
}

.slide_item { /*슬라이드 아이템을 absolute로 겹쳐놓고 투명하게 하기*/
   position: absolute;
   width: 1080;
   height: 600;
   opacity: 0;
   transition: all 0.3s;
   left: 200;
}

.ontheSlide { /*현재 아이템에 붙여줄 클래스*/
   opacity: 1;
   transition: all 0.3s;
}

.ontheThumbnail { /*현재 썸네일에 붙여줄 클래스*/
   border: 1px dashed red;
}

.nextButton, .prevButton { /*다음,이전 버튼을 드래그되지 않게 방지해주기*/
   -webkit-user-select: none;
   -ms-user-select: none;
   user-select: none
}

.nextButton { /*다음 버튼을 오른쪽으로 보내기*/
   float: right;
}

.prevButton { /*왼쪽 버튼을 왼쪽으로 보내기*/
   float: left;
}

.Thumbnail { /*썸네일 아이템을 감쌀 뼈대*/
   display: flex;
   flex-flow: row wrap;
   width: 100%;
   height: 120;
   position: absolute;
   top: 480px;
   justify-content: center;
}

.thumbnail_item { /*썸네일 아이템의 길이 설정*/
   width: 216;
}

.rbutton {
   width: 150px;
   height: 50px;
   font-size: 15px;
   color: white;
   border: 0;
   outline: none;
   background-color: red;
   margin: 1;
}

.wbutton {
   width: 150px;
   height: 50px;
   font-size: 15px;
   color: red;
   border-color: red;
   border: 1;
   outline: none;
   background-color: white;
   margin: 1;
}

.avg-value input[type=button] {
   outline: none;
}

.avg-value input[type=button] {
   border-radius: 15px;
}

.info-price {
   padding-top: 5px;
   padding-bottom: 10px;
}
</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">


var IMP = window.IMP; // 생략 가능
IMP.init("imp10754620"); // 예: imp00000000

function reserve(cnum,id){
   if(!id){
      alert("로그인 후 이용이 가능합니다");
      return;
   }

   IMP.request_pay({
         pg: "html5_inicis",
       pay_method: 'card',
       name: '[${cb.ccompany}] [${cb.cmodel}] ${cb.carname}' ,
       merchant_uid: parseInt(new Date().getTime() + Math.random()),
       amount: parseInt('${cb.cprice * 0.3}'),
       buyer_tel: '01063633778',
       display: {
           card_quota: []
       }
   }, function (rsp) { // callback
          if (rsp.success) {
             // 결제 성공 시
             console.log(rsp);
             
             var orderData = {
              orderNum: rsp.merchant_uid,
              paidAmount: parseInt('${cb.cprice * 0.3}'),
              dataList: cnum
             };
             // 이미지경로1,이미지경로2,
             
             $.ajax({
              url : "paySuccess.mall",
              method: 'POST',
              data : orderData,
              success : function(data){
                 console.log(data);
                 if (data > 0) {
                    // DB 적재 성공
                    window.location.href = 'payResult.mall';
                 }
              }
             });
          } else {
             // 결제 실패 시
             console.log(rsp);
          }
   });

}

function already(){
   alert("이미 예약중인 상품입니다.");
   
}
function wish(cnum,cid){
location.href = "wishadd.mall?cnum="+cnum+"&cid="+cid;
}
</script>

<%
String[] optionList = {"에어컨", "네비게이션", "후방감지센서", "후방카메라", "전방감지센서", "전방카메라", "블랙박스", "통풍시트", "열선시트", "ABS", "스마트키",
      "에어백", "파워 스티어링 휠", "차선이탈 경보 시스템", "크루즈 컨트롤", "HUD", "전자식 주차브레이크", "하이패스", "어라운드뷰", "선루프", "ECM 룸미러", "메모리 시트",
      "헤드램프(HID)", "헤드램프(LED)", "CD 플레이어", "AUX 단자", "TCS", "오토라이트", "360도 어라운드 뷰"};
%>

<div class="component page-detail" align="center" style="overflow : hidden">
   <div id="detailContainer">
      <div id="MainImage" align=center>


         <div class="slides">

            <c:set var="images" value="${fn:split(cb.cimage,',')}" />
            <c:forEach var="x" items="${images}" varStatus="status">
               <div class="slide_item">
                  <a data-fancybox="gallery"> <img width=1080 height=600
                     src="<%=request.getContextPath()%>/resources/images/${images[status.index]}"
                     alt="차량 썸네일 사진">
                  </a>
               </div>
            </c:forEach>
         </div>
         <span class="nextButton">▶</span>
         <!--다음 버튼 -->
         <span class="prevButton">◀</span>
         <!--이전 버튼 -->
         <div class="Thumbnail">
            <!--썸네일을 감쌀 뼈대 -->

            <!--썸네일 아이템들 -->
            <c:forEach var="x" items="${images}" varStatus="status">
               <div class="thumbnail_item">
                  <a data-fancybox="gallery"> <img width=216 height=120
                     src="<%=request.getContextPath()%>/resources/images/${images[status.index]}"
                     alt="차량 썸네일 사진">
                  </a>
               </div>
            </c:forEach>

         </div>



         <script type="text/javascript"></script>
         <script>
            function sliderOn() {
               const slides = document.querySelector('.slides'); // 슬라이드뼈대 감지
               const Content = document.querySelector('.Thumbnail'); //썸네일 뼈대 감지
               const item = slides.getElementsByClassName('slide_item'); // 슬라이드 아이템 획득
               const thumbnail = Content
                     .getElementsByClassName('thumbnail_item'); //썸네일 아이템 획득

               const firstEle = item[0]; // 첫번째 슬라이드 아이템
               const firstThumb = thumbnail[0]; // 첫번째 썸네일 아이템
               firstEle.classList.add('ontheSlide'); //첫번째 슬라이드 아이템에 ontheSlide 클래스 추가
               firstThumb.classList.add('ontheThumbnail'); // 첫번째 썸네일 아이템에 ontheThumbnail 클래스 추가
               const gogogo = setInterval(sliderGo, 4000);
               function sliderGo(isThat) {//isThat을 받아오기

                  if (isThat) {//isThat이 지정되어 있다면
                     var nextOr = 'previous'; //이전 버튼을 누른 것.
                  } else { //isThat이 지정되지 않았다면
                     var nextOr = 'next'; //다음 버튼을 누른 것.
                  }

                  const currentItem = document
                        .querySelector('.ontheSlide');
                  const currentThumb = document
                        .querySelector('.ontheThumbnail');
                  currentItem.classList.remove('ontheSlide')
                  currentThumb.classList.remove('ontheThumbnail')
                  if (nextOr === 'next') { // 다음버튼을 눌렀다면
                     if (!currentItem.nextElementSibling) {//마지막 아이템일 경우
                        item[0].classList.add('ontheSlide') //처음으로 슬라이드아이템 이동
                        thumbnail[0].classList.add('ontheThumbnail')//처음으로 썸네일 아이템 이동
                     } else { //그 외의 경우
                        currentItem.nextElementSibling.classList
                              .add('ontheSlide') //다음으로 슬라이드 아이템 이동
                        currentThumb.nextElementSibling.classList
                              .add('ontheThumbnail')//다음으로 썸네일 아이템 이동
                     }
                  } else if (nextOr === 'previous') { // 이전 버튼을 눌렀다면
                     if (!currentItem.previousElementSibling) { //첫번재 아이템일 경우
                        item[item.length - 1].classList
                              .add('ontheSlide') //마지막 슬라이드로 이동
                        thumbnail[thumbnail.length - 1].classList
                              .add('ontheThumbnail') //마지막 썸네일로 이동
                     } else { //다른 경우
                        currentItem.previousElementSibling.classList
                              .add('ontheSlide') //이전 슬라이드 아이템으로 이동
                        currentThumb.previousElementSibling.classList
                              .add('ontheThumbnail')//이전 썸네일 아이템으로 이동
                     }
                  }

               }
               const nextButton = document.querySelector('.nextButton');//다음버튼 감지
               const prevButton = document.querySelector('.prevButton');//이전버튼 감지
               nextButton.addEventListener('click', function() {//다음 버튼을 누른다면
                  clearInterval(gogogo)//자동이동을 중지하고
                  sliderGo();//수동으로 다음이동
               })
               prevButton.addEventListener('click', function() {//이전 버튼을 누른다면
                  clearInterval(gogogo)//자동이동을 중지하고
                  sliderGo('1');//수동으로 이전 이동
               })
               for (var i = 0; i < thumbnail.length; i++) { // 썸네일 갯수만큼 for문 발동  
                  thumbnail[i].setAttribute('data-number', i); // 썸네일에 data-number를 설정해 몇번째 아이템인지 설정
                  thumbnail[i].addEventListener('click', function(event) { //썸네일 아이템을 클릭한다면
                     clearInterval(gogogo) // 자동이동을 멈춘다.
                     const currentItem = document
                           .querySelector('.ontheSlide'); //현재 아이템 감지
                     const currentThumb = document
                           .querySelector('.ontheThumbnail'); //현재 썸네일 감지
                     currentItem.classList.remove('ontheSlide') // 현재 아이템 비활성화
                     currentThumb.classList.remove('ontheThumbnail') // 현재 썸네일 비활성화
                     const number = event.target
                           .getAttribute('data-number') // 몇 번째 썸네일을 클릭했는지 감지
                     item[number].classList.add('ontheSlide') // 썸네일과 같은 숫자의 아이템을 활성화
                     event.target.classList.add('ontheThumbnail') // 클릭한 썸네일을 활성화

                  })
               }

            }
            sliderOn();
         </script>

         <c:set var="images" value="${fn:split(cb.cimage,',')}" />

         <img id="carImages" width=1080 height=570
            src="<%=request.getContextPath()%>/resources/images/${images[0]}">
      </div>
      <div class="price">
         <div class="content">
            <br> <br>
         </div>



         <div class="component page-detail" align="center" style="overflow : hidden">

            <div class="container-detail">
               <div class="wrap-detail-spot.js-object-fit">
                  <div class="group-gallery">
                     <div class="gallery-view js-gallery-view"></div>
                     <br>


                  </div>
               </div>
               <div class="gallery-data">
                  <dl class="clearfix">

                     <dd class="txt-bar cg">등록번호 ${cb.cnum}</dd>
                     <dd class="txt-bar cg">최초등록 ${cb.inputdate}</dd>


                  </dl>
               </div>
            </div>
            <!-- SECTION -->
            <div class="detail-section mode-half">
               <div class="d-article">
                  <div class="d-head">
                     <h4 class="tit">기본정보</h4>
                  </div>
                  <div class="info-basic">
                     <div class="tbl-01 st-low">
                        <table>
                           <colgroup>
                              <col style="width: 80px">
                              <col style="width: auto">
                              <col style="width: 80px">
                              <col style="width: auto">
                           </colgroup>
                           <caption></caption>
                           <tbody>
                              <tr>
                                 <th>차량 등록일</th>
                                 <fmt:parseDate var="inputDay" value="${cb.creg_day}"
                                    pattern="yyyy-MM-dd" />
                                 <fmt:formatDate value="${inputDay}" var="input"
                                    pattern="yyyy-MM-dd" />
                                 <td>${input}</td>
                                 <th>제조 국가</th>
                                 <td>${cb.cdnf}</td>
                              </tr>
                              <tr>
                                 <th>주행거리</th>
                                 <td>${cb.cmileage}km</td>
                                 <th>가격</th>
                                 <td>${cb.cprice}만원</td>
                              </tr>
                              <tr>
                                 <th>제조사</th>
                                 <td>${cb.ccompany}</td>
                                 <th>모델</th>
                                 <td>${cb.cmodel}</td>
                              </tr>
                              <tr>
                                 <th>사고 유무</th>
                                 <td>${cb.caccident}</td>
                              </tr>

                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <div class="d-article">


                  <div class="d-head">
                     <h4 class="tit">시세정보</h4>
                  </div>
                  <div class="info-price">
                     <strong><font color="red" size="6pt">${cb.cprice}</font></strong>만원<br>
                     <div class="progress-bar">
                        <div class="progress" style="width:${pc.p_avg}%;"></div>
                     </div>
                     <div class="avg-value" style="overflow: hidden;">
                        <br> 평균시세 <span class="avg-min">${pc.p_min}</span> ~ <span
                           class="avg-max">${pc.p_max}</span> 만원<br> 평균 가격 대비
                        ${pc.p_avg}%<br>
                        <c:if test="${pc.p_min eq cb.cprice}">
                           <strong><font color="red" size="3pt">동일 모델 최저가
                                 상품</font></strong>
                        </c:if>
                        <br> <br>
                        <c:if test="${cb.status eq 0}">
                           <input type="button" value="찜하기" class="wbutton" id="wbtn"
                              onclick="wish('${cb.cnum}','${cb.cid}')">
                        </c:if>
                        <c:if test="${cb.status eq 1}">
                           <input type="button" value="찜하기" class="wbutton" id="wbtn"
                              onclick="already()">
                        </c:if>

                        <c:if test="${cb.status eq 0}">
                           <input type="button" value="예약하기" class="rbutton"
                              onClick="reserve(${cb.cnum},'${loginInfo.id}')">
                        </c:if>
                        <c:if test="${cb.status eq 1}">
                           <input type="button" value="예약중" class="rbutton"
                              onclick="already()">
                        </c:if>

                     </div>
                  </div>

                  <div class="btn-box">
                     <a href="mainList.ca?whatColumn=cmodel&keyword=${cb.cmodel}"
                        class="btn-sq-line">동급매물</a> <a
                        href="mainList.ca?whatColumn=cid&keyword=${cb.cid}"
                        class="btn-sq-line">판매자 매물</a> <a
                        href="insertpq.pq?cnum=${cb.cnum}" class="btn-sq-line">상품
                        문의하기</a>



                  </div>
               </div>
            </div>


            <!-- SECTION -->
            <div class="detail-section">
               <div class="detail-option-container">
                  <div class="tbl-option">
                     <table>
                        <colgroup>
                           <col style="width: 127px" />
                           <col style="width:" />
                        </colgroup>
                        <tbody>
                           <tr>
                           <tr>
                              <th>옵션비교</th>
                              <td>
                                 <div class="option-list-container">

                                    <c:forEach var="i" items="<%=optionList%>"
                                       varStatus="status">
                                       <ul class="option-list">


                                          <li><span class="radioBox"> <input
                                                type="checkbox"
                                                <c:if test="${fn:contains(cb.coption, i) }"> checked </c:if>
                                                name="" id="" disabled="disabled" /><label for="">
                                                   <button type="button" onclick="">${i}</button>
                                             </label>
                                          </span></li>

                                       </ul>
                                    </c:forEach>

                                 </div>
                              </td>
                           </tr>
                           <tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
            <div class="detail-section mode-half"></div>



            <!-- SECTION -->
            <div class="detail-section">
               <div class="d-article">
                  <div class="d-head">
                     <h4 class="tit">차량설명</h4>
                  </div>
                  <div class="detail-explanation">

                     <div class="seller-box">
                        <div class="seller-thumb st-w52">
                           <a
                              href="/mycar/mycar_holding_list.php?sellerID=b3BocXJvcGhzbW9waHNkb3Boc2dvcGhzbW9waHNk&mtype_gubun=MK"
                              class="home" title="판매자정보 페이지">판매자정보 페이지로 이동</a>
                        </div>
                        <div class="seller-data">
                           <dl class="clearfix">
                              <dt>
                                 <b>${cb.cname}</b> 딜러
                              </dt>
                              <dd>
                                 <b class="call">${cb.chp}</b>
                              </dd>
                           </dl>
                        </div>
                     </div>
                     <div class="explanation-box"
                        style="width: 1002px; height: 540px; overflow: auto; text-align:left;">

                        <font size="3pt"><pre>${cb.ccontent}</pre></font>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- SECTION -->
   </div>
</div>
<%@ include file="../member/bottom.jsp"%>