<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>


<!-- reviewboardInsert.jsp  -->
<title>이차어때 후기작성</title>

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
	
/* 	#table-main{
		width: 700;
		height: 400;
		border: 1px solid #fff;
	    border-collapse: collapse;
	    border-left: none;
	    border-right: none;
	    font-size: 14px;
	} */
	
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

<jsp:include page="/WEB-INF/member/top.jsp"/>

<center>
	<br>
	<h3>구매 후기 등록</h3>
	<br>

<form:form commandName="rebbean" method="post" action="reinsert.reb" enctype="multipart/form-data">
	<table id="table-main"><!-- width="40%" height="60%" -->
		<tr>
			<td id="td-fff" align="center">매물</td>
			<td>
			<select name="carname" id="whatColumn-text" style="cursor: pointer;" required >
				<option value="">매물선택</option>
				<c:forEach var="cn" items="${cnumList }">
				<option value="${cn}">${cn }</option>
				</c:forEach>
			</select>
			</td>
			
			<td id="td-fff" align="center" >별점선택</td>
			<td class="form-control" id="floatingInput">	
				<div class="asterion-star">
				  <input type="radio" id="5-stars" name="asterion" value="5"/>
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="4-stars" name="asterion" value="4"/>
				  <label for="4-stars" class="star">&#9733;</label>
				  <input type="radio" id="3-stars" name="asterion" value="3"/>
				  <label for="3-stars" class="star">&#9733;</label>
				  <input type="radio" id="2-stars" name="asterion" value="2"/>
				  <label for="2-stars" class="star">&#9733;</label>
				  <input type="radio" id="1-star" name="asterion" value="1"/>
				  <label for="1-star" class="star">&#9733;</label>
				</div>
			</td>
			
		</tr>
		
		<tr>
			<td id="td-fff" align="center">제목</td>
			<td colspan="3">
			<input type="text" name="rtitle" id="text-td" class="rtitle" placeholder="제목을 입력해주세요" required>
			<form:errors class="err" path="rtitle" />
			</td>
		</tr>
		
		<tr>
			<td id="td-fff" align="center">작성자</td>
			<td colspan="3">
			<input id="text-td" type="text" name="rname" placeholder="이름을 입력해주세요" required>&nbsp; [id : ${loginInfo.id }]
			<input id="text-td" type="hidden" name="rid"  value="${loginInfo.id }" readonly>
			</td>
		</tr>
			
		<tr>
			<td id="td-fff" align="center">내용</td>
			<td colspan="3">
				<textarea style="resize:none; background-color:transparent; " name="rcontents" rows="10" cols="85" id="rcontents" placeholder="내용을 입력해주세요" required></textarea>
				<form:errors class="err" path="rcontents" />
			</td>
		</tr>
		
		<tr>
			<td id="td-fff" align="center">이미지</td>
			<td colspan="3">
				<input id="im_check" type="file" name="upload" id="upload" value="파일선택"> <!-- 여기는 글자x 이미지o(화일)가 들어갑니다. -->
			</td>
		</tr>
	
		<tr>
			<td id="td-fff" align="center">비밀번호</td>
			<td colspan="3">
				<input id="text-td" type="password" name="repw" class="repw" id="repw" placeholder="비밀번호 입력해주세요" required>
				<form:errors class="err" path="repw" />
			</td>
		</tr>
		
	</table>
	<br>
				<input id="btn-btn-re" type="reset" value="다시작성" style="cursor: pointer;">
				<input id="btn-btn-sub" type="submit" value="글쓰기" style="cursor: pointer;">
				<input id="btn-btn-list" type="button" value="목록보기" onClick="location.href='list.reb'" style="cursor: pointer;">


</form:form>
	<br><br><br>
</center>

<%@ include file="../member/bottom2.jsp" %>