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

                <img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" style="width:100px; height:100px;" class="rounded-circle loadedProfile">

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
                      			<%=m.getInterest() %>
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
            <p class="viewMore">전체보기>></p>
            
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
		                <!-- case1. 문의가 없을 경우 -->
		                <tr>
		                    <td colspan="4">조회된 문의가 없습니다.</td>
		                </tr>
				<% }else { %>
	                <!-- case2. 게시글이 있을 경우 -->
	                <% for(Qna q : qnaList) { %>
		                <tr>
		                    <td>
		                    <% if(q.getqGrade().equals("0")) {%>
		                    	관리자
		                    <%}else { %>
		                    	<%=q.getaMemNick() %>
		                    <%} %>
		                    </td>
		                    <td><%=q.getqTitle() %></td>
		                    <td><%=q.getqDate()  %></td>
		                    <td>
		                    <% if(q.getaTitle()==null) { %>
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
                        <col style="width:200px;">
                        <col style="width:350px;">
                        <col style="width:125px;">
                        <col style="width:125px;">
                        <col style="width:100px;">
                    </colgroup>
                    <tr class="thd">
                        <th>카테고리</th>
                        <th>클래스명</th>
                        <th>튜터명</th>
                        <th>수강일</th>
                        <th>후기작성</th>
                    </tr>
                    <tbody>
	            	<% if(regList.isEmpty()){ %>
		                <!-- case1. 게시글이 없을 경우 -->
		                <tr>
		                    <td colspan="5">조회된 게시글이 없습니다.</td>
		                </tr>
					<% }else { %>
		                <!-- case2. 게시글이 있을 경우 -->
		                <% for(Register rg : regList) { %>
			                <tr>
			                    <td><%= b.getBoardNo() %></td>
			                    <td><%= b.getCategory() %></td>
			                    <td><%= b.getBoardTitle() %></td>
			                    <td><%= b.getBoardWriter() %></td>
			                    <td><%= b.getCount() %></td>
			                    <td><%= b.getCreateDate() %></td>
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
                        <tr>
                            <td>앙금플라워로 떡케이크...</td>
                            <td>기념일에 하기 너무 좋아요! 오랜만에 힐링...</td>
                            <td>5.0</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>원데이 스케이트...</td>
                            <td>오랜만에 스트레스 풀고 너무 좋았어요</td>
                            <td>5.0</td>
                            <td>2023-01-05</td>
                        </tr>
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
                        <tr>
                            <td>쿠킹>베이킹</td>
                            <td>앙금플러워 떡케이크 만들기</td>
                            <td>람보람보</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>스포츠>실외</td>
                            <td>원데이 스케이트 보드 핵심 기술</td>
                            <td>보드신</td>
                            <td>2023-01-05</td>
                        </tr>
                    </tbody>
                </table>   
            </div>
        </div>







        <br><br><br><br><br><br>
	</div>

</body>
</html>