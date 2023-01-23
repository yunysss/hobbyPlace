<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        background-color: rgb(35, 104, 116);
        width:220px; height:30px;
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
                <h3>🎉가입이 완료되었습니다🎉</h3><br>
                <p>
                    000님 환영합니다😆<br>
                    합플에서 000님의 관심사를 발견하고 취미를 발전시켜보세요!
                </p>

            </div>
            

            <br><br><br>

            <button type="button" class="moveToGuide" onclick="userGuide();"> 이용안내 페이지 바로가기 </button>
            <br><br><br><br><br><br><br><br><br>
        </div>

    </div>
	<script>
		function userGuide(){
			location.href = "<%=contextPath%>";
		}
	</script>

    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>