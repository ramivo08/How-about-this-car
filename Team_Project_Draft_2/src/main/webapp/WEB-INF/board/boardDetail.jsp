<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script type="text/javascript">
	
	function boarddelete() {
		if(confirm("글을 삭제 하시겠습니까?")){			
		location.href='delete.bd?bnum='+${bd.bnum}+'&pageNumber='+${pageNumber};
		}
		
	}
</script>

<style>

	#table-main{
		width: 900;
		border-top: 0.1rem solid #4C4C4C;

	}
	#td-first{
		border-bottom: 0.1rem solid #EAEAEA;
	}
	
	#btn-btn-re{
	background-color: white;
 	border: 1px lightgray solid;
 	border-radius: 5px;
    padding: 4px 8px;
    font-size: 14px;
  	margin-top: 5px;
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
	
	
</style>

<jsp:include page="/WEB-INF/member/top.jsp"/>
<center>
<br>
<h1>${bd.cgview }</h1>
<br>
<table id="table-main">
	<tr height="60">
		<td id="td-first" align="left" >&nbsp;&nbsp;${bd.bnum }&nbsp; ${bd.cgview }${bd.title}</td> <!-- 카테고리 / 제목 -->
		<!-- 작성자/작성일/조회수 -->
		<td id="td-first" align="right"><font color="#747474" size="2">&nbsp;관리자 | &nbsp;<fmt:formatDate value="${bd.inputdate }" pattern="yyyy-MM-dd"/> | &nbsp;조회수&nbsp;${bd.count }&nbsp;</font></td>
	</tr>
	
	<tr height="850">
		<td align="center" colspan="2">&nbsp; <!-- 이미지 -->
		<c:if test="${bd.image != null }">
			<img src="<%=request.getContextPath()%>/resources/${bd.image}" height=800 width=600 >
		</c:if>
		<c:if test="${bd.image == null }">
		 이미지 없음<br>
		</c:if>
		</td>
	</tr>
	
	<tr height="100">
		<td id="td-first" align="center" colspan="2">&nbsp;${bd.content}</td>
	</tr>
	
</table>
<br>
			<c:if test="${loginInfo.id eq 'admin'}">
				<input type="button" id="btn-btn-re" onclick="boarddelete()" value="글 삭제">
				<input type="button" id="btn-btn-list" onclick="location.href='update.bd?bnum=${bd.bnum}&pageNumber=${pageNumber}'" value="글 수정">
			</c:if>
			<input type="button" value="글목록" id="btn-btn-sub" onClick="location.href='list.bd?pageNumber=${pageNumber}'">	
<br>
</center>  
<%@ include file="../member/bottom2.jsp" %>
