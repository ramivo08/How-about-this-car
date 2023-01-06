<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<jsp:include page="/WEB-INF/member/top.jsp"/>

<!-- reviewboardInsert.jsp  -->
<title>이차어때 후기수정</title>

<%-- <%@ include file="../member/top.jsp" %> --%>

<style type="text/css" >
	
	.asterion-star {
	  /* border:solid 1px #ccc; */
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:13pt;
	  justify-content:space-around;
	  padding:0.2em;
	  text-align:center;
	  width:5em;
	}
	
	.asterion-star input {
	  display:none;
	}
	
	.asterion-star label {
	  color:#ccc;
	  cursor:pointer;
	}
	
	.asterion-star :checked ~ label {
	  color:#FFCC00;
	}
	
	.asterion-star label:hover,
	.asterion-star label:hover ~ label {
	  color:#FAED7D;
	}
	
	.err{
		color:red;
		font-size:9pt;
		font-weight:bold;
	}
	
	#table-main{
		width: 700;
		height: 400;
		border: 1px solid #D5D5D5;
	    border-collapse: collapse;
	    border-left: none;
	    border-right: none;
	    font-size: 14px;
	}
	
	#td-fff{
		background-color: #EAEAEA;
		border-bottom-color: #fff;
		font-size: 13px;
		width: 150;
	}
	
	#btn-btn-re{
	background-color: white;
 	border: 1px lightgray solid;
 	border-radius: 5px;
    padding: 4px 8px;
    font-size: 16px;
  	margin-top: 5px;
	}
	
	#btn-btn-sub{ 
	  background-color: #ED0000; /* 빨간색 */
	  color: white;
	  border: none;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
	}
	
	#btn-btn-list{ 
	  background-color: #EAEAEA;
	  border: 1px lightgray solid;
	  border-radius: 5px;
	  padding: 4px 8px;
	  font-size: 16px;
	  margin-top: 5px;
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
	
	#whatColumn-text, #text-td {
		background-color: white;
		border: 1px lightgray solid;
		border-radius: 5px;
		padding: 4px 8px;
		font-size: 13px;
  		margin-top: 5px;
  		width: 250;
	}
	
	#rcontents{
		background-color: white;
		border: 1px lightgray solid;
	}
	
</style>

<center>
	<br>
	<h3>구매 후기 수정</h3>
	<br>
	
<form:form commandName="rebbean" method="post" action="update.reb?pageNumber=${pageNumber}" enctype="multipart/form-data">
	<input type="hidden" name="rnum" value="${rebbean.rnum}">
	<input type="hidden" name="originalImg" value="${rebbean.rimage }">
	
	<table ><!-- width="40%" height="60%" -->
		<tr>
			<td id="td-fff" align="center">매물</td>
			<td>
			<select name="carname" id="whatColumn-text" style="cursor: pointer;" required>
				<option value="">매물선택</option>
				<c:forEach var="cn" items="${cnumList }">
				<option value="${cn }" <c:if test="${cn == rebbean.carname }">selected</c:if>>${cn }</option>
				</c:forEach>
			</select>
			</td>
			
			<td id="td-fff" align="center" >별점선택</td>
			<td class="form-control" id="floatingInput">	
				<div class="asterion-star">
				  <input type="radio" id="5-stars" name="asterion" value="5" <c:if test="${5 eq rebbean.asterion }">checked</c:if>>
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="4-stars" name="asterion" value="4" <c:if test="${4 eq rebbean.asterion }">checked</c:if>>
				  <label for="4-stars" class="star">&#9733;</label>
				  <input type="radio" id="3-stars" name="asterion" value="3" <c:if test="${3 eq rebbean.asterion }">checked</c:if>>
				  <label for="3-stars" class="star">&#9733;</label>
				  <input type="radio" id="2-stars" name="asterion" value="2" <c:if test="${2 eq rebbean.asterion }">checked</c:if>>
				  <label for="2-stars" class="star">&#9733;</label>
				  <input type="radio" id="1-star" name="asterion" value="1" <c:if test="${1 eq rebbean.asterion }">checked</c:if>>
				  <label for="1-star" class="star">&#9733;</label>
				</div>
			</td>
			
		</tr>
		
		<tr>
			<td id="td-fff" align="center">제목</td>
			<td colspan="3">
			<input id="text-td" type="text" name="rtitle" class="rtitle" value="${rebbean.rtitle }" required>
			<form:errors class="err" path="rtitle" />
			</td>
		</tr>
		
		<tr>
			<td id="td-fff" align="center">작성자</td>
			<td colspan="3"><input id="text-td" type="text" name="rname" value="${rebbean.rname}" readonly></td>
		</tr>
			
		<tr>
			<td id="td-fff" align="center">내용</td>
			<td colspan="3">
				<textarea name="rcontents" rows="10" cols="85" class="rcontents"  id="rcontents" style="resize:none;" required>${rebbean.rcontents }</textarea>
				<form:errors class="err" path="rcontents" />
			</td>
		</tr>
		
		<tr>
			<td id="td-fff" align="center">이미지</td>
			<td colspan="3">
				<input type="file" name="upload" id="upload" value="${rebbean.upload }">
				<c:if test="${rebbean.rimage!=null }">
					<img id="im_check" src="<%=request.getContextPath() %>/resources/img/${rebbean.rimage}" width=150 height=80 >
				</c:if>
				<c:if test='${rebbean.rimage==null}'>
					이미지 없음<br>
				</c:if>
			</td>
		</tr>
	
		<tr>
			<td id="td-fff" align="center">비밀번호</td>
			<td colspan="3">
				<input id="text-td"  type="password" name="repw" placeholder="비밀번호 입력해주세요" required>
				<form:errors class="err" path="repw" />
			</td>
		</tr>
		
	</table>
	<br>
				<input id="btn-btn-re" type="reset" value="다시작성" style="cursor: pointer;">
				<input id="btn-btn-sub" type="submit" value="글수정" onclick="update()" style="cursor: pointer;">
				<input id="btn-btn-list" type="button" value="목록보기" onClick="location.href='list.reb'" style="cursor: pointer;">
	<br><br>
</form:form>
<br><br><br>
</center>
	
<%@ include file="../member/bottom2.jsp" %>