<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage Main</title>
<style>
        /*div{border:1px solid black;}*/
        div{box-sizing:border-box;}
        .mpWrap{width:1000px; margin:auto; padding-top:20px;}
        /*.header{width:100%; height:200px;}*/
        .mpMenubar{width:20%; height:600px; padding-top:10px; margin-top:5px; float:left; padding-top:0;}
        .content{width:800px; height:600px; float:left; margin-top:5px;}
        
        .myPageProfile{
            width:48%; 
            float:left; 
            margin-top:20px;
            height:510px;
        }
        .myPageProfile1{
            border:2px solid; border-color: rgb(35, 104, 116); 
            padding-top:25px;
            border-radius:10px;
            border-width:2px;
            margin-right:10px;

        }
        .profileForm{width:90%; margin:auto; margin-bottom:10px;}
        .profileForm1{height:35%}
        .profileForm2{width:100%; height:15%; padding-top:20px;}
        .profileForm3{width:100%; height:40%; padding-top:20px;}
        .categoryMain {
            width:90%;
            height:120px;
            margin:auto;
            border:2px solid; border-color:rgb(35, 104, 116); border-radius:10px;
            background-color: white;
            color:rgb(64, 64, 64); font-size:17px; font-weight:1000; line-height: 120px;
        }
        .categoryMain:hover{
            cursor: pointer;
            background-color:rgb(35, 104, 116);
            color:white;
        }
        #viewMyInfo, #viewMyClass, #viewMyQna{margin-bottom:10px;}
              
        .pageRoute{margin-top:10px;}
        #home{vertical-align:bottom;}
        #home:hover{cursor:pointer;}
        .pageRoute>a {text-decoration: none; color:rgb(64, 64, 64);}
        #helloUser{font-size:15px; font-weight:1000; color:rgb(64, 64, 64);}

        .profileForm2 th{font-size:40px; color:rgb(4, 64, 4); line-height:0.5;}
        .profileForm2 tr{font-size:16px; line-height:0.8;}
        .profileForm2 a{font-size:12px; color:rgb(64, 64, 64);}

        .profileForm3>table{width:100%;}
        .numberData{font-size:45px; font-weight: bolder;}
        

    </style>
    <script>
        $(function(){
            $(".categoryMain").click(function(){
                const category1 = $(this).html();

                if($(this)){
                    $(this).css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $(this).siblings("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");
                }

            }) 
            
        })
    </script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="mpWrap">
		<div class="mpMenubar"></div>
	    <div class="content">
	        <div class="pageRoute">
	            &nbsp; <svg xmlns="http://www.w3.org/2000/svg" id="home"  width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
	                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
	              </svg>
	            > <a>마이페이지</a>
	            <span class="pageRoute1"></span>
	            <span class="pageRoute2"></span>
	            </span>
	            <hr>
	        </div>
	        <script>
	        	$(function(){
	        		$("#home").click(function(){
	        			
	        		})
	        	})
	        </script>
	        <div class="contentMain">
	            <div class="myPageProfile myPageProfile1">
	                <div class="profileForm profileForm1" align="center">
	                    <br>
	                    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
	                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
	                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
	                     </svg>
	                    <p id="helloUser">
	                        안녕하세요 <br>
	                        길동이 님 🥰
	                    </p>
	                </div>
	                <div class="profileForm profileForm2">
	                    <table align="center">
	                        <tr>
	                            <th rowspan="2" width="10%">$</th>
	                            <td>자신만의 취미로 수익을 만들어보세요</td>
	                        </tr>
	                        <tr>
	                            <td><a href="">자세히 알아보기</a></td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="profileForm profileForm3">
	                    <br>
	                    <table>
	                        <tr height="10%" align="center">
	                            <td>수강한 클래스</td>
	                            <td>찜한 클래스</td>
	                            <td>내가 남긴 리뷰</td>
	                        </tr>
	                        <tr align="center" class="numberData">
	                            <td>14</td>
	                            <td>29</td>
	                            <td>6</td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	            <div class="myPageProfile myPageProfile2">
	                <div class="categoryMain" align="center" id="viewMyInfo" onclick="">회원정보 조회 및 수정</div>
	                <div class="categoryMain" align="center" id="viewMyQna" onclick="">나의 문의 조회</div> 
	                <div class="categoryMain" align="center" id="viewMyClass" onclick="">마이클래스</div>
	                <div class="categoryMain" align="center" id="withdrawal" onclick="">회원탈퇴</div>
	            </div>
	        </div>
		</div>
</body>
</html>