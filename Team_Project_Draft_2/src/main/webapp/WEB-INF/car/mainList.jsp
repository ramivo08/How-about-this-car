<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp" %>
<style>
#mainList{
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
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
#searchCar{
  width: 200px; /* 원하는 너비설정 */
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
#keyword{
 width: 200px; /* 원하는 너비설정 */
 height:41px;
  padding: .5em .5em; /* 여백으로 높이 설정 */
  font-family: inherit;  /* 폰트 상속 */
  border: 1px solid #999; 
  border-radius: 0px; /* iOS 둥근모서리 제거 */
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  background-color: white;
}
#submit{
 width: 75px; /* 원하는 너비설정 */
 height:41px;
  padding: .5em .5em; /* 여백으로 높이 설정 */
  font-family: inherit;  /* 폰트 상속 */
  border: 1px solid #999; 
  border-radius: 0px; /* iOS 둥근모서리 제거 */
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  background-color: white;
}
td{
padding: 25px;
}
@font-face {
    font-family: 'SUIT-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
#CarFont{
font-family: 'SUIT-Medium';
color: #000;
}
#carImages{
  transition: all 0.2s linear;
    width: 400px;
  margin: 0px auto;
  overflow: hidden;
}
#carImages:hover{
  transform: scale(1.2); /* 차량 사진이 기존 사진에 비해서 커지는 비율 */
  transition : .3s;
}
#CarFont2{
font-family: 'SUIT-Medium';
color: #afabab;
}

	ul {
	text-align:center;
	}
	ul li {
		display:inline;
		vertical-align:middle;
	}
	ul li #pageButton {
		display:-moz-inline-stack;	/*FF2*/
		display:inline-block;
		vertical-align:top;
		padding:4px;
		margin-right:3px;
		width:15px !important;
		color:#000;
		font:bold 12px tahoma;
		border:1px solid #eee;
		text-align:center;
		text-decoration:none;
		width /**/:26px;	/*IE 5.5*/
	
	}
	ul li #pageButton.now {
		color:#fff;
		background-color:#ED0000;
		border:1px solid #ED0000;
	}
	ul li #pageButton:hover, ul li #pageButton:focus {
		color:#fff;
		border:1px solid: #ED0000;
		background-color:#ED0000;
	}
	
	
</style>
<div id="mainList" align="center">
<br><br>
		<form action="mainList.ca" method="post">
		<strong>총 <font color="red"><fmt:formatNumber value="${totalcount}" var="tc"/>${tc}</font>대</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="whatColumn" id="searchCar">
	<option value="">전체 검색</option>
	<option value="cmodel">모델</option>
	<option value="ccompany">제조사</option>

</select>
<input type="text" name="keyword" id="keyword">
<input type="submit" value="검색" id="submit">
</form>
	<table>

	
		<tr>
	<c:forEach var="i" items="${lists}" varStatus="x">
		
		<td align="center">
			<a style="text-decoration:none;" href="carDetailView.ca?cnum=${i.cnum}">
			
			<c:set var="images" value="${fn:split(i.cimage,',')}" />
			
        <img id="carImages" width="300px" height="230px"src="<%=request.getContextPath()%>/resources/images/${images[0]}">

    	
			
			<br>
			<br><font id="CarFont" size="5pt">[${i.ccompany}] [${i.cmodel}] ${i.carname}</font><br>
			<font id="CarFont2" size="3pt">주행거리 : <strong><fmt:formatNumber var="mileage" value="${i.cmileage}"/>${mileage}km</strong><br>
			가격 : </font><font color="red"><fmt:formatNumber var="price" value="${i.cprice}"/><strong>  ${price}만원</strong></font></a><br><c:if test="${i.status eq 1}">예약중인 상품</c:if>
		</td>
		<c:if test="${(x.count mod 3) eq 0}"></tr><tr></c:if>
		
	</c:forEach>
	<c:if test="${fn:length(lists)==0}">
		<tr align=center>
			<td colspan=8><font color="red">등록된 차량이 없습니다.</font></td>
		</tr>
		</c:if>
		</tr>
	</table>
<br>	
	<ul><li>${pageInfo.pagingHtml }</li></ul>
</div>
<%@ include file="../member/bottom.jsp" %>