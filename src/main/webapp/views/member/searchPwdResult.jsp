<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)request.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    div{box-sizing:border-box;}
    .cWrap{width:1000px; margin:auto;}
    .header{width:100%; height:200px;}
    .content{width:100%; margin-top:5px;}
    
    .welcomeText{
        align-self: left;


        width:700px;
        padding:30px 30px 30px 100px;
        color:rgb(47, 46, 46);
    }
    .welcomeText>p{font-size:20px;}
    
    .moveToGuide{
        color:white;
        background-color: rgb(5, 17, 19);
        width:220px; height:40px;
        border:0;
        border-radius: 5px;
    }
    .fillOutForms{
        width:100%;
        height:45px;
        box-sizing:border-box;  
        border:1px solid rgb(52, 53, 54);
        border-radius:5px;
        padding:10px;
    }
    table{font-size:17px;}
    #idCell{font-size:20px; font-weight: 600;}
</style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">

        <div class="content" align="center">
            
            <br><br><br><br><br>
            
            
            <div class="welcomeText" align="left">
                <h4>새로운 비밀번호를 설정하세요</h4>
                <br><br>
                <table>
	                <tr>
	                	<td width="150px;">아이디</td>
	                	<td width="300px;" id="idCell"><%=memId %></td>
	                </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
	                <tr>
	                	<td>새로운 비밀번호</td>
	                	<td>
	                		<input type="password" class="fillOutForms" id="userPwd" name="userPwd" placeholder="영문, 숫자, 특수문자 포함 6~20자" required>
	                	</td>
	                </tr>
                    <tr>
                        <td></td>
                        <td class="checkAlert pwdTest1"></td>
                    </tr>
	                <tr>
	                	<td>
	                		비밀번호 확인
	                	</td>
	                	<td>
                            <input type="password" class="fillOutForms" id="userPwdCheck" placeholder="영문, 숫자, 특수문자 포함 6~20자" required>
	                	</td>
	                </tr>
                </table>

            </div>
            

            <br><br>
            <button type="button" class="moveToGuide" onclick="inputPwd();"> 비밀번호 변경하기 </button>
            <br><br><br><br><br><br><br><br><br>
        </div>

    </div>
    <script>
        function inputPwd(){
            let pwdCheck = RegExp(/^[a-z\d~`!@#$%^&*()_+=-{}<>?,.]{6,20}$/i);

            if($("#userPwd").val()!=$("#userPwdCheck").val()){
                alert("두 비밀번호가 일치하지 않습니다!");
            }else if(!pwdCheck.test($("#userPwd").val())){
                alert("유효한 비밀번호가 아닙니다!");
            }else{
                $.ajax({
                    url:"<%=contextPath%>/pwdUpdate2.me",
                    data:{
                        memId:'<%=memId%>',
                        memPwd:$("#userPwd").val()
                    },
                    type:"post",
                    success:function(result){
                    	if(result=="NNNNN"){
                    		alert("비밀번호 변경에 실패했습니다.");
                    	}else {
                    		alert("비밀번호가 변경되었습니다.");
                    		location.href="<%=contextPath%>/login.me";
                    	}
                    },
                    error:function(){
                    	console.log("ajax통신실패");
                    }
                });
            }
        }

        
	</script>

    <%@ include file = "../common/footerbar.jsp" %>

</body>
</html>