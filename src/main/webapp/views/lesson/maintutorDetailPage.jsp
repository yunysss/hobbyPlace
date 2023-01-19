<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
    .outer{
        margin: auto;
          width: 1000px;
      }
     
     
      #profile>div{
          width: 50%;
          float: left;
         

      }
      #tutorProfile{
          height: 200px;
          padding: 45px;
          
      }
      #tutorProfile p{
          height: 200px;
          border-radius: 5px;
          padding: 45px;
          
      }
      #p {
        vertical-align: middle;
        
        
      }
      #introduce{
          padding: 45px 0px;
          height: 200px;
      }

     #introduce>div{
      height: 100px;
     }
     #introduce a{ color: rgb(89, 86, 86); 
      font-size: 12px;
      
      }
      #class-area *{
          clear: both;
          width: 100%;
          
      }


  .container{
      width: 1000px;
      margin:auto;      
  }

  .list-area{width:900px;}
  .thumbnail{
    width: 190px;
    display: inline-block;
    margin: 10px;
  }


</style>
</head>

<body>
<%@include file="../common/tuteeMenubar.jsp" %>
<div class="outer">
        
    <h5 style="font-weight: 600;">튜터 상세페이지</h5>
    <hr>

   
        <div id="profile">
            <div id="tutorProfile" align="center">
                <p style="border: 1px solid rgb(201, 199, 199);" id="p">
                <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" width="60" class="rounded-circle" alt="Cinque Terre">
                <span style="font-weight: 600;">튜터 닉네임 자리</span><br>
                <span style="font-size: 11px; color: g;">클래스 3 </span> | 
                <span style="font-size: 11px;"> 후기 30</span>
                <span class="badge badge-danger">문의하기</span>
                
              </p>
                
            </div>
            <div id="introduce">
                <h6 style="font-weight: 600;">튜터 소개</h6>
                <div style="font-size: 13px;">
                    소개 고고 

                </div>
               
                <a href="#demo" data-toggle="collapse" data-target="#demo">더보기</a>

                <div id="demo" class="collapse show">
                  
                </div>
            </div>
            
        </div>
        <div class="container">
            <h2 style="color:white;">.</h2>
            <br><br><br>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home" style="font-weight: 600; font-size: 20px;">클래스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1" style="font-weight: 600; font-size: 20px;">후기</a>
              </li>
              
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content">
              <div id="home" class="container tab-pane active"><br>
               
                <br>
                 <div class="list-area">
                  
                  <table class="thumbnail"  >
                    <tr>
                      <td>
                      <div id="thumbnail">
                      <img src="<%=request.getContextPath()%>/resources/images/sample1.png"" alt="" width="180" height="180">
                      
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-size: 11px;">
                       지역명/서울/구로구
                      </td>
                    </tr>
                    <tr>
                      <th>클래스명~~~~~만들기</th>  
                    </tr>
                    <tr>
                      <td>
                     ⭐⭐⭐⭐⭐
                      </td>
                      
                    </tr>
                    <tr>
                      <th>50,000원</th>
                    </tr>

                  </table>
                  <table class="thumbnail">
                    <tr>
                      <td>
                      <div id="thumbnail">
                      <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" alt="" width="180" height="180">
                      
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-size: 11px;">
                       지역명/서울/구로구
                      </td>
                    </tr>
                    <tr>
                      <th>클래스명~~~~~만들기</th>  
                    </tr>
                    <tr>
                      <td>
                     ⭐⭐⭐⭐⭐
                      </td>
                      
                    </tr>
                    <tr>
                      <th>50,000원</th>
                    </tr>

                  </table>
                  <table class="thumbnail">
                    <tr>
                      <td>
                      <div id="thumbnail">
                      <img src="resources/KakaoTalk_20230111_135534500.jpg" alt="" width="180" height="180">
                      
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-size: 11px;">
                       지역명/서울/구로구
                      </td>
                    </tr>
                    <tr>
                      <th>클래스명~~~~~만들기</th>  
                    </tr>
                    <tr>
                      <td>
                     ⭐⭐⭐⭐⭐
                      </td>
                      
                    </tr>
                    <tr>
                      <th>50,000원</th>
                    </tr>

                  </table>
                  <table class="thumbnail">
                    <tr>
                      <td>
                      <div id="thumbnail">
                      <img src="resources/KakaoTalk_20230111_135534500.jpg" alt=""width="180" height="180"">
                      
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-size: 11px;">
                       지역명/서울/구로구
                      </td>
                    </tr>
                    <tr>
                      <th>클래스명~~~~~만들기</th>  
                    </tr>
                    <tr>
                      <td>
                     ⭐⭐⭐⭐⭐
                      </td>
                      
                    </tr>
                    <tr>
                      <th>50,000원</th>
                    </tr>

                  </table>






               

                </div>   
                  
                  
                  
                  
                 
              </div>
              <div id="menu1" class="container tab-pane fade"><br>
                <div id="review-area">
                    <table style="text-align: left;">
                      <tr>
                        <th width="70" height="60"><img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" width="60" class="rounded-circle" alt="Cinque Terre"></th>
                        <td>
                          <label id="review-nick" style="font-weight: 550;">닉네임1123</label> <br>
                          ⭐⭐⭐⭐⭐ <span id="review-date" style="font-size:12px;">2023-01-21</span>
                      </td>
                          <td rowspan="3" width="150">
                              <img src="<%=request.getContextPath()%>/resources/images/sample1.png" width="150" height="150" alt="">
                          </td>
                      </tr>
                      <tr>
                        <td width="60">
                            
                        </td>
                        <td style="font-size: 11px;" height="20">
                            앙금플라워 떡케이크 클래스 참여
                        </td>
                    </tr>
                      <tr>
                          <td colspan="2" width="700" style="font-size: 14px;">
                            <div style="width: 600px;">
                           앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍
                           </div>
                          </td>
                      </tr>
                   </table>
                   
                  </div>
                  <hr>
                  
                  <div id="review-area">
                    <table style="text-align: left;">
                      <tr>
                        <th width="70" height="60"><img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" width="60" class="rounded-circle" alt="Cinque Terre"></th>
                        <td>
                          <label id="review-nick" style="font-weight: 550;">닉네임1123</label> <br>
                          ⭐⭐⭐⭐⭐ <span id="review-date" style="font-size:12px;">2023-01-21</span>
                      </td>
                          <td rowspan="3" width="150">
                              <img src="<%=request.getContextPath()%>/resources/images/sample1.png" width="150" height="150" alt="">
                          </td>
                      </tr>
                      <tr>
                        <td width="60">
                            
                        </td>
                        <td style="font-size: 11px;" height="30">
                            앙금플라워 떡케이크 클래스 참여
                        </td>
                    </tr>
                      <tr>
                          <td colspan="2" width="700" style="font-size: 14px;">
                            <div style="width: 650px;">
                                앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍 앙금백설기 짱 맛있고 선물용으로 최고에용 👍👍👍
                                </div>
                          </td>
                      </tr>
                   </table>
                   
                  </div>
                  
                  

              </div>
              
            </div>
          </div>
          
    
    
   
                

        
    </div>




</body>
</html>