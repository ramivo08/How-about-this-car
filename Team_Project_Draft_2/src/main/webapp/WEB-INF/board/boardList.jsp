<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/common/common.jsp" %>

<style>
	#table-event{
    	 border-top: solid 1.5px black;
 		 border-collapse: collapse;
 		 width: 1000;
 		 font-size: 14px;
 		 border: 1;
 		 border-left: none;
 		 border-right: none;
	}
	
	#tr-in, #td-in,#th-in{
	text-align:center;
	 padding: 15px 0px;
 	 border-bottom: 1px solid lightgrey;
		
	}
	
	.btn-btn-insert{
	  background-color: #ED0000; /* 빨간색 */
	  color: white;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
	}
	
	#whatColumn-text, #keyword-text{
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
	}	
	
	
	#btn-sch{
		background-color: white;
	 	border: 1px lightgray solid;
	 	border-radius: 5px;
	    padding: 4px 8px;
	    font-size: 13px;
  		margin-top: 5px;
	}
	
	#btn-sch:hover{
	background-color: EAEAEA;
	}
	
	#table-sc{
		width: 1000;
	}
		
	ul {
	text-align:center;
	}
	ul li {
		display:inline;
		vertical-align:middle;
	}
	ul li #page-st {
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
	ul li #page-st.now {
		color:#fff;
		background-color:#ED0000;
		border:1px solid #ED0000;
	}
	ul li #page-st:hover, ul li #page-st:focus {
		color:#fff;
		border:1px solid #ED0000;
		background-color:#ED0000;
	}
	
	#td-td-sc {
	  vertical-align : bottom;
	}
		
	
</style>

<jsp:include page="/WEB-INF/member/top.jsp"/>
<center>
<br>
<h1>공지사항 & Event</h1>

<form action="list.bd" method="get">
<table id="table-sc">
	<tr>
		<td id="td-td-sc" align="left"><font size="2" >글목록 (전체 글 : ${totalCount })</font></td>
		<td align="right">
			<select name="whatColumn" id="whatColumn-text" style="cursor: pointer;">
				<option value="">전체검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="keyword" id="keyword-text">
			<input type="submit" value="검색" id="btn-sch" style="cursor: pointer;">
			
		<c:if test="${loginInfo.id eq 'admin'}">
		<button type="button" class="btn-btn-insert" style="cursor: pointer;" onclick="location.href='write.bd'"> 글등록</button>
		</c:if>
		</td>
	</tr>
</table>
</form> 

<table id="table-event" border="1">
	<tr id="tr-in">
		<th id="th-in" align="center" width="70">번호</th>
		<th id="th-in" align="center">제목</th>
		<th id="th-in" align="center">작성자</th>
		<th id="th-in" align="center" width="130">등록일</th>
	</tr>
	
	<c:forEach var="bd" items="${lists}">
	<tr id="tr-in">
		<td id="td-in" align="center">${bd.bnum }</td>
		<td id="td-in" align="center">
		<a href="detail.bd?bnum=${bd.bnum }&pageNumber=${pageInfo.pageNumber}"> [${bd.cgview }] ${bd.title }</a></td>
		<td id="td-in" align="center">관리자</td>
		<td id="td-in" align="center">&nbsp;<fmt:formatDate value="${bd.inputdate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	</c:forEach>
	
</table>



	<ul><li>${pageInfo.pagingHtml }</li></ul>

</center>
<%@ include file="../member/bottom2.jsp" %>

