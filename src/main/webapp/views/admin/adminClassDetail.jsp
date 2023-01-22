<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hp.lesson.model.vo.* , java.util.ArrayList" %>    
    
<% 
	ArrayList<Schedule> sList = (ArrayList<Schedule>)request.getAttribute("s");
	Lesson l = (Lesson)request.getAttribute("l");

%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 카카오 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
    <style>
            .outer{
                padding: 30px 50px;
                font-size: smaller;
    
            }
    
            #detail-area * {box-sizing: border-box;}
            #img-area{
                width: 410px;
                margin: auto;
                margin-top: 10px;
                text-align: center;
            }
    
           #btn-area{
              
                width: 900px;
                text-align: right;
           }
    
            #thumbnail, #classInfo{float: left;}    
            #thumbnail{
                width: 500px;
                height: 400px;
                position: relative;
            }
    
           
            #classInfo{
                padding: 20px 0px;
                width: 350px;
                height: 100%;
            }
            #classDetail{
                clear: both;
            }
            #className{
                height: 60px;
            }
            #classPrice{height: 100px;}
            #tutorInfo{
                height: 200px;
    
            }
    
            th{width: 100px;
                height: 30px;
            }

            .container{
                font-size: small;
            }

         
    
    </style>
    </head>
    <body>
        <%@ include file="../common/adminMenubar.jsp" %>
        <div class="outer">
                        
            
            <h5 style="font-weight: 900;">클래스 관리</h5>
            <br>
            <span style="font-size: 15px; font-weight:550" id="detail">클래스 상세내역
            </span> 
           
            <div id="btn-area" >
            <!--클래스가 신규면 보여지는 버튼??
            <a href="" class="btn btn-secondary btn-sm a">승인</a>
            <button  type="button" class="btn btn-secondary btn-sm a" data-toggle="modal" data-target="#classReject">반려</button>
            -->
            <button class="btn btn-secondary btn-sm a">목록으로</button>
            </div>
        
            <hr>
            <div id="detail-area">
                <div id="thumbnail">
                    <table id="img-area">
                        <tr>
                            <td colspan="3" height="260px">
                                <img id="mainImg" src="<%=l.getClThumb() %>" width="400" height="250" >
                            </td>
                        </tr>
                        <tr>
                            <div id="img">
                                <td>
                                    <img id="img1" src="" height="98px" width="130px"> 
                                </td>
                                <td>
                                    <img id="img2" src=""height="98px" width="130px">
                                </td>
                                <td>
                                    <img id="img3" src="" height="98px" width="130px">
                                </td>
                            </div>
                        </tr>
                    </table>
                </div>
    
                <div id="classInfo">
                    <div id="className"><h4 style="font-weight: 600;"><%=l.getClName() %></h4></div>
                    <div id="classPrice"><h5 style="font-weight: 550;"><%=l.getClPrice() %> 원</h5></div>
                    <div id="tutorInfo">
                        <div id="tutorImg">
                        <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg"  width="80"  class="rounded-circle" alt="Cinque Terre" >
                        <label style="font-weight: 600;"> &nbsp; <%=l.getMemNo() %></label>
                        </div>
                        <br>
                        <div id="tutorIntroduce">
                            <div style="font-weight: 600"> </div>
                            <p>튜터 소개 저는 감자를 좋아해용 같이 만들어머거요🥔🍟🥔🥔🥔🍟🍟🍟🍟🍟🍟🍟🍟🍟🍟🍟🍟🍟🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🍟🍟🍟🍟🍟🍟🍟🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🍟🍟🍟🍟🍟🥔🥔🥔🥔🥔🥔🥔🥔🥔🍟</p>
                                
                        </div>
                    </div>
                </div>
            </div>
            
            
            <br><br>
            <div id="classDetail">
            <h6 style="font-weight: 550; font-size: 15px; ">클래스 정보</h6>
            <hr>
            <div>
                <table>
                    <tr>
                        <th>난이도</th>
                        <td><%=l.getClLevel() %></td>
                    </tr>
                    <tr>
                        <th>최대인원</th>
                        <td><%=l.getClMax() %> 명</td>
                    </tr>
                </table>
            </div>
    
            <br><br>
            <h6 style="font-weight: 550; font-size: 15px; ">클래스 일정</h6>
            <hr>
            <table>
                <tr>
                    <th>판매시작일</th>
                    <td><%=l.getStartDate() %></td>
                </tr>
                <tr>
                    <th>판매종료일</th>
                    <td> <%=l.getEndDate() %></td>
                </tr>

                <tr>
                    <th>일정</th>
                    <td><%=l.getClSchedule() %> &nbsp; <%=l.getClDay() %></td>
                </tr>
                <tr>
                    <th>스케줄</th>
                    <td>
           
                    </td>
                    
                </tr>
            </table>
            <br><br>
    
    
            <h6 style="font-weight: 550; font-size: 15px; ">클래스 소개</h6>
            <hr>
            <div>
                <%=l.getClDetail() %>
                
    
    
    
    
    
            </div>
    
            <br><br>
            <h6 style="font-weight: 550; font-size: 15px; ">커리큘럼</h6>
            <hr>
            <div>
               <%=l.getCurriculum() %>
                
    
            </div>
            <br><br>
            <h6 style="font-weight: 550; font-size: 15px; ">진행장소</h6>
            <hr>
            <div id="map" style="width:600px;height:300px;"></div>
    
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19e99c5794a1b621123d4304f847fd72&libraries=services"></script>
            <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  
            
            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 
            
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch('<%=l.getClAddress()%>', function(result, status) {
            
                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {
            
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
            
                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">장소명</div>'
                    });
                    infowindow.open(map, marker);
            
                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });    
            </script>
         
    
       
    
    
            <div>
                <b>찾아오는 길</b> <br>
                <%=l.getClAddress()%>
                 
            </div>
            <br><br>
            <h6 style="font-weight: 550;font-size: 15px; ">부가정보</h6>
            <hr>
            <div>
                <table>
                    <tr>
                        <th>준비물</th>
                        <td><%=l.getClSupplies() %></td>
                    </tr>
                    <tr>
                        <th>검색키워드</th>
                        <td><%=l.getKeyword() %> </td>
                    </tr>
                </table>
                
            </div>
    
    
            <br><br>
            <h6 style="font-weight: 550;font-size: 15px; ">취소/환불규정</h6>
            <hr>
            <div style="width: 300px">
               <%=l.getRefundPolicy()%>

            </div>
            
        
        </div>
     
        </div>

        <div class="container">
            <!-- The Modal -->
            <div class="modal" id="classReject">
              <div class="modal-dialog">
                <div class="modal-content">
                    
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h6 class="modal-title">클래스반려</h6>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  
                  <!-- Modal body -->
                  <div class="modal-body" align="center">
                    <b>반려 후 변경이 불가합니다.<br>
                    정말로 반려하시겠습니까? <br><br>
                    </b>
                  </div>
                  
                  <div align="center">
                  <form action="" method="post">
                    
		        	<input type="hidden" name="classNo" value="">
		        	반려사유 : <input type="text" name="causeOfReturn" list="list">
		        	<datalist id="list">
                        <option>주제/내용 부적절</option>
                        <option>내용 부족</option>
                        <option>재수없음..</option>
                    </datalist>
		        	<button type="submit" class="btn btn-danger btn-sm">반려하기</button>
		        <br><br>
		        </form>
                    </div>
                </div>
              </div>
            </div>
            
          </div>
    
        
    </body>
    </html>