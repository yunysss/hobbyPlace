<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Like, com.hp.qna.model.vo.Qna, com.hp.member.model.vo.Member, com.hp.review.model.vo.Review, com.hp.register.model.vo.Register" %>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Qna> qnaList = (ArrayList<Qna>)request.getAttribute("qnaList");
	ArrayList<Register> regList = (ArrayList<Register>)request.getAttribute("regList");
	ArrayList<Review> revList = (ArrayList<Review>)request.getAttribute("revList");
	ArrayList<Like> likeList = (ArrayList<Like>)request.getAttribute("likeList");
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
    .listTable td {text-align: center;}
    .thd{text-align: center; border-bottom: 1px solid #444444;}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap">
        <h3>회원 상세 조회</h3>
        <hr>
        <br>
		<div class="memProfile" align="left">
            <div class="memImg">
				<%if(m.getMemProfile()!=null) {%>
					<img src="<%=contextPath%>/<%=m.getMemProfile()%>" style="width:100px; height:100px;" class="rounded-circle loadedProfile">
				<%}else{ %>
                	<img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" style="width:100px; height:100px;" class="rounded-circle loadedProfile">
				<%} %>
            </div>
            <div class="memInfo">
                <p id="profile1"><%=m.getMemName()%> &nbsp; <%=m.getMemNick() %></p>
                <table>
                    <colgroup>
                        <col style="width:150px;">
                        <col style="width:450px;">
                    </colgroup>
                    <tr>
                        <td>회원번호</td>
                        <td><%=m.getMemNo()%> </td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><%=m.getMemId() %> </td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td><%=m.getPhone() %></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>
	                        <%if(m.getEmail()==null) {%>
	                        	미등록
	                        <%}else{ %>
	                        	<%=m.getEmail() %>
	                        <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                        	<%if(m.getMemAddr()==null) {%>
	                        	미등록
	                        <%}else{ %>
	                        	<%=m.getMemAddr() %>
	                        <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td>회원가입일</td>
                        <td><%=m.getEnrollDate() %></td>
                    </tr>
                    <tr>
                        <td>마지막 정보수정일</td>
                        <td>
                            <%if(m.getMemUpdate()==null) {%>
	                        	<%=m.getEnrollDate() %>
	                        <%}else{ %>
	                        	<%=m.getMemUpdate() %>
	                        <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td>관심 카테고리</td>
                        <td>
                            <%if(m.getInterest()==null) {%>
	                        	미등록
	                        <%}else{ %>
                        	<%
                        		String[] iArray = (m.getInterest()).split(",");
                        		String ctList = "";
                        		for(int i = 0; i<iArray.length; i++){
                        			if(iArray[i].equals("11")){
                        				ctList += "교육 ";
                        			}else if(iArray[i].equals("22")) {
                        				ctList += " 공예DIY ";
                        			}else if(iArray[i].equals("33")) {
                        				ctList += " 드로잉 ";
                        			}else if(iArray[i].equals("44")) {
                        				ctList += " 쿠킹 ";
                        			}else if(iArray[i].equals("55")) {
                        				ctList += " 스포츠/피트니스";
                        			}
                        		}
                        	%>
                      			<%= ctList %>
	                        <%} %>                       
                        </td>
                    </tr>
                    <tr>
                        <td>튜터 등록여부</td>
                        <td><%=m.getGrade() %></td>
                    </tr>
                    <tr>
                        <td>누적 수강횟수</td>
                        <td><%=m.getRegCount() %> 회</td>
                    </tr>
                    <tr>
                        <td>총 결제금액</td>
                        <td><%=m.getTotalpay() %> 원</td>
                    </tr>
                    <tr>
                        <td>등록한 후기</td>
                        <td><%=m.getRevCount() %> 개</td>
                    </tr>
                    <tr>
                        <td>남긴 별점 평균</td>
                        <td>
							<%if(m.getStarAvg() == 0) {%>
	                        	등록한 별점 없음
	                        <%}else{ %>
                      			<%=m.getStarAvg() %> 점
	                        <%} %>   
						</td>
                    </tr>
                    <tr>
                        <td>현재 찜한 클래스</td>
                        <td><%=m.getLikeCount() %> 개</td>
                    </tr>
                </table>
            </div>
        </div>

        <br clear="both"><br><br><br>

        <div class="qnaList">
            <p class="ctTitle">1:1 문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            <p class="viewMore" onclick="qnaViewMore();">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:400px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr class="thd">
                        <th>답변자</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
					<% if(qnaList.isEmpty()){ %>
		                <tr>
		                    <td colspan="4">작성된 문의가 없습니다.</td>
		                </tr>
					<% }else { %>
						<%if(qnaList.size() >= 3) {%>
							<% for(int i=1; i<=3; i++) { %>
				                <tr>
				                    <td>
				                    <% if((((Qna)qnaList.get(i)).getqGrade()).equals("0")) {%>
				                    	관리자
				                    <%}else { %>
				                    	<%=((Qna)qnaList.get(i)).getaMemNick() %>
				                    <%} %>
				                    </td>
				                    <td><%=((Qna)qnaList.get(i)).getqTitle() %></td>
				                    <td><%=((Qna)qnaList.get(i)).getqDate()  %></td>
				                    <td>
				                    <% if(((Qna)qnaList.get(i)).getaTitle()==null) { %>
				                    	답변대기
				                    <%}else {%>
				                    	답변완료
				                    <%} %>
				                    </td>
			               		</tr>
		                	<% } %>
		                	
						<%} else if(qnaList.size() == 2) {%>
							<% for(int i=1; i<=2; i++) { %>
				                <tr>
				                    <td>
				                    <% if((((Qna)qnaList.get(i)).getqGrade()).equals("0")) {%>
				                    	관리자
				                    <%}else { %>
				                    	<%=((Qna)qnaList.get(i)).getaMemNick() %>
				                    <%} %>
				                    </td>
				                    <td><%=((Qna)qnaList.get(i)).getqTitle() %></td>
				                    <td><%=((Qna)qnaList.get(i)).getqDate()  %></td>
				                    <td>
				                    <% if(((Qna)qnaList.get(i)).getaTitle()==null) { %>
				                    	답변대기
				                    <%}else {%>
				                    	답변완료
				                    <%} %>
				                    </td>
				                </tr>
		                	<% } %>
						<%} else {%>
			                <tr>
			                    <td>
			                    <% if((((Qna)qnaList.get(0)).getqGrade()).equals("0")) {%>
			                    	관리자
			                    <%}else { %>
			                    	<%=((Qna)qnaList.get(0)).getaMemNick() %>
			                    <%} %>
			                    </td>
			                    <td><%=((Qna)qnaList.get(0)).getqTitle() %></td>
			                    <td><%=((Qna)qnaList.get(0)).getqDate() %></td>
			                    <td>
			                    <% if(((Qna)qnaList.get(0)).getaTitle()==null) { %>
			                    	답변대기
			                    <%}else {%>
			                    	답변완료
			                    <%} %>
			                    </td>
			                </tr>
		                <% } %>
		                
	                <% } %>
                </table>   
            </div>
        </div>

        <br><br><br>

        <div>
            <p class="ctTitle">수강한클래스</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:300px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                    </colgroup>
                    <tr class="thd">
                        <th>카테고리</th>
                        <th>클래스명</th>
                        <th>튜터명</th>
                        <th>수강일</th>
                        <th>진행상태</th>
                        <th>후기작성</th>
                    </tr>
                    <tbody>
	            	<% if(regList.isEmpty()){ %>
		                <tr>
		                    <td colspan="6">수강한 클래스가 없습니다.</td>
		                </tr>
					<% }else { %>
					
						<% if(regList.size() >= 3) {%>
							<% for(int i=1; i<=3; i++) {%>
								<tr>
				                    <td>
				                    <%= ((Register)regList.get(i)).getCtName() %> 
				                    > 
				                    <%=((Register)regList.get(i)).getCtDname() %>
				                    </td>
				                    <td><%= ((Register)regList.get(i)).getClName() %></td>
				                    <td><%= ((Register)regList.get(i)).getTtName() %></td>
				                    <td><%= ((Register)regList.get(i)).getTeachDate() %></td>
				                    <td>
				                     <%if(((Register)regList.get(i)).getRegSta().equals("0")) {%>
					                     승인전  
					                 <%} else if(((Register)regList.get(i)).getRegSta().equals("1")) {%>
				                     	수강전 
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("2")) {%>
				                        수강완료 
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("3")) {%>
				                     	예약취소
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("4")) {%>
					                     튜터반려 			                     
				                     <%} %>
				                    </td>
				                    <td><%= ((Register)regList.get(i)).getReEnroll() %></td>
				                </tr>
							<%} %>
						<%} else if(regList.size() == 2) {%>
							<% for(int i=1; i<=2; i++) {%>
								<tr>
				                    <td>
				                    <%= ((Register)regList.get(i)).getCtName() %> 
				                    > 
				                    <%=((Register)regList.get(i)).getCtDname() %>
				                    </td>
				                    <td><%= ((Register)regList.get(i)).getClName() %></td>
				                    <td><%= ((Register)regList.get(i)).getTtName() %></td>
				                    <td><%= ((Register)regList.get(i)).getTeachDate() %></td>
				                    <td>
				                     <%if(((Register)regList.get(i)).getRegSta().equals("0")) {%>
					                     승인전  
					                 <%} else if(((Register)regList.get(i)).getRegSta().equals("1")) {%>
				                     	수강전 
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("2")) {%>
				                        수강완료 
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("3")) {%>
				                     	예약취소
				                     <%} else if(((Register)regList.get(i)).getRegSta().equals("4")) {%>
					                     튜터반려 			                     
				                     <%} %>
				                    </td>
				                    <td><%= ((Register)regList.get(i)).getReEnroll() %></td>
				                </tr>
							<%} %>							
						<%} else { %>
			                <tr>
			                    <td>
			                    <%= ((Register)regList.get(0)).getCtName() %> 
			                    > 
			                    <%=((Register)regList.get(0)).getCtDname() %>
			                    </td>
			                    <td><%= ((Register)regList.get(0)).getClName() %></td>
			                    <td><%= ((Register)regList.get(0)).getTtName() %></td>
			                    <td><%= ((Register)regList.get(0)).getTeachDate() %></td>
			                    <td>
			                     <%if(((Register)regList.get(0)).getRegSta().equals("0")) {%>
				                     승인전  
				                 <%} else if(((Register)regList.get(0)).getRegSta().equals("1")) {%>
			                     	수강전 
			                     <%} else if(((Register)regList.get(0)).getRegSta().equals("2")) {%>
			                        수강완료 
			                     <%} else if(((Register)regList.get(0)).getRegSta().equals("3")) {%>
			                     	예약취소
			                     <%} else if(((Register)regList.get(0)).getRegSta().equals("4")) {%>
				                     튜터반려 			                     
			                     <%} %>
			                    </td>
			                    <td><%= ((Register)regList.get(0)).getReEnroll() %></td>
			                </tr>
		                <% } %>
	                
	                <% } %>
                    </tbody>
                    
                </table>   
            </div>
        </div>

        <br><br><br>

        <div>
            <p class="ctTitle">작성한 후기</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:400px;">
                        <col style="width:125px;">
                        <col style="width:125px;">
                    </colgroup>
                    <tr class="thd">
                        <th>클래스명</th>
                        <th>내용</th>
                        <th>평점</th>
                        <th>작성일</th>
                    </tr>
                    <tbody>
                        <% if(revList.isEmpty()){ %>
			                <tr>
			                    <td colspan="4">작성한 후기가 없습니다.</td>
			                </tr>
						<% }else { %>
			                <%if(revList.size() >= 3) {%>
			                	<% for(int i=1; i<=3; i++) { %>
					                <tr>
					                    <td><%= ((Review)revList.get(i)).getClName() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewContent() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewStar() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewDate() %></td>
					                </tr>
			                	<% } %>
			                <%} else if(revList.size() == 2) {%>
				                <% for(int i=1; i<=2; i++) { %>
					                <tr>
					                    <td><%= ((Review)revList.get(i)).getClName() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewContent() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewStar() %></td>
					                    <td><%= ((Review)revList.get(i)).getReviewDate() %></td>
					                </tr>
				                <% } %>			                
			                <%} else {%>
				                <tr>
				                    <td><%= ((Review)revList.get(0)).getClName() %></td>
				                    <td><%= ((Review)revList.get(0)).getReviewContent() %></td>
				                    <td><%= ((Review)revList.get(0)).getReviewStar() %></td>
				                    <td><%= ((Review)revList.get(0)).getReviewDate() %></td>
				                </tr>
			                <% } %>
		                
		                <% } %>
                    </tbody>
                </table>   
            </div>
        </div>

        <br><br><br>

        <div>
            <p class="ctTitle">찜한 클래스</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="tbList">
                <table class="listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:400px;">
                        <col style="width:125px;">
                        <col style="width:125px;">
                    </colgroup>
                    <tr class="thd">
                        <th>카테고리</th>
                        <th>클래스명</th>
                        <th>튜터명</th>
                        <th>찜한날짜</th>
                    </tr>
                    <tbody>
                       <% if(likeList.isEmpty()){ %>
		                <tr>
		                    <td colspan="4">찜한 클래스가 없습니다.</td>
		                </tr>
						<% }else { %>
							<%if(likeList.size() >= 3) {%>
								<% for(int i=1;i<=3;i++) { %>
					                <tr>
					                    <td>
					                    <%= ((Like)likeList.get(i)).getCtName() %>
					                    >
					                    <%= ((Like)likeList.get(i)).getCtDname() %>
					                    </td>
					                    <td><%= ((Like)likeList.get(i)).getClName() %></td>
					                    <td><%= ((Like)likeList.get(i)).getTtName() %></td>
					                    <td><%= ((Like)likeList.get(i)).getLikeDate() %></td>
					                </tr>
				                <% } %>
							<%} else if(likeList.size() == 2) {%>
								<% for(int i=1;i<=2;i++) { %>
					                <tr>
					                    <td>
					                    <%= ((Like)likeList.get(i)).getCtName() %>
					                    >
					                    <%= ((Like)likeList.get(i)).getCtDname() %>
					                    </td>
					                    <td><%= ((Like)likeList.get(i)).getClName() %></td>
					                    <td><%= ((Like)likeList.get(i)).getTtName() %></td>
					                    <td><%= ((Like)likeList.get(i)).getLikeDate() %></td>
					                </tr>
				                <% } %>							
							<%} else{%>
				                <tr>
				                    <td>
				                    <%= ((Like)likeList.get(0)).getCtName() %>
				                    >
				                    <%= ((Like)likeList.get(0)).getCtDname() %>
				                    </td>
				                    <td><%= ((Like)likeList.get(0)).getClName() %></td>
				                    <td><%= ((Like)likeList.get(0)).getTtName() %></td>
				                    <td><%= ((Like)likeList.get(0)).getLikeDate() %></td>
				                </tr>
			                <% } %>
		                
		                <% } %>
                    </tbody>
                </table>   
            </div>
        </div>
	<script>
		function qnaViewMore(){
			location.href = "<%=contextPath%>/memQna1.ad?no=<%=m.getMemNo()%>";
		}
	</script>






        <br><br><br><br><br><br>
	</div>

</body>
</html>