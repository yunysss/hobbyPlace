<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<title>Insert title here</title>

    <style>
       
        /*컨텐트영역*/
         
        #content2{
           margin-top: 90px;
           margin-left: 160px;
           width: 1000px;
       }
      
        #content2>div{
            width: 480px;
            height: 400px;
            margin: 5px 5px;
            
        }

        #content2>div>div{
            background-color: rgb(243, 243, 243);  
            height: 300px;
            width: 100%;
            margin: 5px;
            position: relative;
      
        }
        #content2_1>div{
            
        }

        #c2{
            padding: 10px;
        }

        #welcome{
                      
           width: 100%;
           position: absolute;
           left: 20px;
           bottom: 30px;
           
        }
        #welcome h3{
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
    <%@include file="../common/tutorMenubar.jsp" %>
            <div id="content2">
                <div id="content2_1">
                    <div id="c1"> 
                        <div id="welcome">
                        <span><h3>튜터 ID 님 <br>반갑습니다 🥰</h3> </span>
                        <button class="btn btn-secondary btn-sm">문의하기</button>
                        <button class="btn btn-secondary btn-sm">튜터 가이드</button>
                        </div>
                    </div>

                   
                    <div id="c2">
                        <div id="notice-area">
                            <span style="font-size: 14px;font-weight: 600;">📌공지사항 </span>
                            <a href="" style="color:black; font-size: 12px;"> >더보기</a>
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
                             <a href="" style="color:black; font-size: 12px;"> >더보기</a>
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
</body>
</html>