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
  width: 100%;
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
}

td:hover {
  background-color: #eaeaea;
  color: #fff;
  font-weight: bold;
</style>
    <div id="AnswerForm" align="center">
    	<form action="goAnswer.pq" method="post">
		    <table style="width:50%;">
		    	<tr>
		    		<th style="text-align:center;">상품</th>
		    		<td>${pqbean.carInfo}
		    		<input type="hidden" value="${pqbean.pnum}" name="pnum">
		    		</td>  		
		    	</tr>
		    	<tr>
		    		<th style="text-align:center;">제목</th>
		    		<td>${pqbean.ptitle }</td>    		
		    	</tr>
		    	<tr>
		    		<th style="text-align:center;">내용</th>    		
		    	
		    		<td style="text-align:center;"><pre>${pqbean.pcontents}</pre></td>    		
		    	</tr>
		    	<tr>
		    		<th colspan=2  style="text-align:center;">답변하기&nbsp;&nbsp;&nbsp;<font size="1pt" color="red">*1000자까지 입력가능</font></th>    		
		    	</tr>
		    	<tr>
		    		<td colspan=2 align="center">
		    			<textarea rows="10" cols="100" style="resize:none;" name="answer" maxlength="1000"></textarea>
		    		</td>    		
		    	</tr>
		    	<tr>
		    		<td colspan=2 align=center>
		    			<input type="submit" value="답변하기" id="cart__list__orderbtn"> 
		    		</td>    		
		    	</tr>
		    
		    </table>
   		</form>
    </div>
    <%@ include file="../member/bottom.jsp" %>