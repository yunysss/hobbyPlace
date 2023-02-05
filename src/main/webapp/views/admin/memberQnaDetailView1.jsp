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
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">

  <h3>1:1 문의</h3>

  <br>
  
  <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">튜터 QnA</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">관리자 QnA</a>
  </li>
</ul>

<div class="tbBox">
  <table class="table" id="tbd">
    <thead>
      <colgroup>
        <col style="width:80px;">
        <col style="width:120px;">
        <col style="width:200px;">
        <col style="width:400px;">
        <col style="width:150px;">
        <col style="width:150px;">
      </colgroup>
      <tr>
        <th scope="col">Q.NO</th>
        <th scope="col">튜터이름</th>
        <th scope="col">클래스이름</th>
        <th scope="col">제목</th>
        <th scope="col">작성일</th>
        <th scope="col">답변여부</th>
      </tr>
    </thead>
    <tbody>
    <%if(q.isEmpty()) {%>
    	<tr>
    	<td colspan="6">작성한 문의가 없습니다.</td></tr>
    <%}else {%>
    	<% for(int i=0;i<q.size(); i++) {%>
	    	<tr>
	        <td>
	        	<%=q.get(i).getqNo() %>
	        </td>
	        <td><%=q.get(i).getaMemNick() %></td>
	        <td><%=q.get(i).getClName() %></td>
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
      <%} %>
    <%} %>
    </tbody>
  </table>
  <script>
    $(function(){
       $("#tbd").on("click", "tr", function(){
         location.href = '<%=contextPath%>/memDetail.ad?no=' + $(this).children().eq(0).text(); 
           })
    })
  </script>
</div>

     




    </div>
</body>
</html>