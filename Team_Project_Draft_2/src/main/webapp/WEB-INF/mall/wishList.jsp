<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- 장바구니 목록 보여주는 곳 -->
    
<style>

body {
  margin: 0;
}

section.cart * {
  box-sizing: border-box;
}

section.cart p,
section.cart span {
  margin: 0;
}

a.com-link {
  color: black;
}

a.com-link:hover {
    text-decoration: none;
}

img.wish-img {
  display: block;
  width: 160;
  height: 102px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table.cart__list {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

table.cart__list thead {
  text-align: center;
  font-weight: bold;
}

table.cart__list tbody {
  font-size: 15px;
}

table.cart__list td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}



.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
 /*  background-color: lightgrey;  옵션 밑에 밑줄쳐짐*/
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
 border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

#cart__list__orderbtn{ 
background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: #ED0000;
  color: white;
  border: none;
}

input[type=checkbox], input[type=radio] {
    accent-color:red;
}
#text-light{
color:black;
}

</style>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<input type="hidden" id="isOrderYn" value="${isOrderYn }">

<script type="text/javascript">
	var isOrderYn = document.getElementById("isOrderYn");
	if (isOrderYn.value == 'Y') {
		alert("이미 담은 상품입니다.");
		history.replaceState({}, null, location.pathname); // 파라미터 제거해서 새로고침 시 또 담았다고 나오지 않게
	}
	
	
	function goPay(num) {
		alert('결제하러 이동합니다.');
		location.href="pay.mall?num="+num;
	}
	
	function fn_pay() {
		var allCheck = document.getElementById('allCheck');
		var rowCheckList = document.querySelectorAll('[name="RowCheck"]:checked');
		
		if (rowCheckList.length === 0) {
			alert("상품을 선택해주세요.");
			return;
		} else {
			// 선택된 상품이 존재하는 경우
			var allCheckedData = '';
			for (var i=0; i<rowCheckList.length; i++) {
				allCheckedData += rowCheckList[i].value;
				if (rowCheckList[i+1]) {
					allCheckedData += ',';
				}
			}

			alert('선택한 상품 결제하러 이동합니다.');
			location.href="pay.mall?numList="+allCheckedData;
		}
	}

	function comparison() {
		console.log("비교하기!");
		var numData = '';
		var rowCheckList = document.querySelectorAll('[name="RowCheck"]:checked');
		
		if (rowCheckList.length == 0) {
			alert("비교할 상품을 선택해주세요.");
			return;
		} else if (rowCheckList.length == 1) {
			alert("두 개 이상 상품을 선택해주세요.");
			return;
		}
		
		for (var i=0; i<rowCheckList.length; i++) {
			numData += rowCheckList[i].value;
			if (rowCheckList[i+1]) {
				numData += ',';
			}
		}
		
		window.location.href = 'comparison.mall?numData=' + numData;
	}

	function allChecked(){
		var allCheck = document.getElementById('allCheck').checked;
		var rowCheckList = document.querySelectorAll('[name="RowCheck"]');
		 
		if(allCheck){//check하기
			for(i=0; i<rowCheckList.length;i++){
				rowCheckList[i].checked = true;
			}
		} else{//check해제
			for(i=0; i<rowCheckList.length;i++){
				rowCheckList[i].checked = false;
			}
		}
	 }

	function rowChecked(){
		var allCheck = document.getElementById('allCheck');
		var rowList = document.querySelectorAll('[name="RowCheck"]');
		var rowCheckList = document.querySelectorAll('[name="RowCheck"]:checked');
		 
		if(rowList.length != rowCheckList.length){
			//all check해제
			allCheck.checked = false;
		} else{
			//all check하기
			allCheck.checked = true;
		}
	 }
	
	function deleteCheckedData() {
		var allCheck = document.getElementById('allCheck');
		var rowCheckList = document.querySelectorAll('[name="RowCheck"]:checked');
		
		if (rowCheckList.length === 0) {
			alert("상품을 선택해주세요.");
			return;
		} else {
			// 선택된 상품이 존재하는 경우
			var allCheckedData = '';
			for (var i=0; i<rowCheckList.length; i++) {
				allCheckedData += rowCheckList[i].value;
				if (rowCheckList[i+1]) {
					allCheckedData += ',';
				}
			}

			alert('선택한 상품 삭제 합니다.');
			location.href="wishdelete.mall?numList="+allCheckedData;
		}
	}
</script>

<body>
    <section class="cart">
    	<div><h1 class="title">찜한 차량보기</h1></div>
		<div><span id="text-light">${loginInfo.name }님이 찜한 목록입니다.</span></div>
		<div><span class="badge bg-secondary rounded-pill">${fn:length(lists)}건</span></div>
       	<br>
        <!--  <div class="cart__information">
            <ul>
                <li>결제 전 찜해둔 차량 비교</li>
                <li></li>
                <li></li>
            </ul>
        </div>  -->
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox" id="allCheck" name="allCheck" onClick="allChecked()"/></td>
						<td colspan="2">상품정보</td>
						<td>상품 옵션</td>
						<td>결제할 예약금액</td>
						<td>삭제</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="shopInfo" items="${lists}" varStatus="status">
                <c:set var="images" value="${fn:split(shopInfo.image,',')}" />
                    <tr class="cart__list__detail">
                        <td align="center"><input type="checkbox" name="RowCheck" value="${shopInfo.num}"  onClick="rowChecked()"/></td>
                        <td><a href="carDetailView.ca?cnum=${shopInfo.num}&pageNumber=${pageInfo.pageNumber}"><img class="wish-img" src="<%=request.getContextPath()%>/resources/images/${images[0]}"></a></td>
                     <%--  오류발생   <td><a href="detail.ca?num=${shopInfo.num}&pageNumber=${pageInfo.pageNumber}"><img src="<%=application.getContextPath()%>/resources/images/${shopInfo.image[0]}"></a></td> --%>
                        <td>${shopInfo.company }
                            <p>${shopInfo.name }${shopInfo.model }</p>
                            <span class="price">${shopInfo.price } 만원</span>
                        </td>
                        <td class="cart__list__option">
                            <p>${shopInfo.option }</p>
                         <!--    <button class="cart__list__optionbtn">주문조건 추가/변경</button> -->
                        </td>
                        <td><span class="price">${shopInfo.pay_amt } 만원</span><br>
                        	<input type="button" id="cart__list__orderbtn" value="결제하기" onClick="goPay('${shopInfo.num}')">
                          <%--   <button class="cart__list__orderbtn" onClick="goPay('${shopInfo.num}')">결제하기</button> --%>
                        </td>
                        <td><a href="<%=application.getContextPath()%>/wishdelete.mall?num=${shopInfo.num }">
                        <input type="button" id="cart__list__orderbtn" value="삭제">
                   		</a></td>
                    </tr>
				</c:forEach>
				
				<c:if test="${fn:length(lists) eq 0}">
				<tr><td colspan="6" style="text-align: center;">장바구니 상품이 존재하지 않습니다.</td></tr>
				</c:if>
				
				</tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                        	<button class="cart__list__optionbtn"  onclick="deleteCheckedData(); return false;">선택상품 삭제</button>
                        	<button class="cart__list__optionbtn"  onclick="comparison(); return false;">선택상품 비교하기</button>         
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="cart__mainbtns">
           <a class="com-link" href="mainList.ca"><button class="cart__bigorderbtn left">쇼핑 계속하기</button></a>
            <button class="cart__bigorderbtn right" onclick="fn_pay(); return false;">결제하기</button>
        </div>
    </section>
</body>
<%-- ${pageInfo.pagingHtml} --%>
</html>
<%@ include file="../member/bottom2.jsp" %>
