<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 카카오 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<title>Insert title here</title>
<style>
        .outer{
            padding: 30px 50px;

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

        


</style>
</head>
<body>
    <%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">
                    
        <form action="" id="class_list" >
        <h5 style="font-weight: 900;">내 클래스목록</h5>
        <br>
        <span style="font-size: 15px; font-weight:550" id="detail">클래스 상세내역
        </span> 
       
        <div id="btn-area" >
        <a href="" class="btn btn-secondary btn-sm a">수정</a>
        <a href="" class="btn btn-secondary btn-sm a">삭제</a>
        </div>
    
        <hr>
        <div id="detail-area">
            <div id="thumbnail">
                <table id="img-area">
                    <tr>
                        <td colspan="3" height="260px">
                            <img id="mainImg" src="" width="400" height="250" >
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
                <div id="className"><h4 style="font-weight: 600;">붕어빵을만들어 보아유</h4></div>
                <div id="classPrice"><h5 style="font-weight: 550;">20000 원</h5></div>
                <div id="tutorInfo">
                    <div id="tutorImg">
                    <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg"  width="80"  class="rounded-circle" alt="Cinque Terre" >
                    <label style="font-weight: 600;">&nbsp; 튜터명 감자왕</label>
                    </div>
                    <br>
                    <div id="tutorIntroduce">
                        <div style="font-weight: 600"> &nbsp;튜터 소개</div>
                        <p>튜터 소개 라라라라라랄ㅇㄹㅇ튜터 소개 라라라라라랄ㅇㄹㅇ튜터 소개 라라라라라랄ㅇㄹㅇ튜터 소개 라라라라라랄ㅇㄹㅇ튜터 소개 라라라라라랄ㅇㄹㅇ튜터 소개 라라라라라랄ㅇㄹㅇ</p>
                            
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
                    <td> 쉬움 / 중간  어려움</td>
                </tr>
                <tr>
                    <th>최대인원</th>
                    <td>10 명</td>
                </tr>
            </table>
        </div>

        <br><br>
        <h6 style="font-weight: 550; font-size: 15px; ">클래스 일정</h6>
        <hr>
        <table>
            <tr>
                <th>판매시작일</th>
                <td> 2023-01-31</td>
            </tr>
            <tr>
                <th>판매종료일</th>
                <td> 2023-12-31</td>
            </tr>



            <tr>
                <th>일정</th>
                <td>매주 월/수/금</td>
            </tr>
            <tr>
                <th>스케줄</th>
                <td>1회차 : 오전 9시 - 오전 11시 <br>
                    2회차 : 오후 2시 - 오후 4시 

                </td>
                
            </tr>
        </table>
        <br><br>


        <h6 style="font-weight: 550; font-size: 15px; ">클래스 소개</h6>
        <hr>
        <div>
            이런분들께 추천 드려요~ 
            





        </div>

        <br><br>
        <h6 style="font-weight: 550; font-size: 15px; ">커리큘럼</h6>
        <hr>
        <div>
            1️⃣2️⃣3️⃣<br>
            2️⃣<br>
            3️⃣<br>
            
            

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
        geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
        
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
            제주특별자치도 제주시 첨단로 242
 			
        </div>
        <br><br>
        <h6 style="font-weight: 550;font-size: 15px; ">부가정보</h6>
        <hr>
        <div>
            <table>
                <tr>
                    <th>준비물</th>
                    <td>없음</td>
                </tr>
                <tr>
                    <th>검색키워드</th>
                    <td>뜨개 붕어빵 </td>
                </tr>
            </table>
            
        </div>


        <br><br>
        <h6 style="font-weight: 550;font-size: 15px; ">취소/환불규정</h6>
        <hr>
        <div>
            <pre>
가. 클래스 환불기준 원칙
학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)
- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우
 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 
 교습비를 반환하는 등 학습자를 보호하기위하여 필요한 조치를 하여야 한다.
                
1. 클래스을 제공할 수 없거나, 클래스 장소를 제공할 수 없게 된 날 : 이미 납부한 비용 등을 일한 계산한 금액 환불
                
2. 클래스기간이 1개월 이내의 경우
- 레슨 시작전 : 이미 납부한 레슨비 전액 환불
- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불
- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불
- 총 레슨시간의 1/2 경과후 : 반환하지 않음
                
 3.클래스 기간이 1개월을 초과하는 경우
- 레슨 시작전 : 이미 납부한 레슨비 전액 환불
- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비
(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불
                
• 총 클래스 시간의 레슨비 징수기간 중의 총레슨시간을 말하며,
반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함
            </pre>
        </div>
        
    
    </div>
    </form>
    </div>
    <%@ include file="../common/footerbar.jsp" %>

    
</body>
</html>