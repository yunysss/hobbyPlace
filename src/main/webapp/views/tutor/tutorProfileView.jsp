<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   //로그인한 튜터의 정보 세션으로부터 꺼내기
   
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
     #content2{ width: 1000px;}

.outer{
    padding: 60px 100px;

}
.outer>*{
    font-size: small;
}

tr{height: 80px;}
th{width: 120px; vertical-align: middle;
 }
span{font-size: 10px;}
 
#btn-area{
position: relative;

}
#btn-area a{
padding: 5px 10px;
}

 input[type="text"], input[type="email"], input[type="tel"]{
        width: 350px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

 textarea{
    border: 1px solid rgb(202, 199, 199);
    border-radius: 5px;
    width: 350px;
 }   

</style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

 <div id="content2">
                <div class="outer">
                    
                    <form action="" method="post" id="profile" >
                    <h5 style="font-weight: 900;">프로필 관리</h5>
                    <hr>
                    <br>
                    
                    <table id="profile-area">
                        <tr>
                            <th rowspan="2">프로필 사진</th>
                            <% %>
                            <td>
                                <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" width="80"  class="rounded-circle" alt="Cinque Terre" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="customFile" name="upfile">
                                    <label class="custom-file-label" for="customFile">파일선택</label>
                                </div>
                                <br>
                            <span>용량 2MB이하 jpg, png</span>
                            
                            </td> 
                        </tr>
                        
                        <tr>
                            <th>휴대폰 인증</th>
                            <td>
                                <hr>
                                <input type="tel" name="phone" size="40">&nbsp;&nbsp;<button class="btn btn-secondary btn-sm">재인증</button>
                            <br>
                                <span>클래스를 직접 운영하실 튜터님의 휴대폰 번호로 인증해주세요.</span>
                               
                            </td> 
                        
                        </tr>
                        <tr>
                            <th>튜터명</th>
                            <td>
                                <hr>
                                <input type="text" name="nickName" maxlength="20" class="form-control-sm" size="40" >
                                <br>
                                <span>최대 20자 이내로 입력해주세요.<br>
                                
                            </td>

                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <hr>
                                <input type="email" name="email"  class="form-control-sm">
                                <br>
                                <span>실제 사용하는 이메일주소를 입력해주세요.<br>
                                    해당 메일로 공지사항 및 상품 수정 요청 등 중요 알림이 발생됩니다.
                                </span>
                                
                            </td>
                        </tr>
                        <tr>
                            <th>공개연락처(선택)</th>
                            <td>
                                <hr>
                                <input type="tel" name="phone2" size="40">
                            <br>
                            <span>튜티(회원)에게 노출되는 공개연락처입니다.<br>
                                미입력 시 인증한 연락처가 노출됩니다.</span>
                                
                            </td>


                        </tr>
                        <tr>
                            <th>소개</th>
                            <td>
                                <hr>
                                <textarea name="introduce"  rows="6" style=resize:none; placeholder="간단한 소개와 약력을 입력해주세요."></textarea>
                                <br>
                                <span>튜티(합플 회원)들에게 튜터님을 소개해주세요.<br>
                                *경력, 보유 자격증, 수상이력, 대외활동 등 
                                
                                </span>
                              
                                <hr>
                            </td>
                        </tr>
                    </table>
                    <br><br>
                    <div id="btn-area" align="center" style="width: 600px;">
                    <a class="btn btn-secondary btn-sm">이전</a>
                    <a href="<%=contextPath %>/update.tt"  class="btn btn-secondary btn-sm">정보변경</a>
                    </div>


				</form>
                   
                
            

                </div>
        </div>
        <%@ include file="../common/footerbar.jsp" %>

</body>
</html>