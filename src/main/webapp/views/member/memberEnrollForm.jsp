<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.hp.lesson.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    /*div{border:1px solid black;}*/
    div{box-sizing:border-box;}
    .cWrap{width:1000px; margin:auto;}
    .content{width:100%; margin-top:5px;}

    form{width:70%;}
    span{display:inline-block; align: right;}
    .star{color:rgb(182, 1, 1); font-size:15px; font-weight:bolder;}
    form>table{width:85%; padding:0; border:0;}
    .td1{width:25%; padding:10px;}
    .td2{width:52%;}
    .td3{width:25%; padding-left:10px;}
    .checkAlert{height:12px; padding-left: 13px; font-size:8px; color:red;}

    .fillOutForms{
        width:100%;
        height:35px;
        box-sizing:border-box;  
        border:1px solid rgb(35, 104, 116);
        border-radius:5px;
        padding:10px;
    }
    .fillOutForms:hover, #address1:hover, .birthDay:hover{border:2px solid rgb(35, 104, 116);}
    #address1{
        width:48%;
        height:35px;
        box-sizing:border-box;  
        border:1px solid rgb(35, 104, 116);
        border-radius:5px;
        margin-right:5px;
        padding:10px;
    }
    .doubleCheck{
        width:100%;
        height:35px;
        box-sizing:border-box;  
        border:1px solid rgb(143, 143, 143);
        border-radius:5px;
        color:rgb(143, 143, 143);
        background: white;
    }
    #postCode{width:48%;}
    
    .gender{width:33px;}
    .birthDay{
        width:30%;
        height:35px;
        box-sizing:border-box;  
        border:1px solid rgb(35, 104, 116);
        border-radius:5px;
    }
    #getCode{background:rgb(35, 104, 116); color:white; font-size:18px; font-weight:bolder;}
    .profileButton{
        height:35px;
        width:65px;
        line-height: 35px;
        display: inline-block; 
        box-sizing:border-box;  
        vertical-align: middle;
        text-align: center;
        border:0;
        border-radius:5px;
        background-color:rgb(200, 199, 199);
    }
    .profileButton:hover{cursor:pointer;}
    #upProfile{
        position:absolute; width:1px; height:1px;padding:0; margin:-1px; overflow:hidden;clip:rect(0,0,0,0);border:0; 
    }
    .showRules{
        height:20px;
        width:100px;
        background:white;
        border:1px black solid;
        border-radius: 2px;
        font-size:12px;
        margin-left:10px;
    }
    .agreeAll{font-weight:bold;}
    #submitForm{
        height:45px; width:170px;
        margin:auto;
        background:rgb(35, 104, 116); color:white; 
        border:0;
        border-radius: 10px;
        font-size:20px;
    }
    #submitForm:hover, .showRules:hover, .agreeAll:hover, .agreement:hover {cursor: pointer;}
</style>
</head>
<body>	
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">
        <div class="content" align="center">
            <br>
            <form action="<%=contextPath%>/enrollMember.me" method="post" enctype="multipart/form-data">

                <h1>회원가입</h1>

                <div align="right" style="margin-right: 30px;"><span class="star">*</span>필수입력사항</div>

                <hr>
                
                <table>
                    <tr>
                        <td class="td1">아이디 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="userId" class="fillOutForms" name="userId" placeholder="영문과 숫자 조합 4~16자" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck idDoubleCheck" onclick="idCheck();" disabled>중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert idTest"></td>
                        <td></td>
                    </tr>    
                    <script>
					   	function idCheck(){
					   		const $idInput = $("#userId");
					   		
					   		$.ajax({
					   			url:"<%=contextPath%>/idCheck.me",
					   			data:{checkId:$idInput.val()},
					   			success:function(result){
					   				if(result == "NNNNN") {
					   					$(".idTest").html("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
					   					$idInput.focus();
					   				}else if(result=="NNNNY"){
					   					$(".idTest").html("");
					   					if(confirm("사용가능한 아이디입니다. 정말로 사용하시겠습니까?")){
					   						$idInput.attr("readonly", true);
					   						$(".idDoubleCheck").attr("disabled");
					   						$(".idDoubleCheck").css('cursor', 'default').css('color', 'rgb(35, 104, 116)').text("확인완료");
					   						//$("#enroll-form :submit").removeAttr("disabled");
					   						
					   					}else {
					   						$idInput.focus();
					   					}
					   				}
					   			},
					   			error:function(){
					   				console.log("아이디 중복체크용 ajax 통신실패");
					   			}
					   		})
					   	}
					</script>         
                    <tr>
                        <td class="td1">비밀번호 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="password" class="fillOutForms" id="userPwd" name="userPwd" placeholder="영문, 숫자, 특수문자 포함 6~20자" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert pwdTest1"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1">비밀번호 확인 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="password" class="fillOutForms" id="userPwdCheck" placeholder="영문, 숫자, 특수문자 포함 12~20자" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert pwdTest2"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1">이름 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="userName" class="fillOutForms" name="userName" placeholder="이름을 입력해주세요" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert nameTest"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1">닉네임 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="userNickName" class="fillOutForms" name="userNick" placeholder="8글자 이내로 입력하세요(특수문자제외)" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck nickDoubleCheck" onclick="nickCheck();" disabled>중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert nickNameTest"></td>
                        <td></td>
                    </tr>
                    <script>
                    	function nickCheck(){
                    		const $nickInput = $("#userNickName");
                    		
                    		$.ajax({
                    			url:"<%=contextPath%>/nickCheck.me",
                    			data:{checkNick:$nickInput.val()},
                    			success:function(result){
                    				if(result == "NNNNN"){
                    					$(".nickNameTest").html("이미 존재하는 닉네임입니다");
                    					$nickInput.focus();
                    				}else if(result=="NNNNY"){
                    					$(".nickNameTest").html("");
                    					if(confirm("사용가능한 닉네임입니다. 정말로 사용하시겠습니까?")){
                    						// 확인 눌렀을때
                    						$nickInput.attr("readonly", true);
                    						$(".nickDoubleCheck").attr("disabled");
                    						$(".nickDoubleCheck").css('cursor', 'default').css('color', 'rgb(35, 104, 116)').text("확인완료");
                    					}else {
                							// 취소 눌렀을때
                							$nickInput.focus();
                    					}
                    				}
                    			},
                    			error:function(){
                    				console.log("닉네임 중복체크용 ajax 통신실패");
                    			}
                    		});
                    	}
                    </script>
                    <tr>
                        <td class="td1">이메일 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="email" class="fillOutForms" id="email" name="email" placeholder="예) hobbyplace@hobpl.com" required>
                        </td>
                        <td class="td3">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert emailTest"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1">휴대폰 <span class="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="phone" class="fillOutForms" name="phone" onclick="check();" placeholder="-포함하여 입력해주세요" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck phoneDoubleCheck" disabled>인증번호 받기</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert phoneTest"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1" rowspan="3">주소</td>
                        <td class="td2">
                            <input type="text" id="address1" name="address" onclick="execDaumPostcode()" placeholder="우편번호">
                            <button type="button" id="postCode" class="doubleCheck" onclick="execDaumPostcode()" >우편번호 검색</button>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td2">
                            <input type="text" id="address2" name="address" class="fillOutForms" placeholder="상세주소">
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td2">
                            <input type="text" id="address3" name="address" class="fillOutForms" placeholder="추가주소">
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <script>
                        function execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    var roadAddr = data.roadAddress; // 도로명주소변수
                                    var extraRoadAddr = ''; // 참고항목변수
                
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraRoadAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraRoadAddr !== ''){
                                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                                    }
                                    
                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('address1').value = data.zonecode;
                                    document.getElementById("address2").value = roadAddr;
                
                                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                    if(roadAddr !== ''){
                                        document.getElementById("address2").value += extraRoadAddr;
                                    }
                                }
                            }).open();
                        }
                    </script>    
                    <tr>
                        <td class="td1">성별</td>
                        <td class="td2">
                            <input type="radio" class="gender" name="gender" value="M" id="male"><label for="male">남자</label>
                            <input type="radio" class="gender" name="gender" value="F" id="female"><label for="female">여자</label>
                            <input type="radio" class="gender" name="gender" value="X" id="doNotSelect" checked><label for="doNotSelect">선택안함</label>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">생년월일</td>
                        <td class="td2">
                            <select class="birthDay" name="memBirth" id="bYear">
                                <option disabled selected>출생 연도</option>
                            </select>
                            <select class="birthDay" name="memBirth" id="bMonth">
                                <option disabled selected>월</option>
                            </select>
                            <select class="birthDay" name="memBirth" id="bDate">
                                <option disabled selected>일</option>
                            </select>
                                                           
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <script>
                        $(function(){

                            var thisYear = new Date().getFullYear();
                            for(let i=(thisYear-100); i<=thisYear; i++){
                                $("#bYear").append("<option value='" + i +"'>" + i + "</option>");
                            }

                            for(let i=1; i<=9; i++){
                                $("#bMonth").append("<option value='0" + i + "'>0" + i + "</option>");
                            }
                            for(let i=10; i<=12; i++){
                                $("#bMonth").append("<option value='" + i + "'>" + i + "</option>");
                            }
                            for(let i=1; i<=9; i++){
                                $("#bDate").append("<option value='0" + i + "'>0" + i + "</option>");
                            }
                            for(let i=10; i<=31; i++){
                                $("#bDate").append("<option value='" + i + "'>" + i + "</option>");
                            }
                            
                            $("#bMonth").change(function(){
                                if($(this).val() == 02){

                                $("#bDate").empty();
	                                for(let i=1; i<=9; i++){
	                                    $("#bDate").append("<option value='0" + i + "'>0" + i + "</option>");
	                                }
	                                for(let i=10; i<=29; i++){
	                                    $("#bDate").append("<option value='" + i + "'>" + i + "</option>");
	                                }
                                    
                                }else if($(this).val() == 04 || $(this).val() == 06 || $(this).val() == 09 || $(this).val() == 11){

                                    $("#bDate").empty();
                                    for(let i=1; i<=9; i++){
	                                    $("#bDate").append("<option value='0" + i + "'>0" + i + "</option>");
	                                }
	                                for(let i=10; i<=30; i++){
	                                    $("#bDate").append("<option value='" + i + "'>" + i + "</option>");
	                                }

                                }else{
                                    $("#bDate").empty();
                                    for(let i=1; i<=9; i++){
                                        $("#bDate").append("<option value='0" + i + "'>0" + i + "</option>");
                                    }
                                    for(let i=10; i<=31; i++){
                                        $("#bDate").append("<option value='" + i + "'>" + i + "</option>");
                                    }
                                }
                            
                            })
                        })
                    </script>
                    <tr>
                        <td class="td1">프로필사진</td>
                        <td class="td2">
                        	<label for="upProfile"  class="profileButton">업로드</label>	
                            <input type="file" id="upProfile" name="upProfile">
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td  class="td2" rowspan="2">
                            <img id="loadedProfile" src="<%=request.getContextPath()%>/resources/tutorProfile_upfiles/defaultimg.jpg" style="width:100px; height:100px;" class="rounded-circle">
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <script>
                    	function readURL(input) {
                            if(input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $("#loadedProfile").attr('src', e.target.result);
                                }

                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                        $("#upProfile").change(function(){
                                readURL(this);
                        });
                    </script>
                    <tr>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1" rowspan="5">
                            관심있는 분야 <br>
                            (중복선택 가능)
                        </td>
                        <td class="td2" rowspan="5">
                            <input type="checkbox" name="interest" value="11" id="education"> <label for="education">학업 (외국어, IT, 자격증 등)</label> <br>
                            <input type="checkbox" name="interest" value="22" id="diy"> <label for="diy">공예 DIY (가죽, 비누, 꽃, 뜨개질 등)</label> <br>
                            <input type="checkbox" name="interest" value="33" id="cooking"> <label for="cooking">쿠킹 (요리, 베이킹)</label> <br>
                            <input type="checkbox" name="interest" value="44" id="drawing"> <label for="drawing">드로잉</label> <br>
                            <input type="checkbox" name="interest" value="55" id="sports"> <label for="sports">스포츠</label> <br>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td3"></td>
                    </tr>
                </table>
                <br>
                <hr>
                <br>
                <table>
                    <tr>
                        <td class="td1">이용약관 동의</td>
                        <td class="td2 agreeAll agreement"><input type="checkbox" id="agreeA"> <label for="agreeA">전체 동의합니다</label></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2 agreement"><input type="checkbox" id="agreeRules" required> <label for="agreeRules">이용약관 동의(필수)</label></td>
                        <td><button type="button" class="showRules" data-toggle="modal" data-target="#viewAgreeRules">약관보기 >></button></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2 agreement"><input type="checkbox" id="agreeCollection" required> <label for="agreeCollection"> 개인정보 수집 이용 동의(필수)</label></td>
                        <td><button type="button" class="showRules" data-toggle="modal" data-target="#viewAgreeCollection">약관보기 >></button></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2 agreement"><input type="checkbox" id="over14" required> <label for="over14">본인은 만 14세 이상입니다 (필수)</label></td>
                        <td></td>
                    </tr>
                    
                </table>
                <br><br>
                <button type="submit" id="submitForm" onclick="enrollMember();">가입하기</button>
                <br><br><br><br>
                                                
            </form>
            
			  
            <script>
                $(function(){
                    $("#agreeA").click(function(){
                        if($(this).prop("checked")){
                            $("#agreeRules").prop("checked", true);
                            $("#agreeCollection").prop("checked", true);
                            $("#over14").prop("checked", true);

                        }else {
                            $(this).prop("checked", false);
                            $("#agreeRules").prop("checked", false);
                            $("#agreeCollection").prop("checked", false);
                            $("#over14").prop("checked", false);
                        }  
                    })
                })
                           
            </script>
        </div>
    </div>
    <script>
        $(function(){
           let idCheck = RegExp(/^[a-z\d]{4,16}$/);
           let pwdCheck = RegExp(/^[a-z\d~`!@#$%^&*()_+=-{}<>?,.]{6,20}$/i);
           let nameCheck = RegExp(/^[가-힣]{2,}$/);
           let nickCheck = RegExp(/^[a-z\d가-힣]{1,8}$/i);
           let phoneCheck = RegExp(/^[0][1][\d]-[\d]{3,4}-[\d]{3,4}$/);
           let emailCheck = RegExp(/^[a-z\d+-_.]+@[a-z\d-]+\.[a-z\d.]+$/i);

            $("#userId").keyup(function(){
                if(!idCheck.test($("#userId").val())){
                    $(".idTest").html('유효한 아이디가 아닙니다.');
                    $(".idDoubleCheck").attr("disabled");
                    $(".idDoubleCheck").css('cursor', 'pointer').css('color', 'rgb(143, 143, 143)').css('border-color', 'rgb(143, 143, 143)');
                }else{
                    $(".idTest").html('');
                    $(".idDoubleCheck").removeAttr("disabled");
                    $(".idDoubleCheck").css('cursor', 'pointer').css('color', 'rgb(182, 1, 1)').css('border-color', 'rgb(35, 104, 116)');
                }
            })

            $("#userPwd").keyup(function(){
                if(!pwdCheck.test($("#userPwd").val())){
                    $(".pwdTest1").html('유효한 비밀번호가 아닙니다.');
                }else{
                    $(".pwdTest1").html('');
                }
            })

            $("#userPwdCheck").keyup(function(){
                if($("#userPwd").val() != $("#userPwdCheck").val()){
                    $(".pwdTest2").html('비밀번호가 일치하지 않습니다.');
                }else{
                    $(".pwdTest2").html('');
                }
            })

            $("#userName").keyup(function(){
                if(!nameCheck.test($("#userName").val())){
                    $(".nameTest").html('유효한 이름이 아닙니다.');
                }else{
                    $(".nameTest").html('');
                }
            })
            
            $("#userNickName").keyup(function(){
            	if(!nickCheck.test($("#userNickName").val())){
            		$(".nickNameTest").html('유효한 닉네임 형식이 아닙니다.');
            		$(".nickDoubleCheck").attr("disabled");
                    $(".nickDoubleCheck").css('cursor', 'default').css('color', 'rgb(143, 143, 143)').css('border-color', 'rgb(143, 143, 143)');
            	}else{
            		$(".nickNameTest").html('');
                    $(".nickDoubleCheck").removeAttr("disabled");
                    $(".nickDoubleCheck").css('cursor', 'pointer').css('color', 'rgb(182, 1, 1)').css('border-color', 'rgb(35, 104, 116)');
            	}
            })
            
            $("#email").keyup(function(){
            	if(!emailCheck.test($("#email").val())){
            		$(".emailTest").html('유효한 이메일 형식이 아닙니다.');
            		$(".emailDoubleCheck").attr("disabled");
            		$(".emailDoubleCheck").css('cursor', 'default').css('color', 'rgb(143, 143, 143)').css('border-color', 'rgb(143, 143, 143)');
            	}else{
            		$(".emailTest").html('');
                    $(".emailDoubleCheck").removeAttr("disabled");
                    $(".emailDoubleCheck").css('cursor', 'pointer').css('color', 'rgb(182, 1, 1)').css('border-color', 'rgb(35, 104, 116)');
            	}
            })

            $("#phone").keyup(function(){
                if(!phoneCheck.test($("#phone").val())){
                    $(".phoneTest").html('유효한 연락처 형식이 아닙니다.');
                    $(".phoneDoubleCheck").attr("disabled");
                    $(".phoneDoubleCheck").css('cursor', 'default').css('color', 'rgb(143, 143, 143)').css('border-color', 'rgb(143, 143, 143)');
                }else{
                    $(".phoneTest").html('');
                    $(".phoneDoubleCheck").removeAttr("disabled");
                    $(".phoneDoubleCheck").css('cursor', 'pointer').css('color', 'rgb(182, 1, 1)').css('border-color', 'rgb(35, 104, 116)');
                }
            })
            
        })
    </script>
	
	<!-- 이용약관 modal -->
	<div class="modal" id="viewAgreeRules">
	    <div class="modal-dialog modal-lg modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">
	      
	        <!-- Modal body -->
	        <div class="modal-body" align="left">
	          <h3>이용약관</h3>
	          
	          <br><p><b><a name="a1">여러분을 환영합니다.</a></b></p>
				<p>합플 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 합플 서비스의 이용과 관련하여 합플 서비스를 제공하는 합플 주식회사(이하 ‘합플’)와 이를 이용하는 합플 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 합플 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. </p>
				<p class="sec_last_p">합플 서비스를 이용하시거나 합플 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다</p>
				
				<br><p><b><a name="a2">다양한 합플 서비스를 즐겨보세요.</a></b></p>
				<p>합플은 합플 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
					여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 합플 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 합플 웹고객센터(이하‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.</p>
				<p>합플은 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만,'청소년보호법'등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다.
					자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.</p>
				<p class="sec_last_p">합플 서비스에는 기본적으로 본 약관이 적용됩니다만 합플이 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우가 있습니다. 그리고 합플 계열사가 제공하는 특정 서비스의 경우에도 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다.
					이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다. </p>
					
				<br><p><b><a name="a3">회원으로 가입하시면 합플 서비스를 보다 편리하게 이용할 수 있습니다.</a></b></p>
				<p>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 합플은 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 합플 서비스 이용 계정(이하 ‘계정’)을 부여합니다.
					계정이란 회원이 합플 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.</p>
				<p>회원은 자신의 계정을 통해 좀더 다양한 합플 서비스를 보다 편리하게 이용할 수 있습니다.
					이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 합플 회원가입 방법 등에서 확인해 주세요.</p>
				<p>합플은 단체에 속한 여러 구성원들이 공동의 계정으로 합플 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다.
					단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다.
					단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 합플 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다.
					본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다. </p>
				<p class="sec_last_p">단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책</a> 및 고객센터 내 합플 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다. </p>
				
				<br><p><b><a name="a4">여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</a></b></p>
				<p>합플은 여러분이 게재한 게시물이 합플 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다.
					게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 합플 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.</p>
				<p>합플은 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다. </p>
				<p>한편, 합플 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다. 게시물 게재로 여러분은 합플에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.</p>
				<p>합플은 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 합플 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
					만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.</p>
				<p>또한 여러분이 제공한 소중한 콘텐츠는 합플 서비스를 개선하고 새로운 합플 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 합플 및 합플 계열사에서 사용될 수 있습니다.
					합플은 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.</p>
				<p class="sec_last_p">합플은 여러분이 자신이 제공한 콘텐츠에 대한 합플 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다.
					여러분은 합플 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
					다만, 일부 합플 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다. </p>
				
				<br><p><b><a name="a5">여러분의 개인정보를 소중히 보호합니다.</a></b></p>
				<p>합플은 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집.이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 합플이 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.</p>
				<p class="sec_last_p">합플은 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.</p>
				
				<br><p><b><a name="a6">타인의 권리를 존중해 주세요.</a></b></p>
				<p>여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다.
					합플은 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다.
					보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.</p>
				<p>한편, 합플 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다.
					여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다. </p>
				<p class="sec_last_p">합플은 여러분이 합플 서비스를 마음껏 이용할 수 있도록 여러분께 합플 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다.
					이 경우 여러분의 자유로운 이용은 합플이 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요.</p>
				
				<br><p><b><a name="a7">합플에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.</a></b></p>
				<p>합플은 여러분이 합플 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다.
					포인트는 여러분의 일정한 합플 서비스 이용과 연동하여 합플이 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 합플 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요. </p>
				<p class="sec_last_p">합플은 합플 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다.
					그리고 포인트는 합플이 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 합플 서비스 이용 시 유의해 주시기 바랍니다. </p>
				
				<br><p><b><a name="a8">합플 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</a></b></p>
				<p>합플은 여러분이 합플 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 합플 서비스를 보다 안전하게 이용하고 합플 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다.
					여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 합플 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다. </p>
				<ul class="sec_ul">
					<li>회원 가입 시 이름, 생년월일, 휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다.
						회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록 관리해 주세요.
						자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을 허락해서는 안 됩니다.
						아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다.
					</li>
					<li>타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다. </li>
					<li>관련 법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의 게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다. </li>
					<li>자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을 계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다. </li>
					<li>자동화된 수단을 활용하는 등 합플 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 합플 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 합플 서비스 이용에 불편을 초래하고 더 나아가 합플의 원활한 서비스 제공을 방해하므로 역시 제한될 수 있습니다.
						기타 제한되는 게시물에 관한 상세한 내용은 게시물 운영정책 및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.</li>
					<li>합플의 사전 허락 없이 자동화된 수단(예: 매크로 프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 합플 서비스 회원으로 가입을 시도 또는 가입하거나, 합플 서비스에 로그인을 시도 또는 로그인하거나, 합플 서비스 상에 게시물을 게재하거나, 합플 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등), 합플 서비스에 게재된 회원의 아이디(ID), 게시물 등을 수집하거나, 합플 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를 선택(이른바 ‘클릭’)하는 등 이용자(사람)의 실제 이용을 전제로 하는 합플 서비스의 제공 취지에 부합하지 않는 방식으로 합플 서비스를 이용하거나 이와 같은 합플 서비스에 대한 어뷰징(남용) 행위를 막기 위한 합플의 기술적 조치를 무력화하려는 일체의 행위(예: IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위 등)를 시도해서는 안 됩니다. </li>
					<li>합플의 동의 없이 자동화된 수단에 의해 합플 서비스 상에 광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 삽입해서는 안 됩니다.
						또한, 합플 서비스 또는 이에 포함된 소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을 허락해서는 안 됩니다.
						합플 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방, 기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다).
						그 밖에 바이러스나 기타 악성 코드를 업로드하거나 합플 서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위 역시 금지됩니다.</li>
				</ul>
				<p class="sec_last_p">합플은 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다.</p>
				
				<br><p><b><a name="a9">부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.</a></b></p>
				<p>합플은 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다.
					다만, 이것이 합플이 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.</p>
				<p>또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 합플은 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 합플 서비스 이용에 대한 주의를 당부하거나, 합플 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다.
					한편, 이러한 이용 제한에도 불구하고 더 이상 합플 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다.</p>
				<p>부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다.
					서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다. </p>
				
				<br><p><b><a name="a10">합플의 잘못은 합플이 책임집니다.</a></b></p>
				<p>합플은 여러분이 합플 서비스를 이용함에 있어 합플의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다.
					다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 합플이 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 합플은 책임을 부담하지 않습니다.</p>
				<p>그리고 합플이 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다. </p>
				<p>한편, 합플 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 합플은 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.</p>
				
				<br><p><b><a name="a11">언제든지 합플 서비스 이용계약을 해지하실 수 있습니다.</a></b></p>
				<p>합플에게는 참 안타까운 일입니다만, 회원은 언제든지 합플 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 합플은 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다. </p>
				<p class="sec_last_p">합플 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 합플이 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다.
					다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.</p>
				
				<br><p><b><a name="a12">일부 합플 서비스에는 광고가 포함되어 있습니다.</a></b></p>
				<p>여러분이 다양한 합플 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다.
					합플 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다. </p>
				<p>원하는 합플 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다.
					이는 여러분에게 제공하는 다양한 합플 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 합플이 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다.
					최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.  </p>
				<p class="sec_last_p">합플은 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다.</p>
				
				<br><p><b><a name="a13">서비스 중단 또는 변경 시 꼭 알려드리겠습니다.</a></b></p>
				<p>합플은 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만,
					컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.</p>
				<p>한편, 합플은 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다.
					무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.</p>
				<p class="sec_last_p">이 경우 합플은 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다.
					또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.</p>
					
				<br><p><b><a name="a14">주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.</a></b></p>
				<p>합플은 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다.
					회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며,
					다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 합플 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.</p>
				<p>합플은 여러분의 소중한 의견에 귀 기울이겠습니다.
					여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며,
					합플은 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.</p>
			    
			    <br><p><b><a name="a15">여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.</a></b></p>
				<p>합플은 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록 서비스 초기 화면에 게시하고 있습니다. </p>
				<p>합플은 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며,
					사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.</p>
				<p>합플은 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다.
					위 기간이 지나도록 여러분의 의견이 합플에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다.
					합플로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.</p>
				<p>합플 서비스에는 기본적으로 본 약관이 적용됩니다만,
					부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다.
					따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다.
					이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다. </p>
				<p>본 약관은 한국어를 정본으로 합니다. 본 약관 또는 합플 서비스와 관련된 여러분과 합플와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 합플 서비스와 관련하여 여러분과 합플 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</p>
				<dl class="service_info">
					<dt>공지 일자:</dt>
					<dd>2023년 1월 26일</dd>
					<dt>적용 일자:</dt>
					<dd>2023년 2월 1일</dd>
				</dl>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	  
	  <!-- 개인정보수집약관 -->
	  <div class="modal fade" id="viewAgreeCollection">
	    <div class="modal-dialog modal-lg modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">

	        <!-- Modal body -->
	        <div class="modal-body">
	          <h3>개인정보 처리 방침</h3>
	          <p><strong id="a2_2">회원가입 시점에 합플이 이용자로부터 수집하는 개인정보는 아래와 같습니다.</strong></p>
              <ul class="bu">
                  <li>회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.</li>
                  <br><li>단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.</li>
              </ul>
	          
              <dl class="tgl_cont" id="tgl2-1">
                  <dt>(1) 필수항목과 선택항목의 차이</dt>
                  <dd>필수항목이란 서비스의 본질적 기능을 수행하기 위해 필요한 정보이며, 선택항목이란 서비스 이용 자체에 영향을 미치지는 않으나 이용자에게 부가적인 가치를 제공하기 위해 추가로 수집하는 정보입니다. 회원가입 시에 수집하는 아이디, 비밀번호는 로그인을 위하여 필요한 정보이며 이름, 생년월일, 성별은 회원제 서비스 운영에 따르는 이용자 구분을 위하여 사용됩니다. 가입인증 휴대폰번호는 불법 광고 게시 등 부정한 목적으로 회원가입을 시도하는 경우, 이용제한 조치 등을 적용하기 위하여 수집합니다. 선택항목은 입력을 하지 않아도 회원 가입이나 서비스 이용에 제한이 없으며, 필요할 경우 ‘HOBBYPLACE 내정보 &gt; 회원정보 &gt; 연락처’에서 사후에 언제든지 직접 입력하실 수 있습니다.</dd>
                  <dt>(2) 법정대리인 정보를 수집하는 이유</dt>
                  <dd>만 14세 미만 아동의 개인정보를 수집할 경우, 회사는 개인정보보호법에 따라 법정대리인(부모 등 아동의 보호자)의 동의를 받아야 합니다. 이에 따라 합플은 만 14세 미만 아동의 개인정보 수집 시점에서 법정대리인의 동의를 받고 있으며, 이 과정에서 법정대리인의 이름, DI, 휴대폰번호(모바일 인증 시에만)를 수집합니다. 수집된 법정대리인의 정보는 아동이 성년이 되는 시점에서 파기하고 있습니다.</dd>
                  <dt>(3) 단체정보의 개인정보 인정 여부</dt>
                  <dd>개인정보보호법에서 정의하는 개인정보는 ‘살아있는 자연인에 대한 정보’를 말합니다. 따라서 단체명, 영업소 주소 및 전화번호, 대표자 성명 등과 같은 법인이나 단체에 관한 정보는 원칙적으로 개인정보에 해당하지 않습니다. 합플 단체아이디로 회원 가입 시에 수집하는 대부분의 정보는 개인정보에 해당하지 않습니다. 하지만 개인 사업자 등의 경우 이를 단체정보로만 처리하기 모호한 측면이 있고, 관리자/담당자의 연락처 정보 등을 수집하기 때문에 본 개인정보처리방침에서는 단체정보의 수집 관련 내용을 기재하여 이용자의 이해를 돕고 있습니다.</dd>
              </dl><br>
              <p><strong id="a2_3">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.</strong></p>
              <ul class="bu">
                  <li>회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. <span>회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.</li>
                  <li>합플 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</li>
              </ul><br>
              
                  <p><strong>서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.</strong></p>
                  <p>구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하거나 이용자가 입력한 정보를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며, 합플에서 제공하는 위치기반 서비스에 대해서는 '합플 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.<br />이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.</p>
              <br>
              
	             <dl class="tgl_cont" id="tgl2-2">
	                 <dt>IP(Internet Protocol) 주소란?</dt>
	                 <dd>IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가 개인정보에 해당하는지 여부에 대해서는 각국마다 매우 다양한 견해가 있습니다.</dd>
	                 <dt>서비스 이용기록이란?</dt>
	                 <dd>합플 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체,메일 수발신 과정에서 기록되는 이메일주소, 친구 초대하기 또는 선물하기 등에서 입력하는 휴대전화번호, 스마트스토어 판매자와 구매자간 상담내역(합플톡톡 및 상품 Q&A 게시글) 등을 의미합니다.</dd>
	                 <dt>기기정보란?</dt>
	                 <dd>본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 모두 일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의 이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에 필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA, 설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, 합플은 IMEI와 같은 기기의 고유한 식별값을 수집할 필요가 있는 경우, 이를 수집하기 전에 합플도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여 식별성(Identifiability)을 제거한 후에 수집합니다.</dd>
	                 <dt>쿠키(cookie)란?</dt>
	                 <dd>쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의 텍스트 파일입니다. 이후 이용자가 다시 웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가 설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케 합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된 서비스(광고 포함)를 제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 합플 일부 서비스의 이용에 불편이 있을 수 있습니다.</dd>
	             </dl><br>
              <p><strong id="a2_5">합플은 아래의 방법을 통해 개인정보를 수집합니다.</strong></p>
	                <ul class="bu">
	                    <li><i></i>회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우, 해당 개인정보를 수집합니다.</li>
	                    <li><i></i>고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.</li>
	                    <li><i></i>오프라인에서 진행되는 이벤트, 세미나 등에서 서면을 통해 개인정보가 수집될 수 있습니다.</li>
	                    <li><i></i>합플와 제휴한 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 개인정보보호법에 따라 제휴사에서 이용자에게 개인정보 제공 동의 등을 받은 후에 합플에 제공합니다.</li>
	                    <li><i></i>기기정보와 같은 생성정보는 PC웹, 모바일 웹/앱 이용 과정에서 자동으로 생성되어 수집될 수 있습니다.</li>
	                </ul><br>
              <p><strong id="a3_1">합플 및 합플 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발·제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.</strong></p>
                    <ul class="bu">
                        <li><i></i>회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>법령 및 합플 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.</li>
                        <li><i></i>이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.</li>
                        <li><i></i>서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.</li>
                        <li><i></i>보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</li>
                    </ul><br>
               <p><strong id="a4_1">합플은 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.</strong></p>
                    <p>합플은 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의거해 합플에 개인정보 제출 의무가 발생한 경우, 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우에 한하여 개인정보를 제공하고 있습니다.</p>  
          		<br>
          		
       		   <p><strong id="a5_4">전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 합플은 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.</strong></p>
                 <dl class="bu">
                     <dt><i></i>전자상거래 등에서 소비자 보호에 관한 법률</dt>
                     <dd>계약 또는 청약철회 등에 관한 기록 : 5년 보관</dd>
                     <dd>대금결제 및 재화 등의 공급에 관한 기록 : 5년 보관</dd>
                     <dd>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 보관</dd>
                     <dt><i></i>전자문서 및 전자거래 기본법</dt>
                     <dd>공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관</dd>
                     <dt><i></i>통신비밀보호법</dt>
                     <dd>로그인 기록 : 3개월</dd>
                 </dl><br>
              <p><strong id="a5_5">회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. <br />법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.</strong></p>
              <p>전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.</p>
              <p><strong id="a5_6">참고로 합플은 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는 삭제하여 관리하고 있습니다.</strong></p>
                    
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
    
    
   <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>