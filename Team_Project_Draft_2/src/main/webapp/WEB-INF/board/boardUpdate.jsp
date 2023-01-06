<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<style type="text/css">

	.err{
		color:red;
		font-size:9pt;
		font-weight:bold;
	}
	
	#th-fff{
		background-color: #EAEAEA;
		border-bottom-color: #fff;
		font-size: 13px;
		width: 150;
		text-align: center;
	}

	input[type=file]::file-selector-button {
	  width: 150px;
	  height: 30px;
	  background: #fff;
	  border: 1px solid rgb(77,77,77);
	  border-radius: 10px;
	  cursor: pointer;
	}
	input[type=file]::file-selector-button:hover {
	  background: rgb(77,77,77);
	  color: #fff;
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
	  color: white;
	  border: none;
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
	
	#whatColumn-text, #text-td {
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
  		width: 250;
  		height: 32;
	}
	
	#contents{
		background-color: white;
		border: 1px lightgray solid;
	}
	
	#table-main{
		border-top-style: 1px solid #353535;
	}
	
</style> 
<jsp:include page="/WEB-INF/member/top.jsp"/>
<center>
<h1>글 수정</h1>
<form:form commandName="bd" method="post" action="update.bd" enctype="multipart/form-data">
	<input type="hidden" name="bnum" value="${bd.bnum }">
	<table id="table-main">
		<tr>
			<th id="th-fff">제목</th>
			<td>
			<input id="text-td" type="text" name="title" value="${bd.title }">
			<form:errors class="err" path="title"/>
			</td>
		</tr>
		
		<tr>
			<th id="th-fff">작성자</th>
			<td>관리자</td>
		</tr>
		
		<tr>
			<th id="th-fff">카테고리</th>
			<td>
				<select name = "cgview" id="whatColumn-text" style="cursor: pointer; width: 140;" required>
				<option value="">카테고리 선택</option> 
				<option value="공지사항" <c:if test="${bd.cgview == '공지사항' }">selected</c:if>>공지사항</option> 
				<option value="Event" <c:if test="${bd.cgview == 'Event' }">selected</c:if>>Event</option> 
			</select>
			<form:errors class="err" path="cgview"/>
			</td>
		</tr>
		
		<tr>
			<th id="th-fff">이미지</th>
			<td>
			<input id="im_check" type="file" name="upload" id="upload" value="${bd.image }">
			</td>
		</tr>
		
		<tr>
			<th id="th-fff">내용</th>
			<td>
			<textarea id="contents" style="resize:none;" name="content" rows="15" cols="80" required>${bd.content }</textarea>
			<form:errors class="err" path="content"/>
			</td>
		</tr>
		
	</table>
	
		<input id="btn-btn-re" type="reset" value="다시작성" style="cursor: pointer;">
		<input id="btn-btn-sub" type="submit" value="글수정" style="cursor: pointer;">
		<input id="btn-btn-list" type="button" value="글목록" onClick="location.href='list.bd?pageNumber=${pageNumber}'" style="cursor: pointer;">

</form:form>
</center>
<%@ include file="../member/bottom2.jsp" %>