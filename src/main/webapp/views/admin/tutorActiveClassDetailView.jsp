<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.admin.model.vo.TutorList, com.hp.lesson.model.vo.Lesson, com.hp.tutor.model.vo.Tutor, com.hp.member.model.vo.Like, com.hp.qna.model.vo.Qna, com.hp.member.model.vo.Member, com.hp.review.model.vo.Review, com.hp.register.model.vo.Register" %>
<%
	Tutor t1 = (Tutor)request.getAttribute("t1");
	TutorList t2 = (TutorList)request.getAttribute("t2");
	ArrayList<Review> cr = (ArrayList<Review>)request.getAttribute("clRevList");
	ArrayList<Like> cl = (ArrayList<Like>)request.getAttribute("clLikeList");
	ArrayList<Qna> a = (ArrayList<Qna>)request.getAttribute("aList");
	ArrayList<Qna> q = (ArrayList<Qna>)request.getAttribute("qList");
	ArrayList<Lesson> c = (ArrayList<Lesson>)request.getAttribute("cAList");
	ArrayList<Review> r = (ArrayList<Review>)request.getAttribute("revList");
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
.clBox{width:800px; padding:20px; margin-bottom:30px; border:1px solid lightgray; border-radius: 10px;}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap" align="center">
	
	  <h3 align="left"><b><%=t1.getTtName()%></b>님이 진행중인 클래스</h3>
	  <br clear="both">
	
	  <%if(c.isEmpty()) {%>
	    	<p>운영중인 클래스가 없습니다.</p>
	    <%}else {%>
	    	<% for(int i=0;i<c.size(); i++) {%>
			  <div class="clBox" align="left">
				<table>
					<tr>
						<td rowspan="7">
							<img src="<%=contextPath%>/<%=c.get(i).getClThumb()%>" style="width:150px; height:150px; margin-right:20px; border-radius:5px;">
						</td>
						<td style="font-size:13px;">
							<%=((Lesson)c.get(i)).getCtName() %> > <%=((Lesson)c.get(i)).getCtDname() %> <br>
						</td>
					</tr>
					<tr>
						<td id="clName" style="font-size:17px;">
							<b><%=((Lesson)c.get(i)).getClName() %></b>
						</td>
					</tr>
					<tr>
						<td style="font-size:13px;">
							<%=((Lesson)c.get(i)).getClAddress() %>
						</td>
					</tr>
					<tr>
						<td>
							<%=((Lesson)c.get(i)).getStartDate() %> ~ <%=((Lesson)c.get(i)).getEndDate() %>
						</td>
					</tr>
					<tr>
						<td><%=((Lesson)c.get(i)).getClSchedule() %> <%=((Lesson)c.get(i)).getClDay() %> <%=((Lesson)c.get(i)).getClTimes() %>회</td>
					</tr>
					<tr>
						<td>
						💰<%=((Lesson)c.get(i)).getClPrice() %>&nbsp;&nbsp;
						⭐<%=c.get(i).getClStarAvg()%>&nbsp;(<%=c.get(i).getReviewCount() %>)&nbsp;&nbsp;
						❤️
						<%if(cl.isEmpty()){%>
						0
						<%}else{ %>
						<%=((Like)cl.get(i)).getLikeCount() %>
						<%} %>
						</td>
					</tr>
					<tr>
						<td>
						✏️ 
						<%if(cr.isEmpty()){%>
							0
						<%}else{ %>
							<%=((Review)cr.get(i)).getReviewNo() %>
						<%} %>
						</td>
					</tr>
				</table>
		
			  </div>
			<%} %>
		
		<%} %>
	
	
	
	
	</div>
</body>
</html>