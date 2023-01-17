<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  

    <style>
        
        div{box-sizing: border-box;}
        .wrap{
            width: 1200px;
            height: 1200px;
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
        #header2>h4{
           width: 100%;
            margin-top: 45px;
            margin-left: 10px;
            font-weight: 600;
       
            
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

      
        #header1>img{
            margin-top: 20px;
            width: 150px;
           
        }

        #hr{
            width: 1200px;
            
        }

   

        /*메뉴바*/
        #content1{width: 200px; 
            position: fixed;
            margin-top: 100px;
        }
        #button-area{
            height: 60px;
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
            font-weight: 800;
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








        /*컨텐트영역*/
        
        #content2{
           
            padding:20px 50px;
            margin-top: 90px;
            margin-left: 160px;
            width: 90%;
            height: 100%;
 
        }
        #content2>div{
            width: 99%;
            height: 48%;
            margin: 5px 5px;
        }

        #content2>div>div{
            background-color: rgb(243, 243, 243);  
            height: 100%;
            width: 48.9%;
            float: left;
            margin: 5px;
            position: relative;
      
        }

        #c2{
            padding: 10px;
        }

        #c1{
                      
           width: 50%;
           position: absolute;
           left: 20px;
           bottom: 30px;
           
        }
        #c1 h3{
            font-weight: 900; 
            margin-bottom: 5px;
        
        }
       
       #notice-area, #reserva-area{
        height: 48%;
        margin: 5px 5px;
       }

       #notice-area>table, #reserva-area>table{
        width: 400px;
        margin: auto;
        margin-top: 5px;
       }
       #notice-area a, #reserva-area a{
        position: absolute;
        right: 40px;
       }
       
    
    
       /*통계*/
       .s{font-weight: 600; font-size:13px; color: rgb(77, 76, 76); margin-bottom: 12px;}
       .l{font-weight: 600; font-size: 26px;}



      
     
        
    </style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <div id="header1">
                <img src="../resources/images/logo.png">
            </div>
            <div id="header2">
                <h4>튜터 관리 페이지</h4>
            </div>
            <div id="header3">
                <div class="dropdown" >
                    <img src="resources/images/sampleimg.png" type="button" width="65"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
                  
                    </img>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="#">프로필관리</a>
                      <a class="dropdown-item" href="#">내 클래스</a>
                      <a class="dropdown-item" href="#">메인페이지로</a>
                      <a class="dropdown-item" href="#">로그아웃</a>
                    </div>
                  </div>
                  
            </div>
            <div id="hr">
                <hr>
            </div>
        </div>
       
        <div id="content">
           
            <div id="content1">
                <div id="button-area">
                
                <button type="button" class="btn btn-secondary btn btn-primary btn-sm">클래스 등록</button>
                <button type="button" class="btn btn-secondary btn btn-primary btn-sm">클래스 목록</button>
                </div>
               
                <ul>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            person_pin
                            </span>&nbsp;&nbsp;마이페이지
                           
                                <li><a href="">프로필관리</a></li>
                            
                                
                            
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            event_available
                            </span>&nbsp;클래스관리
                            
                                <li><a href="">클래스등록</a></li>
                                <li><a href="">내 클래스목록</a></li>
                                <li><a href="">예약승인</a></li>
                                <li><a href="">예약관리</a></li>
                                <li><a href="">문의관리</a></li>
                                <li><a href="">후기관리</a></li>
                            
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                            paid
                            </span>&nbsp;정산관리
                            <li><a href="">정산신청</a></li>
                            <li><a href="">정산내역</a></li>
                        </li>
                    <li style="background-color: rgb(22, 160, 133); color: aliceblue;">
                        <span class="material-symbols-outlined">
                        support_agent
                        </span>&nbsp;고객센터
                        <li><a href="">공지사항</a></li>
                        <li><a href="">1:1문의</a></li>
                        <li><a href="">자주묻는질문</a></li>
                    </li>
                </ul>
                
            </div>
            
            <div id="content2">
                <div id="content2_1">
                    <div> 
                        <div id="c1">
                        <span><h3>튜터 ID 님 <br>반갑습니다 🥰</h3> </span>
                        <button class="btn btn-secondary btn-sm">문의하기</button>
                        <button class="btn btn-secondary btn-sm">튜터 가이드</button>
                        </div>
                    </div>

                   
                    <div id="c2">
                        <div id="notice-area">
                            <span style="font-size: 14px;font-weight: 600;">📌공지사항 </span>
                            <a href="" style="color:black; font-size: 12px;"> ▶️더보기</a>
                            <table id="notice" class="table table-hover table-sm" >
                                <tr>
                                    <td><span class="badge badge-info">공지</span></td>
                                    <td>어쩌구 저쩌구 안내사항 공지 공지 공지</td>
                                    
                                </tr>
                                <tr>
                                    <td><span class="badge badge-info">공지</span></td>
                                    <td></td>
                                    
                                </tr>
                                <tr>
                                    <td><span class="badge badge-info">공지</span></td>
                                    <td> </td>
                                  
                                </tr>
                            </table>
                            
                        </div>
                        <div id="reserva-area">
                            <span style="font-size: 14px;font-weight: 600;">📆예약관리</span>
                             <a href="" style="color:black; font-size: 12px;"> ▶️더보기</a>
                            <table id="reservation" class="table table-hover table-sm">
                                <tr>
                                    <th width="80">날짜</th>
                                    <th width="150">클래스명</th>
                                    <th width="50">인원</th>
                                </tr>
                                <tr>
                                    <td>2023-02-02</td>
                                    <td>클래스명 dfdfdfdfsdfsf</td>
                                    <td>6명</td>
                                </tr>
                                <tr>
                                    <td>2023-02-02</td>
                                    <td>클래스명 </td>
                                    <td>6명</td>
                                </tr>
                            </table>
                        </div>
                        
                    </div>
                    
                </div>
                <div id="content2_2">
                    <div>
                        <table align="center" style="margin-top: 10px;">
                            <tr style="vertical-align:middle">
                              <td style="width:220px; height: 150px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                                    <div class="s">평균평점</div>
                                    <div class="l">4.5 점</div>

                                </td>
                              <td style="padding-left:10px; width:220px; text-align:center  ">
                                <div class="s">수강후기 수</div>
                                <div class="l">25 개</div>
                            
                            </td>
                            </tr>
                            <tr>
                                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 150px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                                    <div class="s">문의응답률</div>
                                    <div class="l">80 %</div>
                                </td>
                                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                                    <div class="s">이번달 취소건수</div>
                                    <div class="l">4 건</div>
                                </td>
                            </tr>
                          </table>
                        
                    </div>
                    <div>
                        <table align="center" style="margin-top: 10px;">
                            <tr style="vertical-align:middle">
                              <td style="width:220px; height: 150px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                                    <div class="s">이번달 진행클래스</div>
                                    <div class="l">5 건</div>

                                </td>
                              <td style="padding-left:10px; width:220px; text-align:center  ">
                                <div class="s">이번달 판매금액</div>
                                <div class="l">450,000</div>
                             </td>
                         
                            </tr>
                            <tr>
                                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 150px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                                    <div class="s">전체 결제건수</div>
                                    <div class="l">20 건</div>
                                </td>
                                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                                    <div class="s">전체 판매금액</div>
                                    <div class="l">1,451,500 원</div>
                                </td>
                            </tr>
                          </table>
                         
                    </div>
                    
                </div>
            </div>
        </div>

        </div>

       
        


    </div>
</body>
</html>