<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/common/common.jsp"%>


<style>
h1.mon-title {
    margin: 0 auto;
    width: 500px;
    /* border-bottom: 1px solid #999; */
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
    max-width: 800px;
    margin: 0 auto;
    padding: 50px 0;
    text-align: center;
}

.comparison-item {
    display: inline-block;
    width: 150px;
    margin: 0 5px;
   /*  border-bottom: 1px solid #999; */
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
    list-style: none;
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

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
  text-align: center;
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

.imgking{
  display: block;
  width: 500px;
  height: 600px;
  margin: auto;
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
</style>

<script type="text/javascript">
function goShop(){
	//alert(1);
	location.href="mainList.ca";
}
</script>
<jsp:include page="/WEB-INF/member/top.jsp"/> 
	 <p></p><h1 class="mon-title"></h1><p></p>
	
<div>
	<img class="imgking" src="<%=request.getContextPath()%>/resources/images/king.jpg">
</div>


	<div class="comparison-section">
		<h3>이달의 딜러왕 <font color="red" style="font-weight: bold;">Top 5</font>를 소개합니다.</h3>*판매 차량의 개수가 동일할 경우, <font color="red" style="font-weight: bold;">이름 순서</font>로 적용 됩니다.<br><br><br>
		<c:forEach begin="0" end="4" items="${lists }" var="item" varStatus="status">
			<div class="comparison-item">
				<div class="comparison-body">
					<ul class="comparison-desc">
						<li>
						<c:if test="${status.count eq 1}">
						<font color="red" size="6pt">
						</c:if>
						<c:if test="${status.count eq 2}">
						<font color="red" size="5pt">
						</c:if>
						<c:if test="${status.count eq 3}">
						<font color="red" size="4pt">
						</c:if>
						${status.count}등
						<c:if test="${status.count eq 1}">
						</font>
						</c:if>
						<c:if test="${status.count eq 2}">
						</font>
						</c:if>
						<c:if test="${status.count eq 3}">
						</font>
						</c:if>
						</li>
						<li>성함: ${item.cname }</li>
						<li>판매대수: ${item.cnt }</li>
						<li><input type="button" id="btn-btn" value="판매자 매물 보기"  onclick="location.href='mainList.ca?whatColumn=cid&keyword=${item.cid}'"></li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="cart__mainbtns">
		<button class="cart__bigorderbtn left" onClick="goShop()">전체 매물 보러가기</button>
	</div>

</body>
</html>

<%@ include file="../member/bottom2.jsp" %>