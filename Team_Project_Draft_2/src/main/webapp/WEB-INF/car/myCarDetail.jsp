<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/common.jsp" %>
<style>
body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: #353535;
}
@media screen and (max-width: 800px) {
  body {
    font-size: 16px;
    line-height: 22px;
  }
}

.wrapper {
  margin: 0 auto;
  padding: 40px;
  max-width: 800px;
}

.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 800px) {
  .table {
    display: block;
  }
}

.row {
  display: table-row;
  background: #eaeaea;
}
.row:nth-of-type(odd) {
  background: #eaeaea;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.red {
  background: #bf0f28;
}
@media screen and (max-width: 800px) {
  .row {
    padding: 14px 0 7px;
    display: block;
  }
  .row.header {
    padding: 0;
    height: 6px;
  }
  .row.header .cell {
    display: none;
  }
  .row .cell {
    margin-bottom: 10px;
  }
  .row .cell:before {
    margin-bottom: 3px;
    content: attr(data-title);
    min-width: 98px;
    font-size: 10px;
    line-height: 10px;
    font-weight: bold;
    text-transform: uppercase;
    color: #747474;
    display: block;
  }
}

.cell {
  padding: 6px 12px;
  display: table-cell;
}
@media screen and (max-width: 800px) {
  .cell {
    padding: 2px 16px;
    display: block;
  }
}
#carUpdate{
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  margin:2;
  }
</style>
<script>
	
	function goMyCarUpdate(cnum, status) {
		if (status == 1) {
			alert("예약중인 상품으로 수정이 불가능 합니다.");
		} else if (status != 1) {

			if (confirm("수정 하시겠습니까?")) {
				location.href = "carUpdate.ca?cnum=" + cnum;
			} else {
				return;
			}
		}
	}
	function goClose() {
		window.close();
	}
</script>
  <div class="table">
    
    <div class="row header red">
      <div class="cell">
        상품번호
      </div>
      <div class="cell">
        판매자 아이디
      </div>
      <div class="cell">
        판매자 이름
      </div>
      <div class="cell">
        판매자 번호
      </div>
      <div class="cell">
        차량 이름
      </div>
      <div class="cell">
        제조사
      </div>
      <div class="cell">
        모델
      </div>
      <div class="cell">
        연식
      </div>
      <div class="cell">
        주행거리
      </div>
      <div class="cell">
        옵션
      </div>
      <div class="cell">
        제조 국가
      </div>
      <div class="cell">
        사고 유무
      </div>
      <div class="cell">
        가격
      </div>
      <div class="cell">
        사진
      </div>
      <div class="cell">
        설명
      </div>
      <div class="cell">
        판매 등록 날짜
      </div>
    </div>
    
    <div class="row">
      <div class="cell" data-title="상품 번호">
       ${cb.cnum}
      </div>
      <div class="cell" data-title="판매자 아이디">
       ${cb.cid}
      </div>
      <div class="cell" data-title="판매자 이름">
       ${cb.cname}
      </div>
      <div class="cell" data-title="판매자 번호">
        ${cb.chp}
      </div>
      <div class="cell" data-title="차량 이름">
        ${cb.carname}
      </div>
      <div class="cell" data-title="제조사">
        ${cb.ccompany}
      </div>
      <div class="cell" data-title="모델">
        ${cb.cmodel}
      </div>
      <div class="cell" data-title="차량등록일">
      <fmt:parseDate var="regDay" value="${cb.creg_day}" pattern="yyyy-MM-dd"/>
	  <fmt:formatDate value="${regDay}" var="reg" pattern="yyyy-MM-dd"/>
    	${reg}
      </div>
      <div class="cell" data-title="주행거리">
	  <fmt:formatNumber var="mileage" value="${cb.cmileage }"/>
    	${mileage}km
      </div>
      <div class="cell" data-title="옵션">
       <c:forTokens var ="i" items="${cb.coption}" delims="," varStatus="status">
    	<c:set var="option" value="${fn:split(cb.coption,',')}"/>
    		${i}<c:if test="${fn:length(option) ne status.count }">,</c:if>&nbsp;
    		<c:if test="${(status.count mod 5) eq 0}">
    		<br>
    		</c:if>
    		
    	</c:forTokens> 
      </div>
      <div class="cell" data-title="제조 국가">
        ${cb.cdnf}
      </div>
      <div class="cell" data-title="사고 유무">
        ${cb.caccident}
      </div>
      <div class="cell" data-title="가격">
        <fmt:formatNumber var="price" value="${cb.cprice }"/>
    	${price}만원
      </div>
      <div class="cell" data-title="사진">
       <c:set var="images" value="${fn:split(cb.cimage,',')}" />
    	<c:forEach var="x" items="${images}" varStatus="status">
        <img height=200 width=300 src="<%=request.getContextPath()%>/resources/images/${images[status.index]}">
    	</c:forEach>
      
      </div>
      <div class="cell" data-title="설명">
       <pre> ${cb.ccontent}</pre>
      </div>
      <div class="cell" data-title="판매 등록 날짜">
        <fmt:parseDate var="inputDay" value="${cb.inputdate}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${inputDay}" var="input" pattern="yyyy-MM-dd"/>		
		${input}
      </div>
    </div>
    <div class="cell" align=center>
        <input type="button" id="carUpdate" value="수정" onclick="goMyCarUpdate('${cb.cnum}','${cb.status}')" style="width:100;height:30;">
    	<input type="button" id="carUpdate" value="닫기" onclick="goClose()" style="width:70;height:30;">
      </div>
  </div>