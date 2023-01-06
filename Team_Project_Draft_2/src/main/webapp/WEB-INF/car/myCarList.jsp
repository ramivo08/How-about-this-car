<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp" %> 

<style>

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

a.link:hover {
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
  font-size: 12px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table {
  border-top: solid 1.5px black;
  border-bottom: solid 1.5px black;
  border-collapse: collapse;
  width: 75%;
  font-size: 15px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 13px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
  text-align: center;
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

#cart__list__btn{
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
  font-size: 15px;
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
.myCar_goToDetail{
text-decoration: none;
color:black;
}
.myCar_goToDetail:hover{
font-weight: bold;
color:red;
}
.mycartd:hover {
  background-color: #eaeaea;
  color: #fff;
  font-weight: bold;
  }
</style>

<script>
function goDetail(cnum){
	window.open("carDetail.ca?cnum="+cnum,"DetailView","width=700, height=1080, resizable=no, scrollbars=no, toolbars=no, menubar=no");
}
function goDelete(cnum,pageNumber,status){
	if(status == 1){
		alert("예약중인 상품으로 삭제가 불가능합니다.");
		return;
	}else if(status != 1){
		
	location.href="myCarDelete.ca?cnum="+cnum+"&pageNumber="+pageNumber;
	}
}

</script>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<div id="myPageCar" align="center">
<div><h1 class="title">등록한 판매 상품</h1></div><br>
<div><span class="badge bg-secondary rounded-pill">등록한 건수 : ${totalcount}</span></div><br>

<form action="myCarList.ca" method="post">
 
	<select name="whatColumn">
		<option value="">전체 검색</option>
		<option value="carname">차량명</option>
		<option value="cmodel">모델</option>
		<option value="ccompany">제조사</option>
	</select>

<input type="text" name="keyword">
<input type="submit" value="검색" id="cart__list__orderbtn">
</form>
<br><br>

<form method="post" action="myPage.ca">
	<table class="cart__list">
		<tr class="cart__list__detail">
			<td>차량명</td>
			<td>제조사</td>
			<td>모델</td>
			<td>가격(만원)</td>
			<td>차량등록일</td>
			<td>주행거리(km)</td>
			<td>사고유무</td>
			<td>판매 등록 날짜</td>
			<td>삭제</td>
			<td>상세보기</td>
		</tr>
	<tbody>		
	<c:forEach var="i" items="${lists}" varStatus="status">
		<tr class="cart__list__detail">
			
			<td class="mycartd"><a href="carDetailView.ca?cnum=${i.cnum}" class="myCar_goToDetail">${i.carname} <c:if test="${i.status eq 1}"><strong><font color="red">(예약중)</font></strong></c:if></a>
			</td>
			<td class="mycartd"><a href="carDetailView.ca?cnum=${i.cnum}" class="myCar_goToDetail">${i.ccompany}</a></td>
			<td class="mycartd"><a href="carDetailView.ca?cnum=${i.cnum}" class="myCar_goToDetail">${i.cmodel}</a></td>
		
			<fmt:formatNumber var="price" value="${i.cprice }"/>
			<td><span class="price">${price}만원</span></td>	
		
			<fmt:parseDate var="regDay" value="${i.creg_day}" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${regDay}" var="reg" pattern="yyyy-MM-dd"/>
			<td>${reg}</td>
			
			<fmt:formatNumber var="mileage" value="${i.cmileage }"/>
			<td>${mileage} km</td>
			<td>${i.caccident}</td>
			
			<fmt:parseDate var="inputDay" value="${i.inputdate}" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${inputDay}" var="input" pattern="yyyy-MM-dd"/>		
			<td>${input}</td>
			<td><input type="button" id="cart__list__btn" value="삭제" onclick="goDelete('${i.cnum}','${pageInfo.pageNumber}','${i.status}')"></td>
			<td><input type="button" value="상세보기" class="cart__list__optionbtn" onclick="goDetail('${i.cnum}')"></td>				
			</tr>
			</c:forEach>
	</tbody>	
	<c:if test="${fn:length(lists)==0}">
		<tr align=center>
			<td colspan=10><font color="red">등록한 차량이 없습니다.</font></td>
		</tr>
	</c:if>
</table>

</form>
</div>
<br><br>
<center>
		${pageInfo.pagingHtml}
</center>
<%@ include file="../member/bottom2.jsp" %>