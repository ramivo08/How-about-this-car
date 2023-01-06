<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.row.g-5.text-center {
	font-size: 12px;
}

span.badge.bg-secondary.rounded-pill {
	font-size: 11px;
}

.row.g-5.text-center>div {
	margin: 0;
}

py-5 text-center>h2 {
	padding: 0;
	margin: 0;
}

.py-5.text-center {
	padding: 10px !important;
}

#text-light {
	color: black !important;
	font-size: 14pt;
}

.button-area {
    display: flex;
}

input.form-check-input {
	vertical-align: middle;
}

input.form-check-input:checked {
	background-color: red !important;
	border: red !important;
}

.form-check .form-check-input {
	float: none !important;
	margin-left: 10px !important;
}

h6.my-0 {
	font-size: 12px !important;
}

/* input[type=checkbox], input[type=radio] {
	accent-color: red;
}  *//* 체크박스,라디오타입 빨간색으로 적용 */

button.btn-common {
	color: white;
	background-color: #ED0000;
	border-color: #ED0000;
}

button.btn-common:hover {
	opacity: 0.7;
	color: white;
}

/* button.btn-common:visited {
	color: white;
}
 */
button.btn-comm {
	color: #7F7F7F;
	background-color: white;
	border-color: #EAEAEA;
	height: 50px;
}
</style>

<!-- iamport.js 설정 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	function goShop() {
		alert(1);
		location.href = "mainList.ca";
	}

	//여기서 API 작업하기
	var dataList = '${numData}';
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp10754620"); // 예: imp00000000

	function pay() {
		var paymentMethod = $('[name="paymentMethod"]:checked');
		var totalPayAmt = parseInt($('#totalPayAmt').val());

		if (paymentMethod.length == 0) {
			alert("결제수단을 선택해주세요.");
			return;
		}

		alert('결제하시겠습니까?');

		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : paymentMethod.val(),
			name : '자동차 결제 테스트',
			merchant_uid : parseInt(new Date().getTime() + Math.random()),
			amount : totalPayAmt,
			buyer_tel : '01063633778',
			display : {
				card_quota : []
			}
		}, function(rsp) { // callback
			if (rsp.success) {
				// 결제 성공 시
				console.log(rsp);

				var orderData = {
					orderNum : rsp.merchant_uid,
					paidAmount : rsp.paid_amount,
					dataList : dataList
				};

				$.ajax({
					url : "paySuccess.mall",
					method : 'POST',
					data : orderData,
					success : function(data) {
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
</script>
<jsp:include page="/WEB-INF/member/top.jsp"/> 
<input type="hidden" id="totalPayAmt" value="${Totalpay_amt }" />

<div class="container">
	<main>
		<div class="py-5 text-center"
			style="max-width: 400px; margin: 0 auto;">
			<h2>결제내역</h2>
		</div>

		<div class="row g-5 text-center"
			style="max-width: 400px; margin: 0 auto;">
			<div class="">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span id="text-light"><font id="text-light" style="color:black;">구매하는 차량</font></span> <span
						class="badge bg-secondary rounded-pill">${fn:length(lists) }건</span>
				</h4>


				<ul class="list-group mb-3">
					<c:forEach var="cart" items="${lists }">

						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">${cart.name }${cart.model }</h6>
								<small class="text-muted">${cart.company }</small>
							</div> <span class="text-muted">
								<h6 class="my-0">
									판매 금액
									<fmt:formatNumber value="${cart.price}" pattern="#,###,###" />
									원
								</h6>
						</span> <br>
							<div>
								<h6 class="my-0">결제할 금액</h6>
							</div> <span class="text-muted">
								<h6 class="my-0">
									<fmt:formatNumber value="${cart.price * 0.3}"
										pattern="#,###,###" />
									원
								</h6>

						</span>
						</li>

					</c:forEach>
					<li class="list-group-item d-flex justify-content-between"><span>최종
							결제금액</span> <strong> <fmt:formatNumber value="${Totalpay_amt }"
								pattern="#,###,###" />원
					</strong></li>
				</ul>
			</div>

			<div class="">
				<form class="needs-validation" method="get" action="" novalidate>
					<input type="hidden" name="totalcount" value="${totalcount}">
					<input type="hidden" value="${totalprice }" name="totalprice">
					<hr class="my-4">
					<br>
					<h4 class="mb-3">결제수단 선택</h4>

					<div class="my-3">

						<div class="form-check">
							<img src="<%=request.getContextPath()%>/resources/images/pay.png"
								width="40" height="40"> 
								<input type="radio" name="paymentMethod" class="form-check-input" class="form-check-input" />
						
							<label class="form-check-label" for="payment1">신용카드</label> <img
								src="<%=request.getContextPath()%>/resources/images/pay1.png"
								width="40" height="40"> <input id="radio_p1"
								name="paymentMethod" type="radio" class="form-check-input"
								value="kakaopay" required> <label
								class="form-check-label" for="payment3">카카오페이</label>
						</div>
					</div>

					<div class="button-area">
						<button onclick="window.location.href='mainList.ca'"
							class="w-100 btn btn-comm btn-light" type="button">쇼핑
							계속하기</button>
						<button class="w-100 btn btn-common btn-lg" type="button"
							onClick="pay()">결제하기</button>
					</div>
				</form>
				<br> <br>
			</div>
		</div>
	</main>
</div>

<%@ include file="../member/bottom2.jsp" %>