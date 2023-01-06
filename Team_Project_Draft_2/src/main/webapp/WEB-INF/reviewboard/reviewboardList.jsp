<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<title>이차어때 후기</title>
<!-- reviewboardList.jsp -->
	
<script type="text/javascript">
	
	function insert(){
		location.href = "reinsert.reb";
	}


</script>

<style>
	#main-table{
		width: 1000;
		
	}
	
	#table-review{
		width: 1000;
		height: 310;
		border-collapse: collapse;
  		/* overflow: hidden; */
  		border-radius: 8px;
  		background-color: #fff;
  		padding: 1.5rem;
  		position: relative;
  		margin-bottom: 2rem;
  		display: flex;
    	justify-content: space-between;
    	box-shadow: 3px 3px 5px #A6A6A6;
    	
	}
	
	#tr-in, #td-in{
		border:none;
		
	}
	
	.td-in-star{
		width: 600;
	}
	
	#td-in{
		padding: 30,0,0,0;
	}
	
	#btn-btn{
		background-color: white;
	 	border: 1px lightgray solid;
	 	border-radius: 5px;
	    padding: 4px 8px;
	    font-size: 14px;
  		margin-top: 5px;
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
	
	.carname-Label{
		background-color: #EAEAEA;
		padding: 0.5rem 1rem;
		border-radius: 10px;
		border-top-right-radius: 3px;
		border-bottom-left-radius: 3px;
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
	
	#whatColumn-text, #keyword-text{
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
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
	
	
</style>

<%-- <%@ include file="../member/top.jsp" %> --%>
<jsp:include page="/WEB-INF/member/top.jsp"/>

<center>
	<br>
	
	<h1>구매 후기 게시판</h1>
	<form>
	<table id="main-table">
		<c:if test="${fn:length(lists) == 0 }">
		<tr id="tr-in">
			<td id="td-in"colspan="3" align="center"><h4>작성된 후기가 없습니다.</h4></td>
		<tr>
		</c:if>
		
		<tr id="tr-in" height="30"> <!-- 글쓰기 -->
			<td id="td-in">
				<select name="whatColumn" id="whatColumn-text" style="cursor: pointer;">
				<option value="">전체검색</option>
				<option value="rtitle">제목</option>
				<option value="rname">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword-text">
				<input type="submit" value="검색" id="btn-sch" style="cursor: pointer;">
				<br><br>
			</td>
			<td id="td-in" colspan="2" align="right">
				<c:if test="${loginInfo != null }">
				<input type="button" value="후기작성" onClick="insert()" class="btn-btn-insert" style="cursor: pointer;">
				</c:if>
				<br><br>
			</td>
		<tr>
		
	<c:forEach var="reb" items="${lists}">
	<table id="table-review" border="1"> 
		<tr id="tr-in">
			<td id="td-in" class="td-in-num">${reb.rnum }</td><!-- 번호 -->
			<!-- <td>별점:</td>-->
			<c:if test="${reb.asterion == null }">
			<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">☆☆☆☆☆</font></td> 				
			</c:if>
			<c:if test="${reb.asterion == '1' }">
				<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">★☆☆☆☆</font></td>				
			</c:if>
			<c:if test="${reb.asterion == '2' }">
				<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">★★☆☆☆</font></td> 					
			</c:if>
			<c:if test="${reb.asterion == '3' }">
				<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">★★★☆☆</font></td> 				
			</c:if>
			<c:if test="${reb.asterion == '4' }">
				<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">★★★★☆</font></td> 					
			</c:if>
			<c:if test="${reb.asterion == '5' }">
				<td id="td-in" class="td-in-star" align="right"><font size="2">별점 :</font><font color="#FAD400">★★★★★</font></td> 				
			</c:if>
		</tr>
		<tr id="tr-in">
			<td id="td-in" class="image-in" rowspan="3" width="300" height="180" align="center"> <!-- 이미지 -->
				<c:if test="${reb.rimage != null }">
				<img src="<%=application.getContextPath()%>/resources/img/${reb.rimage}" height=200 width=250 >
				</c:if>
				<c:if test="${reb.rimage == null }">
				</c:if>
			</td><!-- 이미지 -->
			<td id="td-in" height="45" width="150"><label class="carname-Label"><font size="4" style="font-weight: bold; ">${reb.carname }</font></label></td><!-- 상품명 -->
		</tr>
		<tr id="tr-in">
			<td id="td-in"><font size="2" >${reb.rname }(${reb.rid })</font>
			<input type="hidden" name="rname" value="${reb.rname}">
			<input type="hidden" name="rid" value="${reb.rid}">
			</td><!-- 작성자(아이디) -->
		</tr>
		<tr id="tr-in">
			<td id="td-in"><textarea rows="4" cols="90" style="resize:none; border: none; background-color: transparent;" readonly="readonly" >${reb.rcontents }</textarea></td><!-- 내용 -->
		</tr>
		<tr id="tr-in">
			<td colspan="2" id="td-in"><font size="2" color="#4C4C4C"><fmt:formatDate value="${reb.r_day }" pattern="yyyy-MM-dd"/></font><!-- 작성일 -->
				<c:if test="${loginInfo.id eq reb.rid }">
				<input id="btn-btn" style="float: right; cursor: pointer;" type="button" value="수정" onClick="location.href='update.reb?rnum=${reb.rnum}&pageNumber=${pageInfo.pageNumber }'">
				</c:if>
				<c:if test="${loginInfo.id == reb.rid || loginInfo.id == 'admin'}">
				<input id="btn-btn" style="float: right; cursor: pointer;" type="button" value="삭제" onClick="location.href='delete.reb?rnum=${reb.rnum}&pageNumber=${pageInfo.pageNumber }'">
				</c:if>
			</td>
		</tr>
	</table>
	</c:forEach>
	</table>
	</form>
	
	<ul><li>${pageInfo.pagingHtml }</li></ul>
	
</center>

<%@ include file="../member/bottom2.jsp" %>