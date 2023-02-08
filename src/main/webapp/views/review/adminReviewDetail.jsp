<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.review.model.vo.Review, java.util.ArrayList, com.hp.common.model.vo.Attachment"%>
<% 
	Review r = (Review)request.getAttribute("r"); 
	ArrayList<Attachment> atList = (ArrayList<Attachment>)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
		width:1000px; margin:auto; padding:30px 50px;
	}	
	.content>*{font-size:small;}
    .review-table thead{text-align: center;}
    .review-table td{padding:10px;}
	.content img{width:100px; height:100px;}
</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>
    <div class="content" >
        <h5 style="font-weight: 600; font-size:18px"><b>후기 상세 조회</b></h5>
        <hr>
        	<div class="btn-area" align="right">
                <button class="btn btn-sm btn-secondary" id="list-btn" onclick="history.back();">목록</button>
                <% if(r.getReviewStatus().equals("등록")) {%>
                	<a class="btn btn-sm" id="del-btn" style="background:rgb(22, 160, 133); color:white;" href="<%=contextPath %>/deleteReview.ad?reNo=<%=r.getReviewNo()%>">삭제</a>
            	<% } %>
            </div>
            <br>
            <table class="review-table" border="1" align="center" width="100%">
            	<thead>
	                <tr>
	                    <th>클래스명</th>
	                    <td><%=r.getClName() %></td>
	                    <th>튜터명</th>
	                    <td><%=r.getTtName() %></td>
	                    <th>카테고리</th>
	                    <td width="110px"><%= r.getCtName() %></td>
	                    <th>등록상태</th>
	                    <td><%=r.getReviewStatus() %></td>
	                </tr>
                
	                <tr>
	                	<th>작성자</th>
	                    <td><%= r.getMemName() %></td>
	                    <th>별점</th>
	                    <td>
	                    	<%for(int i=1; i<=r.getReviewStar(); i++) {%>
	                    		⭐
	                    	<%} %>
	                    </td>
	                    <th>등록일</th>
	                    <td width="110px"><%= r.getReviewDate() %></td>
	                    <th>수정일</th>
	                    <td width="110px">
							<%if(r.getReviewUpDate()!=null) {%>
								<%= r.getReviewUpDate() %>
							<%}%>
						</td>
	                    
	                </tr>
                </thead>
                <tr>
                    <td colspan="10">
                        <p><%= r.getReviewContent() %></p><br>
                        <%for(int i=0; i<atList.size(); i++){%>
							<a href="<%= contextPath %>/<%=atList.get(i).getFilePath() %><%=atList.get(i).getChangeName() %>" data-toggle="lightbox" data-gallery="example-gallery"><img src="<%= contextPath %>/<%=atList.get(i).getFilePath() %><%=atList.get(i).getChangeName() %>" class="img-fluid"> </a>
						<% }%>
                        
                    </td>
                </tr>
                
            </table>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
			<script>
			$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			    event.preventDefault();
			    $(this).ekkoLightbox();
			});
			</script>
    </div> 




</body>
</html>