<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp" %>
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

a.com-link:hover {
    text-decoration: underline;
}

img {
  display: block;
  width: 90%;
  height: 80px;
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

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 80%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 15px;
}

td {
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

.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    /* -webkit-appearance: none; */
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;

</style>
<script>
function goBack(){
	alert(1);
}
</script>

<center>
<section class="cart">
<div><h2 class="title">상품 문의하기</h2></div>
<br><br>
<form action="insertpq.pq" method="post">
<table class="cart__list">
  <tbody>
  <tr class="cart__list__detail">
    <td>상품명 : [${cb.ccompany}] [${cb.cmodel}] ${cb.carname}
    <input type="hidden" value="[${cb.ccompany}] [${cb.cmodel}] ${cb.carname}" name="carInfo">
    <input type="hidden" value="${cb.cid}" name="seller_id">
    </td>
  </tr>
  <tr>
    <td>제 목 : &nbsp;
    <label for="inputPassword2" class="visually-hidden">Password</label>
    <input type="text" class="form-control-sm"  placeholder="제목을 입력하세요" name="ptitle">   

    <input type="hidden" value="${loginInfo.id}" name="buyer_id">
    <input type="hidden" value="${loginInfo.name}" name="buyer_name">
    </td>
  </tr>
  <tr>
    <td colspan=2>
    <textarea class="form-control col-sm-5" rows="10" cols="80" placeholder="내용을 입력하세요" style="resize:none" name="pcontents"></textarea>
    </td>
  </tr>
  </tbody>
  
  <tfoot>
  <tr>
    <td colspan=2 align=center>
     <input type="submit" class="cart__bigorderbtn right" value="문의하기">
    </td>
  </tr>
   </tfoot>
</table>
</form>
</div>
</section>
</center>
    <%@ include file="../member/bottom.jsp" %>