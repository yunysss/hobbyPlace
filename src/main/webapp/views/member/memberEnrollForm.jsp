<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.hp.lesson.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                        <td><button type="button" class="showRules">약관보기 >></button></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td class="td2 agreement"><input type="checkbox" id="agreeCollection" required> <label for="agreeCollection"> 개인정보 수집 이용 동의(필수)</label></td>
                        <td><button type="button" class="showRules">약관보기 >></button></td>
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


    
    
   <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>