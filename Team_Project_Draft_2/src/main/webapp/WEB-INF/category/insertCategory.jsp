<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

<style>
#cart__list__orderbtn{ 
background-color: #ED0000; /* 빨간색 */
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 14px;
  margin-top: 5px;
  width:50px;
  height:30px;
}
.input_text{
width:200px;
height:30px;
background:url('input_bg.jpg') no-repeat;
border:1;
padding:15px;
font-size:16px;
color:#aaa;
      }
input[type=text]{
 vertical-align:middle;
 float:right;
 }
 table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 15%;
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
.title{
text-align: center;
}
</style>
<jsp:include page="/WEB-INF/member/top.jsp"/>
<div class="title"><h3>카테고리 등록</h3></div>
<div class="cateListAllContainer" align="center">
	<form action="insertCate.cate" method="post">
	<table>
	<tr>
	<td>
		<p><label for="company">제조사 :&nbsp;&nbsp;&nbsp;</label><input type="text" id="company" class="input_text" name="company"></p>
		</td>
		</tr>
		<tr>
	<td>
		<p><label for="model">모델 :&nbsp;&nbsp;&nbsp;</label><input type="text" id="model" class="input_text" name="model"></p>
		 </td>
		</tr>
		<tr>
		<td align=center>
		 <input  id="cart__list__orderbtn"  type="submit"	value="추가">
		 <input  id="cart__list__orderbtn"  type="button"	value="뒤로" onclick="window.history.go(-1);">
		 </td>
		</tr>
		 
</table>
	</form>

</div>
<%@ include file="../member/bottom2.jsp" %>