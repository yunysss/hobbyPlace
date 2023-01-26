<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginFail = (String)session.getAttribute("loginFail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hobby Place || 로그인 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
        /*div{border:1px solid black;}*/
        div{box-sizing:border-box;}
        .lgWrap{width:1000px; margin:auto;}
        .content{width:100%; height:600px; margin-top:5px;}

        .lgPage{
            margin:auto; margin-top:5px; height:50px; width:300px; box-sizing:border-box; padding-left:10px;
            border:2px solid rgb(35, 104, 116);
            border-radius: 10px;
            font-size:15px;
        }
        
        .searchInfo{width:300px; line-height:2;}
        .searchInfo>a{font-size: 13px; text-decoration: none; color:rgb(64, 64, 64);}
        .searchInfo>a:hover{font-weight: 600;}
        .searchInfo>p{display: inline-block; font-size: 18px; font-weight:bolder; color:rgb(35, 104, 116);}
		#loginFail{padding-bottom:10px; display:none;}

        #logInUser{background:rgb(35, 104, 116); color:white; font-size:18px; font-weight:bolder;}
        #signInUser{background: white; color:rgb(35, 104, 116); font-size:18px; font-weight:bolder;}

        button:hover{cursor: pointer;}
    </style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="lgWrap">
        <div class="content" align="center">
            <br><br><br>
            <form action="<%=contextPath%>/loginUser.me" method="post">
            	
            	<h1 align="center">로그인</h1>
            	
	            <br>
	            
	            <input type="text" class="lgPage" id="userId" name="userId" required placeholder="아이디를 입력해주세요"> <br>
	            <input type="password" class="lgPage" id="userPwd" name="userPwd" required placeholder="비밀번호를 입력해주세요">
	            
	            <div class="searchInfo" align="right">
	                <a href="<%=contextPath%>/searchIdByPhone.me">아이디 찾기</a>
	                <p> | </p>
	                <a href="<%=contextPath%>/searchPwdByPhone.me">비밀번호 찾기</a>
	            </div>
	            




	            	

	            
	            <button type="submit" class="lgPage" id="logInUser">로그인</button> <br>
	            <button type="button" class="lgPage" id="signInUser" onclick="enrollPage();">회원가입</button>
            
            </form>
        </div>
    </div>
    <script>
        function enrollPage(){

        }
    </script>
	
	
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>