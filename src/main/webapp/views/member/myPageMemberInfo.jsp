<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.lang.String.*"%>
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
       .content{width:80%; float:left; margin-top:5px; padding-top:100px; margin-left:200px;}
       .mpMenubar{
       		width:200px; padding-top:15px;float:left;
       		position:fixed; top:130px; background: white;
       }
       
       .categoryMain {
           width:90%;
           height:50px;
           font-size:13px;
           margin:auto;
           margin-bottom:5px;
           line-height:50px;
           border:1px solid; border-color: rgb(35, 104, 116);  
           color:rgb(64, 64, 64);
           background-color: white;
           border-radius:5px;
           font-size: 14px;
       }
       .categoryMain:hover{
           cursor: pointer;  
       }
       #viewMyInfo{color:white; background-color:rgb(35, 104, 116); font-weight:bolder;}
       .mpMenubar ul{
           color:rgb(64, 64, 64);
           list-style-type:none;
           line-height:2;
           text-align:left;
           display:none;
       }
       .mpMenubar li:hover{
           cursor: pointer;
           color:black;
           font-weight: bolder;
       }
       
       .pageRoute{  
       	position:fixed;
       	top:120px;
       	width:800px;
       	background:white;
       	padding-top:20px;
       }
       #home {width:20px; height:20px; vertical-align: text-bottom;}
       #home:hover{cursor:pointer;}
       .contentA{text-decoration:none; color:black;}

       .contentMain{padding-left:15px; padding-top:30px;}

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
	    #changePwdB{
	        height:30px; width:170px;
	        margin:auto;
	        background:rgb(35, 104, 116); color:white; 
	        border:0;
	        border-radius: 5px;
	    }
	    #updateButton:hover, .showRules:hover, .agreeAll:hover, .agreement:hover {cursor: pointer;}
	    .hiddenPwd{display: none;}
	    .profileImage{align:center;}
	    #updateButton{
	        height:45px;
	        width:150px;
	        box-sizing:border-box;  
	        background:rgb(35, 104, 116); color:white; 
	        border:0; border-radius: 10px;
	        font-size:17px;
	    }
	    .td10{width:30%; padding-right:5px;}
	    .td20{width:70%;}
</style>
<script>
     $(function(){
  	   $(".categoryWrap").mouseover(function(){
              if($(this)){
                 $(this).children("div").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                 $(this).siblings().children("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");

                  if($(this).children("ul").css("display")=="none"){
                      $(this).siblings().children("ul").slideUp();
                      $(this).children("ul").slideDown();
                  }
             }
          })          
	
          $(".categoryWrap").mouseleave(function(){
          	$(this).children("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");
              $("#viewMyInfo").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
              $(this).children("ul").slideUp(); 
          })
          
     })
</script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	
	<%
    	String memId = loginUser.getMemId();
    	String memName = loginUser.getMemName();
    	String memNick = loginUser.getMemNick();
    	String phone = loginUser.getPhone();
    	String email = loginUser.getEmail() == null ? "" : loginUser.getEmail();
    	String gender = loginUser.getGender();
    	String memBirth = loginUser.getMemBirth();
    	String address = loginUser.getMemAddr() == null ? "" : loginUser.getMemAddr();
    	String interest = loginUser.getInterest() == null ? "" : loginUser.getInterest();
    %> 
	<div class="cWrap">
        <div class="mpMenubar">
            <h3 align="center">마이페이지</h3>
			<br><br>
			
            <div class="categoryWrap">
				<div class="categoryMain" align="center" id="viewMyInfo">회원정보 조회 및 수정</div>
	            <ul class="categoryDetail">
	            </ul>
			</div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyQna">나의 문의 조회</div>
	            <ul class="categoryDetail">
	                <li id="selectMyQna" onclick="">나의 문의 내역</li>
	                <li id="insertMyQna" onclick="">문의하기</li>
	            </ul>
            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyClass">마이클래스</div>
	            <ul class="categoryDetail">
	            </ul>
            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="withdrawal">회원탈퇴</div>
	            <ul class="categoryDetail">
	            </ul>
            </div>
        </div>
        <script>
            $(function(){
                $("#viewMyInfo").click(function(){
                    //회원정보 조회 및 수정 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/memberInfo.me";
                })
                $("#selectMyQna").click(function(){
                    // 나의 문의 조회>>나의 문의내역 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/.....";
                })
                $("#insertMyQna").click(function(){
                    // 나의 문의 조회>> 문의하기 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/.....";
                })
                $("#viewMyClass").click(function(){
                    //마이클래스 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/myClass.tt";
                })
                $("#withdrawal").click(function(){
                    // 회원탈퇴 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/withdrawal.me";
                })


            })
        </script>


        <div class="content">
            <div class="pageRoute">
                &nbsp;  <svg xmlns="http://www.w3.org/2000/svg" id="home"  width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                  </svg>
                > <a class="contentA" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
                > 회원정보 조회 및 수정

                <hr>
            </div>
            <script>
	        	$(function(){
	        		$("#home").click(function(){
	        			location.href="<%=contextPath%>/main.tee"
	        		})
	        	})
	        </script>
            
            
            <div class="contentMain">
            
            
            <div align="center"><h3>나의 회원 정보</h3></div>
            <br><br>
            
            <form action="<%=contextPath%>/update.me" method="post">
            	<input type="hidden" name="memId" value="<%=memId%>">
            	
                <div align="center">
                    <% if(loginUser.getMemProfile() == null) {%>
                        <img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" style="width:100px; height:100px;" class="rounded-circle loadedProfile">
                    <%} else {%>
                        <img src="<%=contextPath%><%=loginUser.getMemProfile()%>" style="width:100px; height:100px;" class="rounded-circle loadedProfile">
                    <%} %>
                </div>
                <table>  
                    <tr>
                        <td class="td1">아이디 </td>
                        <td class="td2">
                            <%=memId%>
                        </td>
                        <td class="td3">
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="td1">비밀번호 </td>
                        <td class="td2">
                            <button type="button" id="changePwdB" data-toggle="modal" data-target="#changePwd">비밀번호 변경하기</button>
                        </td>
                        <td class="td3"></td>
                    </tr> 
                    <tr>
                        <td class="td1">이름 </td>
                        <td class="td2">
                            <%=memName%>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="td2 checkAlert nameTest"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="td1">닉네임 </td>
                        <td class="td2">
                            <input type="text" id="userNickName" class="fillOutForms" name="userNick" value="<%=memNick%>" placeholder="6자이내로입력하세요" required>
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
                        <td class="td1">이메일 </td>
                        <td class="td2">
                            <input type="email" class="fillOutForms" id="email" name="email" value="<%=email%>" required>
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
                        <td class="td1">휴대폰 </td>
                        <td class="td2">
                            <input type="text" id="phone" class="fillOutForms" name="phone" onclick="check();" value="<%=phone%>" required>
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
                    <script>
		                $(function(){
		            		const address = "<%=address%>";
		            		
		            		if(address.charAt(5)=="/"){
		            			const addressArr = address.split("///");
			            		$("#address1").val(addressArr[0]);
			            		$("#address2").val(addressArr[1]);
			            		if(!addressArr[2]){
			            			$("#address3").val("");
			            		}else{
			            			$("#address3").val(addressArr[2]);
			            		}
		            		}else{
		            			$("#address2").val(address);
		            		}
		            		
		            		
		            		
		            			            		
			            })
	                </script>  
                    <tr>
                        <td class="td1">성별</td>
                        <td class="td2">
                            <input type="radio" class="gender" name="gender" value="M" id="male"><label for="male">남자</label>
                            <input type="radio" class="gender" name="gender" value="F" id="female"><label for="female">여자</label>
                            <input type="radio" class="gender" name="gender" value="X" id="doNotSelect"><label for="doNotSelect">선택안함</label>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <script>
                    	$(function(){
                    		const gender = "<%=gender%>";
                    		// 현재 로그인한 회원의 관심분야들
                    		// "sports,climbing,game" | ""
                    		
                    		$("input[type=radio]").each(function(){
                    			// $(this) : 순차적으로 접근하는 체크박스input요소
                    			// $(this).val() : 순차적으로 접근하는 체크박스input요소의 value값 (sports, climbing, ...)
                    			if(gender.search($(this).val()) != -1){
                    				$(this).attr("checked", true);
                    			}
                    		})
                    	})
                    </script>
                    
                    <tr>
                        <td class="td1">생년월일</td>
                        <td class="td2 bDay">
                            <select class="birthDay" name="memBirth" id="bYear">
                                <option disabled>출생 연도</option>
                            </select>
                            <select class="birthDay" name="memBirth" id="bMonth">
                                <option disabled>월</option>
                            </select>
                            <select class="birthDay" name="memBirth" id="bDate">
                                <option disabled>일</option>
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
                    <script>
		                $(function(){
		            		const memBirth = "<%=memBirth%>";
		            		const memBirthArr = memBirth.split("-");
		            		$("#bYear").val(memBirthArr[0]).prop("selected", true);
		            		$("#bMonth").val(memBirthArr[1]).prop("selected", true);
		            		$("#bDate").val(memBirthArr[2]).prop("selected", true);		            		
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
                
                    <script>
                        function readURL(input) {
                            if(input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $(".loadedProfile").attr('src', e.target.result);
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
                            <input type="checkbox" class="interest" name="interest" value="11" id="education"> <label for="education">학업 (외국어, IT, 자격증 등)</label> <br>
                            <input type="checkbox" class="interest" name="interest" value="22" id="diy"> <label for="diy">공예 DIY (가죽, 비누, 꽃, 뜨개질 등)</label> <br>
                            <input type="checkbox" class="interest" name="interest" value="33" id="cooking"> <label for="cooking">쿠킹 (요리, 베이킹)</label> <br>
                            <input type="checkbox" class="interest" name="interest" value="44" id="drawing"> <label for="drawing">드로잉</label> <br>
                            <input type="checkbox" class="interest" name="interest" value="55" id="sports"> <label for="sports">스포츠</label> <br>
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
                <script>
                $(function(){
            		const interest = "<%=interest%>";
            		// 현재 로그인한 회원의 관심분야들
            		// "sports,climbing,game" | ""
            		
            		$("input[type=checkbox]").each(function(){
            			// $(this) : 순차적으로 접근하는 체크박스input요소
            			// $(this).val() : 순차적으로 접근하는 체크박스input요소의 value값 (sports, climbing, ...)
            			if(interest.search($(this).val()) != -1){
            				$(this).attr("checked", true);
            			}
            		})
            		
            	})
                </script>
                <br><br><br>
                <div align="center">
                    <button type="submit" id="updateButton">수정완료</button>
                </div>
            </form>
            <br><br><br><br><br>
            </div>
            
		
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

            $("#newPwd").keyup(function(){
                if(!pwdCheck.test($("#newPwd").val())){
                    $(".pwdTest1").html('유효한 비밀번호가 아닙니다.');
                }else{
                    $(".pwdTest1").html('');
                }
            })

            $("#newPwdCheck").keyup(function(){
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
    
    
    
    <!-- 비밀번호 변경 Modal -->
	<div class="modal" id="changePwd">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	     <div class="modal-header">
	       <h5 class="modal-title">비밀번호 변경</h5>
	       <button type="button" class="close" data-dismiss="modal">&times;</button>
	     </div>
	
	     <!-- Modal body -->
	     <div class="modal-body" align="center">
	       <table class="pwdModal">
	       		<tr>
	                 <td class="td10">기존 비밀번호</td>
	                 <td class="td20">
	                     <input type="password" class="fillOutForms" id="userPwd" name="userPwd" required>
	                 </td>
	             </tr>
	             <tr>
                    <td></td>
                    <td class="td2 checkAlert"></td>
                 </tr>
	             <tr>
	                 <td class="td10">새로운 비밀번호</td>
	                 <td class="td20">
	                     <input type="password" class="fillOutForms" id="newPwd" name="newPwd" placeholder="영문+숫자+특수문자(6~20)" required>
	                 </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="td2 checkAlert pwdTest1"></td>
                </tr>
                <tr>
	                 <td class="td10">비밀번호 확인</td>
	                 <td class="td20">
	                     <input type="password" class="fillOutForms" id="newPwdCheck" placeholder="영문+숫자+특수문자(6~20)" required>
	                 </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="td2 checkAlert pwdTest2"></td>
                </tr>
	       </table>
	       <br>
	       <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="pwdUpdate();">변경하기</button>
	     </div>
	    </div>
	  </div>
	</div>
	<script>
		function pwdUpdate(){
			const memId = <%=memId%>;
			const $userPwd = $("#userPwd");
			const $newPwd = $("#newPwd");
			
			$.ajax({
				url:"<%=contextPath%>/pwdUpdate.me",
				data:{
					memId:$userId,
					memPwd:$userPwd.val(),
					newPwd:$newPwd.val()
					},
				type:"post",
				success:function(result){
					if(result == "NNNNN"){ //비밀번호변경실패
						$("#alertPwd").alert().show();
						$("#userPwd").val().focus();
						
					}else if(result == "NNNNY"){ //비밀번호변경성공
						$('#changePwd').modal().hide();
						$('#changePwdSuccess').modal('show');
					}
				},
				error:function(){
					console.log("비밀번호 업데이트용 ajax 통신실패");
				}
			})
			
		}
	</script>
	<!-- 비밀번호변경성공Modal -->
	<div class="modal fade" id="changePwdSuccess">
	   <div class="modal-dialog">
	      <div class="modal-content" align="center">
	      	
	          비밀번호가 변경되었습니다
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
	        
	      </div>
	    </div>
	  </div>
	  
	 <!-- 비밀번호변경실패 alert -->
	 <div class="alert alert-danger" id="alertPwd">
     <strong>비밀번호 변경 실패</strong> 기존 비밀번호를 다시 확인해주세요
     </div>
	  
	  
	
    <br clear="both">
     <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>