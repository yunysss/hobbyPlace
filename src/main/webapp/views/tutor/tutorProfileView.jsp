<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<%
	String introduce = tutorInfo.getIntroduce() == null? "" : tutorInfo.getIntroduce();
	String pubPhone = tutorInfo.getPubPhone() == null? "" : tutorInfo.getPubPhone();

%>

 <div id="content2">
                <div class="outer">
                    
                    <form action="<%=contextPath %>/update.tt" method="post" id="profile" enctype="multipart/form-data">
                    <input type="hidden" name="no" value="<%=tutorInfo.getMemNo()%>">
                    <h5 style="font-weight: 900;">프로필 관리</h5>
                    <hr>
                    <br>
                    
                    <table id="profile-area">
                        <tr>
                            <th rowspan="2">프로필 사진</th>
                           
                            <td>
                                <img src="<%=request.getContextPath()%>/<%=ttProfile %>" id="loadedProfile" width="80" height="80" class="rounded-circle" alt="Cinque Terre" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="upProfile" name="upfile" >
                                    <label class="custom-file-label" for="customFile">파일선택</label>
                                    <input type="hidden" name="originFile" value="<%=ttProfile%>">
                                </div>
                                <br>
                            <span>용량 2MB이하 jpg, png</span>
                            
                            </td> 
                            <script>
                                function readURL(input) {
                                    if(input.files && input.files[0]) {
                                        var reader = new FileReader();
        
                                        reader.onload = function (e) {
                                            $("#loadedProfile").attr('src', e.target.result);
                                        }
        
                                        reader.readAsDataURL(input.files[0]);
                                    }else{  $("#loadedProfile").attr('src', null);
                                         if($("#loadedProfile").attr('src') ==null){
                                            $("#loadedProfile").attr('src', '<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg');
                                         }
                                    }
                                }
                                $("#upProfile").change(function(){
                                        readURL(this);
                                });
                            </script>



                        </tr>
                        
                        <tr>
                            <th>휴대폰 인증</th>
                            <td>
                                <hr>
                                <input type="tel" name="phone" required size="40" value="<%=tutorInfo.getTtPhone()%>">&nbsp;&nbsp;<button class="btn btn-secondary btn-sm">재인증</button>
                            <br>
                                <span>클래스를 직접 운영하실 튜터님의 휴대폰 번호로 인증해주세요.(-포함)</span>
                               
                            </td> 
                        
                        </tr>
                        <tr>
                            <th>튜터명</th>
                            <td>
                                <hr>
                                <input type="text" name="nickName" required maxlength="20" class="input_id" size="40" value="<%=tutorInfo.getTtName() %>">
	                 
                                <br>
                                 <font id = "checkId" size = "1"></font>
                                <span>최대 10자 이내로 입력해주세요.</span>
                                
                            </td>

                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <hr>
                                <input type="email" name="email"  required class="form-control-sm" value="<%=tutorInfo.getTtEmail()%>">
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
                                <input type="tel" name="phone2" size="40" value="<%=pubPhone %>">
                            <br>
                            <span>튜티(회원)에게 노출되는 공개연락처입니다.<br>
                                미입력 시 인증한 연락처가 노출됩니다.</span>
                                
                            </td>


                        </tr>
                        <tr>
                            <th>소개</th>
                            <td>
                                <hr>
                                <textarea id="introduce"name="introduce"  rows="6" style=resize:none; placeholder="간단한 소개와 약력을 입력해주세요."><%=introduce %></textarea>
                                <div class="textCount"></div>
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
                    <button class="btn btn-secondary btn-sm">정보변경</button>
                    </div>


				</form>
                   
                
            

                </div>
        </div>
        
        
       	 <script>
			$('.input_id').focusout(function(){
				let ttName = $('.input_id').val(); // input_id에 입력되는 값
				
				$.ajax({
					url : "<%=contextPath%>/checknick.tt",
					type : "post",
					data : {checkNick: ttName},
					success : function(result){
						if(result == 0){
							$("#checkId").html('사용할 수 없는 닉네임입니다.');
							$("#checkId").attr('color','red');
						} else{
							$("#checkId").html('사용할 수 있는 닉네임입니다.');
							$("#checkId").attr('color','green');
						} 
					},
					error : function(){
						alert("서버요청실패");
					}
				})
				 
			})
			
			
			
			$('#introduce').keyup(function (e) {
			let content = $(this).val();
		    
		    // 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textCount').text('0/300');
		    } else {
		    	$('.textCount').text(content.length + "/300");
		    }
		    
		    // 글자수 제한
		    if (content.length > 300) {
		        $(this).val($(this).val().substring(0, 300));
		        // 300자 넘으면 알림창 뜨도록
		        alert('글자수는 300자까지 입력 가능합니다.');
		    };
		});
					
					
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		 </script>
		 
		 
		 
		 
		 
		 
  
        
        
        
        <%@ include file="../common/footerbar.jsp" %>

</body>
</html>