<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../common/common.jsp"%>
    <style>
    .cateListAllContainer{
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    padding-left: 200px;
    padding-right: 200px;
    
}
select {
  -webkit-appearance: none;  /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  background: url(이미지 경로) no-repeat 95% 50%;  /* 화살표 모양의 이미지 */ 
}

/* IE 10, 11의 네이티브 화살표 숨기기 */
select::-ms-expand { 
  display: none;
}

   .cateList td{
   padding:10px;
   }
   .cateList th{
   padding:10px;
   }
   #productSelect{
   width:150px;
      height:41px;
  padding: .5em .5em; !important/* 여백으로 높이 설정 */
  font-family: inherit;  !important/* 폰트 상속 */
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; !important/* 네이티브 화살표 대체 */  
  border: 1px solid #999; !important
  border-radius: 0px; !important/* iOS 둥근모서리 제거 */
  -webkit-appearance: none;  !important/* 네이티브 외형 감추기 */
  -moz-appearance: none; !important
  appearance: none; !important
   }
   #mallSelect{
   width:200px;
         height:41px;
  padding: .5em .5em; !important/* 여백으로 높이 설정 */
  font-family: inherit;  !important/* 폰트 상속 */
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; !important/* 네이티브 화살표 대체 */  
  border: 1px solid #999; !important
  border-radius: 0px; !important/* iOS 둥근모서리 제거 */
  -webkit-appearance: none;  !important/* 네이티브 외형 감추기 */
  -moz-appearance: none; !important
  appearance: none; !important
   }
   }
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
  width: 50%;
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
.title{
text-align: center;
}
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
    <script>
    var malls = false;

    function update_selected() {
      $("#mallSelect").val(0);
      $("#mallSelect").find("option[value!=0]").detach();

      $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
    }

    function update_text(){
    	$("#textarea").val($("#productSelect").val());
    	
    }
    function update_text2(){
    	$("#textarea2").val($("#mallSelect").val());
    	
    }
    
    $(function() {
      malls = $("#mallSelect").find("option[value!=0]");
      malls.detach();

      $("#productSelect").change(update_selected);
      $("#productSelect").change(update_text);
      $("#mallSelect").change(update_text2);
      $("#productSelect").trigger("change");
      $("#mallSelect").trigger("change");
    });
    </script>
    
    <script>
    function goInsert(){
    	location.href="insertCate.cate";
    }
    
    function goDelete(cate_cnum){
    	location.href="deleteCate.cate?cate_cnum="+cate_cnum;
    }
    </script>
<jsp:include page="/WEB-INF/member/top.jsp"/>
    <div class="cateListAllContainer" align="center">
<!--     <input type="text" id="textarea" value=""> -->
    <select name="company" id="productSelect">
    	<option value="0" selected>제조사
    <c:forEach var="x" items="${comLists}" varStatus="status">
    	
    	<option value="${x.company}" >${x.company}
    </c:forEach>
    
    </select>
    
        <select name="model" id="mallSelect">
        <option value="0" selected>모델
    <c:forEach var="y" items="${modLists}">
    	<option value="${y.model}" class="mall${y.company}">${y.model}
    </c:forEach>
    
    </select>
    <br><br>
        <div><h1 class="title">카테고리 목록 <input type="button" id="cart__list__orderbtn" onclick="goInsert()" value="카테고리 추가"></h1></div>
    <table class="cateList">
    	<tr>
    	<th>
    	 번호
    	</th>
    	<th>
    	제조사
    	</th>
    	<th>
    	모델
    	</th>
    	<th>
    	삭제
    	</th>
    	</tr>
    	<c:forEach var="z" items="${modLists}">
    	<tr>
    	<td>
    	 ${z.cate_cnum}
    	</td>
    	<td>
    	${z.company}
    	</td>
    	<td>
    	${z.model}
    	</td>
    	<td>
    	<input type="button" value="삭제" id="cart__list__orderbtn" onclick="goDelete('${z.cate_cnum}')">
    	</td>
    	</tr>
    	</c:forEach>
    	<tr><td colspan=4 align=center><input  id="cart__list__orderbtn"  type="button" value="목록보기" onclick="location.href='list.mem'"></td></tr>
    </table>
    </div>
    <%@ include file="../member/bottom.jsp" %>
    