<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>


<style type="text/css">

	#table-main{
		margin:auto;
		}

	
	#btn-delete{
	  background-color: #ED0000; /* 빨간색 */
	  color: white;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
	}
	
	#btn-list{
		background-color: white;
	 	border: 1px lightgray solid;
	 	border-radius: 5px;
	    padding: 4px 8px;
	  font-size: 16px;
  		margin-top: 5px;
	}
	
	
	#hr-delete{
    border: none;
    border-top: 1px solid #A6A6A6;
    overflow: visible;
    text-align: center;
    margin-top: 24px;
    height: 2px;
	}
	
	#text-td {
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
  		width: 250;
	}
</style>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<center>
<br>
	<h2>글 삭제</h2>
	
	<form method="post" action="delete.reb">
	<input type="hidden" name="rnum" value="${rnum }">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
		<table id="table-main" width="500">
			<tr align="center">
				<td><br>
				<hr id="hr-delete">
					<div><b>삭제하실 글의 비밀번호를 입력하세요.</b></div>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<br>
					<input id="text-td" type="password" name="repw" placeholder="비밀번호 입력">
					<br><br>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<br>
						<input type="submit" value="글삭제" id="btn-delete" style="cursor: pointer;">
						<input type="button" value="글목록" id="btn-list" onClick="location.href='list.reb?pageNumber=${pageNumber}'" style="cursor: pointer;">
					<br>
					<hr id="hr-delete">
				</td>
			</tr>
		</table>
	</form>
<br>
<br>
<br>
<br>

</center>

<%@ include file="../member/bottom2.jsp" %>
