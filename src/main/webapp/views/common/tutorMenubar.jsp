<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.hp.tutor.model.vo.Tutor, com.hp.member.model.vo.Member" %>    
    
<% 
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	
// 로그인한 튜터 정보
	Member loginUser = (Member)session.getAttribute("loginUser");
	int MemNo = loginUser.getMemNo();
	Tutor tutorInfo = (Tutor)session.getAttribute("tutorInfo");
	String ttProfile = tutorInfo.getTtProfile() ==  null? "resources/tutorProfile_upfiles/defaultimg.jpg" : tutorInfo.getTtProfile();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Document</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
    
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  

    <style>
        
        div{box-sizing: border-box;}
        .wrap{
            width: 1200px;
            margin: auto;
        }
        .wrap>div{width: 1200px;}
        #header{
            z-index: 100;
            position: fixed;
            height: 80px;  
            
        }  
        
        #content{height: 700px; }
      
          /*헤더*/
        #header>div, #content>div {float: left; height: 100%;}


  
        #header1{
           
            width:200px; 
            text-align: center;

        }
        #header2{width:800px;}
        #header2 h4{
           width: 750px;
            margin-top: 45px;
            margin-left: 10px;
            font-weight: 600;

        }
        #header2>a{
         	text-decoration : none;
         	color : black;
         }
        #header3{
            width:200px;
            text-align: center;
    
        }

        #header3 div{
            width: 200px;
            margin-top: 15px;
            margin-right: 20px;
      
        }

      
        #header1 img{
            margin-top: 20px;
            width: 150px;
        }

        #hr{
            width: 1200px;
           height: 1px;

        }

   

        /*메뉴바*/
        #content1{width: 200px; 
            position: fixed;
            margin-top: 100px;
        }
        #button-area{
            margin-bottom: 10px;
            text-align: center;
            line-height: 50px;
            
        }
        #content1>ul{
            width: 100%; padding: 0; margin: 0;

        }
        #content1>ul>li{
            border-radius: 3px;
            width: 100%;
            height:30px;
            list-style-type: none;
            font-weight: 600;
            font-size: 15px;
            text-align: center;
            line-height: 30px;

        }
        #content1>ul>li span{
            color:rgb(245, 242, 242);
            vertical-align: middle;

        }
        #content1>ul>li a{
            box-sizing: border-box;
            text-decoration: none;
            color: rgb(90, 82, 82); 
            font-size: 13.5px;
            display: block;
        }
        #content1>ul>li a:hover{
            color: black;
            background-color: rgb(253, 252, 250);
        }
        .mbtn{
            border: 1px solid white;
            border-radius: 5px;
            background-color: rgb(92, 90, 90);
            color: white;
            padding: 5px 8px;
            text-align: center;
            vertical-align: middle;
            line-height: 5px;
            font-size: 13px;
        }
        #button-area :hover{
            cursor: pointer;
            background-color: rgb(75, 68, 68);
            text-decoration: none;
            color: white;
        }
        .sub{
         	font-size : 13px
        }

       

        /*컨텐트영역*/
        .content-area{
            margin-top: 90px;
            margin-left: 200px;
            width: 1000px;

        }
       

        
    </style>
</head>
<body>
	<%if(alertMsg != null) {%>
		<script>
			alert("<%=alertMsg%>"); // alert("") 따옴표안에 작성해야됨
		</script>
			<%session.removeAttribute("alertMsg");%>
		<%} %>
    <div class="wrap">
        <div id="header">
            <div id="header1">
                <a href="<%=contextPath%>/tutorMain.tt"><img src="<%=request.getContextPath()%>/resources/images/logo.png"></a>
            </div>
            <div id="header2">
               <a href="<%=contextPath%>/tutorMain.tt"> <h4>튜터 관리 페이지</h4></a> 
            </div>
            <div id="header3">
                <div class="dropdown" >
                    <img src="<%=request.getContextPath()%>/<%=ttProfile %>" name="ttimg" type="button" width="60" height="60"  alt="Cinque Terre" class="rounded-circle dropdown-toggle" data-toggle="dropdown">
                  
                 
                    <div class="dropdown-menu sub">
                      <a class="dropdown-item" href="<%=contextPath%>/profile.tt">프로필관리</a>
                      <a class="dropdown-item" href="<%=contextPath%>/ttclass.tt?cpage=1">내 클래스</a>
                      <a class="dropdown-item" href="<%=contextPath%>">메인페이지로</a>
                      <a class="dropdown-item" href="<%=contextPath%>/logout.me">로그아웃</a>
                    </div>
                  </div>
                  
            </div>
            <div id="hr" style="height: 0px;">
                <hr>
            </div>
        </div>
       
        <div id="content">
           
            <div id="content1">
                <div id="button-area">
                
                <a href="<%=contextPath %>/clenroll.tt" class="mbtn">클래스 등록</a>
                <a href="<%=contextPath%>/ttclass.tt?cpage=1" class="mbtn">클래스 목록</a>
              
                </div>
        
                <ul>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            person_pin
                            </span>&nbsp;&nbsp;마이페이지
                           
                                <li><a href="<%=contextPath%>/profile.tt">프로필관리</a></li>
                            
                                
                            
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            event_available
                            </span>&nbsp;클래스관리
                            
                                <li><a href="<%=contextPath %>/clenroll.tt">클래스등록</a></li>
                                <li><a href="<%=contextPath%>/ttclass.tt?cpage=1">내 클래스목록</a></li>
                                <li><a href="<%=contextPath%>/approval.tt?">예약승인</a></li>
                                <li><a href="<%=contextPath%>/reservationList.tt">예약관리</a></li>
                                <li><a href="">문의관리</a></li>
                                <li><a href="">후기관리</a></li>
                            
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            paid
                            </span>&nbsp;정산관리
                            <li><a href="<%=contextPath%>/calculate.cal?">정산신청</a></li>
                            <li><a href="<%=contextPath%>/list.cal?">정산내역</a></li>
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                        support_agent
                        </span>&nbsp;고객센터
                        <li><a href="<%=contextPath%>/noticelist.tor?cpage=1">공지사항</a></li>
                        <li><a href="<%=contextPath%>/qnalist.tor?MemNo=<%=MemNo%>">1:1문의</a></li>
                        <li><a href="<%=contextPath%>/faqlist.tor?cpage=1">자주묻는질문</a></li>
                    </li>
                </ul>
                
            </div>
            
            <div class="content-area">
               
                
        

        

       
        


   
</body>
</html>