<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	#table-scmain{
		border-spacing: 10px;
  		border-collapse: separate;
	}
</style>

<center>
<br><br>
<h1>고객 지원 서비스</h1>
<font>안녕하세요. 이 차 어때? 고객센터 입니다.<br>무엇을 도와드릴까요?</font>
<br><br><br>
<table id="table-scmain">
	<tr>
	 <td><a href="list.fq"><img alt="자주하는 질문" src="<%=application.getContextPath()%>/resources/img/service_img/service_img1.png" height=200 width=190"></a></td>
	 <td><a href="#"><img alt="자주하는 질문" src="<%=application.getContextPath()%>/resources/img/service_img/service_img2.png" height=200 width=190"></a> </td>
	 <td><a href="#"><img alt="자주하는 질문" src="<%=application.getContextPath()%>/resources/img/service_img/service_img3.png" height=200 width=190"></a> </td>
	 <td><a href="#"><img alt="자주하는 질문" src="<%=application.getContextPath()%>/resources/img/service_img/service_img4.png" height=200 width=190"></a> </td>
	 <td><a href="#"><img alt="자주하는 질문" src="<%=application.getContextPath()%>/resources/img/service_img/service_img5.png" height=200 width=190"></a> </td>
	</tr>
	
</table>
<br><br>
<font size="3" color="#4C4C4C">궁금한 사항은 이 차 어때? 고객센터(1588-####)로 문의해주세요.</font>
</center>