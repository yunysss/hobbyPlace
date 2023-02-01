<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <p id="profile1">이름 &nbsp; 닉네임</p>
                <table>
                    <colgroup>
                        <col style="width:150px;">
                        <col style="width:450px;">
                    </colgroup>
                    <tr>
                        <td>회원번호</td>
                        <td>000-000-0000</td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td>000-000-0000</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>000-000-0000</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>aaa@na.com</td>
                    </tr>
                    <tr>
                        <td>클래스 주소</td>
                        <td>00시00구00동</td>
                    </tr>
                    <tr>
                        <td>클래스 카테고리</td>
                        <td>
                        	00클래스 레져>실내
                        	00클래스 DIY>어쩌고
                        </td>
                    </tr>
                    <tr>
                        <td>튜터 등록일</td>
                        <td>2022-11-11</td>
                    </tr>
                    <tr>
                        <td>총 정산금액</td>
                        <td>0000000원</td>
                    </tr>
                    <tr>
                        <td>누적 후기</td>
                        <td>
                        	~~~클래스 00개 <br>
                        	~~~클래스 00개
                        </td>
                    </tr>
                    <tr>
                        <td>클래스별 찜</td>
                        <td>
							~~~클래스 00개 <br>
                        	~~~클래스 00개
						</td>
                    </tr>
                </table>
            </div>
        </div>

        <br clear="both"><br><br><br>

        <div class="qnaList">
            <p class="ctTitle">받은 1:1 문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
                        <th>질문자</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
					
                </table>   
            </div>
        </div>

        <br><br><br>
        
        <div class="qnaList">
            <p class="ctTitle">작성한 1:1 문의 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
                        <th>질문자</th>
                        <th>질문 제목</th>
                        <th>작성일</th>
                        <th>답변여부</th>
                    </tr>
					<tbody>
					
					</tbody>
                </table>   
            </div>
        </div>


        <br><br><br> 
        
        <div>
            <p class="ctTitle">진행중인 클래스</p>
            <p class="viewMore">전체보기>></p>  
            <div class="tbList">
            	<table>
	            	<tr>
	            		<th rowspan="2"><img src=""></th>
	            		<td>서울 동작</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			클래스명 000원 ⭐5.0(15)
	            		</td>
	            	</tr>
	            </table>
            </div>                  	
        </div>       
        
        <br><br><br>

        <div>
            <p class="ctTitle">승인 대기 클래스</p>
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
                        <th>신청일</th>
                        <th>진행상태</th>
                    </tr>
                    <tbody>
	            	
                    </tbody>
                    
                </table>   
            </div>
        </div>
        
        <br><br><br>
        
        <div>
            <p class="ctTitle">반려된 클래스</p>
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
                        <th>신청일자</th>
                        <th>반려사유</th>
                    </tr>
                    <tbody>
                       
                    </tbody>
                </table>   
            </div>
        </div>        

        <br><br><br>

        <div>
            <p class="ctTitle">받은 후기</p>
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
                    	<th>평점</th>
                        <th>클래스명</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                    <tbody>
                        
                    </tbody>
                </table>   
            </div>
        </div>

        <br><br><br>



        <br><br><br><br><br><br>
	</div>

</body>
</html>