<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.admin.model.vo.TutorList, com.hp.lesson.model.vo.Lesson, com.hp.tutor.model.vo.Tutor" %>
<%
	Tutor t1 = (Tutor)request.getAttribute("t1");
	TutorList t2 = (TutorList)request.getAttribute("t2");
	ArrayList<Lesson> c = (ArrayList<Lesson>)request.getAttribute("cRList");
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

  <h3>비활성 클래스</h3>

  <br>
	<div class="tbBox">
	  <table class="table table-hover" id="tbd">
	    <thead class="table-dark">
	      <colgroup>
	        <col style="width:180px;">
	        <col style="width:350px;">
	        <col style="width:120px;">
	        <col style="width:120px;">
	        <col style="width:120px;">
	        <col style="width:180px;">
	      </colgroup>
	      <tr>
	        <th scope="col">카테고리</th>
	        <th scope="col">클래스명</th>
	        <th scope="col">신청일자</th>
	        <th scope="col">변경일자</th>
	        <th scope="col">클래스상태</th>
	        <th scope="col">반려사유</th>
	      </tr>
	    </thead>
	    <tbody>
	    <%if(c.isEmpty()) {%>
	    	<tr>
	    	<td colspan="6">비활성 클래스가 없습니다.</td></tr>
	    <%}else {%>
	    	<% for(int i=0;i<c.size(); i++) {%>
		    	<tr>
		        <td>
		        	<%=c.get(i).getCtName()%> > <%=c.get(i).getCtDname()%>
		        </td>
		        <td><%=c.get(i).getClName() %></td>
		        <td><%=c.get(i).getEnrollDate()%></td>
		        <td>
		        <%if(c.get(i).getUpdateDate()==null) {%>
		        	<%=c.get(i).getEnrollDate()%>
		        <%} else{%>
		        	<%=c.get(i).getUpdateDate()%>
		        <%} %>
		        </td>
		        <td>
				<%if(c.get(i).getClStatus().equals("1")) {%>
               		신청반려
               	<%} else if(c.get(i).getClStatus().equals("3")){%>
               		판매중지
               	<%} else if(c.get(i).getClStatus().equals("0")){%>
               		검수요청
               	<%} %>
				</td>  
		        <td>
					<%if(c.get(i).getClRefuse() !=null) {%>
						<%=c.get(i).getClRefuse() %>
					<%}else {%>
					 
					<%} %>
				</td>
		      </tr>
		      
		       
	      <%} %>
	    <%} %>
	    </tbody>
	  </table>
	
	</div>

    </div>
</body>
</html>