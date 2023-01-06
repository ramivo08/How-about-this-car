<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<style type="text/css">

	#table-main{
		width:700;
		height: 150;
		margin:auto;
		border: 1px solid #EAEAEA;
		border-top: 0.1rem solid #353535;
		border-left: none;
		border-right: none;
		}
		
	.err{
		color:red;
		font-size:9pt;
		font-weight:bold;
		}
		
	input[type=text]{
		width : 100%
	}
	
	#th-font{
		font-size: 25;
	}

	#btn-btn-sub{ 
	  background-color: #ED0000; /* 빨간색 */
	  border: 1px #ED0000 solid;
	  color: white;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 14px;
	  margin-top: 5px;
	}
	
	#btn-btn-list{ 
	  background-color: #EAEAEA;
	  border: 1px lightgray solid;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 14px;
	  margin-top: 5px;
	}	
	
	#text-td {
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
  		height: 40;
	}	
	
</style> 
<jsp:include page="/WEB-INF/member/top.jsp"/>
<center>

<br>
<h1> FAQ 수정</h1>
<br>

<form:form commandName="fq" method="post" action="update.fq">
	<table id="table-main">
		<tr>
			<th id="th-font">Q. </th>
			<td>
			<input type="hidden" name="fnum" value="${fq.fnum}">
			<input id="text-td" type="text" name="ftitle" value="${fq.ftitle}">
			<form:errors class="err" path="ftitle"/>
			</td>
		</tr>
		<tr>
			<th id="th-font">A. </th>
			<td>
			<input id="text-td" type="text" name="fcontent" value="${fq.fcontent }">
			<form:errors class="err" path="ftitle"/>
			</td>
		</tr>
	</table>
<br>
		<input type="submit" value="수정하기" id="btn-btn-sub" style="cursor: pointer;">
		<input type="button" id="btn-btn-list" value="목록보기" onClick="location.href='list.fq'" style="cursor: pointer;">
<br>
</form:form>
</center>
<%@ include file="../member/bottom2.jsp" %>