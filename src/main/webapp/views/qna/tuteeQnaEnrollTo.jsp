<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.lesson.model.vo.Lesson"%>
<%
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	div{box-sizing:border-box;}
	.cWrap{width:1000px; margin:auto;}
	.content{width:80%; float:left; margin-top:5px; padding-top:100px; margin-left:200px;}
	.mpMenubar{
	   	width:200px; padding-top:15px;float:left;
	   	position:fixed; top:130px; background: white;
	}
	   
	.categoryMain {
        width:90%;
        height:50px;
        font-size:13px;
        margin:auto;
        margin-bottom:5px;
        line-height:50px;
        border:1px solid; border-color: rgb(35, 104, 116);  
        color:rgb(64, 64, 64);
        background-color: white;
        border-radius:5px;
        font-size: 14px;
    }
    .categoryMain:hover{
        cursor: pointer;
    }
    #viewMyQna{color:white; background-color:rgb(35, 104, 116); font-weight:bolder;}
    #insertMyQna{color:black; font-weight: bolder;}
    .mpMenubar ul{
        color:rgb(64, 64, 64);
        list-style-type:none;
        line-height:2;
        text-align:left;
        //display:none;
        padding-bottom:3px;
    }
    .mpMenubar li:hover{
        cursor: pointer;
        color:black;
        font-weight: bolder;
    }
    .pageRoute{  
    position:fixed;
    top:120px;
    width:800px;
    background:white;
    padding-top:20px;
    }
    #home {width:20px; height:20px; vertical-align: text-bottom;}
    #home:hover{cursor:pointer;}
    .outer{
            width: 800px;
            margin: auto;
           
        }
        .admin {
            width: 300px;
            height: 30px;
            background-color: rgb(50, 106, 118);
            color: white;
            font-size: larger;
            font-weight: 600;
            text-align: center;
            
        }
        .tutor{
            width: 300px;
            height: 30px;
            background-color: rgb(50, 106, 118);
            color: white;
            font-size: larger;
            font-weight: 600;
            text-align: center;
            
        }
</style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">
        <div class="mpMenubar">
            <h3 align="center">마이페이지</h3>
			<br><br>
			
			<div class="categoryWrap">
				<div class="categoryMain" align="center" id="viewMyInfo">회원정보 조회 및 수정</div>

			</div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyQna">나의 문의 조회</div>
	            <ul class="categoryDetail qna">
	                <li id="selectMyQna" onclick="">나의 문의 내역</li>
	                <li id="insertMyQna" onclick="">문의하기</li>
	            </ul>
            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyClass">마이클래스</div>

            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="withdrawal">회원탈퇴</div>

            </div>
            
        </div>
        <script>
            $(function(){
                $("#viewMyInfo").click(function(){
                    //회원정보 조회 및 수정 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/memberInfo.me";
                })
                $("#selectMyQna").click(function(){
                    // 나의 문의 조회시 이동할 페이지링크(나의문의내역으로)
                    location.href = "<%=contextPath%>/qnaList.tee";
                })
                $("#insertMyQna").click(function(){
                    // 나의 문의 조회>> 문의하기 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/qnaEnroll.tee";
                })
                $("#viewMyClass").click(function(){
                    //마이클래스 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/myClass.tt";
                })
                $("#withdrawal").click(function(){
                    // 회원탈퇴 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/withdrawal.me";
                })

            })
        </script>
		<script>
	       $(function(){
	    	   $(".categoryWrap").mouseover(function(){
                    $(this).siblings().children("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal"); 
	                $(this).children("div").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $(this).siblings().children("ul").children("li").css("font-weight", "normal");
	            })          
	            $(".categoryWrap").mouseleave(function(){
	            	$(".categoryMain").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");
	                $("#viewMyQna").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $("#insertMyQna").css("font-weight", "bolder");
	            })
	            $("li").mouseover(function(){
                    $(this).css("font-weight", "bolder");
                    $(this).siblings().css("font-weight", "normal");

                })

	       })
 		</script>

        <div class="content">
            <div class="outer" align="center">
					<br><br><br><br><br>
		        <div class="admin" onclick="location.href='<%=contextPath%>/qnaEnrollAdmin.tee'">>>관리자에게 문의하기</div><br>
		        <div class="tutor" onclick="location.href='<%=contextPath%>/qnaEnrollTutor.tee'">>>튜터에게 문의하기</div>
					<br><br><br><br><br>
   			 </div>
                
            </div>
        </div>
    </div>
    <br clear="both">
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>