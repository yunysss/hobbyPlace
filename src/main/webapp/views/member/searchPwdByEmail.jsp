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
        .m2{border-bottom:4px solid rgb(35, 104, 116);}
        .m1{border-bottom:2px solid gray;}



        #divForm{
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
        button:hover{cursor:pointer}
        .inputCodeForm{display:none;}
        .cCode{width:65%; display:inline-block;}
        .sendAgain{border:0; width:33%; display:inline-block;}
        
    </style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	
	<div class="cWrap">
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
            		$(".m1").click(function(){
            			location.href = "<%=contextPath%>/searchPwdByPhone.me";
            		})
            	})
            </script>

            <br><br><br>

            <div id="divForm" align="center">
                <h6>아이디</h6>
                <input type="text" class="cInput" id="userId" required placeholder="아이디를 입력해주세요"> <br><br>
                
                <h6>이메일 주소</h6>
                <input type="email" class="cInput" id="userEmail" required placeholder="이메일주소를 입력해주세요">
                
                <br><br>
                <button type="button" class="getCode cButton" onclick="sendCode();">인증번호 받기</button> <br><br>

              
                <div class="inputCodeForm">
                    <input type="text" class="cCode cInput" placeholder="6자리 입력" required>
                    <button class="sendAgain cButton" onclick="sendCode();">재발송</button>
                    <br>
                    <button class="submitCode cButton">확인</button>
                    
                </div>

               <script>
               var code = "";
		    	var memId = "";
		    	function sendCode(){
                    
                    $.ajax({
                   	 url:"<%=contextPath%>/mailForPwd.me",
                   	 data:{memId:$("#userId").val(),
                   		   email:$("#userEmail").val()
                   	 },
                   	 type:"post",
                     success:function(result){
                       	 
                       	 if(result == "NNNNN") {//이메일주소 다르거나 존재하는 회원이 아니면
                       	 		alert("해당 아이디와 이메일로 일치하는 회원이 없습니다.");
				   					
		   				}else {
		   					console.log(result.key);
		   					
		   					$(".getCode").css("background", "gray").css("border-color", "gray");
	                        $(".inputCodeForm").show();
	                        code = result.key;
	                        memId = result.memId;
	                        
		   				}
                        },
                     error:function(){
                       	 	console.log("ajax통신실패");
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
		    				location.href = '<%=contextPath%>/searchPwd.me?memId=' + memId;
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