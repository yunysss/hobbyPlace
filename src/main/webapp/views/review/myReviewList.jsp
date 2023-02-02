<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box; }
    .cwrap{width:1000px; height:1300px; margin:auto; padding:2px;}
    
    .menubar{width:200px; height:1299px; float:left; padding-top:30px; background: white; }
    .content {width:793px; height:1300px;  float: right; padding-top:65px;}


    .review-area{
        width: 300px; 
        height: 400px; 
        margin: 15px 40px;
        border: 1px solid lightgray;
        border-radius: 5px;
        display: inline-block;
        
    }
    .class-area{
        width: 100%; 
        height: 90px;
    }
    .classThumb {
        width: 32%;
        height: 90px;
        float: left;
        padding: 6px;
    }
    .classThumb img {float: left;}
    .classText{
        width:60%; 
        height: 90px;
        float: left;
        padding-top: 5px;
        font-size: 13px;;
        }
    .classText div{
        height: 50%;

    }
    #nextBtn {
        width: 10px;
        height: 10px;
        float: left;

    }
    .nextBtn img{
        width: 15px;
        height: 15px;
        cursor: pointer;
    }
    .review-content{
        height: 140px;
    }

    .review-content p {
        margin:0%; 
        padding:3px; 
        padding-left: 5px;
    }


</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content">

            <div class="review-area">

                <div class="class-area">
                    <div class="classThumb">
                        <img src="" width="80px" height="80px">
                    </div>
                    
                    <div class="classText">
                        <div>
                            <p>클래스 제목들어가는 자리</p>
                        </div>
                        <div>
                            별점 들어가는 공간
                        </div>
                    </div>

                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div>
                <hr style="margin:0%">
                <div class="review-content">
                    <p>2023/01/02</p>
                    <p>리뷰내용들어가는 곳와라라라랄라라라라</p>

                </div>

                <div class="reviewThumb" align="center">
                    <img src="" width="200px" height="150px">

                </div>
                
               
            </div> <!-- 리뷰div끝-->

            <div class="review-area">

                <div class="class-area">
                    <div class="classThumb">
                        <img src="" width="80px" height="80px">
                    </div>
                    
                    <div class="classText">
                        <div>
                            <p>클래스 제목들어가는 자리</p>
                        </div>
                        <div>
                            별점 들어가는 공간
                        </div>
                    </div>

                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div>
                <hr style="margin:0%">
                <div class="review-content">
                    <p>2023/01/02</p>
                    <p>리뷰내용들어가는 곳와라라라랄라라라라</p>

                </div>

                <div class="reviewThumb" align="center">
                    <img src="" width="200px" height="150px">

                </div>
                
               
            </div> <!-- 리뷰div끝-->

            <div class="review-area">

                <div class="class-area">
                    <div class="classThumb">
                        <img src="" width="80px" height="80px">
                    </div>
                    
                    <div class="classText">
                        <div>
                            <p>클래스 제목들어가는 자리</p>
                        </div>
                        <div>
                            별점 들어가는 공간
                        </div>
                    </div>

                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div>
                <hr style="margin:0%">
                <div class="review-content">
                    <p>2023/01/02</p>
                    <p>리뷰내용들어가는 곳와라라라랄라라라라</p>

                </div>

                <div class="reviewThumb" align="center">
                    <img src="" width="200px" height="150px">

                </div>
                
               
            </div> <!-- 리뷰div끝-->

            <div class="review-area">

                <div class="class-area">
                    <div class="classThumb">
                        <img src="" width="80px" height="80px">
                    </div>
                    
                    <div class="classText">
                        <div>
                            <p>클래스 제목들어가는 자리</p>
                        </div>
                        <div>
                            별점 들어가는 공간
                        </div>
                    </div>

                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div>
                <hr style="margin:0%">
                <div class="review-content">
                    <p>2023/01/02</p>
                    <p>리뷰내용들어가는 곳와라라라랄라라라라</p>

                </div>

                <div class="reviewThumb" align="center">
                    <img src="" width="200px" height="150px">

                </div>
                
               
            </div> <!-- 리뷰div끝-->

          



        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>