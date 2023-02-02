<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
   page import= "java.util.ArrayList, com.hp.lesson.model.vo.Lesson, com.hp.common.model.vo.PageInfo"
%>    
    
<%
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String category = (String)request.getAttribute("category");
	String dcategory = (String)request.getAttribute("dcategory");
	String sido = (String)request.getAttribute("sido");
	String sigungu = (String)request.getAttribute("sigungu");
	String price = (String)request.getAttribute("price");
	String day = (String)request.getAttribute("day");
	int count = (int)request.getAttribute("count");
	

	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
 <style>
.outer {
	width: 1000px;
	margin: auto;
}

h4>a {
	color: rgb(65, 64, 64);
	margin-right: 5px;
	text-decoration: none;
	font-size: 20px;
	font-weight: 550;
}

h4>a:hover {
	text-decoration: none;
	cursor: pointer;
	color: rgb(35, 104, 116);
}

.thumbnail {
	width: 190px;
	display: inline-block;
	margin: 10px;
	text-align: left;
}

#detail-category a {
	color: rgb(65, 64, 64);
	font-size: 12px;
	margin-right: 5px;
}

#detail-category a:hover {
	cursor: pointer;
	color: black;
	font-size: 12.5px;
}

#button-area {
	margin-top: 10px;
}

#btn-area {
	display: inline-block;
	width: 770px;
	text-align: right;
}

#btn-area>button {
	width: 60px;
	height: 30px;
	line-height: 10px;
	background-color: rgb(35, 104, 116);
	border: none;
	font-size: 13px;
	color: whitesmoke;
	border-radius: 5px;
}

#btn-area>button:hover {
	background-color: rgba(35, 104, 116, 0.685);
}

#thumbnail img {
	border-radius: 5px;
}

.paging-area {
	text-align: center;
}

.paging-area>* {
	border: none;
	border-radius: 3px;
}

#thumbnail img, .a img {
	border-radius: 5px;
}
#thumbnail:hover {
		opacity:0.8;
	}
	
img:hover{
	opacity:0.8;
}
.dropdown {
	display: inline;
}

.dropdown-menu a {
	font-size: 12px;
}

.pop {
	width: 30px
}

.a {
	width: 190px;
	display: inline-block;
	margin: 10px;
	text-align: left;
	box-sizing: border-box;
}

#clName {
	height: 50px;
}

#range img {
	margin-left: 10px;
	margin-right: 10px;
}

a {
	text-decoration: none !important;
	color: black !important;
}
</style>
</head>
<body>
<%@include file="../common/tuteeMenubar.jsp" %>
 <div class="outer">
 	<%if (list.isEmpty()) {%>
 		<div align="center">
  		<h5> 검색된 클래스가 없습니다.🥲</h5>
  		</div>
  		<%} else {%>
        <h4> <a href=""><%=keyword%> 검색결과</a><span class="material-symbols-outlined symbol">expand_more</span></h4>
       <!-- 
        <div id="button-area">
             <div class="dropdown">
            <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown">
              지역
            </button>
            <div class="dropdown-menu region">
              <a class="dropdown-item" href="#" data-value="서울">서울</a>
              <a class="dropdown-item" href="#" data-value="인천">인천</a>
              <a class="dropdown-item" href="#"data-value="경기">경기</a>
            </div>
            </div>
            <div class="dropdown">
              <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown">
                일정
              </button>
              <div class="dropdown-menu schedule">
                <a class="dropdown-item" href="#">평일</a>
                <a class="dropdown-item" href="#">주말</a>
                <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="#">오전</a>
                <a class="dropdown-item" href="#">오후</a>
               </div>
              </div>
    
        </div>
 --> 
        <br><br>
        <span style="font-size: 12px; font-weight: 550; color: rgb(75, 72, 72);">검색결과 <%=count%> 건</span>
        <div id="btn-area">
         <div class="dropdown">
		    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		      정렬
		    </button>
		    <div class="dropdown-menu price">
		      <a class="dropdown-item" onclick="rowPrice();">낮은가격순</a>
		      <a class="dropdown-item" onclick="highPrice();">높은가격순</a>
		      <a class="dropdown-item" onclick="highReg();">인기순</a>
		      <a class="dropdown-item" onclick="highStar();">평점순</a>
		      
		    </div>
       	 </div>
        </div>


		<div class="container">

			<div class="list-area">
				<div id="area1"></div>

				<% for(Lesson l : list) {%>
				<table class="thumbnail">
					<input type="hidden" value="<%=l.getClNo()%>">
					<tr>
						<td>
							<div id="thumbnail">
								<img src="<%=contextPath%>/<%=l.getClThumb()%>" width="180"
									height="180">

							</div>
						</td>
					</tr>
					<tr>
						<td style="font-size: 11px;"><%=l.getDistrCode()%></td>
					</tr>
					<tr>
						<th height="50px"><%=l.getClName()%></th>
					</tr>

					<tr>
						<th><%=l.getClPrice()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>⭐<%=l.getClStarAvg() + ".0(" + l.getClStarCount()%>)
						</small></th>
					</tr>

				</table>
				<%} %>

			</div>
		</div>	
			<script>
              	$(function(){
              		$(".thumbnail").click(function(){
              			location.href="<%=contextPath%>/page.cl?no="+ $(this).children('input').val();
						})
				})
			</script>
	<%} %>
			<div class="paging-area">
                                                                              
				<%if (pi.getCurrentPage() != 1) {%>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=pi.getCurrentPage() - 1%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%>';">&lt;</button>
				<%}%>

				<%for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=p%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%> ';"><%= p %></button>
				<%} %>

				<%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=pi.getCurrentPage()+1%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%>';">&gt;</button>
				<%} %>

			</div>


	</div>
		<%@ include file="../common/footerbar.jsp" %>



</body>
</html>