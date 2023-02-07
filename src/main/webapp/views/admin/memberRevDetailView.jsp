<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Member, com.hp.review.model.vo.Review" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Review> r = (ArrayList<Review>)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
div{box-sizing:border-box;}
.tbBox{margin-top:50px; margin-left:20px;}
table{text-align: center; font-size:13px;}
.modal-body{align:center;}
.mdDiv{font-size:15px; text-align:left; padding-left:30px; width:80%; border-radius:5px; line-height: 200%}
th{background-color:lightgray;}
.modal-dialog.modal-del {
  width: 400px;
  height: 150px;
  margin: auto;
  margin-top:200px;
  padding: 0;
}
#deleteBt{height:38px; border:0; border-radius:5px; width:60px; background-color:rgb(219, 53, 53); color:white; margin-right:15px; margin-left:80px;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">
  <br>
  <h3><b><%=m.getMemName()%></b>님의 리뷰 리스트</h3>

  

<div class="tbBox">
  <table class="table table-hover" id="tbd">
    <thead class="table-dark">
      <colgroup>
        <col style="width:80px;">
        <col style="width:300px;">
        <col style="width:600px;">
        <col style="width:120px;">
        <col style="width:230px;">
        <col style="width:120px;">
      </colgroup>
      <tr>
        <th scope="col">No</th>
        <th scope="col">클래스</th>
        <th scope="col">내용</th>
        <th scope="col">평점</th>
        <th scope="col">작성일</th>
        <th scope="col">관리</th>
      </tr>
    </thead>
    <tbody>
    <%if(r.isEmpty()) {%>
    	<tr>
    	<td colspan="6">작성한 리뷰가 없습니다.</td></tr>
    <%}else {%>
    	<% for(int i=0;i<r.size(); i++) {%>
	    	<tr>
	        <td><%=r.get(i).getReviewNo()%></td>
	        <td>
	        <%if(r.get(i).getClName().length()>12) {%>
            		<%=r.get(i).getClName().substring(0, 11) %>...
            <%}else {%>
            	<%= r.get(i).getClName() %>
            <%} %>
	       
	        </td>
	        <td><%=r.get(i).getReviewContent() %></td>
	        <%if(r.get(i).getReviewStar()==5){ %>
	        	<td>⭐⭐⭐⭐⭐</td>
	        <%}else if(r.get(i).getReviewStar()==4){ %>
	        	<td>⭐⭐⭐⭐</td>
	        <%}else if(r.get(i).getReviewStar()==3){ %>
	        	<td>⭐⭐⭐</td>
	        <%}else if(r.get(i).getReviewStar()==2){ %>
	        	<td>⭐⭐</td>
	        <%} else if(r.get(i).getReviewStar()==1){ %>
	        	<td>⭐</td>
	        <%} %>

	        <%if(r.get(i).getReviewUpDate()==null){ %>
	        	<td><%=r.get(i).getReviewDate() %></td>
	        <%}else { %>
	        	<td>(수정됨)<%=r.get(i).getReviewDate() %></td>
	        <%} %>  
	        <td><button type="button" class="btn btn-outline-warning" onclick="modal();">삭제</button></td>
	      </tr>
	      
	        <script>
			   function modal(){
					 let dt = "";
				    dt += "해당 리뷰를 정말로 삭제하시겠습니까?<br><br>";
				   	dt += "<button id='deleteBt' onclick='delRev();'>삭제</button>";
				   	dt += "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>";
					 $(".mdDiv").html(dt);
					 $(".modal-title").html("악성리뷰 관리");
			         $("#myModal").modal('show');
			    }
			   
			   
        		 function delRev(){
        			 location.href='<%=contextPath%>/deleteReviewMem.ad?no=<%=r.get(i).getReviewNo()%>&mem=<%=m.getMemNo()%>'; 
        		 }
			 </script>
      <%} %>
    <%} %>
    </tbody>
  </table>

</div>
    	<div class="modal" id="myModal">
		  <div class="modal-dialog modal-del">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h6 class="modal-title"></h6>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
			        <div class="mdDiv">
			        	  
					      
	  				</div>
		      </div>
		    </div>
		  </div>
		</div>
    </div>

</body>
</html>