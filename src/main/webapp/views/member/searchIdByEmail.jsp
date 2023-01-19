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

        .selectMethod{width:20%; display:inline-block; font-size: 17px; font-weight: bold; color:rgb(64, 64, 64); line-height:2; }
        .selectMethod:hover{cursor: pointer;}
        .m2{border-bottom:4px solid rgb(35, 104, 116);}
        .m1{border-bottom:2px solid gray;}



        form{
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
        <div class="content" align="center">

            <br><br><br>

            <h1 align="center">아이디 찾기</h1>

            <br>

            <div class="selectMethod m1">
                휴대폰 인증
            </div><div class="selectMethod m2" >
                이메일 인증
            </div>
            <script>
            	$(function(){
            		$(".m1").click(function(){
						location.href = "<%=contextPath%>/searchIdByPhone.me";
					})
            	})
            </script>

            <br><br><br>

            <form action="" align="center">
                <h6>이름</h6>
                <input type="text" class="cInput" id="userName" required placeholder="이름을 입력해주세요"> <br><br>
                
                <h6>이메일 주소</h6>
                <input type="email" class="cInput" id="userEmail" required placeholder="이메일주소를 입력해주세요">
                
                <br><br>
                <button type="button" class="getCode cButton">인증번호 받기</button> <br><br>

              
                <div class="inputCodeForm">
                    <input type="text" class="cCode cInput" placeholder="6자리 입력" required>
                    <button class="sendAgain cButton">재발송</button>
                    <br>
                    <button type="submit" class="submitCode cButton">확인</button>
                    
                </div>

               <script>
                    $(function(){
                        $(".getCode").click(function(){
                            $(this).css("background", "gray").css("border-color", "gray");
                            $(".inputCodeForm").show();
                        })
                    })
                </script>             
                    <br><br><br>
            </form>

        </div>
    </div>

</body>
</html>