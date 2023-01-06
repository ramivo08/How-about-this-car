<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<style>
#haha{

}
.layout {
   max-width: 400px;
   margin: 0 auto;
}

.fq {
   border-top: 0.1rem solid #353535;
   list-style: none;
   margin: 0;
   padding: 0;
   width: 600;
}

#fq-bot{
	
}

.fq>li {
   padding: 10px 0;
   box-sizing: border-box;
}

.fq>li:nth-child(n+2) { /* 아이템 구분 점선 */
   border-top: 1px dashed #aaa;
}

.fq input {
   display: none;
}

.fq label { /* 제목 - 클릭 영역 */
   font-weight: bold;
   color: #000;
   margin: 20px 0 0;
   cursor: pointer;
}

.fq label::before { /* 제목 앞 화살표 */
   display: block;
   content: "";
   width: 0;
   height: 0;
   border: 8px solid transparent;
   border-left: 8px solid #a00;
   margin: 2px 0 0 8px;
   float: left;
}

.fq input:checked+label::before { /* 내용 펼침 상태 제목 앞 화살표 */
   border: 8px solid transparent;
   border-top: 8px solid #a00;
   border-bottom: 0;
   margin: 8px 4px 0;
}

.fq div { /* 내용 영역 - 기본 감춤 상태 */
   display: none;
   color: #666;
   font-size: 0.9375em;
   overflow: hidden;
   padding: 10px 0 10px 30px;
   box-sizing: border-box;
   transition: max-height 0.4s;
}


.fq input:checked+label+div { /* 내용 영역 펼침 */
   display: block;
}
.delUp{
	margin-left: 910;
	
}

	#btn-btn-upd{ 
	  background-color: #ED0000; /* 빨간색 */
	  border: 1px #ED0000 solid;
	  color: white;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
	}
	
	#btn-btn-del{ 
	  background-color: #EAEAEA;
	  border: 1px lightgray solid;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 12px;
	  margin-top: 5px;
	}


	ul {
	text-align:center;
	list-style:none;
	}
	ul li {
		//display:inline;
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
	
	#sc-type{
		margin-left: 260;
		margin-right: 260;
	}
	
	#haha,#sc-type,.delUp{
		height: 55;
		
	}
	.hahaform{
	width:500px;
	text-align:center;
	margin:auto;
	}
</style>

<jsp:include page="/WEB-INF/member/top.jsp"/>   
<center>
<br>
   <h2>자주 묻는 질문</h2>
   <br>
</center>

<div id="haha">
   <div id="sc-type" style="position: positive; z-index: 2;">
   <form class="hahaform"action="list.fq" method="get">
      <select name="whatColumn" id="whatColumn-text" style="cursor: pointer;">
         <option value="">전체검색</option>
         <option value="ftitle">질문</option>
         <option value="fcontent">답글</option>
      </select> 
      <input type="text" name="keyword" id="keyword-text"> 
      <input type="submit" value="검색" id="btn-sch" style="cursor: pointer;">
         <c:if test="${loginInfo.id eq 'admin'}" >
      <input type="button" id="btn-btn-upd" style="float:right"
         onclick="location.href='write.fq'" value="추가하기">
   </c:if> 
   </form>
   </div>
<%-- 
	<div class="delUp" style="position: relative; left:272px; top: 80px; z-index: 1;">
   <c:if test="${loginInfo.id eq 'admin'}" >
      <button id="btn-btn-upd"
         onclick="location.href='write.fq'"><font size="2.5">추가하기</font></button>
   </c:if> 
   </div> --%>
</div>

<center>
   
   <div id="fq-bot">
         <ul class="fq">
      <c:forEach var="fq" items="${lists}" varStatus="status">
            <li><input type="checkbox" id="fq${status.count}">
               <label for="fq${status.count}">${fq.ftitle }
               
               </label>
               <div>
               <p>
               ${fq.fcontent }<br>
               <br>
            <c:if test="${loginInfo.id eq 'admin'}">
               <button id="btn-btn-del" onClick="location.href='delete.fq?fnum=${fq.fnum}&pageNumber=${pageNumber}'">삭제하기</button>
               <button id="btn-btn-upd" onClick="location.href='update.fq?fnum=${fq.fnum}&pageNumber=${pageNumber}'">수정하기</button>
                  </c:if> </p></div></li>
            </c:forEach>
         </ul>
   </div>
   
   <div>
  <br>
  <ul><li>${pageInfo.pagingHtml }</li></ul>
  </div>
</center>
<%@ include file="../member/bottom2.jsp" %>

<%--          
            <button type="button" class="btn btn-warning"
               onclick="location.href='delete.fq'">삭제하기</button>
            <button type="button" class="btn btn-warning"
               onclick="location.href='update.fq'">수정하기</button>
      
--%>