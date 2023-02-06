<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.admin.model.vo.TutorList, com.hp.tutor.model.vo.Tutor, com.hp.qna.model.vo.Qna" %>
<%
	Tutor t1 = (Tutor)request.getAttribute("t1");
	TutorList t2 = (TutorList)request.getAttribute("t2");
	ArrayList<Qna> a = (ArrayList<Qna>)request.getAttribute("a");
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
        }
 th{background-color:lightgray;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">

  <h3><b><%=t1.getTtName()%></b>님이 받은 문의</h3>

  <br>
	<div class="tbBox">
	  <table class="table table-hover" id="tbd">
	    <thead class="table-dark">
	      <colgroup>
	        <col style="width:80px;">
	        <col style="width:100px;">
	        <col style="width:350px;">
	        <col style="width:250px;">
	        <col style="width:150px;">
	        <col style="width:150px;">
	      </colgroup>
	      <tr>
	        <th scope="col">No</th>
	        <th scope="col">질문자</th>
	        <th scope="col">클래스이름</th>
	        <th scope="col">제목</th>
	        <th scope="col">작성일</th>
	        <th scope="col">답변여부</th>
	      </tr>
	    </thead>
	    <tbody>
	    <%if(a.isEmpty()) {%>
	    	<tr>
	    	<td colspan="6">받은 문의가 없습니다.</td></tr>
	    <%}else {%>
	    	<% for(int i=0;i<a.size(); i++) {%>
		    	<tr onclick="modal();">
		        <td>
		        	<%=a.get(i).getqNo() %>
		        </td>
		        <td><%=a.get(i).getaMemNick() %></td>
		        <td><%=a.get(i).getClName() %></td>
		        <td><%=a.get(i).getqTitle() %></td>
		        <td><%=a.get(i).getqDate() %></td>  
		        <td>
					<%if(a.get(i).getaContent()!=null) {%>
					<h5><span class="badge rounded-pill bg-success">완료</span></h5>
					<%}else {%>
					<h5><span class="badge rounded-pill bg-secondary">대기</span></h5>
					<%} %>
				</td>
		      </tr>
		      
		        <script>
				   function modal(){
				    	 var dt = "";
						 dt += "<tr><td style='width:25%'>" + "<%=a.get(i).getaMemNick() %>" + "</td><td colspan='3'>";
						 dt += "<%=a.get(i).getClName() %>" + "</td></tr><tr><td style='width:75%' colspan='3'>";
						 dt += "<%=a.get(i).getqTitle()%>" + "</td><td>" + "<%=a.get(i).getqDate()%>" + "</td>";
						 dt += "</tr><tr style='height:150px;' rowspan='4'><td colspan='4'>" + "<%=a.get(i).getqContent()%>" + "</td></tr>";
						 
						 <%if(a.get(i).getaContent()!=null) {%>
							 var dv = "";
							 dv +="<tr><td style='width:75%' colspan='3'>" + "<%=a.get(i).getaTitle()%>" + "</td><td style='width:25%'>";
							 dv +="<%=a.get(i).getaDate()%>" + "</td></tr>"; 
						 	 dv +="<tr style='height:150px;'rowspan='4'><td colspan='4'>" + "<%=a.get(i).getaContent()%>" + "</td></tr>";
							$("#mTb2").html(dv);
						 <%}%>
						 
						 $("#mTb1").html(dt);
						 $(".modal-title").html("상세내용");
				         $("#myModal").modal('show');
				    }
				 </script>
	      <%} %>
	    <%} %>
	    </tbody>
	  </table>
	
	</div>
	
	
	    	<div class="modal" id="myModal">
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
				        	  
						      <table class="table table-bordered border-success rounded" id="mTb1">
						          
						          
						      </table>
						      <br><br>
						      
						      <table class="table table-bordered border-success rounded" id="mTb2">
						          
						          
						      </table>
		  				</div>
			      </div>
			    </div>
			  </div>
			</div>
 







    </div>
</body>
</html>