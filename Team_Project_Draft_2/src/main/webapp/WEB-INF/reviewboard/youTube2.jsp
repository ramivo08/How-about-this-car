<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<jsp:include page="/WEB-INF/member/top.jsp"/>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${path}/resources/js/jquery.js"></script>
<script language="javascript">


/* function new(){
 	window.open("test.asp","new", 
	"width=300, height=200, left=30, top=30, 
	scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
} */

/* 1 */
	$(function(){
		  
	    var embed = $('.youtube');
	    $('.video').empty();
	    /* click 'PLAY'  button */
	    $('.pop_open').click( function() {
	      $('.gray_mask').show();
	      $('#popup').show();
	      $('.video').append(embed);
	    });
	  /* click 'CLOSE' button */
	  $('.gray_mask, .close').click( function() {
	    $('#popup').hide();
	    $('.gray_mask').hide();
	    $('.video').empty(); 
	  }); 
	  
	  /* click 'popu background' */
	  $('.gray_mask, .close').click( function() {
	    $('#popup').hide();
	    $('.gray_mask').hide();
	    $('.video').empty(); 
	  }); 
	  
	});
	
/* 2 */
	$(function(){
	    var embed = $('.youtube1');
	    $('.video').empty();
	    
	    $('.pop_open1').click( function() {
	      $('.gray_mas1').show();
	      $('#popup1').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas1, .close').click( function() {
	    $('#popup1').hide();
	    $('.gray_mas1').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas1, .close').click( function() {
	    $('#popup1').hide();
	    $('.gray_mas1').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 3 */
	$(function(){
	    var embed = $('.youtube2');
	    $('.video').empty();
	    
	    $('.pop_open2').click( function() {
	      $('.gray_mas2').show();
	      $('#popup2').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas2, .close').click( function() {
	    $('#popup2').hide();
	    $('.gray_mas2').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas2, .close').click( function() {
	    $('#popup2').hide();
	    $('.gray_mas2').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 4 */
	$(function(){
	    var embed = $('.youtube3');
	    $('.video').empty();
	    
	    $('.pop_open3').click( function() {
	      $('.gray_mas3').show();
	      $('#popup3').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas3, .close').click( function() {
	    $('#popup3').hide();
	    $('.gray_mas3').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas3, .close').click( function() {
	    $('#popup3').hide();
	    $('.gray_mas3').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 5 */
	$(function(){
	    var embed = $('.youtube4');
	    $('.video').empty();
	    
	    $('.pop_open4').click( function() {
	      $('.gray_mas4').show();
	      $('#popup4').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas4, .close').click( function() {
	    $('#popup4').hide();
	    $('.gray_mas4').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas4, .close').click( function() {
	    $('#popup4').hide();
	    $('.gray_mas4').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 6 */
	$(function(){
	    var embed = $('.youtube5');
	    $('.video').empty();
	    
	    $('.pop_open5').click( function() {
	      $('.gray_mas5').show();
	      $('#popup5').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas5, .close').click( function() {
	    $('#popup5').hide();
	    $('.gray_mas5').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas5, .close').click( function() {
	    $('#popup5').hide();
	    $('.gray_mas5').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 7 */
	$(function(){
	    var embed = $('.youtube6');
	    $('.video').empty();
	    
	    $('.pop_open6').click( function() {
	      $('.gray_mas6').show();
	      $('#popup6').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas6, .close').click( function() {
	    $('#popup6').hide();
	    $('.gray_mas6').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas6, .close').click( function() {
	    $('#popup6').hide();
	    $('.gray_mas6').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 8 */
	$(function(){
	    var embed = $('.youtube7');
	    $('.video').empty();
	    
	    $('.pop_open7').click( function() {
	      $('.gray_mas7').show();
	      $('#popup7').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas7, .close').click( function() {
	    $('#popup7').hide();
	    $('.gray_mas7').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas7, .close').click( function() {
	    $('#popup7').hide();
	    $('.gray_mas7').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 9 */
	$(function(){
	    var embed = $('.youtube8');
	    $('.video').empty();
	    
	    $('.pop_open8').click( function() {
	      $('.gray_mas8').show();
	      $('#popup8').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas8, .close').click( function() {
	    $('#popup8').hide();
	    $('.gray_mas8').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas8, .close').click( function() {
	    $('#popup8').hide();
	    $('.gray_mas8').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 10 */
	$(function(){
	    var embed = $('.youtube9');
	    $('.video').empty();
	    
	    $('.pop_open9').click( function() {
	      $('.gray_mas9').show();
	      $('#popup9').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas9, .close').click( function() {
	    $('#popup9').hide();
	    $('.gray_mas9').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas9, .close').click( function() {
	    $('#popup9').hide();
	    $('.gray_mas9').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 11 */
	$(function(){
	    var embed = $('.youtube10');
	    $('.video').empty();
	    
	    $('.pop_open10').click( function() {
	      $('.gray_mas10').show();
	      $('#popup10').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas10, .close').click( function() {
	    $('#popup10').hide();
	    $('.gray_mas10').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas10, .close').click( function() {
	    $('#popup10').hide();
	    $('.gray_mas10').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 12 */
	$(function(){
	    var embed = $('.youtube11');
	    $('.video').empty();
	    
	    $('.pop_open11').click( function() {
	      $('.gray_mas11').show();
	      $('#popup11').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas11, .close').click( function() {
	    $('#popup11').hide();
	    $('.gray_mas11').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas11, .close').click( function() {
	    $('#popup11').hide();
	    $('.gray_mas11').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 13 */
	$(function(){
	    var embed = $('.youtube12');
	    $('.video').empty();
	    
	    $('.pop_open12').click( function() {
	      $('.gray_mas12').show();
	      $('#popup12').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas12, .close').click( function() {
	    $('#popup12').hide();
	    $('.gray_mas12').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas12, .close').click( function() {
	    $('#popup12').hide();
	    $('.gray_mas12').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 14 */
	$(function(){
	    var embed = $('.youtube13');
	    $('.video').empty();
	    
	    $('.pop_open13').click( function() {
	      $('.gray_mas13').show();
	      $('#popup13').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas13, .close').click( function() {
	    $('#popup13').hide();
	    $('.gray_mas13').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas13, .close').click( function() {
	    $('#popup13').hide();
	    $('.gray_mas13').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 15 */
	$(function(){
	    var embed = $('.youtube14');
	    $('.video').empty();
	    
	    $('.pop_open14').click( function() {
	      $('.gray_mas14').show();
	      $('#popup14').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas14, .close').click( function() {
	    $('#popup14').hide();
	    $('.gray_mas14').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas14, .close').click( function() {
	    $('#popup14').hide();
	    $('.gray_mas14').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 16 */
	$(function(){
	    var embed = $('.youtube15');
	    $('.video').empty();
	   
	    $('.pop_open15').click( function() {
	      $('.gray_mas15').show();
	      $('#popup15').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas15, .close').click( function() {
	    $('#popup15').hide();
	    $('.gray_mas15').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas15, .close').click( function() {
	    $('#popup15').hide();
	    $('.gray_mas15').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 17 */
	$(function(){
	    var embed = $('.youtube16');
	    $('.video').empty();
	    
	    $('.pop_open16').click( function() {
	      $('.gray_mas16').show();
	      $('#popup16').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas16, .close').click( function() {
	    $('#popup16').hide();
	    $('.gray_mas16').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas16, .close').click( function() {
	    $('#popup16').hide();
	    $('.gray_mas16').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 18 */
	$(function(){
	    var embed = $('.youtube17');
	    $('.video').empty();
	    
	    $('.pop_open17').click( function() {
	      $('.gray_mas17').show();
	      $('#popup17').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas17, .close').click( function() {
	    $('#popup17').hide();
	    $('.gray_mas17').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas17, .close').click( function() {
	    $('#popup17').hide();
	    $('.gray_mas17').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 19 */
	$(function(){
	    var embed = $('.youtube18');
	    $('.video').empty();
	    
	    $('.pop_open18').click( function() {
	      $('.gray_mas18').show();
	      $('#popup18').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas18, .close').click( function() {
	    $('#popup18').hide();
	    $('.gray_mas18').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas18, .close').click( function() {
	    $('#popup18').hide();
	    $('.gray_mas18').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 20 */
	$(function(){
	    var embed = $('.youtube19');
	    $('.video').empty();
	    
	    $('.pop_open19').click( function() {
	      $('.gray_mas19').show();
	      $('#popup19').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas19, .close').click( function() {
	    $('#popup19').hide();
	    $('.gray_mas19').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas19, .close').click( function() {
	    $('#popup19').hide();
	    $('.gray_mas19').hide();
	    $('.video').empty(); 
	  }); 
	});
	
/* 21 */
	$(function(){
	    var embed = $('.youtube20');
	    $('.video').empty();
	    
	    $('.pop_open20').click( function() {
	      $('.gray_mas20').show();
	      $('#popup20').show();
	      $('.video').append(embed);
	    });
	 
	  $('.gray_mas20, .close').click( function() {
	    $('#popup20').hide();
	    $('.gray_mas20').hide();
	    $('.video').empty(); 
	  }); 
	  
	  $('.gray_mas20, .close').click( function() {
	    $('#popup20').hide();
	    $('.gray_mas20').hide();
	    $('.video').empty(); 
	  }); 
	});

</script>


<style>
	
	
	
	
/* 1 */
	.gray_mask{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup{
	  display:none;
	  position:absolute;
	  top:-10;	  
	  left:500;
	}
	
/* 2 */
	.gray_mas1{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup1{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 3 */
	.gray_mas2{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup2{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 4 */
	.gray_mas3{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup3{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 5 */
	.gray_mas4{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup4{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 6 */
	.gray_mas5{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup5{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 7 */
	.gray_mas6{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup6{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 8 */
	.gray_mas7{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup7{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 9 */
	.gray_mas8{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup8{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 10 */
	.gray_mas9{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup9{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 11 */
	.gray_mas10{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup10{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 12 */
	.gray_mas11{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup11{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 13 */
	.gray_mas12{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup12{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 14 */
	.gray_mas13{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup13{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 15 */
	.gray_mas14{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup14{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 16 */
	.gray_mas15{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup15{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 17 */
	.gray_mas16{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup16{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 18 */
	.gray_mas17{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup17{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 19 */
	.gray_mas18{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup18{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 20 */
	.gray_mas19{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup19{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
/* 21 */
	.gray_mas20{
	  display:none;
	  position:absolute;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0,0,0,0.7);
	}
	#popup20{
	  display:none;
	  position:absolute;
	  top:180;	  
	  left:500;
	}
	
	table {
	  border-spacing: 18px;
	  border-collapse: separate;
	}
	table td {
	  width: 30px;
	  background: #fff;
	}


</style>
<center>
<br>
<h2>미디어 영상</h2>
<br>
<table>
<!-- 1 -->
	<tr>
		<td>
			<a class="pop_open" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_0.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mask"></div> <!-- 여기 -->
			<div id="popup"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/IqfNGRq9dPc" 
						title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
						allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차의모든것</font><br>
			<font size="2" color="#353535">"이것" 모르고 중고차 사면 바로 차를 팔아야 합니다...<br><br></font>
		</td>
		<td>
			<a class="pop_open1" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_1.PNG" height=260 width=360 ></a>
			<div class="gray_mas1"></div> 
			<div id="popup1">
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube1"> 
					<iframe width="560" height="315" src="https://www.youtube.com/embed/d-kHnoVept8" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #중고차구매요령 #신차​</font><br>
			<font size="2" color="#353535">중고차딜러들이 10만km 넘은차만 타는 이유는?!<br>10만km 넘은 중고차의 장점,구매시 조심해야하는 부분은?!</font>
		</td>
		<td>
			<a class="pop_open2" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_2.PNG" height=260 width=360 ></a>
			<div class="gray_mas2"></div> 
			<div id="popup2">
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube2"> 
					<iframe width="560" height="315" src="https://www.youtube.com/embed/X2zs71dNsmY" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차추천 #SM6 #중고차구매</font><br>
			<font size="2" color="#353535">가성비 좋은 1,000만원대 중고차 TOP5! <br> 자동차 전문 기자의 원픽은? l O'Pick EP. 72</font>
		</td>
	</tr>
<!-- 2 -->
	<tr>
		<td>
			<a class="pop_open3" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_3.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas3"></div> <!-- 여기 -->
			<div id="popup3"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube3"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/Xs7436jJ4rk" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #체크리스트</font><br>
			<font size="2" color="#353535">좋은 중고차 고르는 방법 - 중고차 구매요령 체크리스트<br><br></font>
		</td>
		<td>
			<a class="pop_open4" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_4.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas4"></div> <!-- 여기 -->
			<div id="popup4"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube4"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/vf2cGDoFdF4" title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#부싼카 #중고차파괴자 #중고차</font><br>
			<font size="2" color="#353535">1000만원대 중고차를 살펴보자<br><br></font>
		</td>
		<td>
			<a class="pop_open5" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_5.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas5"></div> <!-- 여기 -->
			<div id="popup5"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube5"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/taVgrfmTTEA" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차구매요령 #중고차 #신차​</font><br>
			<font size="2" color="#353535">중고차 사러가서 '엔진룸'을 열고 뭐해야될지 모르시겠다면 <br> 그냥 이 영상을 따라하세요.<br></font>
		</td>
	</tr>
<!-- 3 -->
	<tr>
		<td>
			<a class="pop_open6" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_6.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas6"></div> <!-- 여기 -->
			<div id="popup6"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube6"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/KluY1C72Eow" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #중고차꿀팁​</font><br>
			<font size="2" color="#353535">🚖'이것'만 알면 진짜 무사고차인지 알 수 있다!<br> 중고차 43년 짬바의 호구 안 당하고 중고차 사는 꿀팁!<br></font>
		</td>
		<td>
			<a class="pop_open7" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_7.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas7"></div> <!-- 여기 -->
			<div id="popup7"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube7"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/ruXf-Gy9XRE" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차구매요령 #중고차​ #신차​</font><br>
			<font size="2" color="#353535">중고차 구매할때 키로수가 어느정도 된 차를 사야할까?<br>내차 팔때는 몇 Km 때 팔아야 이득일까?!<br></font>
		</td>
		<td>
			<a class="pop_open8" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_8.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas8"></div> <!-- 여기 -->
			<div id="popup8"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube8"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/4PiwqzCuhs4" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차구매 #중고차대출 #중고차할부​</font><br>
			<font size="2" color="#353535">중고차를 할부로 구매하기전에 꼭!! 알아야하는 점<br> ''절대 딜러가 하라는대로 하지마세요''<br></font>
		</td>
	</tr>
<!-- 4 -->
	<tr>
		<td>
			<a class="pop_open9" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_9.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas9"></div> <!-- 여기 -->
			<div id="popup9"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube9"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/mS3dV8Pk91E" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#사회초년생중고차 #첫차추천​</font><br>
			<font size="2" color="#353535">월급 200~250만원 사회초년생 진짜 현실적인 추천 중고차<br><br></font>
		</td>
		<td>
			<a class="pop_open10" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_10.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas10"></div> <!-- 여기 -->
			<div id="popup10"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube10"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/qFW7FjdBlnU" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#닥신 #중고차 #2022​</font><br>
			<font size="2" color="#353535">2022 닥신의 중고차 고르기<br> feat. 나쁜차 소거하는 11가지 방법<br></font>
		</td>
		<td>
			<a class="pop_open11" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_11.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas11"></div> <!-- 여기 -->
			<div id="popup11"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube11"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/LqRcSr8g5Z4" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #중고차구매요령 #신차​​</font><br>
			<font size="2" color="#353535">중고차를 가장 싸게 살수있는 시기와 방법<br>중고차는 X월에 사면 가장 싸게 살수있다?!<br></font>
		</td>
	</tr>
<!-- 5 -->
	<tr>
		<td>
			<a class="pop_open12" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_12.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas12"></div> <!-- 여기 -->
			<div id="popup12"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube12"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/LkudG9cOyWo" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">[세상에 나쁜 자동차는 없다]박병일 명장과 함께하는 자동차 점검 꿀팁​</font><br>
			<font size="2" color="#353535">박병일 명장이 중고차 구입할때 자동차 내부보는법 알려준다<br> _세.나.자[산업방송 채널i]<br></font>
		</td>
		<td>
			<a class="pop_open13" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_13.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas13"></div> <!-- 여기 -->
			<div id="popup13"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube13"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/5k-E21ASjNE" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차구매 #중고차 #신차​​</font><br>
			<font size="2" color="#353535">일반인은 모르는 구매후 계약서 작성할때 꼭넣어야 하는 문구<br>이것만 알아도 구매 후에 문제 생길일 없습니다.<br></font>
		</td>
		<td>
			<a class="pop_open14" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_14.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas14"></div> <!-- 여기 -->
			<div id="popup14"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube14"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/XNINlcKSPP4" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#첫차 #자동차 #중고차</font><br>
			<font size="2" color="#353535">연봉별 자동차 추천! 실수령 기준 100~600만원 이상까지 <br><br></font>
		</td>
	</tr>
<!-- 6 -->
	<tr>
		<td>
			<a class="pop_open15" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_15.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas15"></div> <!-- 여기 -->
			<div id="popup15"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube15"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/i8MhIMUnaVw" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #주행거리 #중고차구입​</font><br>
			<font size="2" color="#353535">중고차딜러들은 주행거리 얼마쯤되는 차를 탈까.<br> 중고차구입시 최고의 주행거리 선택 노하우<br></font>
		</td>
		<td>
			<a class="pop_open16" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_16.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas16"></div> <!-- 여기 -->
			<div id="popup16"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube16"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/bn_KHDDejy0" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">신차구매팁_이것만 따라해도 호구 안잡힘!​​</font><br>
			<font size="2" color="#353535">썬팅 추천,썬팅 농도?ㅣ썬팅(틴팅) 선택 어려우시죠?<br> 쉽게 "4가지"만 기억하세요<br></font>
		</td>
		<td>
			<a class="pop_open17" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_17.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas17"></div> <!-- 여기 -->
			<div id="popup17"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube17"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/g12TyM9vc0g" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#월급220만원 #자동차 #중고차</font><br>
			<font size="2" color="#353535">월급이 220만원인데 중고아반떼 전액할부로 유지가능할까요?<br><br></font>
		</td>
	</tr>
<!-- 7 -->
	<tr>
		<td>
			<a class="pop_open18" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_18.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas18"></div> <!-- 여기 -->
			<div id="popup18"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube18"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/taYM3HFwjrk" title="YouTube video player" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #닥신​</font><br>
			<font size="2" color="#353535">중고차 입문자를 위한 필수 이론 정리 TOP20<br><br></font>
		</td>
		<td>
			<a class="pop_open19" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_19.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas19"></div> <!-- 여기 -->
			<div id="popup19"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube19"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/ojGOTWGtSr8" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#중고차 #신차 #할일</font><br>
			<font size="2" color="#353535">신차 출고 후 3일 동안 반드시 해야하는 것들!<br> (검수, 비닐 제거, 외부 세차 등등)<br></font>
		</td>
		<td>
			<a class="pop_open20" href="#"><img src="<%=application.getContextPath()%>/resources/img/img_you/you_20.PNG" height=260 width=360 ></a> <!-- 여기 -->
			<div class="gray_mas20"></div> <!-- 여기 -->
			<div id="popup20"> <!-- 여기 -->
			    <a class="close" href="#"><font color="#fff">CLOSE</font></a>
			    <div class="youtube20"> <!-- 여기 -->
					<iframe width="560" height="315" src="https://www.youtube.com/embed/zuhg-jLYcEw" title="YouTube video player" frameborder="0" 
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    </div>
			</div>
			<br>
			<font size="1" color="#ED0000">#부싼카 #중고차 #중고차파괴자</font><br>
			<font size="2" color="#353535">400만원부터 5000만원까지 중고차구경하기<br><br></font>
		</td>
	</tr>
	
</table>
</center>


<%@ include file="../member/bottom2.jsp" %>
