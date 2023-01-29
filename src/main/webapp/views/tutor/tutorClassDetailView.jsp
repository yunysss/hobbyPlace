<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hp.lesson.model.vo.* , com.hp.tutor.model.vo.*,java.util.ArrayList, com.hp.common.model.vo.Attachment" %>        
<% 
	ArrayList<Schedule> sList = (ArrayList<Schedule>)request.getAttribute("sList");
	Lesson l = (Lesson)request.getAttribute("l");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>          

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                height: 120px;
            }
            #classPrice{height: 50px;}
            #tutorInfo{
                height: 200px;
    
            }
    
            th{width: 100px;
                height: 30px;
            }

            .container{
                font-size: small;
            }

            #img-area img{
                border-radius: 5px;
            }

            textarea{
            border: none;
            width: 700px;
            resize: none;
        
            }

         
    

    </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- 카카오 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>

  <div class="outer">
                        
            
            <h5 style="font-weight: 900;">클래스 관리</h5>
            <br>
            <span style="font-size: 15px; font-weight:550" id="detail">클래스 상세내역
            </span> 
            <form action="<%=contextPath %>/" method="post">
            <div id="btn-area" >

            <a href="<%=contextPath %>/updateForm.cl?no=<%=l.getClNo()%>" class="btn btn-secondary btn-sm a">수정</a>
             <%if (l.getClStatus().equals("2")){ %>
            <button type="button" class="btn btn-secondary btn-sm a" data-toggle="modal" data-target="#classDelete">판매중단</button>
			<%} %>
		     
            </div>
            
            
        
            <hr>
            <div id="detail-area">
                <div id="thumbnail">
                    <table id="img-area">
                        <tr>
                            <td colspan="3" height="260px">
                                <img id="mainImg" src="<%=l.getClThumb() %>" width="450" height="270" >
                            </td>
                        </tr>
                        <tr>
                            <div id="img">
                            	<% for(int i=0;i<list.size();i++){ %>
                                <td>
                                    <img id="img1" class="imgs" src="<%=contextPath %>/<%=list.get(i).getFilePath()+list.get(i).getChangeName() %>" height="100px" width="148px"> 
                                </td>
                                <%} %>
                            </div>
                        </tr>
                    </table>
                    <script>
                        var thumb = document.getElementById("mainImg");
                        var small = document.querySelectorAll(".imgs");

                        for(var i = 0; i < small.length; i++){
                            small[i].addEventListener("click",changePic);
                        }

                        function changePic(){
                            var smallAttribute = this.getAttribute("src");
                            thumb.setAttribute("src",smallAttribute);

                        }
                         
                     
                


                    </script>






                </div>
    
                <div id="classInfo">
                    <div id="className"><h4 style="font-weight: 600;"><%=l.getClName() %></h4></div>
                    <div id="classPrice"><h5 style="font-weight: 550;"><%=l.getClPrice() %> 원</h5></div>
                    <div id="tutorInfo">
                        <div id="tutorImg">
                        <img src="<%=request.getContextPath()%>/<%=ttProfile %>"  width="80" height="80"  class="rounded-circle" alt="Cinque Terre" >
                        <label style="font-weight: 600;"> &nbsp; <%=l.getMemNo() %></label>
                        </div>
                        
                        <div id="tutorIntroduce">
                            <div style="font-weight: 600"> </div>
                            <p><%=l.getIntroduce() %></p>
                          	
                                
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
                    <th>일정</th>
                    <td><%=l.getClSchedule() %> &nbsp; <%=l.getClDay() %></td>
                </tr>
                <tr>
                    <th>스케줄</th>
                    <td>
           			<%for(Schedule s : sList) {%>
           			<%=s.getSessionNo()%> 회차 : <%=s.getStartTime() %> - <%=s.getEndTime() %><br>
           			<%} %>
                    </td>
                    
                </tr>
            </table>
            <br><br>
    
    
            <h6 style="font-weight: 550; font-size: 15px; ">클래스 소개</h6>
            <hr>
            <div>
              <!--  clob 변환해야됨 -->
                <%=l.getClDetail() %>
                
  
            </div>
    
            <br><br>
            <h6 style="font-weight: 550; font-size: 15px; ">커리큘럼</h6>
            <hr>
            <div>
                <textarea rows="10" style="resize:none" ><%=l.getCurriculum() %>
                 </textarea>
    
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
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">클래스장소</div>'
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
                        <td>
                        <%String supplies = l.getClSupplies() == null? "없음" : l.getClSupplies() ;%>
                        <%=supplies %>
                        </td>
                    </tr>
                    <tr>
                        <th>검색키워드</th>
                        <td>
                         <%String keyword = l.getKeyword() == null? "없음" : l.getKeyword() ;%>
                        <%=keyword %>
                        
                         </td>
                    </tr>
                </table>
                
            </div>
    
    
            <br><br>
            <h6 style="font-weight: 550;font-size: 15px; ">취소/환불규정</h6>
            <hr>
            <div style="width: 300px">
              <textarea rows="5" style="resize:none"><%=l.getRefundPolicy()%>
            </textarea>
            </div>
        </form>
            <div align="center">
                <a href="<%=contextPath%>/ttclass.tt?cpage=1"class="btn btn-secondary btn-sm a">목록으로</a>
            </div>
            
        
        </div>
     
        <div class="container">
            <!-- The Modal -->
            <div class="modal" id="classDelete">
              <div class="modal-dialog">
                <div class="modal-content">
                    
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h6 class="modal-title">클래스 판매중단</h6>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  
                  <!-- Modal body -->
                  <div class="modal-body" align="center">
                    <b>판매중단 후 복구가 불가능합니다.<br>
                    정말로 중단하시겠습니까? <br><br>
                    </b>
                  </div>
                  
                  <div align="center">
                  <form action="<%=contextPath %>/stopcl.tt" method="post">
		        	<input type="hidden" name="classNo" value="<%=l.getClNo()%>">
		        	<button type="submit" class="btn btn-danger btn-sm">확인</button>
		        <br><br>
		        </form>
                    </div>
                </div>
              </div>
            </div>
            
          </div>
    

        
    </body>
    </html>
 