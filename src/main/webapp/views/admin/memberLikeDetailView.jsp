<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Like, com.hp.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Like> l = (ArrayList<Like>)request.getAttribute("l");
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
  <h3><b><%=m.getMemName()%></b>님이 찜한 클래스😍</h3>

  

<div class="tbBox">
  <table class="table table-hover" id="tbd">
    <thead class="table-dark">
      <colgroup>
        <col style="width:300px;">
        <col style="width:500px;">
        <col style="width:150px;">
        <col style="width:150px;">
      </colgroup>
      <tr>
        <th scope="col">카테고리</th>
        <th scope="col">클래스명</th>
        <th scope="col">튜터명</th>
        <th scope="col">찜한날짜</th>
      </tr>
    </thead>
    <tbody>
    <%if(l.isEmpty()) {%>
    	<tr>
    	<td colspan="4">찜한 클래스가 없습니다.</td></tr>
    <%}else {%>
    	<% for(int i=0;i<l.size(); i++) {%>
	    	<tr>
	        <td>
	        	<%=((Like)l.get(i)).getCtName() %>><%= ((Like)l.get(i)).getCtDname() %>
	        </td>
	        <td><%= ((Like)l.get(i)).getClName() %></td>
            <td><%= ((Like)l.get(i)).getTtName() %></td>
            <td><%= ((Like)l.get(i)).getLikeDate() %></td>
	      </tr>
	      
      <%} %>
    <%} %>
    </tbody>
  </table>

</div>




    </div>
</body>
</html>