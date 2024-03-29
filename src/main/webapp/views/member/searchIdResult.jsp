<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)request.getAttribute("memId");
	String memName = (String)request.getAttribute("memName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
	.moveToLogin{
        background-color: lightgray;
        width:220px; height:40px;
        border:0;
        border-radius: 5px;
    }
    
    .moveToGuide{
        color:white;
        background-color: rgb(35, 104, 116);
        width:220px; height:40px;
        border:0;
        border-radius: 5px;
    }

</style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">

        <div class="content" align="center">
            
            <br><br><br><br><br>
            
            
            <div class="welcomeText" align="left">
                <h5>아이디 찾기 성공🔓</h5>
                <br><br>
                <p>
                    <b><%=memName%></b>님 의 아이디는 <b><%=memId%></b>입니다.
                </p>

            </div>
            

            <br><br><br>
			<button type="button" class="moveToLogin" onclick="login();">로그인하러 가기</button>
            <button type="button" class="moveToGuide" onclick=""> 비밀번호 찾기 </button>
            <br><br><br><br><br><br><br><br><br>
        </div>

    </div>
	<script>
		function userGuide(){
			location.href = "<%=contextPath%>";
		}
		function login(){
			location.href = "<%=contextPath%>/login.me";
		}
	</script>

    <%@ include file = "../common/footerbar.jsp" %>

</body>
</html>