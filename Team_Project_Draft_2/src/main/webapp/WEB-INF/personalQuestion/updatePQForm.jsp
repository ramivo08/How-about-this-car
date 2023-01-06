<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/top.jsp" %>

<style>
#updateForm{
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
}
#detailView{
  width: 80px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 35%;
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
text-align: center;
}
</style>
<div class="title"><h2>문의 수정</h2></div>
<div id="updateForm" align="center">
	<form action="updatePQ.pq" method="post">
		<table>
			<tr>
			    <td colspan=2>문의 상품 : ${pqbean.carInfo }
			    <input type="hidden" name="pnum" value="${pqbean.pnum}">
			    </td>
	  		</tr>
	 		<tr>
			    <td>문의글 제목&nbsp;&nbsp;&nbsp; <input type="text" name="ptitle" value="${pqbean.ptitle }"></td>
			    <td>구매자명 :     ${loginInfo.name}
	   
			    </td>
	  		</tr>
		 	<tr>
		   		<td colspan=2>
		    	<textarea rows="10" cols="80" placeholder="내용을 입력하세요" style="resize:none" name="pcontents">${pqbean.pcontents}</textarea>
		    	</td>
		  	</tr>
	  		<tr>
	    		<td colspan=2 align=center>
			    <input type="submit" value="수정하기" id="cart__list__orderbtn"> 
			    </td>
		 	</tr>
		</table>
	</form>
</div>
<%@ include file="../member/bottom.jsp" %>