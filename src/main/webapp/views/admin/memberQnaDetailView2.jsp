<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Member, com.hp.qna.model.vo.Qna" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Qna> q = (ArrayList<Qna>)request.getAttribute("q");
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
.mdTable{
     font-size:14px;
     width:60%;
     border-color:black;
        }
 th{background-color:lightgray;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">
       <h3>1:1 문의</h3>
       <br>
       <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link" href="<%=contextPath%>/memQna1.ad?no=<%=m.getMemNo()%>">튜터 QnA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page">관리자 QnA</a>
        </li>
      </ul>


       	<div class="tbBox">
	  
	    <%if(q.isEmpty()) {%>
		    <table class="table table-hover" id="tbd">
		    <thead class="table-dark">
		      <colgroup>
		        <col style="width:80px;">
		        <col style="width:200px;">
		        <col style="width:400px;">
		        <col style="width:150px;">
		        <col style="width:150px;">
		      </colgroup>
		      <tr>
		        <th scope="col">Q.NO</th>
		        <th scope="col">카테고리</th>
		        <th scope="col">제목</th>
		        <th scope="col">작성일</th>
		        <th scope="col">답변여부</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<tr>
		    	<td colspan="6">작성한 문의가 없습니다.</td></tr>
		    </tbody>
	  	</table>
	    <%}else {%>
		    <table class="table table-hover" id="tbd">
		    <thead class="table-dark">
		      <colgroup>
		        <col style="width:80px;">
		        <col style="width:200px;">
		        <col style="width:400px;">
		        <col style="width:150px;">
		        <col style="width:150px;">
		      </colgroup>
		      <tr>
		        <th scope="col">Q.NO</th>
		        <th scope="col">카테고리</th>
		        <th scope="col">제목</th>
		        <th scope="col">작성일</th>
		        <th scope="col">답변여부</th>
		      </tr>
		    </thead>
		    <tbody>
	    	<% for(int i=0;i<q.size(); i++) {%>
	    	<table class="table table-hover" id="tbd">
	    
		      <colgroup>
		        <col style="width:80px;">
		        <col style="width:200px;">
		        <col style="width:400px;">
		        <col style="width:150px;">
		        <col style="width:150px;">
		      </colgroup>
		      
		    <tbody>
		    	<tr  data-toggle="modal" data-target="#myModal<%=i%>">
		        <td><%=q.get(i).getqNo() %></td>
		        <td>
		        	<%if((q.get(i).getqCategory()).equals("10")) {%>
				   		튜터
				   	<%}else if((q.get(i).getqCategory()).equals("20")) {%>
				   		결제/환불
				   	<%}else if((q.get(i).getqCategory()).equals("30")) {%>
				   		운영
				   	<%}else if((q.get(i).getqCategory()).equals("40")) {%>
				   		기타
				   	<%}%>
		        </td>
		        <td><%=q.get(i).getqTitle() %></td>
		        <td><%=q.get(i).getqDate() %></td>  
		        <td>
					<%if(q.get(i).getaContent()!=null) {%>
					<h5><span class="badge rounded-pill bg-success">완료</span></h5>
					<%}else {%>
					<h5><span class="badge rounded-pill bg-secondary">대기</span></h5>
					<%} %>
				</td>
		      </tr>
		      </tbody>
	  		</table>
	  		
		       <div class="modal" id="myModal<%=i%>">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h6 class="modal-title"></h6>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
				        <div class="container mt-3">
						   <table class="table table-bordered table-sm mdTable" id="mTb1">
							 <tr>
							 <td colspan='2' style='width:50%'><%=m.getMemId() %></td>
							 <td colspan='2'>
							 카테고리 :
							 <%if((q.get(i).getqCategory()).equals("10")) {%>
							   		튜터
							  <%}else if((q.get(i).getqCategory()).equals("20")) {%>
							   		결제/환불
							  <%}else if((q.get(i).getqCategory()).equals("30")) {%>
							   		운영
							  <%}else if((q.get(i).getqCategory()).equals("40")) {%>
							   		기타
							  <%}%>
							 </td>
							 </tr>
							 <tr>
							 <td style='width:75%' colspan='3'><%=q.get(i).getqTitle()%></td>
							 <td><%=q.get(i).getqDate()%></td>
							</tr>
							<tr style='height:150px' rowspan='4'>
							<td colspan='4'><%=q.get(i).getqContent()%></td>
							</tr>
					      </table>
					      <br><br>
					   <table class="table table-bordered table-sm mdTable" id="mTb2">
				          <%if(q.get(i).getaContent()!=null) {%>
					 	<tr>
					 	<td style='width:75%' colspan='3'><%=q.get(i).getaTitle()%></td>
					 	<td style='width:25%'><%=q.get(i).getaDate()%></td>
					 	</tr> 
				 	 <tr style='height:150px' rowspan='4'>
				 	 <td colspan='4'><%=q.get(i).getaContent()%></td>
				 	 </tr>
					
						 <%}%>
						          
						      </table>
		  				</div>
			      </div>
			    </div>
			  </div>
			</div>
	      <%} %>
	    <%} %>
	    
	
	</div>
	
	
	    	





    </div>

</body>
</html>