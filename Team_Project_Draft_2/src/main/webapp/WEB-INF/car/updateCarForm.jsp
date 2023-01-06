<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/common.jsp" %>
 <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<style>
body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: #2b2b2b;
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
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
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
    color: #969696;
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
    <script>
    var malls = false;

    function update_selected() {
      $("#mallSelect").val(0);
      $("#mallSelect").find("option[value!=0]").detach();

      $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
    }

    $(function() {
      malls = $("#mallSelect").find("option[value!=0]");
      malls.detach();

      $("#productSelect").change(update_selected);
      $("#productSelect").trigger("change");
    });
    
    function goClose(){
    	window.close();
    }
    </script>
	<%

	String[] optionList = {"에어컨","네비게이션","후방감지센서","후방카메라","전방감지센서","전방카메라","블랙박스","통풍시트","열선시트","ABS","스마트키","에어백","파워 스티어링 휠","차선이탈 경보 시스템","크루즈 컨트롤","HUD","전자식 주차브레이크","하이패스","어라운드뷰","선루프","ECM 룸미러","메모리 시트",
			"헤드램프(HID)","헤드램프(LED)","CD 플레이어", "AUX 단자","TCS","오토라이트","360도 어라운드 뷰"};

%>




  <div class="table">
    
    <div class="row header green">
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
        상품명
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
    <form:form method="post" commandName="cb" action="carUpdate.ca" enctype="multipart/form-data" name="f">
    <div class="row">
      <div class="cell" data-title="상품 번호">
       ${cb.cnum}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 상품번호는 변경이 <font color="red"><b>불가능</b></font>합니다.
       <input type="hidden" value="${cb.cnum}" name="cnum">
      </div>
      <div class="cell" data-title="판매자 아이디">
       ${cb.cid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 판매자 아이디는 변경이 <font color="red"><b>불가능</b></font>합니다.
       <input type="hidden" value="${cb.cid}" name="cid">
      </div>
      <div class="cell" data-title="판매자 이름">
       ${cb.cname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 판매자 이름는 변경이 <font color="red"><b>불가능</b></font>합니다.
       <input type="hidden" value="${cb.cname}" name="cname">
      </div>
      <div class="cell" data-title="판매자 번호">
        <input type="text" id="chp" name="chp"value="${cb.chp}" maxlength="11">
      </div>
      <div class="cell" data-title="상품명">
        <input type="text" name="carname" id="carname" value="${cb.carname}">
		<form:errors cssClass="err" path="carname"/>
      </div>
      <div class="cell" data-title="제조사">
  
						 <select name="ccompany" id="productSelect" style="width: 130px;"> 
    	<option value="0" selected>제조사
    <c:forEach var="x" items="${comLists}" varStatus="status">
    	
    	<option value="${x.company}" <c:if test="${x.company eq cb.ccompany}">selected</c:if>>${x.company}
    </c:forEach>
    
    </select>
					<form:errors cssClass="err" path="ccompany" />
      </div>
      <div class="cell" data-title="모델">
      
       <select name="cmodel" id="mallSelect" style="width: 130px;">
        <option value="0" selected>모델
    <c:forEach var="y" items="${modLists}">
    	<option value="${y.model}" class="mall${y.company}" <c:if test="${y.model eq cb.cmodel}">selected</c:if>>${y.model}
    </c:forEach>
    
    </select>
					<form:errors cssClass="err" path="cmodel" />
      </div>
      <div class="cell" data-title="차량 등록일">
      	<input type="date" name="creg_day" id="creg_day" value="${cb.creg_day}" max="<%=sf.format(nowTime)%>">
		<form:errors cssClass="err" path="creg_day" />
      </div>
      <div class="cell" data-title="주행거리">
	  	<input type="text" name="cmileage" id="cmileage" value="${cb.cmileage}"> km 
		<form:errors cssClass="err" path="cmileage" />
      </div>
      <div class="cell" data-title="옵션">
       <c:forEach var="x" items="<%=optionList%>"
							varStatus="status">
							<input type="checkbox" name="coption" id="coption" value="${x}"
								<c:if test="${fn:contains(cb.coption, x) }"> checked </c:if>>${x}
									<c:if test="${(status.count mod 5) eq 0}">
									<br>
									</c:if>
						</c:forEach>
						<form:errors cssClass="err" path="coption" />
      </div>
      <div class="cell" data-title="제조 국가">
        <input type="radio" name="cdnf" id="cdnf" value="국내" <c:if test="${cb.cdnf eq '국내' }"> checked</c:if>>국내
		<input type="radio" name="cdnf" id="cdnf" value="국외" <c:if test="${cb.cdnf eq '국외' }"> checked</c:if>>국외 
		<form:errors cssClass="err" path="cdnf" />
      </div>
      <div class="cell" data-title="사고 유무">
        <input type="radio" name="caccident" id="caccident" value="유" <c:if test="${cb.caccident eq '유' }">checked</c:if>> 유
		<input type="radio" name="caccident" id="caccident" value="무" <c:if test="${cb.caccident eq '무' }">checked</c:if>> 무
		<form:errors cssClass="err" path="caccident" />
      </div>
      <div class="cell" data-title="가격">
        <input type="text" name="cprice" id="cprice" value="${cb.cprice}"> 만원
		<form:errors cssClass="err" path="cprice" />
      </div>
      <div class="cell" data-title="사진">
        <input type="file" name="upload" id="upload" value="${cb.cimage}" multiple="multiple">
		<form:errors cssClass="err" path="cimage" />
      </div>
      <div class="cell" data-title="설명">
        <textarea rows="10" cols="80" name="ccontent" id="ccontent" style="resize: none;">${cb.ccontent}</textarea>
		<form:errors cssClass="err" path="ccontent" />
      </div>
      <div class="cell" data-title="판매 등록 날짜">
        <fmt:parseDate var="inputDay" value="${cb.inputdate}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${inputDay}" var="input" pattern="yyyy-MM-dd"/>		
		${input}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 판매 등록 날짜는 변경이 <font color="red"><b>불가능</b></font>합니다.
		<input type="hidden" value="${input}" name="inputdate">
      </div>
    </div>l
    <div class="cell" align=center>
        <input type="submit" id="carUpdate" value="수정하기" style="width:100;height:30;">
    	<input type="button" id="carUpdate" value="닫기" onclick="goClose()" style="width:70;height:30;">
      </div>
  </form:form>
  </div>