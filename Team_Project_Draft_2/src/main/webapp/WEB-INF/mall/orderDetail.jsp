<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>
<%@ include file="../member/top.jsp"%>  
<!--   payResultDetail.jsp 주문내역에서 상세보기 누르면 여기로 와서 결제내역을 보여준다 -->
<style>
table.cart__list td {
    text-align: left;
}

section.se1 h1 {
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	padding: 20px;
	text-align: center;
}

section.se1 table {
	width: 100%;
	border-collapse: collapse;
	‌‌text-align: center;
	‌‌line-height: 1.5;
	‌‌border-top: 1px solid #ccc;
	‌‌border-bottom: 1px solid #ccc;
	‌‌margin: 20px 10px;
}

section.se1 table, th, td {
	border-collapse: collapse;
	border-bottom: 1px solid #999;
	padding: 10px;
}

section.se1 table tbody tr:last-child > td,
section.se1 table tbody tr:last-child > th {
	border-bottom: 0;
}

section.se1 th {
	background-color: white;
}

section.se1 td#won {
	text-align: right;
	font-weight: 900;
}

section.se1 section.se1 {
	text-align: center;
}

section.se1 table {
	width: 800px;
	margin: 0 auto;
	border-top: 1px solid #757575;
	border-bottom: 2px solid #757575;
}

section.se1 th.gray {
	background: #e4e4e4;
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

.button-area {
    display: flex;
    width: 350px;
    margin: 0 auto;
    margin-bottom: 50px;
}

button.btn-common {
	color: white;
	background-color: #ED0000;
	border-color: #ED0000;
}

button.btn-common:hover {
	opacity: 0.7;
	color: white;
}

button.btn-common:visited {
	color: white;
}

button.btn-comm {
	color: #7F7F7F;
	background-color: #EAEAEA;
	border-color: #EAEAEA;
	height: 6%;
}

</style>

<section class="se1">
	<h1>중고자동차 매매계약</h1>

	<table>
			<tr>
				<th class="gray">등록번호 <!-- 주문번호 --></th>
				<td colspan="3">${item.cnum }</td>
			</tr>
			<tr>
				<th class="gray">차 명</th>
				<td colspan="3">${item.ccompany }${item.cmodel }${item.carname }</td>
			</tr>
			<tr>
				<th class="gray">판매자</th>
				<td>${item.cname }</td>
				<th class="gray">판매자 연락처</th>
				<td>${item.chp }</td>
			</tr>
			<tr>
				<th class="gray">매매 계약금액</th>
				<td colspan="3"><fmt:formatNumber value="${item.cprice}" pattern="#,###,###"/>원</td>
			</tr>
			<tr>
				<th class="gray">계약 보증금</th>
				<td><fmt:formatNumber value="${item.cprice  * 0.3}" pattern="#,###,###"/>원</td>
				<th class="gray">계약금 지불 날짜</th>
				<td>${nowStr }</td>
			</tr>
			<tr>
				<th class="gray">잔 금</th>
				<td colspan="3"><fmt:formatNumber value="${item.cprice - (item.cprice  * 0.3)}" pattern="#,###,###"/>원</td>
			</tr>

		<tr>
			<th class="gray">주문자</th>
			<td>${loginInfo.name }</td>
			<th class="gray">주문자 연락처</th>
			<td>${loginInfo.hp }</td>
		</tr>
	</table>
	<br>

	<br> <br> <br>

	<pre style="text-align: left; width: 800px;margin: 0 auto; white-space: pre-line;">
 	<b>*계약 조항*</b>
 	
 	<b>제 1조 (당사자 표시)</b><br>
 		매도인을 "갑"이라고 하고, 매수인을 "을"이라고 한다.
 	
 	<b>제 2조 (하자담보책임)</b><br>
 		"을"은 "갑"으로부터 이 차량을 인수한 후에는 이차량의 고장 또는 불량 등의 사유로 <br>
 		"갑"에게 그 책임을 물을 수 없다.
 	
 	<b>제 3조 (사고책임)</b><br>
 		"을"은 이 차량을 인수한 때부터 발생하는 모든 사고에 대하여 책임을 진다.<br>
 	
 	<b>제 4조 (법률상의 하자 책임)</b><br>
 		차량인도일 이전에 발생한 행정처분 또는 이전등록 요건의 불비 기타 법령상의 하자에 대하여<br>
 		"갑"이 그 책임을 진다.


 	<b>제 5조 (해약금)</b><br>
 		"갑"이 이 계약을 위약 하였을 때에는 "갑"은 해약금으로 계약금의 배액을 "을"에게 배상하여야 하며,<br>
 		"을"이 위약 하였을 때에는 "을"은 "갑"에게 계약금의 반환을 요구할 수 없다.
 
 </pre>

<br><br>
	<div class="button-area">
		<button onclick="window.location.href='${pageContext.request.contextPath}/main.mem'"
			class="w-100 btn btn-comm btn-light" type="button" style="background: white;">메인으로 가기</button>
		<button class="w-100 btn btn-comm btn-light" type="button" style="background: white;"
			onclick="window.location.href='${pageContext.request.contextPath}/myPage.ca'">마이페이지로 가기</button>
	</div>
</section>


<%@ include file="../member/bottom2.jsp" %>