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
</head>
<body>

</body>
</html>