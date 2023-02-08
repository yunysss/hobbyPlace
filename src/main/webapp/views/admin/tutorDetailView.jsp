<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.admin.model.vo.TutorList, com.hp.lesson.model.vo.Lesson, com.hp.tutor.model.vo.Tutor, com.hp.member.model.vo.Like, com.hp.qna.model.vo.Qna, com.hp.member.model.vo.Member, com.hp.review.model.vo.Review, com.hp.register.model.vo.Register" %>
<%
	Tutor t1 = (Tutor)request.getAttribute("t1");
	TutorList t2 = (TutorList)request.getAttribute("t2");
	ArrayList<Review> clRevList = (ArrayList<Review>)request.getAttribute("clRevList");
	ArrayList<Like> clLikeList = (ArrayList<Like>)request.getAttribute("clLikeList");
	ArrayList<Qna> aList = (ArrayList<Qna>)request.getAttribute("aList");
	ArrayList<Qna> qList = (ArrayList<Qna>)request.getAttribute("qList");
	ArrayList<Lesson> cAList = (ArrayList<Lesson>)request.getAttribute("cAList");
	ArrayList<Lesson> cWList = (ArrayList<Lesson>)request.getAttribute("cWList");
	ArrayList<Lesson> cRList = (ArrayList<Lesson>)request.getAttribute("cRList");
	ArrayList<Review> revList = (ArrayList<Review>)request.getAttribute("revList");
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
	/*div{border:solid 1px black;}*/
    h4{margin:10px;}
    .memImg{float:left;}
    .memInfo{
        float:left;
        margin-left:25px;
    }
    #profile1{font-size:20px; font-weight:800;}
    .ctTitle{float:left; margin-left:20px; font-size:17px; font-weight:600;}
    .viewMore{float:left; margin-left:50px;}
    .viewMore:hover{cursor:pointer;}
    .tbList{clear:both; text-align: center; margin-left:15px;}
    #activeClass{clear:both; text-aligh:left; margin-left:30px;}
    .listTable td {text-align: center;}
    .thd{text-align: center; border-bottom: 1px solid #444444;}	
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap">
        <h3>회원 상세 조회</h3>

		<div class="memProfile" align="left">
            <div class="memImg">
				<%if(t1.getTtProfile()!=null) {%>
					<img src="<%=contextPath%>/<%=t1.getTtProfile()%>" style="width:100px; height:100px; margin-top:30px;" class="rounded-circle loadedProfile">
				<%}else{ %>
                	<img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" style="width:100px; height:100px;" class="rounded-circle loadedProfile">
            	<%} %>
            </div>
            <div class="memInfo">
                <p id="profile1"><%=t2.getMemName() %> &nbsp; <%=t2.gettutorName() %></p>
                <table>
                    <colgroup>
                        <col style="width:150px;">
                        <col style="width:600px;">
                    </colgroup>
                    <tr>
                        <td>회원번호</td>
                        <td><%=t1.getMemNo() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>아이디</td>
                        <td><%=t2.getMemId() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>연락처</td>
                        <td><%=t1.getPubPhone() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>이메일</td>
                        <td><%=t1.getTtEmail() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>클래스 주소</td>
                        <td><%=t2.getTutorAddress() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>클래스 카테고리</td>
                        <td> 
                        	<%if(cAList.isEmpty()){ %>
                        	 	현재 운영중인 클래스 없음
                        	<%} else {%>
                        		<% for(int i=0; i<cAList.size(); i++) {%>
                        			<b><%=((Lesson)cAList.get(i)).getClName() %></b> &nbsp;&nbsp;
                        			<%=((Lesson)cAList.get(i)).getCtName() %> >
                        			<%=((Lesson)cAList.get(i)).getCtDname() %> <br>
                        		<%} %>
                        	<%} %>
                        	
                        	
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>튜터 등록일</td>
                        <td><%=t1.getEnrollDate() %></td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>총 정산금액</td>
                        <td><%=t2.getIncomeTotal() %>원</td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>누적 후기</td>
                        <td>
                        	<%if(clRevList.isEmpty()){ %>
                        	 	없음
                        	<%} else {%>
                        		<% for(int i=0; i<clRevList.size(); i++) {%>
                        			<%=((Review)clRevList.get(i)).getClName() %> &nbsp;:&nbsp;
                        			<%=((Review)clRevList.get(i)).getReviewNo() %> 개 <br>
                        			 <br>
                        		<%} %>
                        	<%} %>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>클래스별 찜</td>
                        <td>
							<%if(clLikeList.isEmpty()){ %>
                        	 	없음
                        	<%} else {%>
                        		<% for(int i=0; i<clLikeList.size(); i++) {%>
                        			<%=((Like)clLikeList.get(i)).getClName() %> &nbsp;&nbsp; ❤️
                        			<%=((Like)clLikeList.get(i)).getLikeCount() %><br>
                        		<%} %>
                        	<%} %>
						</td>
                    </tr>
                </table>
            </div>
        </div>

        <br clear="both"><br><br><br>

        <div class="qnaList">
            <p class="ctTitle">받은 1:1 문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p class="viewMore" onclick="aViewMore();">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:400px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr class="thd">
                        <th>질문자</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
					<% if(aList.isEmpty()){ %>
		                <tr>
		                    <td colspan="4">받은 문의가 없습니다.</td>
		                </tr>
					<% }else if(aList.size() <= 3) {%>
							<% for(int i=0; i<aList.size(); i++) { %>
				                <tr>
				                    <td>
				                    	<%=((Qna)aList.get(i)).getaMemNick() %>
				                    </td>
				                    <td><%=((Qna)aList.get(i)).getqTitle() %></td>
				                    <td><%=((Qna)aList.get(i)).getqDate()  %></td>
				                    <td>
				                    <% if(((Qna)aList.get(i)).getaTitle()==null) { %>
				                    	답변대기
				                    <%}else {%>
				                    	답변완료
				                    <%} %>
				                    </td>
			               		</tr>
		                	<% } %>
		                	
						<%} else if(aList.size() > 3) {%>
							<% for(int i=0; i<3; i++) { %>
				                <tr>
				                    <td>
				                    	<%=((Qna)aList.get(i)).getaMemNick() %>
				                    </td>
				                    <td><%=((Qna)aList.get(i)).getqTitle() %></td>
				                    <td><%=((Qna)aList.get(i)).getqDate()  %></td>
				                    <td>
				                    <% if(((Qna)aList.get(i)).getaTitle()==null) { %>
				                    	답변대기
				                    <%}else {%>
				                    	답변완료
				                    <%} %>
				                    </td>
				                </tr>
		                	<% } %>
						<%} %>
		                
	                
                </table>   
            </div>
        </div>

        <br><br><br>
        
        <div class="qnaList">
            <p class="ctTitle">작성한 1:1 문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p class="viewMore" onclick="qViewMore();">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:400px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr class="thd">
                        <th>카테고리</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
					<tbody>
						<% if(qList.isEmpty()){ %>
			                <tr>
			                    <td colspan="4">받은 문의가 없습니다.</td>
			                </tr>
						<% }else if(qList.size() <= 3) {%>
								<% for(int i=0; i<qList.size(); i++) { %>
					                <tr>
					                    <td>
					                    	<%if(((Qna)qList.get(i)).getqCategory().equals("10")) {%>
										   		튜터
										   	<%}else if(((Qna)qList.get(i)).getqCategory().equals("20")) {%>
										   		결제/환불
										   	<%}else if(((Qna)qList.get(i)).getqCategory().equals("30")) {%>
										   		운영
										   	<%}else if(((Qna)qList.get(i)).getqCategory().equals("40")) {%>
										   		기타
										   	<%}%>
					                    </td>
					                    <td><%=((Qna)qList.get(i)).getqTitle() %></td>
					                    <td><%=((Qna)qList.get(i)).getqDate()  %></td>
					                    <td>
					                    <% if(((Qna)qList.get(i)).getaTitle()==null) { %>
					                    	답변대기
					                    <%}else {%>
					                    	답변완료
					                    <%} %>
					                    </td>
				               		</tr>
			                	<% } %>
			                	
							<%} else if(qList.size() > 3) {%>
								<% for(int i=0; i<3; i++) { %>
					                <tr>
					                    <td>
					                    	<%if((((Qna)qList.get(i)).getqCategory()).equals("10")) {%>
										   		튜터
										   	<%}else if((((Qna)qList.get(i)).getqCategory()).equals("20")) {%>
										   		결제/환불
										   	<%}else if((((Qna)qList.get(i)).getqCategory()).equals("30")) {%>
										   		운영
										   	<%}else if((((Qna)qList.get(i)).getqCategory()).equals("40")) {%>
										   		기타
										   	<%}%>
					                    </td>
					                    <td><%=((Qna)qList.get(i)).getqTitle() %></td>
					                    <td><%=((Qna)qList.get(i)).getqDate()  %></td>
					                    <td>
					                    <% if(((Qna)qList.get(i)).getaTitle()==null) { %>
					                    	답변대기
					                    <%}else {%>
					                    	답변완료
					                    <%} %>
					                    </td>
					                </tr>
			                	<% } %>
							<%} %>
				                
					</tbody>
                </table>   
            </div>
        </div>


        <br><br><br> 
        
        <div>
            <p class="ctTitle">진행중인 클래스</p>
            <p class="viewMore" onclick="clViewMore1();">전체보기>></p>  
            <div id="activeClass">
            	<%if(cAList.isEmpty()){ %>
            	진행중인 클래스 없음
            	<%}else{ %>
            	<table>
            		<%for(int i=0;i<cAList.size(); i++) {%>
	            	<tr>
	            		<th rowspan="2">
	            			<img src="<%=contextPath%>/<%=cAList.get(i).getClThumb()%>" style="width:50px; height:50px;">	
	            		</th>
	            		<td>
	            			<%=cAList.get(i).getLocalCode() %> 
	            			<%=cAList.get(i).getDistrCode() %> &nbsp;&nbsp;
	            			⭐<%=cAList.get(i).getClStarAvg() %>
	            			(<%=cAList.get(i).getReviewCount() %>)
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			<%=cAList.get(i).getClName() %>
	            		</td>
	            	</tr>
	            	<tr><td></td><td></td></tr>
	            	<tr><td></td><td></td></tr>
	            	<%} %>
	            </table>
	            <%} %>
            </div>                  	
        </div>       
        
        <br><br><br>
        
        <div>
            <p class="ctTitle">비활성 클래스</p>
            <p class="viewMore" onclick="clViewMore2();">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:400px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr class="thd">
                        <th>카테고리</th>
                        <th>클래스명</th>
                        <th>신청일자</th>
                        <th>비활성사유</th>
                    </tr>
                    <tbody>
                       <% if(cRList.isEmpty()){ %>
			                <tr>
			                    <td colspan="4">비활성 클래스가 없습니다.</td>
			                </tr>
						<% }else if(cRList.size() <= 3) {%>
								<% for(int i=0; i<cRList.size(); i++) { %>
					                <tr>
					                    <td>
					                    	<%=cRList.get(i).getCtName()%> > <%=cRList.get(i).getCtDname()%>
					                    </td>
					                    <td>
					                    	<%=cRList.get(i).getClName() %>
					                    </td>
					                    <td>
					                    	<%=cRList.get(i).getEnrollDate() %>
					                    </td>
					                    <td>
					                    	<%if(cRList.get(0).getClStatus().equals("1")) {%>
					                    		신청반려
					                    	<%} else if(cRList.get(0).getClStatus().equals("3")){%>
					                    		판매중지
					                    	<%} else if(cRList.get(0).getClStatus().equals("0")){%>
					                    		검수요청
					                    	<%} %>
					                    </td>
				               		</tr>
			                	<% } %>
			                	
							<%} else if(cRList.size() > 3) {%>
								<% for(int i=0; i<3; i++) { %>
					                <tr>
					                    <td>
					                    	<%=cRList.get(i).getCtName()%> > <%=cRList.get(i).getCtDname()%>
					                    </td>
					                    <td>
					                    	<%=cRList.get(i).getClName() %>
					                    </td>
					                    <td>
					                    	<%=cRList.get(i).getEnrollDate() %>
					                    </td>
					                    <td>
					                    	<%if(cRList.get(0).getClStatus().equals("1")) {%>
					                    		신청반려
					                    	<%} else if(cRList.get(0).getClStatus().equals("3")){%>
					                    		판매중지
					                    	<%} else if(cRList.get(0).getClStatus().equals("0")){%>
					                    		검수요청
					                    	<%} %>
					                    </td>
					                </tr>
			                	<% } %>
							<%} %>
				                
                    </tbody>
                </table>   
            </div>
        </div>        

        <br><br><br>

        <div>
            <p class="ctTitle">받은 후기</p>
            <p class="viewMore" onclick="revViewMore();">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:100px;">
                        <col style="width:200px;">
                        <col style="width:450px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr class="thd">
                    	<th>평점</th>
                        <th>클래스명</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                    <tbody>
                        <% if(revList.isEmpty()){ %>
			                <tr>
			                    <td colspan="4">받은 문의가 없습니다.</td>
			                </tr>
						<% }else if(revList.size() <= 3) {%>
								<% for(int i=0; i<revList.size(); i++) { %>
					                <tr>
					                    <td>
					                    	<%=revList.get(i).getReviewStar()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getClName()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getReviewContent()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getMemNickName() %>
					                    </td>
					                    <td>
					                    	<%if(revList.get(i).getReviewUpDate()==null){ %>
					                    		<%=revList.get(i).getReviewDate() %>
					                    	<%}else{ %>
					                    		<%=revList.get(i).getReviewUpDate() %>
					                    	<%} %>
					                    </td>
				               		</tr>
			                	<% } %>
			                	
							<%} else if(revList.size() > 3) {%>
								<% for(int i=0; i<3; i++) { %>
					                <tr>
					                    <td>
					                    	<%=revList.get(i).getReviewStar()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getClName()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getReviewContent()%>
					                    </td>
					                    <td>
					                    	<%=revList.get(i).getMemNickName() %>
					                    </td>
					                    <td>
					                    	<%if(revList.get(i).getReviewUpDate()==null){ %>
					                    		<%=revList.get(i).getReviewDate() %>
					                    	<%}else{ %>
					                    		<%=revList.get(i).getReviewUpDate() %>
					                    	<%} %>
					                    </td>
				               		</tr>
			                	<% } %>
							<%}%>
				                
                    </tbody>
                </table>   
            </div>
        </div>

        <br><br><br>



        <br><br><br><br><br><br>
	</div>
<script>
		function aViewMore(){
			location.href = "<%=contextPath%>/ttQna1.ad?no=<%=t1.getMemNo()%>";
		}
		function qViewMore(){
			location.href = "<%=contextPath%>/ttQna2.ad?no=<%=t1.getMemNo()%>";
		}
		function clViewMore1(){
			location.href = "<%=contextPath%>/ttClass1.ad?no=<%=t1.getMemNo()%>";
		}
		function clViewMore2(){
			location.href = "<%=contextPath%>/ttClass2.ad?no=<%=t1.getMemNo()%>";
		}
		function revViewMore(){
			location.href = "<%=contextPath%>/ttReview.ad?no=<%=t1.getMemNo()%>";
		}
	</script>
</body>
</html>