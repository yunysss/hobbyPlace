<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input{box-sizing:border-box;}
    #menubar a{text-decoration: none !important; color:black !important;}

    .wrap{width:1000px; height:120px; margin:auto;}
    #menubar{width:1000px; height:120px; background:white; z-index: 100; position: fixed;}

    /* menubar 전반적인 틀 */
    #menubar>div{width:100%;}
    #menubar-1{height:25%; background-color: rgb(247,247,247);}
    #menubar-2{height:75%;}
    
    #menubar-2>*{height:100%; float:left;}
    #category{width:20%; font-size:14px;}
    #logo{width:15%; position:relative; cursor:pointer;}
    #search{width:40%; position:relative;}
    #membership{width:25%;}

    /* menubar 세부 스타일 */

    /* menubar-1 */
    #menubar-1>a{font-size:12px; margin:15px; line-height: 30px;}

    /* menubar-2 */
    /* 로고 이미지, 검색창 공통스타일 */
    #search-form, #logo img{
        margin:auto;
        position:absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
    }
    /* 검색창 추가 스타일 */
    #search-form{
        width:80%; 
        height:40%; 
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
    }
    #search-form>div{height:100%; float:left;}
    #search-text{width:80%;}
    #search-btn{width:20%;}
    #search-form button, #search-form input{
        width:100%; 
        height:100%;
        box-sizing:border-box;
        border:none;
        background:none;
        cursor:pointer;
    }

    /* 카테고리, 멤버십 스타일 */
    #category{line-height:90px;}
    #category>img, #membership>img{vertical-align:middle; cursor:pointer;}
    #category>*{margin:5px; font-size:14px;}
    #membership>*{margin-left:20px; font-size:12px;}
    
    
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="wrap">
		<div id="menubar">
	        <div id="menubar-1">
	            <a href="">튜터센터</a>
	            <a href="">튜터등록</a>
	        </div>
	        <div id="menubar-2">
	            <a href="" id="category">
	                    <img src="<%= contextPath %>/resources/images/list.png" alt="" height="20px" width="25px">
	                    전체 카테고리
	            </a>
	            <div id="logo">
	            	<a href="../common/tuteeMainPage.jsp">
	            		<img src="<%= contextPath %>/resources/images/logo.png" width="100%" height="50%">
	            	</a>
	            </div>
	            <div id="search">
	                <form action="" id="search-form">
	                        <div id="search-text">
	                            <input type="text" name="keyword" placeholder="&nbsp;검색어를 입력하세요">
	                        </div>
	                        <div id="search-btn">
	                            <button type="submit"><img src="<%= contextPath %>/resources/images/search.png" height="25px" width="25px"></button>
	                        </div>
	                </form>
	                
	            </div>
	            <div id="membership" align="center">
	            	<br>
	                <!-- 로그인 전 -->
	                <a href="">로그인</a>
	                <a href="">회원가입</a>
	
	                <!-- 로그인 후 -->
	                <!-- <a href="">마이 클래스</a> -->
	                
					<img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" type="button" width="45"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
					
					<div class="dropdown-menu">
					    <a class="dropdown-item" href="#">마이페이지</a>
					    <a class="dropdown-item" href="#">내가 찜한 목록</a>
					    <a class="dropdown-item" href="#">로그아웃</a>
					</div>
	                
	            </div>
	        </div>
		</div>
    </div>

</body>
</html>