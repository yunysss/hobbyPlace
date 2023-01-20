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
           background-color:rgb(35, 104, 116);
           font-size:15; color:white;
       }
       .mpMenubar ul{
           color:rgb(64, 64, 64);
           list-style-type:none;
           line-height:2;
           text-align:left;
           display:none;
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
       .contentA{text-decoration: none; color:rgb(64, 64, 64);}
        .explainForm{
            width:700px;
            background-color: lightgray;
            border:0;
            padding:30px 20px 30px 20px;
        }
        .explainForm>table td{padding-left:15px;}
        .checkAgreement{width:700px; margin-top:5px; padding-left:5px;}
        .checkAgreement>table th{width:100px; text-align:left;}
        .tr1{height:30px;}
        .tr1>td{font-size:15px;}

        .leaveButton{
            height:30px; width:140px; 
            color:white; background-color:gray; 
            border:0; border-radius:5px; 
            margin-top:30px;
            margin-left:300px;
        }
        .leaveButton:hover{cursor: pointer;}

    </style>
    <script>
        $(function(){
            $(".categoryMain").click(function(){
                
                // 카테고리 div 선택시 슬라이드다운 + 선택카테고리 css변화 + 세부메뉴 중 첫번째항목 font-weight:bolder + pageRoute변화
                if($(this)){
                    $(this).css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $(this).siblings("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");
                    $(this).next().children('li:eq(0)').css("font-weight", "bolder");
 
                    if($(this).next().css("display")=="none"){
                        $(this).siblings("ul").slideUp();
                        $(this).next().slideDown();
                    }else{
                        $(this).next().slideUp();
                    }
                }
                const category1 = $(this).html();
                if($(this).next().children().is("li")) {
                    $(".pageRoute1").html("> " + category1 + " > " + $(this).next().children().html());
                }else {
                    $(".pageRoute1").html("> " + category1);
                }
                
                    
            })
 
            // 카테고리의 세부메뉴 클릭시 css변화(font-weight:bolder) + pageRoute변화
            $(".categoryMain").next().children("li").click(function(){
                $(this).css("font-weight", "bolder");
                $(this).siblings("li").css("font-weight", "normal");
 
                const category1 = $(this).parent().prev().html();
                const category2 = $(this).html();
                $(".pageRoute1").html("> " + category1 + " > " + category2)
            })   
        })
 </script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">
        <div class="mpMenubar">
            <h3 align="center">마이페이지</h3>
			<br><br>
			
            <div class="categoryMain" align="center" id="viewMyInfo" onclick="">회원정보 조회 및 수정</div>
            <ul class="categoryDetail">
            </ul>
            <div class="categoryMain" align="center" id="viewMyQna" onclick="">나의 문의 조회</div>
            <ul class="categoryDetail">
                <li id="selectMyQna" onclick="">나의 문의 내역</li>
                <li id="insertMyQna" onclick="">문의하기</li>
            </ul>
            <div class="categoryMain" align="center" id="viewMyClass" onclick="">마이클래스</div>
            <ul class="categoryDetail">
            </ul>
            <div class="categoryMain" align="center" id="withdrawal" onclick="">회원탈퇴</div>
            <ul class="categoryDetail">
            </ul>
        </div>
        <script>
            $(function(){
                $("#viewMyInfo").click(function(){
                    //회원정보 조회 및 수정 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/memberInfo.me";
                })
                $("#viewMyQna").click(function(){
                    // 나의 문의 조회시 이동할 페이지링크(나의문의내역으로)
                    location.href = "<%=contextPath%>/.....";
                })
                $("#selectMyQna").click(function(){
                    // 나의 문의 조회>>나의 문의내역 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/.....";
                })
                $("#insertMyQna").click(function(){
                    // 나의 문의 조회>> 문의하기 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/.....";
                })
                $("#viewMyClass").click(function(){
                    //마이클래스 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/.....";
                })
                $("#withdrawal").click(function(){
                    // 회원탈퇴 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/withdrawal.me";
                })


            })
        </script>


        <div class="content">
            <div class="pageRoute">
                &nbsp;  <svg xmlns="http://www.w3.org/2000/svg" id="home"  width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                  </svg>
                > <a class="contentA" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
                <span class="pageRoute1"></span>
                </span>
                <hr>
            </div>
            <script>
	        	$(function(){
	        		$("#home").click(function(){
	        			location.href="<%=contextPath%>/main.tee"
	        		})
	        	})
	        </script>
            <div class="contentMain" align="center">
                <br>

                <h3>정말 떠나시겠어요?</h3>
                <br><br>
                
                <div class="explainForm" align="center">
                    <table>
                        <tr>
                            <th>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                            </svg>
                            </th>
                            <td>
                                지금 탈퇴하시면 수강 예정이거나 현재 수강 중인 수업을 더 이상 이용하실 수 없게 돼요!
                            </td>
                        </tr>
                        <tr>
                            <th></th><td>&nbsp; </td>
                        </tr>
                        <tr>
                            <th>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                            </svg>
                            </th>
                            <td>
                                지금 탈퇴하시면 보유하신 쿠폰과 포인트도 함께 사라져요. <br>
                                추후에 동일 계정으로 재가입하셔도 쿠폰과 포인트 내역은 복구되지 않아요!
                            </td>
                        </tr>
                        <tr>
                            <th></th><td>&nbsp; </td>
                        </tr>
                        <tr>
                            <th>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                            </svg>
                            </th>
                            <td>
                                탈퇴 후에는 작성하신 리뷰를 수정 혹은 삭제하실 수 없어요. <br>
                                탈퇴 신청 전에 꼭 확인해 주세요! 
                            </td>
                        </tr>
                    </table>
                </div>
                <form action="">
                    <div class="checkAgreement" align="left">
                        <input type="checkbox" id="agreeAll" required> <label for="agreeAll">회원탈퇴 유의사항을 모두 확인하였으며 동의합니다.</label>
                        
                        <br>
                        <br>
                        <br>
                    
                        <table>
                            <tr class="tr1">
                            <th>
                                    &nbsp;아이디
                            </th>
                            <td>
                                    userId
                            </td> 
                            </tr>
                            <tr>
                                <th>
                                    &nbsp;탈퇴사유
                                </th>
                                <td rowspan="10">
                                    <textarea name="" id="" cols="70" rows="10" style=resize:none></textarea>
                                </td> 
                            </tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>
                            <tr><th></th></tr>          
                        </table>

                        <button type="submit" class="leaveButton">탈퇴 신청</button>
                        <br><br><br><br>
                    </div>
                </form>
                    
                
            </div>
        </div>
    </div>
    <br clear="both">
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>