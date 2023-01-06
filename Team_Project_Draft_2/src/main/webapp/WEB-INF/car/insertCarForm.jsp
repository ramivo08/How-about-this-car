<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp" %>
 <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<style>
#insertCar{
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
}
.err{
     color:red;
     font-size:9pt;
     font-weight:bold;
}
.insert {
    padding: 20px 30px;
    display: block;
    width: 600px;
    margin: 5vh auto;
    height: 90vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
	.err{
	font-size: 7pt;
	color: red;
	font-weight: bold;
	}
	
h2.title {
    margin: 0 auto;
    width: 500px;
    border-bottom: 1px solid #999;
    padding: 20px 0;
    text-align: center;
}

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  border-left: none;
  border-right: none;
  width: 65%;
  font-size: 14px;
}

td {
  width:35;
  padding-top: 15px;
  padding-right: 10px;
  padding-bottom: 15px;
  padding-left: 30px;
  border-bottom: 1px solid lightgrey;
}

#btn-btn{ 
background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

input[type=checkbox], input[type=radio] {
    accent-color:red;
}

#text-p{
	width: 82.5%;
}

#btn-btn-re{
	background-color: white;
 	border: 1px lightgray solid;
 	border-radius: 5px;
    padding: 4px 8px;
    font-size: 16px;
  	margin-top: 5px;
}
.main-ul li {
	float: left;
	list-style: none;
	height:15px;
	margin: 5px;
}

.main-ul li a {
	text-decoration: none;
	color: black;
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
    </script>
    
<%
	String[] optionList = {"에어컨","네비게이션","후방감지센서","후방카메라","전방감지센서","전방카메라","블랙박스","통풍시트","열선시트","ABS","스마트키","에어백","파워 스티어링 휠","차선이탈 경보 시스템","크루즈 컨트롤","HUD","전자식 주차브레이크","하이패스","어라운드뷰","선루프","ECM 룸미러","메모리 시트",
			"헤드램프(HID)","헤드램프(LED)","CD 플레이어", "AUX 단자","TCS","오토라이트","360도 어라운드 뷰"};

%>





	<div id="insertCar" align="center">
		<form:form commandName="cb" method="post" action="insertCar.ca" enctype="multipart/form-data" name="f">
			<table>
				<tr>
					<td colspan=2 align="center">
						<h3>
							<span>차량 추가 화면</span>
						</h3>
					</td>
				</tr>
				<tr>
					<td colspan=2 align="center"><font size="5pt">* 표시는 <font color="red"><strong>필수</strong></font> 입력 사항입니다.</font></td>
				</tr>
				<tr>
					<td>*상품명</td>
					<td>
					<input type="text" name="carname" id="carname" value="${cb.carname}">
					<form:errors cssClass="err" path="carname"/>
					</td>

				</tr>
				<tr>
					<td>*제조사</td>
					<td>    <select name="ccompany" id="productSelect">
    	<option value="0" selected>제조사
    <c:forEach var="x" items="${comLists}" varStatus="status">
    	
    	<option value="${x.company}">${x.company}
    </c:forEach>
    
    </select>
					<form:errors cssClass="err" path="ccompany" /></td>
				</tr>

				<tr>
					<td>*모델</td>
					<td>        <select name="cmodel" id="mallSelect">
        <option value="0" selected>모델
    <c:forEach var="y" items="${modLists}">
    	<option value="${y.model}" class="mall${y.company}">${y.model}
    </c:forEach>
    
    </select>
					<form:errors cssClass="err" path="cmodel" /></td>
				</tr>

				<tr>
					<td>*가격</td>
					<td><input type="text" name="cprice" id="cprice" value="${cb.cprice}"> 만원
						<form:errors cssClass="err" path="cprice" /></td>
				</tr>


				<tr>
					<td>옵션</td>
					<td>
					<ul class="main-ul">
					<c:forEach var="x" items="<%=optionList%>"
							varStatus="status">
							<li>
							<a href="" class="firstA"><label for="options_${status.count}" ><input type="checkbox" name="coption" id="options_${status.count}" value="${x}"
								<c:if test="${fn:contains(cb.coption, x) }"> checked </c:if>>${x}</label></a></li>
									<c:if test="${(status.count mod 7) eq 0}">
									<ul class="main-ul"></ul>
									</c:if>
									
						</c:forEach>
						
						</ul>
						<form:errors cssClass="err" path="coption" /></td>
				</tr>

				<tr>
					<td>*차량 사진</td>
					<td><input type="file" name="upload" id="upload" multiple="multiple"  onchange="addFile(this);" value="${cb.cimage}">
					<form:errors cssClass="err" path="cimage" />
					
					<script>
					
					function addFile(obj){
					    var maxFileCnt = 4;   // 첨부파일 최대 개수
					    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
					    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
					    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

					    // 첨부파일 개수 확인
					    if (curFileCnt > remainFileCnt) {
					        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
					    document.querySelector("input[type=file]").value = "";
					    }

					}
					</script>
						</td>
				</tr>

				<tr>
					<td>*차량 등록일</td>
					<td><input type="date" name="creg_day" id="creg_day" value="${cb.creg_day}" max="<%= sf.format(nowTime)%>">
						<form:errors cssClass="err" path="creg_day" />
						</td>
				</tr>

				<tr>
					<td>*주행거리</td>
					<td><input type="text" name="cmileage" id="cmileage" value="${cb.cmileage}"> km 
						<form:errors cssClass="err" path="cmileage" /></td>
				</tr>

				<tr>
					<td>*제조 국가</td>
					<td>
					<input type="radio" name="cdnf" id="cdnf" value="국내" <c:if test="${cb.cdnf eq '국내' }"> checked</c:if>>국내
					<input type="radio" name="cdnf" id="cdnf" value="국외" <c:if test="${cb.cdnf eq '국외' }"> checked</c:if>>국외 
						<form:errors cssClass="err" path="cdnf" />
					</td>
				</tr>

				<tr>
					<td>*사고 유무</td>
					<td><input type="radio" name="caccident" id="caccident" value="유" <c:if test="${cb.caccident eq '유' }">checked</c:if>> 유
						<input type="radio" name="caccident" id="caccident" value="무" <c:if test="${cb.caccident eq '무' }">checked</c:if>> 무
						<form:errors cssClass="err" path="caccident" />
					</td>
				</tr>

				<tr>
					<td>*설명</td>
					<td><textarea rows="15" cols="120" name="ccontent" id="ccontent" style="resize: none;" maxlength="1500"><c:if test="${cb.ccontent eq null}">◆ 구매 가이드
 ▶허위매물 대처
  - 가격이 수시로 여러번 오르고 내리는 형태를 보이는 매물
  - 전화상담 직원과 차량 응대 직원이 다를 경우(자연스럽게 여러가지 핑계를 댄다.)
  - 상담했던 차량과 다른 차량을 보여주거나 권하는 매물, 저렴하면서 좋은 중고차는 세상에 존재하지 않는다는 것을 잊지 마세요.

 ▶성능 상태 점검기록부
  - 성능 상태 점검기록부에 점검지와 고지자의 서명날인된 원본을 받습니다.
  - 보증수리 주체가 누구인지 명기되지 않았다면, 계약서의 보증책임주체를 명기합니다.
 
 ▶차량 금액 외 별도 수수료
  - 차량금액 외 별도의 수수료가 발생하는지 계약 진행 전 챙기도록 합니다.
  - 모든 수수료에 대해 영수증을 받습니다.

 ▶차량 이전등록
  - 차량 이전등록업무를 맡길 경우 별도의 이전등록수수료가 얼마인지 사전에 묻고, 이전등록이 끝난뒤 수수료외 납부한 모든 금액에 대한 영수증을 확인합니다.

 ▶차량체크 사항
  - 매뉴얼이 있는지 확인합니다.(수입차는 별도 매뉴얼을 구하기 어렵고, 높은 비용이 발생함.)
  - 보조키가 있는지 확인합니다.(이모빌라이져 기능이 있는 키나, 스마트키는 추가 비용이 높음.)
  - 겨울에는 에어컨 상태를, 여름에는 히터 상태를 확인합니다.(판매작 점검을 잊기 쉬움.)
  - 스페어타이어는 밖으로 빼서 확인합니다.(쓸 수 없는 타이어가 들어있는 경우가 많음.)
  - 차량 공구 및 비상 삼각거치대 유무를 확인합니다.(출고 후 다시 찾아가 요청하기 힘든 품목.)
  - 출고 전 차량의 하체를 확인하여 부식 상태나 충격 유무를 확인합니다.
  - 내비게이션이 장착된 차량은 차량을 움직여 봄으로써 GPS와 기계 정상 작동을 확인합니다.
  - 남아있는 신차 보증기간과 신차 출고 시 제공한 쿠폰이 있는지 확인합니다.(전자쿠폰은 눈으로 불가한 경우도 있음)</c:if><c:if test="${cb.ccontent  ne null}">${cb.ccontent}</c:if></textarea>
					<form:errors cssClass="err" path="ccontent" /></td>

				</tr>


				<tr>
					<td>*판매자명</td>
					<td><input type="text" name="cname" value="${loginInfo.name}"readonly></td>
				</tr>

				<tr>
					<td>*판매자 아이디</td>
					<td><input type="text" name="cid" value="${loginInfo.id}"readonly></td>
				</tr>

				<tr>
					<td>*판매자 번호 ('-' 없이 입력)</td>
					<td>
						<input type="text" id="chp" name="chp" value="${loginInfo.hp}" maxlength="11">
						<form:errors cssClass="err" path="chp" />

					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="추가하기" id="btn-btn">
						<input type="reset" value="취소" id="btn-btn">
					</td>
				</tr>

			</table>
		</form:form>
	</div>
</body>
<%@ include file="../member/bottom2.jsp" %>
