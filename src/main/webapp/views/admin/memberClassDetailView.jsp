<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Member, com.hp.register.model.vo.Register" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Register> r = (ArrayList<Register>)request.getAttribute("r");
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
.mdDiv{font-size:15px; text-align:left; padding:20px; width:80%; border-radius:5px; line-height: 200%}
 th{background-color:lightgray;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">
  <br>
  <h3><b><%=m.getMemName()%></b>님의 클래스 리스트</h3>

  

<div class="tbBox">
  <table class="table table-hover" id="tbd">
    <thead class="table-dark">
      <colgroup>
        <col style="width:80px;">
        <col style="width:150px;">
        <col style="width:450px;">
        <col style="width:120px;">
        <col style="width:150px;">
        <col style="width:120px;">
      </colgroup>
      <tr>
        <th scope="col">No</th>
        <th scope="col">카테고리</th>
        <th scope="col">클래스명</th>
        <th scope="col">신청인원</th>
        <th scope="col">수강일</th>
        <th scope="col">진행상태</th>
      </tr>
    </thead>
    <tbody>
    <%if(r.isEmpty()) {%>
    	<tr>
    	<td colspan="6">신청한 클래스가 없습니다.</td></tr>
    <%}else {%>
    	<% for(int i=0;i<r.size(); i++) {%>
	    	<tr onclick="modal();">
	        <td>
	        	<%=r.get(i).getRegNo() %>
	        </td>
	        <td><%=r.get(i).getCtName() %></td>
	        <td><%=r.get(i).getClName() %></td>
	        <td><%=r.get(i).getRegCount() %>명</td>
	        <td><%=r.get(i).getTeachDate() %></td>  
	        <td>
				<%if(r.get(i).getRegSta().equals("0")) {%>
					<h6><span class="badge rounded-pill bg-secondary">승인전</span></h6>
				<%}else if(r.get(i).getRegSta().equals("1")) {%>
					<h6><span class="badge rounded-pill bg-secondary">수강전</span></h6>
				<%}else if(r.get(i).getRegSta().equals("2")) {%>
					<h6><span class="badge rounded-pill bg-success">수강완료</span></h6>
				<%}else if(r.get(i).getRegSta().equals("3")) {%>
					<h6><span class="badge rounded-pill bg-danger">예약취소</span></h6>
				<%}else if(r.get(i).getRegSta().equals("4")) {%>
					<h6><span class="badge rounded-pill bg-danger">튜터거절</span></h6>
				<%} %>
			</td>
	      </tr>
	      
	        <script>
			   function modal(){
					 let pay = "";
				     <%if(r.get(i).getRegPay() == "0") {%>
					 	pay = "카드<br>";
				     <%}else {%>
				      	pay = "무통장<br>";
				     <%} %>
				     
				     let status = "";
				     <%if(r.get(i).getRegSta().equals("0")) {%>
				     	status = "승인전<br>";
					 <%}else if(r.get(i).equals("1")) {%>
						status = "수강전<br>";
					 <%}else if(r.get(i).getRegSta().equals("2")) {%>
						status ="수강완료<br>";
					 <%}else if(r.get(i).getRegSta().equals("3")) {%>
						status ="예약취소<br>";
					 <%}else if(r.get(i).getRegSta().equals("4")) {%>
						status = "튜터거절<br>";
					 <%} else {%>
					 	status ="<br>";
					 <%}%>
			    	 var dt = "";
					 dt += "- 카테고리 : " + "<%=r.get(i).getCtName()%>" + " > " + "<%=r.get(i).getCtDname()%><br>";
					 dt += "- 지역 : " + "<%=r.get(i).getLocalName()%>" + ", <%=r.get(i).getDistrName()%><br>";
					 dt += "- 클래스명 : " + "<%=r.get(i).getClName() %><br>";
					 dt += "- 튜터명 : " + "<%=r.get(i).getMemName()%><br>";
					 dt += "- 신청일 : " + "<%=r.get(i).getRegDate() %><br>";
					 dt += "- 수강일 : " + "<%=r.get(i).getTeachDate() %>" + ", <%=r.get(i).getStartTime()%> - <%=r.get(i).getEndTime()%><br>";
					 dt += "- 신청인원 : " + "<%=r.get(i).getRegCount() %>명 <br>";
					 dt += "- 결제수단 : " + pay;					 
				     dt += "- 진행상태 : " + status;
				     
					dt += "- 후기작성여부 : " + "<%=r.get(i).getReEnroll() %><br>";
					 
					 $(".mdDiv").html(dt);
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
			        <div class="mdDiv">
			        	  
					      
	  				</div>
		      </div>
		    </div>
		  </div>
		</div>
 







    </div>
</body>
</html>