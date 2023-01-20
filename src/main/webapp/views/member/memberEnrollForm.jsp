<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*div{border:1px solid black;}*/
    div{box-sizing:border-box;}
    .cWrap{width:1000px; margin:auto;}
    .content{width:100%; margin-top:5px;}

    form{width:70%;}
    span{display:inline-block; align: right;}
    #star{color:rgb(182, 1, 1); font-size:15px; font-weight:bolder;}
    form>table{width:85%; padding:0; border:0;}
    .td1{width:25%; padding:10px;}
    .td2{width:52%;}
    .td3{width:25%; padding-left:10px;}

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
        border:1px solid rgb(35, 104, 116);
        border-radius:5px;
        color:rgb(182, 1, 1);
        background: white;
    }
    #postCode{width:48%;}
    .doubleCheck:hover{cursor:pointer; border:2px solid rgb(35, 104, 116);}
    .gender{width:33px;}
    .birthDay{
        width:30%;
        height:35px;
        box-sizing:border-box;  
        border:1px solid rgb(35, 104, 116);
        border-radius:5px;
    }
    /*
    .birthDay select::-webkit-scrollbar {
        width: 10px;
    }

    .birthDay select::-webkit-scrollbar-thumb {
        background-color: #b6b6b6;
        border-radius: 3px;
    }

    .birthDay select::-webkit-scrollbar-track {
        background-color: #ebe9e9;
        border-radius: 6px;
    }
    */
    #getCode{background:rgb(35, 104, 116); color:white; font-size:18px; font-weight:bolder;}
    .profileButton{
        height:30px;
        width:60px;
        box-sizing:border-box;  
        border:0;
        border-radius:5px;
        background-color:rgb(200, 199, 199);
    }
    .profileButton:hover{cursor:pointer;}
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
            <form action="">

                <h1>회원가입</h1>

                <div align="right" style="margin-right: 30px;"><span id="star">*</span>필수입력사항</div>

                <hr>
                
                <table>
                    <tr>
                        <td class="td1">아이디 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="userId" class="fillOutForms" placeholder="영문과 숫자 조합 6~16자" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">비밀번호 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="password" class="fillOutForms" placeholder="영문, 숫자, 특수문자 포함 12~20자" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">비밀번호 확인 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="password" class="fillOutForms" placeholder="영문, 숫자, 특수문자 포함 12~20자" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">이름 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="userName"  class="fillOutForms" placeholder="이름을 입력해주세요" required>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">닉네임 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="text" class="fillOutForms" placeholder="8글자 이내로 입력하세요" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">이메일 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="email" class="fillOutForms" placeholder="예) hobbyplace@hobpl.com" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck">중복확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1">휴대폰 <span id="star">*</span></td>
                        <td class="td2">
                            <input type="text" id="phone" class="fillOutForms"  placeholder="-포함하여 입력해주세요" required>
                        </td>
                        <td class="td3">
                            <button type="button" class="doubleCheck">인증번호 받기</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="td1" rowspan="2">주소</td>
                        <td class="td2">
                            <input type="text" id="address1" placeholder="우편번호">
                            <button type="button" id="postCode" class="doubleCheck">우편번호 검색</button>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td2">
                            <input type="text" id="address2"  class="fillOutForms" placeholder="상세주소">
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">성별</td>
                        <td class="td2">
                            <input type="radio" class="gender" name="gender" id="male"><label for="male">남자</label>
                            <input type="radio" class="gender" name="gender" id="female"><label for="female">여자</label>
                            <input type="radio" class="gender" name="gender" id="doNotSelect" checked><label for="doNotSelect">선택안함</label>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1">생년월일</td>
                        <td class="td2">
                            <select class="birthDay" id="bYear">
                                <option disabled selected>출생 연도</option>
                            </select>
                            <select class="birthDay" id="bMonth">
                                <option disabled selected>월</option>
                            </select>
                            <select class="birthDay" id="bDate">
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

                            for(let i=1; i<=12; i++){
                                $("#bMonth").append("<option value='" + i + "'>" + i + "</option>");
                            }

                            for(let i=1; i<=31; i++){
                                $("#bDate").append("<option value='" + i + "'>" + i + "</option>");
                            }

                           
                            $("#bMonth").change(function(){
                                if($(this).val() == 2){
                                    const d30 = $("#bDate option[value='30']").detach();
                                    const d31 = $("#bDate option[value='31']").detach();
                                    
                                }else {
                                    
                                    $("#bDate").append(d);
                                   
                                    
                                }
                                
                              
                               
                            })
                            
                            /*
                            if($("#bMonth").change()){
                                console.log("change발생");
                                console.log($(this).children("option:selected").val());
                                if($(this).val() == 2){
                                    $("#bDate option[value='30']").remove(); 
                                    $("#bDate option[value='31']").remove(); 

                                }
                            }else{
                                $("#bDate").append("<option value='30'>30</option>");
                                $("#bDate").append("<option value='31'>31</option>");
                            }
                            */
                           
                            
                            /*
                            if($("#bMonth option[value='4']") || 
                                $("#bMonth option[value='6']") || 
                                $("#bMonth option[value='9']") ||
                                $("#bMonth option[value='11']")
                                ){
                                $("#bDate option[value='31']").remove(); 
                            }
                            */
                            
                        })
                    </script>
                    <tr>
                        <td class="td1">프로필사진</td>
                        <td class="td2">
                            <button type="button" class="profileButton" id="uploadPicture">업로드</button>
                            <button type="reset" class="profileButton" id="deletePicture">삭제</button>
                        </td>
                        <td class="td3"></td>
                    </tr>
                    <tr>
                        <td class="td1"></td>
                        <td  class="td2" rowspan="2">
                            <img src="" alt="">
                        </td>
                        <td class="td3"></td>
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
                            <input type="checkbox" name="interest" id="education"> <label for="education">학업 (외국어, IT, 자격증 등)</label> <br>
                            <input type="checkbox" name="interest" id="diy"> <label for="diy">공예 DIY (가죽, 비누, 꽃, 뜨개질 등)</label> <br>
                            <input type="checkbox" name="interest" id="cooking"> <label for="cooking">쿠킹 (요리, 베이킹)</label> <br>
                            <input type="checkbox" name="interest" id="drawing"> <label for="drawing">드로잉</label> <br>
                            <input type="checkbox" name="interest" id="sports"> <label for="sports">스포츠</label> <br>
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
                <button type="submit" id="submitForm">가입하기</button>
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

    
    
    
   <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>