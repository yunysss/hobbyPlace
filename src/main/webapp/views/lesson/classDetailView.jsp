<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--w지워-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  



 <!-- 카카오 -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 
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
            padding: 20px;
            width: 300px;
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
        <span style="font-size: 14px; font-weight:550" id="detail">클래스 상세내역
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
                        </img></td>
                    </tr>
                    <tr>
                    <div id="img">
                        <td>
                            <img id="img1" src="" height="98px" width="130px"> </img>
                        </td>
                        <td>
                            <img id="img2" src=""height="98px" width="130px"></img>
                        </td>
                        <td>
                            <img id="img3" src="" height="98px" width="130px"></img>
                        </td>
                    </div>
                    </tr>
                </table>
            </div>

            <div id="classInfo">
                <div id="className"><h4>붕어빵을만들어 보아유</h4></h3></div>
                <div id="classPrice"><h5>20000 원</h5></div>
                <div id="tutorInfo">
                    <div id="tutorImg">
                    <img src="resources/KakaoTalk_20230111_135534500.jpg"  width="80"  class="rounded-circle" alt="Cinque Terre" >
                    <label style="font-weight: 600;">튜터명 감자왕</label>
                    </div>
                    <br>
                    <div id="tutorIntroduce">
                        <div style="font-weight: 600">튜터 소개</div>
                        <p>튜터 소개넣어유</p>
                            
                    </div>
                </div>
            </div>
        </div>
        
        
        <br><br>
        <div id="classDetail">
        <h6 style="font-weight: 550;">클래스 정보</h6>
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
        <h6 style="font-weight: 550;">클래스 일정</h6>
        <hr>
        <table>
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


        <h6 style="font-weight: 550;">클래스 소개</h6>
        <hr>
        <div>
            이런분들께 추천 드려요~ 
            





        </div>

        <br><br>
        <h6 style="font-weight: 550;">커리큘럼</h6>
        <hr>
        <div>
            1️⃣2️⃣3️⃣<br>
            🟦🟦🟦<br>
            🔵🔵🟧🟥<br>
            🟢🟡
            

        </div>
        <br><br>
        <h6 style="font-weight: 550;">진행장소</h6>
        <hr>
      <!--카카오맵 지도 (주소입력하면 지도위에표시)-->
    <div id="map" style="width:500px;height:350px;"></div>
    
    
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
        geocoder.addressSearch('인천시 부평구 수변로 333' , function(result, status) {

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
                content: '<div style="width:150px;text-align:center;">우리회사</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
   	
   	
   	</script>
   


        <div>
            <b>찾아오는 길</b>

        </div>
        <br><br>
        <h6 style="font-weight: 550;">부가정보</h6>
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


        <br>
        <h6 style="font-weight: 550;">취소/환불규정</h6>
        <hr>
        <div>

        </div>
        
    
    </div>

    
</body>
</html>