<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{border: 1px solid;}
    .review-area{
        margin: auto;
        width: 80%;
        height: 800px;
        border: 1px solid gray;
        border-radius: 5px;

    }

    .classPart{
        margin: auto;
        width: 95%;
        height: 17%;
    }
    .classThumbnail{
        height: 100%;
        width: 180px;
        padding: 15px;
        float: left;
    }

    .classThumbnail img{
        width: 100%;
        height: 100%;
    }
    .classTitle{
        width: 350px;
        height: 134px;
        float: left;
    }
    .classTitle b{
        font-size: 18px;
        line-height:120px;
    }
    .nextBtn{
        float: left;
        width: 68px;
        height: 134px;
    }
    .nextBtn img{
        width: 55px;
        cursor: pointer;
        padding-top: 35px;
        margin-left:15px;
    }
    
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content">
            <h6 style="margin-left: 15px;"><b>수강 후기 작성</b></h6>
            <hr>
            <div class="review-area">
                <div class="classPart">
                    <div class="classThumbnail">
                        <img src="<%=contextPath%>/resources/classThumbnail_upfiles/2023012714522990657.png" >
                    </div>
                    <div class="classTitle">
                        <b> 클래스 제목 들가는 자리</b>
                    </div>
                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div> <!--header:클래스정보부분끝-->

                <div class="starRating">
                    <div>
                        <span>별 별 별 별 별</span>

                    </div>
                    
                    <p>별표를 클릭하여 평가해주세요.</p>
                </div>


            </div> <!--리뷰영역 닫는  div-->
            

            


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>