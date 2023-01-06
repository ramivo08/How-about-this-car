<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
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
    
<body>   
<section class="cart">
       <div><h1 class="title">프로필 정보</h1></div>
      <div><span id="text-light"><font id="text-light">${mem.name }님의 정보입니다.</font></span></div>
          <br>
          
   <form method="post" action="detail.mem">       
      <input type="hidden" name="num" value="${mem.num }">
      
    <table class="cart__list">
    </tbody>
   <tr class="cart__list__detail">
      <th>ID</th>
      <td>${mem.id}</td>
   </tr>
   <tr class="cart__list__detail">
      <th>이름</th>
      <td>${mem.name}</td>
   </tr>
   <tr class="cart__list__detail">
      <th>성별</th>
      <td>${mem.gender}</td>
   </tr>
   <tr class="cart__list__detail">
      <th>주소</th>
      <td>${mem.addr}</td>
   </tr>
   
   <tr class="cart__list__detail">
      <th>생년월일</th>
      <td>${mem.yy}-${mem.mm}-${mem.dd}</td>
   </tr>
   <tr class="cart__list__detail">
      <th>회사</th>
      <td>${mem.company}</td>
   </tr>
   <tr class="cart__list__detail">
      <th>이메일</th>
      <td>${mem.email}</td>
   </tr>
   <tr class="cart__list__detail">
      <th align="center">핸드폰번호</th>
      <td>${mem.hp}</td>
   </tr>
   </tbody>
   </table>
   </form>

       <div class="cart__mainbtns">
           <button class="cart__bigorderbtn right" onclick="location.href='delete.mem?num=${mem.num}'">삭제하기</button>
           <button class="cart__bigorderbtn right" onclick="location.href='list.mem?num=${mem.num}'">목록보기</button>
        </div>   
</section>
</body>

<%@ include file="../member/bottom2.jsp" %>
 