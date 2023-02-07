<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.hp.review.model.vo.Review, com.hp.common.model.vo.PageInfo"%>
<% 
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo rePi = (PageInfo)request.getAttribute("rePi"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    

	 .classnull{
        width: 100%;
        height:300px;
        margin-top: 70px;
    }
    .classnull img{width: 100px}
    
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
        border-radius:5px;
    }
    .classThumb img {float: left;}
    .classText{
        width:60%; 
        height: 90px;
        float: left;
        padding-top: 5px;
        font-size: 13px;;
        }


    .clName{
        font-weight: bold;
        width: 178px;
        white-space : nowrap;
        overflow : hidden;
        text-overflow : ellipsis;
        margin-top: 10px;
        margin-bottom: 0%;
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
    .revContent{
        white-space: normal;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
    .paging-area button{border:0; border-radius:3px;}

    .reviewThumb:hover{
        opacity: 0.7;
        cursor: pointer;
    }


</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content">
        <!-- 작성한 리뷰가 없을 때-->
            <%if(loginUser != null && list.isEmpty()) {%>
            <div class="classnull" align="center">
                <img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png" >
                <br><br>
					<p>작성한 리뷰가 없어요!</p>
            </div>
            
            <%}else{ %>
            <!-- 작성한 리뷰가 있을때 -->
			<%for(int i=0; i<list.size();i++) { %>
            <div class="review-area">

                <div class="class-area">
                    <div class="classThumb">
                    
                        <img src="<%=contextPath%>/<%=list.get(i).getClThumb() %>" width="80px" height="80px">
                    </div>
                    
                    <div class="classText">
                        <div>
                            <p class="clName"><%=list.get(i).getClName() %></p>
                        </div>
                          	
                        <div>
                        	<%if(list.get(i).getReviewStar()==1){ %>
                        		⭐
                        	<%} else if(list.get(i).getReviewStar()==2){ %>
                        		⭐⭐
                        	<%} else if(list.get(i).getReviewStar()==3){ %>
                        		⭐⭐⭐
                        	<%} else if(list.get(i).getReviewStar()==4){ %>
                        		⭐⭐⭐⭐
                        	<%} else {%>
                        		⭐⭐⭐⭐⭐
                        	<%} %>
                        	
                        </div>
                    </div>
                    

                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="location.href='<%=contextPath%>/page.cl?no=<%=list.get(i).getClNo() %>'">
                    </div>
                </div>
               
               
                <hr style="margin:0%">
                <div class="review-content">
                    <p><%=list.get(i).getReviewDate() %></p>
                    <p class="revContent"><%=list.get(i).getReviewContent()%></p>

                </div>

                <div class="reviewThumb" align="center">
                    <img src="<%=list.get(i).getTitleImg()%>" width="220px" height="150px" style="border-radius:5px">
                </div>
                <script>
                    $(function(){
                    	$(".reviewThumb").click(function(){
                    		location.href="<%=contextPath%>/detail.rev?no=<%=list.get(i).getReviewNo()%>"
                    	})
                    })
               </script>
                
               
            </div> <!-- 리뷰div끝-->
			<%} %>
			<div class="paging-area" align="center" >
				<%if(rePi.getCurrentPage()!=1){ %>
				<button onclick="location.href='<%=contextPath%>/list.rev?cpage=<%=rePi.getCurrentPage()-1%>'">&lt;</button>
				<%} %>
				
				<%for(int p=rePi.getStartPage(); p<=rePi.getEndPage(); p++){ %>
					<button onclick="location.href='<%=contextPath%>/list.rev?cpage=<%=p%>'"><%= p %></button>
				<%} %>
				
				<%if(rePi.getCurrentPage()!=rePi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/list.rev?cpage=<%=rePi.getCurrentPage()+1%>'">&gt;</button>
				<%} %>
				</div>
          <%} %>
        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>