<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.review.model.vo.Review"%>
<%
 	Review dr = (Review)request.getAttribute("dr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;  }
    .cwrap{width:1000px; height:1300px; margin:auto; padding:2px;}
    
    .menubar{width:200px; height:1299px; float:left; padding-top:30px; background: white; }
    .content {width:793px; height:1300px;  float: right; padding-top:65px;}


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
        width: 415px;
        height: 134px;
        float: left;
    }
    .classTitle b{
        font-size: 18px;
        line-height:120px;
    }

    .reviewTable{
        text-align: center;
        width:600px;
        height: 300px;
        box-sizing: border-box;
        margin: auto;
        
    }

    .reviewTable {
        border: 1px solid gray;
    }

    
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content" >
            <h6 style="margin-left: 15px;"><b>수강후기</b></h6>
            <hr>
            <div class="review-area">
                <div class="classPart">
                    <div class="classThumbnail">
                        <img src="<%=contextPath%>/<%=dr.getMemProfile() %>" >
                    </div>
                    <div class="classTitle" style="font-size: 15px; font-weight: bold; vertical-align: middle; ">
                        <p style="margin-top:45px"><%=dr.getMemNickName() %></p>
                    </div>
                    
                </div> <!--header:클래스정보부분끝-->
                <div align="center">
                    <table class="reviewTable" border="0">
                        <tr>
                            <td><%=dr.getReviewUpDate() %></td>
                            <td rowspan="2">
                            <%if(dr.getReviewStar()==1){ %>
                        		⭐
                        	<%} else if(dr.getReviewStar()==2){ %>
                        		⭐⭐
                        	<%} else if(dr.getReviewStar()==3){ %>
                        		⭐⭐⭐
                        	<%} else if(dr.getReviewStar()==4){ %>
                        		⭐⭐⭐⭐
                        	<%} else {%>
                        		⭐⭐⭐⭐⭐
                        	<%} %>
                            </td>
                        </tr>
                        
                        <tr>
                            <td><%=dr.getReviewDate() %></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 1px; background: gray;"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%=dr.getReviewContent() %></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="reviewPhoto">
                                <img src="" width="400px" height="200px" >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button>수정하기</button>
                                <button> 삭제하기</button>
                            </td>
                            
                        </tr>
                    </table>
                </div><!--end of 리뷰 정보 표 -->
               
                 


            </div><!--end of review-area-->

            


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>