<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
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
    .tbList{clear:both;}
    .listTable>tr{height:10px;}
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
                <p id="profile1">홍길동 길똥길똥</p>
                <table>
                    <colgroup>
                        <col style="width:150px;">
                        <col style="width:450px;">
                    </colgroup>
                    <tr>
                        <td>회원번호</td>
                        <td>01</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>gildong01</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>010-0000-0000</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>gildong@gd.com</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>서울시 용산구 한강로 3가 40-999</td>
                    </tr>
                    <tr>
                        <td>회원가입일</td>
                        <td>2022-12-01</td>
                    </tr>
                    <tr>
                        <td>마지막 정보수정일</td>
                        <td>2023-01-23</td>
                    </tr>
                    <tr>
                        <td>관심 카테고리</td>
                        <td>쿠킹,스포츠</td>
                    </tr>
                    <tr>
                        <td>튜터 등록여부</td>
                        <td>Y</td>
                    </tr>
                    <tr>
                        <td>누적 수강횟수</td>
                        <td>5 회</td>
                    </tr>
                    <tr>
                        <td>총 결제금액</td>
                        <td>285000원</td>
                    </tr>
                    <tr>
                        <td>등록한 후기</td>
                        <td>2 개</td>
                    </tr>
                    <tr>
                        <td>남긴 별점 평균</td>
                        <td>5.0</td>
                    </tr>
                    <tr>
                        <td>현재 찜한 클래스</td>
                        <td>8 개</td>
                    </tr>
                </table>
            </div>
        </div>

        <br clear="both"><br>

        <div class="qnaList">
            <p class="ctTitle">1:1 문의</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="container mt-3 table-responsive-xxl tbList">
                <table class="table table-responsive-xxl listTable">
                    <colgroup>
                        <col style="width:150px;">
                        <col style="width:450px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                    </colgroup>
                    <tr>
                        <th>답변자</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
                    <tr>
                        <td>관리자</td>
                        <td>환불신청한지 5일째에요</td>
                        <td>2023-01-30</td>
                        <td>답변대기</td>
                    </tr>
                    <tr>
                        <td>윤슬</td>
                        <td>수업난이도가 구체적으로 어느정도인가요?</td>
                        <td>2023-01-15</td>
                        <td>답변완료</td>
                    </tr>
                </table>   
            </div>
        </div>

        <br>

        <div>
            <p class="ctTitle">수강한클래스</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="container mt-3 table-responsive-xxl tbList">
                <table class="table table-responsive-xxl listTable">
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:400px;">
                        <col style="width:150px;">
                        <col style="width:150px;">
                        <col style="width:120px;">
                    </colgroup>
                    <tr>
                        <th>카테고리</th>
                        <th>클래스명</th>
                        <th>튜터명</th>
                        <th>수강일</th>
                        <th>후기작성</th>
                    </tr>
                    <tbody>
                        <tr>
                            <td>쿠킹>베이킹</td>
                            <td>앙금플러워 떡케이크 만들기</td>
                            <td>람보람보</td>
                            <td>2023-01-01</td>
                            <td>Y</td>
                        </tr>
                        <tr>
                            <td>스포츠>실외</td>
                            <td>원데이 스케이트보드 핵심 기슬</td>
                            <td>보드신</td>
                            <td>2023-01-05</td>
                            <td>Y</td>
                        </tr>
                    </tbody>
                    
                </table>   
            </div>
        </div>

        <br>

        <div>
            <p class="ctTitle">작성한 후기</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="container mt-3 table-responsive-xxl tbList">
                <table class="table table-responsive-xxl listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:400px;">
                        <col style="width:100px;">
                        <col style="width:120px;">
                    </colgroup>
                    <tr>
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

        <br>

        <div>
            <p class="ctTitle">찜한 클래스</p>
            <p class="viewMore">전체보기>></p>
            
            <div class="container mt-3 table-responsive-xxl tbList">
                <table class="table table-responsive-xxl listTable">
                    <colgroup>
                        <col style="width:250px;">
                        <col style="width:400px;">
                        <col style="width:100px;">
                        <col style="width:120px;">
                    </colgroup>
                    <tr>
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







        <br><br><br>
	</div>

</body>
</html>