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
    .outer{width:1000px; height:1400px; margin:auto; margin-top:20px;}
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

    #mainPageRec-1 div{width:100%;}
    .rec-title{height:10%;}
    #rec-pic{height:90%; overflow-x:auto; overflow-y:hidden; white-space:nowrap;}
    #rec-pic::-webkit-scrollbar {
	  height: 8px;
	}
	#rec-pic::-webkit-scrollbar-track{
	  background-color: rgb(240,240,240);
	}
	#rec-pic::-webkit-scrollbar-thumb{
	  border-radius: 3px;
	  background-color: rgb(180, 180, 180);
	}
	#rec-pic::-webkit-scrollbar-button{
	  width: 0;
	  height: 0;
	}
	
    #mainPageRec-1 img, #mainPageRec-2 img{
        width:175px;
        height:175px;
        margin-left:10px;
        margin-right:10px;
    }

    #mainPageRec-3 img{
        width:200px;
        height:200px;
    }

    
</style>
</head>
<body>

	<%@ include file="../common/tuteeMenubar.jsp" %>
	
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
                <img src="https://umclassupload.s3.ap-northeast-2.amazonaws.com/app/web_um_coupon_220530.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="https://post-phinf.pstatic.net/MjAxOTExMjhfOTMg/MDAxNTc0OTE5MDA0OTYw.hyFb4e85nGeKGZyF4CZhEce16yWo9hM9R_Q9ALHV4RUg.2Yhm6vm0ButtlO5JHrIlzcl_e9AiF7KmC8SS0SaZ9Vsg.JPEG/20191125_%EC%9D%B8%EC%8A%A4%ED%83%80_%EC%9B%90%EB%8D%B0%EC%9D%B4%ED%81%B4%EB%9E%98%EC%8A%A4.jpg?type=w1200" alt="">
              </div>
              <div class="carousel-item">
                <img src="https://og-data.s3.amazonaws.com/media/artworks/half/A0880/A0880-0019.jpg" alt="">
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
	                    <b>새로운 클래스</b>
	                </div>
	                <div id="rec-pic">
	                    <table>
	                    	<tr>
	                    	</tr>
	                    </table>
	                </div>
	                
	                <script>
	                	$(function(){
	                		selectMainClassList();
	                	})
	                	
	                	function selectMainClassList(){
	                		$.ajax({
	                			url:"<%=contextPath%>/listMain.cl",
	                			success:function(list){
	                				let value = "";
	                				for(let i=0; i<10; i++){
	                					value += "<td>"
	                								+ "<a href=''<%=contextPath%>'/page.cl'>"
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
                
                <% } %>
                
            </div>

            <div id="mainPageRec-2">
                <div class="rec-title">
	                    <b>찜이 가장 많은 클래스 ❤️</b>
	                </div>
	                <div id="rec-pic-2">
	                    
	                </div>
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
            </div>
          </div>

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>

	

</body>
</html>