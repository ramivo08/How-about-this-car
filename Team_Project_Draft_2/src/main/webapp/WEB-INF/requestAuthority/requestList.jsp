<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp" %>
<style>
#requestList{
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
    padding-left: 200px;
    padding-right: 200px;
}
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

a.com-link:hover {
    text-decoration: underline;
}

img {
  display: block;
  width: 90%;
  height: 80px;
  margin: auto;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 15px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}
#cart__list__orderbtn{ 
background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}
.title{
padding-left : 200px;
}

</style>

<script>
function authority(){
		location.href="list.mem";

	}

</script>
<div><h1 class="title">권한 요청 목록</h1></div>
<div id="requestList" align=center>

	<table>
		<tr align="center">
			<th align="center">ID</th>
			<th align="center">대표자명</th>
			<th align="center">사업자명</th>
			<th align="center">구분</th>
			<th align="center">사업자 등록 번호</th>
			<th align="center">권한부여하기</th>	
			<th align="center">상세보기</th>
			
		</tr>
		<c:if test="${fn:length(lists)==0}">
		<tr align="center">
		<td colspan="7" align=center>
		<font color=red>권한 요청한 목록이 없습니다.</font>
		</td>
		</tr>
		</c:if>
	<c:forEach var="ralist" items="${lists}">
			<tr align="center">
				<td align="center">${ralist.id }</td>
				<td align="center">${ralist.name }</td>
				<td align="center">${ralist.company }</td>
				<td align="center">${ralist.kind}</td>
				<td align="center">${ralist.registrationno}</td>
				<td align="center"><input type="button" id="cart__list__orderbtn" value="권한 부여" onclick="authority()"></td>

				<td align="center"><a href="detail.ra?id=${ralist.id}">상세보기</a></td>
			
			</tr>
		</c:forEach>
	</table>
<input  id="cart__list__orderbtn"  type="button" value="목록보기" onclick="location.href='list.mem'">

</div>


<%@ include file="../member/bottom.jsp" %>