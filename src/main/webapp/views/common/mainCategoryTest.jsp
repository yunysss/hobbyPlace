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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
    


    /*카테고리 영역*/
    .dropdown *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            list-style-type: none;
            text-decoration: none;
            
        }
        .category{
            width: 200px;
          
        }
        .menu a:hover{ text-decoration: none;}

        .bookmark-lists{
            height: 100%;
            width: 100%;
            
                  
        }
        
        .bookmark-lists>li>a{
            display: block;
            height: 35px;
            color: aliceblue;
            background-color: rgb(35, 104, 116);
            text-align: left;
            line-height: 35px;
            border-radius: 5px;   
            font-weight: 600;  
            font-size: 13px;
            padding: 0px 10px;
        }

        .bookmark>ul>li{
            height: 30px;
            border: 0.5px solid rgba(214, 213, 213, 0.881);
            border-radius: 5px;
        
        }

        .bookmark>ul>li>a{
            display: block;
            color: rgb(250, 248, 248);
            height: 30px;
            text-align: left;
            line-height: 30px;
            font-weight: 500;
            font-size: 12px;
            padding: 0px 10px;
            
        }

        .bookmark span{
            float:right;
            line-height: 35px;
            font-size: 12px;
            
            
        }
        .submenu>li:hover{
            background-color: rgb(243, 242, 242)     
        }
        #symbol>span{  
            height: 50px;
            font-size: 14px;
        
        }
        .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
    }
       .bookmark-lists>li *{
        color: white;
       }

       #category{
        margin-right: 30px;
       }
       
   
       
    </style>

    
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
	            <div class="dropdown">
                    <div id="category"">
                      <span class="material-symbols-outlined dropdown-toggle" data-toggle="dropdown">
                        <img src="<%= contextPath %>/resources/images/list.png" alt="" height="20px" width="25px">전체 카테고리</span> 
                    </div>

                    <div class="category dropdown-menu ">
                     
                          <ul class="bookmark-lists menu">
                              <li class="bookmark"><a href="" >교육  
                                  <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                  </a>
                                  <ul class="submenu">
                                      <li><a href="">외국어</a></li>
                                      <li><a href="">IT</a></li>
                                      <li><a href="">자격증</a></li>
              
                                  </ul>
                              </li>
                              <li class="bookmark"><a href="">공예 DIY
                                  <span class="material-symbols-outlined"> arrow_forward_ios</span>
                              </a>
                                  <ul class="submenu">
                                      <li><a href="">가죽 / 라탄</a></li>
                                      <li><a href="">비누 / 꽃 / 향</a></li>
                                      <li><a href="">뜨개 / 자수 </a></li>
                                      <li><a href="">기타 </a></li>
                                  </ul>
                              
                              </li>
                              <li class="bookmark"><a href="">드로잉
                                  <span class="material-symbols-outlined"> arrow_forward_ios</span>
                              </a>
                                  <ul class="submenu">
                                      <li><a href="">취미미술</a></li>
                                      <li><a href="">캘리그래피</a></li>
                                      <li><a href="">웹디자인 </a></li>
                                    
                                  </ul>
                              </li>
                              <li class="bookmark"><a href="">쿠킹
                                  <span class="material-symbols-outlined"> arrow_forward_ios</span>
                              </a>
                                  <ul class="submenu">
                                      <li><a href="">요리</a></li>
                                      <li><a href="">베이킹</a></li>
                                    
                                  </ul>
                              </li>
                              <li class="bookmark"><a href="">스포츠/피트니스
                                  <span class="material-symbols-outlined"> arrow_forward_ios</span>
                              </a>
                                  <ul class="submenu">
                                      <li><a href="">실내스포츠</a></li>
                                      <li><a href="">야외스포츠</a></li>
                                      <li><a href="">레저 / 액티비티 </a></li>
                                      <li><a href="">요가 / 필라테스 </a></li>
                                      <li><a href="">헬스 / PT </a></li>
                                  </ul>
                              </li>
                          </ul>
              
                      </div>   
                      
                  </div>   

                
                


                
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
	                <a href="<%=contextPath%>/login.me">로그인</a>
	                <a href="">회원가입</a>
	
	                <!-- 로그인 후 -->
	                <!-- <a href="">마이 클래스</a> -->
	                
					<img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" type="button" width="45"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
					
					<div class="dropdown-menu">
					    <a class="dropdown-item" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
					    <a class="dropdown-item" href="#">내가 찜한 목록</a>
					    <a class="dropdown-item" href="#">로그아웃</a>
					</div>
	                
	            </div>
	        </div>
		</div>
    </div>

  

</body>
</html>