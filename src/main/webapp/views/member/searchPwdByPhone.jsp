<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hobby Place</title>
<style>
        /*div{border:1px solid black;}*/
        div{box-sizing:border-box;}
        .cWrap{width:1000px; margin:auto;}
        .content{width:100%; margin-top:5px;}

        .selectMethod{width:20%; display:inline-block; font-size: 17px; font-weight: bold; color:rgb(64, 64, 64); line-height:2; }
        .selectMethod:hover{cursor: pointer;}
        .m1{border-bottom:4px solid rgb(35, 104, 116);}
        .m2{border-bottom:2px solid gray;}
        
        .divForm{
            width:30%;
            align-self: center;
            text-align: left;
        }
        h4{margin-bottom:0; margin-top:0; margin-left:5px;}
        .cInput{
            margin:auto; margin-top:5px; height:50px; width:100%; box-sizing:border-box; padding-left:10px; 
            border:1px solid gray;
            border-radius: 10px;
            font-size:15px;
        }
        .cButton{
            margin:auto; margin-top:5px; height:50px; width:100%; box-sizing:border-box; padding-left:10px; 
            border:2px solid rgb(35, 104, 116);
            border-radius: 10px;
            font-size:15px;
        }
        
        .getCode, .submitCode{background:rgb(35, 104, 116); color:white; font-size:18px; font-weight:bolder;}
        .cButton:hover{cursor:pointer}
        .inputCodeForm{display:none;}
        .cCode{width:65%; display:inline-block;}
        .sendAgain{border:0; width:33%; display:inline-block;}
        
    </style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">
        <div class="header"></div>
        <div class="content" align="center">

            <br><br><br>

            <h3 align="center">비밀번호 찾기</h3>

            <br>

            <div class="selectMethod m1">
                휴대폰 인증
            </div><div class="selectMethod m2" >
                이메일 인증
            </div>
			<script>
				$(function(){
					$(".m2").click(function(){
						location.href = "<%=contextPath%>/searchPwdByEmail.me";
					})
				})
			</script>
            <br><br><br>

            <div class="divForm" align="center">
                <h6>아이디</h6>
                <input type="text" class="cInput" id="userId" required placeholder="이름을 입력해주세요"> <br><br>
                
                <h6>휴대폰 번호</h6>
                <input type="text" class="cInput" id="userPhone" required placeholder="휴대폰번호를 입력해주세요(-포함입력)">
                
                <br><br>
                <button type="button" class="getCode cButton" onclick="sms();">인증번호 받기</button> <br><br>

              
                <div class="inputCodeForm">
                    <input type="text" class="cCode cInput" placeholder="6자리 입력" required>
                    <button class="sendAgain cCode cButton" onclick="sms();">재발송</button>

                    <button class="submitCode cButton">확인</button>
                </div>

               <script>
	                var code = "";
					
		       		function sms(){
		       			var $memId = $("#userId").val();
		       			var $phone = $("#userPhone").val();
		       			$.ajax({
		       				url: "<%=contextPath%>/pwdByPhone.me",
		       				data:{
		       					memId:$memId,
		       					phone:$phone
		       				},
		       				type:"post",
		       				success:function(result){
		       					if(result=="NNNNN"){//가입되지않은회원
		       						alert("가입된 회원이 아닙니다");
		       						
		       					}else{//가입된회원						
		       						$("#sendSms").css("background", "gray").css("border-color", "gray");
		                               $("#sendSms").attr("disabled", true);
		       						$(".inputCodeForm").show();
		       						code = result.key;
		                            
		       					}
		       				},
		       				error: function(){
		       					console.log("연락처로 아이디찾기 ajax 통신 실패");
		       				}
		       			});
		       		}
		       		
		       		$(function(){
		        		$(".sendAgain").on("click", $(".sendAgain"), function(){
		        			$(".cCode").val('');
		        			alert("인증코드가 재발송되었습니다.");
		        		})
		        		$(".submitCode").on("click", $(".submitCode"), function(){
		        			if(code == $(".cCode").val()) {
		        				$(".cCode").val('');
		        				location.href = '<%=contextPath%>/searchPwd.me?memId=' + $("#userId").val();
		        			}else {
		        				$(".cCode").val('');
		        				alert("인증코드가 일치하지 않습니다.");
		        			}
		        			  
		                 })
		        	})
                                    
                </script>             

            </div>
			
        </div>
    </div>
    
    
    
	<br><br><br><br>
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>