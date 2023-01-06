<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp" %>

   <!--  orderList.jsp 결제후 주문내역 보여주는곳 -->
    
<script type="text/javascript">
	function goShop(){
		//alert(1);
		location.href="mainList.ca";
	}
</script>

    
<style>
table.cart__list  thead td {
    text-align: center;
}

table.cart__list  tbody td {
    text-align: center;
}

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
  text-decoration: none;
}

a.com-link:hover {
    text-decoration: none;
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
  font-size: 12px;
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

#img_car{
	width:200px;
	height:80px;
	margin: 10px;
	padding: 4px 8px;
}


</style>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<section class="cart">
	<br>
	<h1>주문 내역</h1>
	<br>
	<table class="cart__list">
		<thead>
			<tr>
				<td>주문 번호</td>
				<td>주문 일자</td>
				<td>상세 보기</td> <!-- 주문번호 가지고 상세보기 넘어가기 -->
			</tr>
		</thead>

		<tbody>
			<c:forEach var="item" items="${orderInfoList}">
				<tr>
					<td>${item.onum}</td>
					<td><fmt:formatDate var="formatDate" value="${item.orderdate}" pattern="yyyy-MM-dd HH:mm:ss"/>${formatDate}</td>
					<td><a class="com-link" href="${pageContext.request.contextPath}/orderListDetail.mall?onum=${item.onum}">주문 상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>

<%@ include file="../member/bottom2.jsp" %>