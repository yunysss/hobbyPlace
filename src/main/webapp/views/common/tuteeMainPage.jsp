<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.hp.lesson.model.vo.Lesson"%>
<%
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input{box-sizing:border-box;}
    .outer{width:1000px; height:1500px; margin:auto; margin-top:20px;}
    a{text-decoration: none !important; color:black !important;}

    .outer>div{width:100%;}
    #demo{height:25%;}
    #mainPageRec{height:75%;}

    /* 배너 */
    .carousel-inner, .carousel-inner img{width:95%; height:95%;}

    /* 추천 클래스 */
    #mainPageRec{margin-top:20px;}
    #mainPageRec>div{width:100%; padding:10px;}
    #mainPageRec-1, #mainPageRec-2{height:30%;}
    #mainPageRec-3{height:40%;}
    
    #rec-pic-1, #rec-pic-2 {display:inline-block; height:241px; overflow:hidden;}
    #rec-pic-3{display:inline-block; height:290px; overflow:hidden;}
    #rec-pic-3 li{
    	width:200px;
    	margin-right:30px;	
    }
	#mainPageRec img{
		border-radius: 5px;
  	}
  	#mainPageRec li:hover img{
  		opacity:0.8;
  	}
    #mainPageRec-1 img, #mainPageRec-2 img{
        width:170px;
        height:170px;
        margin-right:10px;
    }

    #mainPageRec-3 img{
        width:210px;
        height:210px;
    }

   li {
	  float: left;
	  list-style: none;
	}
	.rec-title>span{
		float:right; 
		margin-right:50px
	}
	.rec-title button{
		border:1px solid rgb(127, 127, 127);
		background:white;
		border-radius:50%;
		height:27px;
		width:27px;
		color:gray;
		font-weight:bold;
		margin-left:3px;
	}
	.rec-title button:hover{
		opacity:0.5;
	}
	.rec-title>*{
		margin-bottom:10px;
	}
    
</style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="outer">
        <div id="demo" class="carousel slide" data-ride="carousel" align="center">
            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="<%=contextPath %>/resources/images/mainImage.png">
              </div>
              <div class="carousel-item">
                <img src="<%=contextPath %>/resources/images/mainImage2.png">
              </div>
              <div class="carousel-item">
                <img src="<%=contextPath %>/resources/images/mainImage3.png">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>

          <div id="mainPageRec">
            <div id="mainPageRec-1">
            	<script>
	            	function selectNewClassList(){
	            		$.ajax({
	            			url:"<%=contextPath%>/listNew.cl",
	            			success:function(list){
	            				let value = "";
	            				for(let i=0; i<10; i++){
	            					value += "<li>"
	            								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
	            									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
	            									+ "<small>" + list[i].distrCode + "</small><br>"
	            									+ "<b>" + list[i].clName 
   									if(list[i].clName.length == 11){
                  							value += "...";
                  						}
                                   	value += "</b><br>"
                   							+ list[i].clPrice + "&nbsp&nbsp&nbsp;&nbsp;⭐" + list[i].clStarAvg+".0(" + list[i].clStarCount + ")"
                  								+ "</a>"
                								+ "</li>"
	            				}
	            				$("#rec-pic-1").append(value);
	            				
	            			},error:function(){
	            				console.log("클래스 조회용 ajax 통신실패");
	            			}
	            		})
	            	}
	            	
	            	function selectLikeClassList(){
                		$.ajax({
                			url:"<%=contextPath%>/listLike.cl",
                			success:function(list){
                				
                				let value = "";
                				for(let i=0; i<10; i++){
                					value += "<li>"
                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
                									+ "<small>" + list[i].distrCode + "</small><br>"
                									+ "<b>" + list[i].clName 
									if(list[i].clName.length == 11){
               							value += "...";
               						}
                                	value += "</b><br>"
                							+ list[i].clPrice + "&nbsp&nbsp&nbsp;&nbsp;⭐" + list[i].clStarAvg+".0(" + list[i].clStarCount + ")"
               								+ "</a>"
             								+ "</li>"
                				}
                				$("#rec-pic-2").html(value);
                			},error:function(){
                				console.log("클래스 조회용 ajax 통신실패");
                			}
                		})
                	}
	            	
	            	function selectReviewClassList(){
                		$.ajax({
                			url:"<%=contextPath%>/listReview.cl",
                			success:function(list){
                				let value = "";
                				for(let i=0; i<list.length; i++){
                					console.log(list[i].reviewContent.length)
                					value += "<li>"
                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
                									+ "<b>" + list[i].clName 
  									if(list[i].clName.length == 13){
               							value += "...";
               						}
                					value += "</b><br>"
                					for(let j=1; j<=list[i].reviewStar; j++){
                						value += "⭐"
                					}
                					value += "<p>" + list[i].reviewContent 
             						if(list[i].reviewContent.length == 25){
             							value += "...";
             						}
               						value += "</p>"
       										+ "</a>"
     										+ "</li>"
                				}
                				$("#rec-pic-3").html(value);
                			},error:function(){
                				console.log("클래스 조회용 ajax 통신실패");
                			}
                		})
                	}
            	</script>
                <!-- 로그인 전 -->
                <% if(loginUser == null || loginUser.getInterest() == null) {%>
	                <div class="rec-title">
	                    <b>새로운 클래스 🎁</b>
	                    <span><button class="left" onclick="prevView(1);">❮</button> <button class="right" onclick="nextView(1);">❯</button></span>
	                </div>
	                <script>
	                	$(function(){
	                		selectNewClassList();
	                	})
	                </script>
                <% } else{ %>
                	<!-- 로그인 후 -->
                	<div class="rec-title">
	                    <b><%= loginUser.getMemNick() %> 님이 좋아할만한 클래스 🥰</b>
	                    <span><button class="left" onclick="prevView(1);">❮</button> <button class="right" onclick="nextView(1);">❯</button></span>
	                </div>
	                <script>
		                $(function(){
	                		selectInterestClassList();
	                	})
	                	function selectInterestClassList(){
	                		$.ajax({
	                			url:"<%=contextPath%>/listInterest.cl",
	                			data:{interest:"<%=loginUser.getInterest()%>"},
	                			success:function(list){
	                				let value = "";
	                				for(let i=0; i<list.length; i++){
	                					value += "<li>"
	                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
	                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
	                									+ "<small>" + list[i].distrCode + "</small><br>"
	                									+ "<b>" + list[i].clName
      									if(list[i].clName.length == 11){
                     							value += "...";
                     						}
                                      	value += "</b><br>"
                      							+ list[i].clPrice + "&nbsp&nbsp&nbsp;&nbsp;⭐" + list[i].clStarAvg+".0(" + list[i].clStarCount + ")"
                     								+ "</a>"
                   								+ "</li>"
	                				}
	                				if(list.length < 5){
	                					selectNewClassList();
	                				}
	                				$("#rec-pic-1").html(value);
	                			},error:function(){
	                				console.log("클래스 조회용 ajax 통신실패");
	                			}
	                		})
	                	}
	                </script>
                <% } %>
                <div id="mainPageRec-1">
                    <ul id="rec-pic-1">
					</ul>
                </div>
            </div>
            <div id="mainPageRec-2">
                <div class="rec-title">
	                    <b>찜이 가장 많은 클래스 ❤️</b>
	                    <span><button class="left" onclick="prevView(2);">❮</button> <button class="right" onclick="nextView(2);">❯</button></span>
	                </div>
	                <ul id="rec-pic-2">
	                </ul>
	                <script>
		                $(function(){
	                		selectLikeClassList();
	                	})
	                </script>
            </div>

            <div id="mainPageRec-3">
                <div class="rec-title">
	                    <b>클래스 후기</b>
	                    <span><button class="left" onclick="prevView(3);">❮</button> <button class="right" onclick="nextView(3);">❯</button></span>
	                </div>
	                <ul id="rec-pic-3">
	                </ul>
	                <script>
		                $(function(){
		                	selectReviewClassList();
	                	})
	                </script>
            </div>
          </div>

    </div>
    <script>
		function prevView(a) {
			let margin = "";
			if(a == 3){
				margin = "-210px"
			}else{
				margin = "-170px"
			}
		  $("#rec-pic-" + a + " li:last").prependTo("#rec-pic-" + a);
		  $("#rec-pic-" + a).css("marginLeft", margin);
		  $("#rec-pic-" + a).animate({
		    marginLeft: 0
		  });
		};	
	
		function nextView(a) {
			let margin = "";
			if(a == 3){
				margin = "-=210px"
			}else{
				margin = "-=170px"
			}
		  $("#rec-pic-"+a).animate({
	    	marginLeft: margin
		  }, function() {
		    $("#rec-pic-" + a +" li:first").appendTo("#rec-pic-" + a);
		    $("#rec-pic-" + a).css({
		      marginLeft: 0
		    });
		  });
	
		};
	</script>
    
    <%@ include file="../common/footerbar.jsp" %>

	

</body>
</html>