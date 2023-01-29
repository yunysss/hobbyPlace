<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.member.model.vo.Member"%>
<% 
	Member loginAdmin = (Member)session.getAttribute("loginAdmin");
%>
<%
	String contextPath = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    
        
        .wrap{
            width: 1200px;
            height: 100vh;
            margin: auto;
        }

        .wrap>div{width: 100%;}

        #header{height: 160px;}
        #content{height: 80%;}

        #content>div{height: 100%; float:left}

       
        
        /*헤더바 상세 스타일*/
        #header{background: url(<%=request.getContextPath()%>/resources/images/newMainLogoBG.png); background-size: cover;}
        
        #log_box{ height: 155px; padding:52px;margin-left:40%;}

        p{  display: inline-block;
            margin-top: 15px;}

        p>a{margin:5px;color:black; text-decoration: none;}


        #navigator{width: 16%; box-sizing: border-box;}
        
        
        #mainContent{width:1000px; padding:20px; }

       
        #search_box, #meny_box{width: 100%;}
        #search_box{background:#266C78;height: 8%;}
       
        #navi_box{height:100vh; background:#266C78;}
        
        #search_icon{width:30px; margin-top: 6px; margin-left: 5px;} 
        #searchText{width: 140px; padding-top: 14px;}
       
        #navi{
            list-style-type:none;
            padding: 0px;
            margin: 0;
            width: 100%;
            height: 40%;
        }

        #navi a{
            text-decoration: none;
            color: white;
            font-size: 17px;
            text-align: right;
            display: block;
            width: 100%;
            height: 100%;
            text-align: none;
            line-height: 42px;
            font-weight: bold;
            padding-right:15px
        }
        
        #navi a:hover{
            color:black;
            font-weight: bold;
            background-color: rgb(224, 223, 223);
        }

        #navi>li>ul{
            list-style-type:none;
            padding:4%;
            margin: 0%;
            display:none;
        }
        #navi>li>ul a {
            font-size:15px;
            text-align: left;
            color: rgb(26, 26, 26);
            padding-left:10px;
        }

        #navi>li:hover>ul{
            display:block;
            padding: 0%;

        }
        
        .input-group{
            padding:10px
        }
        


    </style>
</head>
<body>
	
    <div class="wrap">
        <div id="header">
                    <div id="log_box">
                            <p style="width: 450px;" align="right"> <img src="<%=request.getContextPath()%>/resources/images/admin_icon.png" height="23px">
                            관리자<%=loginAdmin.getMemName() %>님 반갑습니다!</p>
                            <p><a href="<%=contextPath%>/logout.ad">로그아웃</a></p>
                            <p><a href="<%=contextPath%>/main.tee">합플 홈</a></p>
                    </div>
                
            
        </div>
            
        <!--해당 화면 나오는 곳-->
        <div id="content">
            <!--사이드 메뉴바-->
            <div id="navigator">
                <!-- 검색창-->
                <div id="search_box">
                    <form action="#" id="searchForm">
                        <div class="input-group mb-3 input-group-sm">
                            <div class="input-group-prepend">
                              <span class="input-group-text">검색</span>
                           </div>
                           <input type="text" class="form-control">
                         </div>
                    </form>
                </div>
    
                <!--메뉴창-->
                <div id="navi_box">
                    <ul id="navi">
                        <li><a href="">회원 관리</a>
                            <ul>
                                <li><a href="<%=contextPath%>/viewMember.ad">전체 회원 조회</a></li>
                                <li><a href="<%=contextPath%>/viewTutor.ad">튜터 관리</a></li>
                            </ul>
                        </li>
                        <li><a href="">클래스 관리</a>
                            <ul>
                                <li><a href="<%=contextPath%>/newcl.ad?cpage=1">신규클래스 검토/승인</a></li>
                                <li><a href="<%=contextPath%>/classmg.ad?cpage=1">클래스 관리</a></li>
                                <li><a href="">리뷰 관리</a></li>
                            </ul>
                        </li>
                        <li><a href="">결제 관리</a>
                            <ul>
                                <li><a href="<%=contextPath%>/manage.reg">결제 내역</a></li>
                                <li><a href="<%=contextPath%>/manage.cal">튜터 정산 관리</a></li>
                                <li><a href="<%=contextPath %>/manage.ref">환불 신청 관리</a></li>
                            </ul>
                        </li>
                        <li><a href="">통계</a>
                            <ul>
                                <li><a href="">사용자 관리 통계</a></li>
                                <li><a href="">클래스 관리 통계</a></li>
                            </ul>
                        </li>
                        <li><a href="">고객센터</a>
                            <ul>
                                <li><a href="">공지사항</a></li>
                                <li><a href="">자주 묻는 질문</a></li>
                                <li><a href="">문의 / 답변</a></li>
                            </ul>
                        </li>
    
                    </ul>
                </div>
            </div>
              
            
            <div id="mainContent">
        

    
</body>
</html>