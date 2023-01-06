<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp" %>     
  <!--   payResultDetail.jsp 주문내역에서 상세보기 누르면 여기로 와서 결제내역을 보여준다 -->
  
<style>
h1.comp-title {
    margin: 0 auto;
    width: 500px;
    border-bottom: 1px solid #999;
    padding: 20px 0;
    text-align: center;
}

.comparison-section {
    width: 100%;
	overflow-x: auto;
    overflow-y: hidden;
    display: block;
    flex-flow: row;
    white-space: nowrap;
    max-width: 1000px;
    margin: 0 auto;
    padding: 50px 0;
    text-align: center;
}

.comparison-item {
    display: inline-block;
    width: 300px;
    margin: 0 5px;
    vertical-align: top;
}

.comparison-head {
    width: 100%;
    border: 1px solid #999;
    padding: 20px;
    box-sizing: border-box;
}

/* .comparison-head.img{
	position: absolute;
  	width: 50px;
   height: 100%;
  	top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
} */

ul.comparison-desc {
    list-style-type: disc;
    padding-left: 10px;
    font-size: 10pt;
    line-height: 26px;
}

ul.comparison-desc > li {
    width: 150px;
    margin: 0 auto;
    text-align: left;
}

ul.comparison-desc > li.option {
    white-space: normal;
}

ul.comparison-desc > li {
	margin-top: 10px;
  font-weight: bold;
  font-size :15px;
 }

a.com-link {width: 100%;text-align: center;display: block;text-decoration: none;color: #ED0000; font-weight: 700;margin: 10px 0;}
a.com-link:hover {
    text-decoration: underline;
}

.cart__bigorderbtn.left {
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

.comparison-head img{
	 display: block;
 	 width:260px;
	 height:300px;
	 margin: auto;
	}

</style>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<h1 class="comp-title">차량 비교하기</h1>

<div class="comparison-section">
	<c:forEach items="${carList }" var="item">
         <c:set var="images" value="${fn:split(item.cimage,',')}" />
		<div class="comparison-item">
			<div class="comparison-head">
			<img src="<%=request.getContextPath()%>/resources/images/${images[0]}">
			<%-- 	<img src="${pageContext.request.contextPath}/resources/images/${item.cimage}" > --%>
			</div>
			<div class="comparison-body">
				<ul class="comparison-desc">
					<li>차량명: ${item.carname }</li>
					<li>모델: ${item.cmodel }</li>
					<li>가격: ${item.cprice } 만원</li>
					<li>주행거리: ${item.cmileage } km</li>
					<li class="option">옵션: ${item.coption }
<%-- 					<c:forTokens var ="i" items="${item.coption}" delims="," varStatus="status">
    	<c:set var="option" value="${fn:split(item.coption,',')}"/>
    		${i}<c:if test="${fn:length(option) ne status.count }">,</c:if>&nbsp;
    		<c:if test="${(status.count mod 5) eq 0}">
    		<br>
    		</c:if>
    		
    	</c:forTokens>  --%>
					
					 
					</li>
				</ul>
			</div>
		</div>
	</c:forEach>
</div>

<a class="com-link" href="#" onclick="history.back(); return false;"><button class="cart__bigorderbtn left">뒤로 가기</button></a>
<br><br>
<%@ include file="../member/bottom2.jsp" %>