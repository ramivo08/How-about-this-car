<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../member/top.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">

	function authority(id,pageNumber,authority){
		if(authority == 0){
		location.href="authority.mem?id="+id+"&pageNumber="+pageNumber;
		}else if(authority == 1){
			alert("최대 권한입니다.");
			return;
		}
	}
	
	function requestList(){
		location.href="requestList.ra";
	}
	
	
	function init(result){
		if(result > 0){
			var a = confirm("새로운 권한 요청이 "+result+"개 있습니다.\n확인 시, 요청 목록으로 이동");
			if(a){
					location.href="requestList.ra";
			}else{
			}
		}
	}
	function goInsertCategory(){
		location.href="insertCate.cate";
	}
	function goCategory(){
		location.href="list.cate";
	}

</script>


<style>

	#table-sc{
	width:1000;
	}
	 #table-main{
	 	width: 1000;
	 	height: 300;
	 	border-top: 1px solid #4C4C4C;
	 }
	 #table-tt{
		 text-align: center:
	 }

 
	 thead tr{
	 	background-color: #747474;
	 	color: #fff;
	 }
	 tr:nth-child(2n){
	 	background-color: #fff;
	 }
	 tr:nth-child(2n+1){
	 	background-color: #F9F9F9;
	 }
 
	td, th {
	  text-align : center;
	  vertical-align : middle;
	}
	 
 	#btn-btn{
		background-color: white;
	 	border: 1px lightgray solid;
	 	border-radius: 5px;
	    padding: 4px 8px;
	    font-size: 14px;
  		margin-top: 5px;
	}
	#btn-btn:hover {
		background-color: #ED0000;
		color: white;
	}
	a {
	  text-decoration: none;
	}
	#font-bt:hover {
		color: #ED0000;
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

.listForm{
padding-bottom: 10px;
}
</style>


<center>
<body onLoad="init('${result}')">
<br>
<h1>회원 리스트 (회원수: ${totalCount })</h1>

<br>
<form name="f" class="listForm">
	<table id="table-sc">
		<tr bgcolor="#fff" style="background-color: #fff">
			<td bgcolor="#fff" style="float:left;">
				<select name="whatColumn" id="whatColumn-text" style="cursor: pointer;">
					<option value="id">아이디
					<option value="name">이름
				</select>
				<input type="text" name="keyword" id="keyword-text">
				<input type="submit" value="검색" id="btn-sch" style="cursor: pointer;">
			</td>
			<td bgcolor="#fff" width="223"></td>
			<td align="right" bgcolor="#fff"  style="float:right;">
				<input id="btn-btn-list" type="button" onclick="goCategory()" value="카테고리 목록" style="cursor: pointer;">
				<input id="btn-btn-list" type="button" onclick="goInsertCategory()" value="카테고리 추가" style="cursor: pointer;">
				<input id="btn-btn-sub" type="button" onclick="requestList()" value="권한 요청 목록" style="cursor: pointer;">
			</td>
		</tr>	
	</table>
</form>

<table id="table-main" >
	<thead>
		<tr id="table-tt tr-in" style="background-color: #747474; border-color: 1px solid #fff;" height="50">
			<th id="table-tt th-in" align="center" width="90">회원번호</th>
			<th id="table-tt th-in" align="center" width="110">ID</th>
			<th id="table-tt th-in" align="center" width="110">이름</th>
			<th id="table-tt th-in" align="center" width="110">비번</th>
			<th id="table-tt th-in" align="center" width="60">성별</th>
			<th id="table-tt th-in" align="center">판매자 회사</th>
			<th id="table-tt th-in" align="center" width="60">판매자 권한</th>
			<th id="table-tt th-in" align="center" width="100">권한여부(O/X)</th>			
			<th id="table-tt th-in" align="center" width="60">삭제</th>
			<th id="table-tt th-in" align="center"width="90">상세보기</th>
		</tr>
	</thead>
	
	<c:forEach var="mem" items="${lists}">
			<tr id="table-tt tr-in tr-col">
				<td id="table-tt td-in" align="center">${mem.num }</td>
				<td id="table-tt td-in" align="center">${mem.id }</td>
				<td id="table-tt td-in" align="center">${mem.name }</td>
				<td id="table-tt td-in" align="center">${mem.pw }</td>
				<td id="table-tt td-in" align="center">${mem.gender }</td>
				<td id="table-tt td-in" align="center">${mem.company }</td>
				<td id="table-tt td-in" align="center">
				<form action="authority2.mem?id=${mem.id}&pageNumber=${pageInfo.pageNumber}&authority=${mem.authority}" method="post">
				<input id="btn-btn" type="button" style="cursor: pointer;" value="권한" onclick="authority('${mem.id}','${pageInfo.pageNumber}','${mem.authority }')">
				<input id="btn-btn" type="submit" style="cursor: pointer;" value ="취소"></form>
				</td>
				<td id="table-tt td-in" align=center>
				<c:if test="${mem.authority eq 0}">X</c:if>
				<c:if test="${mem.authority eq 1}">O</c:if>
				</td>
				<td id="table-tt td-in" align="center"><a href="delete.mem?num=${mem.num}&pageNumber=${pageInfo.pageNumber}" style="cursor: pointer;"><font id="font-bt" color="#353535">삭제</font></a></td>
				<td id="table-tt td-in" align="center"><a href="detail.mem?num=${mem.num }&pageNumber=${page.pageNumber}" style="cursor: pointer;"><font id="font-bt" color="#353535">상세보기</font></a></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
	<ul><li>${pageInfo.pagingHtml }</li></ul>
</center>
 <%@ include file="../member/bottom2.jsp" %>