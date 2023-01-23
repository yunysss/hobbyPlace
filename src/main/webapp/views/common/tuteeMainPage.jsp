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
    .carousel-inner, .carousel-inner img{width:100%; height:100%;}

    /* 추천 클래스 */
    #mainPageRec{margin-top:20px;}
    #mainPageRec>div{width:100%; padding:10px;}
    #mainPageRec-1, #mainPageRec-2{height:30%;}
    #mainPageRec-3{height:40%;}

    #mainPageRec-1 div, #mainPageRec-2 div{width:100%;}
    .rec-title{height:10%;}
    #rec-pic, #rec-pic-2, #rec-pic-3 {height:90%; overflow-x:auto; overflow-y:hidden;}
    #rec-pic::-webkit-scrollbar, #rec-pic-2::-webkit-scrollbar, #rec-pic-3::-webkit-scrollbar{
	  height: 8px;
	}
	#rec-pic::-webkit-scrollbar-track, #rec-pic-2::-webkit-scrollbar-track, #rec-pic-3::-webkit-scrollbar-track{
	  background-color: rgb(240,240,240);
	}
	#rec-pic::-webkit-scrollbar-thumb, #rec-pic-2::-webkit-scrollbar-thumb, #rec-pic-3::-webkit-scrollbar-thumb{
	  border-radius: 3px;
	  background-color: rgb(180, 180, 180);
	}
	
    #mainPageRec-1 img, #mainPageRec-2 img{
        width:175px;
        height:175px;
        margin-left:10px;
        margin-right:10px;
    }

    #mainPageRec-3 img{
        width:230px;
        height:230px;
    }
    #mainPageRec-3 td{
    	width:240px;
    	vertical-align : top;
    	padding:10px;
    	
    }

    
</style>
</head>
<body>
	<div class="outer">
        <div id="demo" class="carousel slide" data-ride="carousel">
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
                <!-- 로그인 전 -->
                <% if(loginUser == null) {%>
	                <div class="rec-title">
	                    <b>새로운 클래스 🎁</b>
	                </div>
	                <div id="rec-pic">
	                    <table>
	                    	<tr>
	                    	</tr>
	                    </table>
	                </div>
	                
	                <script>
	                	$(function(){
	                		selectNewClassList();
	                	})
	                	
	                	function selectNewClassList(){
	                		$.ajax({
	                			url:"<%=contextPath%>/listNew.cl",
	                			success:function(list){
	                				let value = "";
	                				for(let i=0; i<10; i++){
	                					value += "<td>"
	                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
	                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
	                									+ "<small>" + list[i].distrCode + "</small><br>"
	                									+ "<b>" + list[i].clName + "</b><br>"
	                									+ list[i].clPrice + "&nbsp&nbsp&nbsp;&nbsp;⭐" + list[i].clStarAvg+".0(" + list[i].clStarCount + ")"
	               									+ "</a>"
	             								+ "</td>"
	                				}
	                				$("#rec-pic tr").html(value);
	                			},error:function(){
	                				console.log("클래스 조회용 ajax 통신실패");
	                			}
	                		})
	                	}
	                </script>
                <% } else{ %>
                	<!-- 로그인 후 -->
                	<div class="rec-title">
	                    <b><%= loginUser.getMemNick() %> 님이 좋아할만한 클래스 🥰</b>
	                </div>
	                <div id="rec-pic">
	                    <table>
	                    	<tr>
	                    	</tr>
	                    </table>
	                </div>
                
                <% } %>
                
            </div>

            <div id="mainPageRec-2">
                <div class="rec-title">
	                    <b>찜이 가장 많은 클래스 ❤️</b>
	                </div>
	                <div id="rec-pic-2">
	                    <table>
	                    	<tr>
	                    	</tr>
	                    </table>
	                </div>
	                
	                <script>
		                $(function(){
	                		selectLikeClassList();
	                	})
	                	function selectLikeClassList(){
	                		$.ajax({
	                			url:"<%=contextPath%>/listLike.cl",
	                			success:function(list){
	                				
	                				let value = "";
	                				for(let i=0; i<10; i++){
	                					value += "<td>"
	                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
	                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
	                									+ "<small>" + list[i].distrCode + "</small><br>"
	                									+ "<b>" + list[i].clName + "</b><br>"
	                									+ list[i].clPrice + "&nbsp&nbsp&nbsp;&nbsp;⭐" + list[i].clStarAvg+".0(" + list[i].clStarCount + ")"
	               									+ "</a>"
	             								+ "</td>"
	                				}
	                				$("#rec-pic-2 tr").html(value);
	                			},error:function(){
	                				console.log("클래스 조회용 ajax 통신실패");
	                			}
	                		})
	                	}
	                </script>
            </div>

            <div id="mainPageRec-3">
                <div class="rec-title">
	                    <b>클래스 후기</b>
	                </div>
	                <div id="rec-pic-3">
	                    <table>
	                    	<tr>
	                    		
	                    	</tr>
	                    </table>
	                </div>
	                <script>
	                $(function(){
                		selectReviewClassList();
                	})
	                	function selectReviewClassList(){
	                		$.ajax({
	                			url:"<%=contextPath%>/listReview.cl",
	                			success:function(list){
	                				let value = "";
	                				for(let i=0; i<list.length; i++){
	                					value += "<td>"
	                								+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + list[i].clNo + "'>"
	                									+ "<img src='" + '<%=contextPath%>' + "/" + list[i].clThumb + "'><br>"
	                									+ "<b>" + list[i].clName + "</b><br>"
	                					for(let j=1; j<=list[i].reviewStar; j++){
	                						value += "⭐"
	                					}
	               						value += "<p>" + list[i].reviewContent + "</p>"
	               								+ "</a>"
	             								+ "</td>"
	                				}
	                				$("#rec-pic-3 tr").html(value);
	                			},error:function(){
	                				console.log("클래스 조회용 ajax 통신실패");
	                			}
	                		})
	                	}
	                </script>
            </div>
          </div>

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>

	

</body>
</html>