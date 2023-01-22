<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.lesson.model.vo.Lesson"%>
<%
	Lesson le = (Lesson)request.getAttribute("le");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div, p, form, input{box-sizing:border-box;}
        a{text-decoration: none !important; color:black !important;}

        .outer{width:1000px; margin:auto; margin-top:20px;}

        /* 상세페이지 전반적인 틀 */
        .outer>div{height:100%; float:left;}
        #classDetail-1{width:60%;}
        #classDetail-2{width:40%;}

        #classDetail-1>div{width:100%;}
        #classDetail-img{height:20%;}
        #classDetail-content{height:80%}
        
        /* img */
        #classDetail-img>img{
            width:500px;
            height:400px;
        }
        #classDetail-img table img{
            width:150px;
            height:120px;
            margin-left:8px;
        }
        #classDetail-short{float:left;}
        #classDetail-likeShare{float:right;}
        #classDetail-short>span{
            border:1px solid rgb(245, 245, 245); 
            border-radius:5px;
            background: rgb(245, 245, 245);
            padding:5px;
            text-align:center;
        }
        #classDetail-img span{
            font-size:13px;
            display:inline-block;
            margin:5px;
        }

        /* content */
        #classDetail-content{
            margin-top:50px; 
            position:relative;
        }
        .nav-item{
            margin-left:25px;
            font-size:15px;
        }
        .nav-item:hover{
            text-decoration: underline 3px;
        }
        #section3 button{
            background:rgb(35, 104, 116);
            color:white;
            height:40px;
            width:150px;
        }

        /* classDetail-2 */
        #classDetail-2>*{
            position:fixed;
            padding-left:20px;
        }
        /* calender */
        #classDetail-cal{
            width:350px;
            padding:20px;
            background:rgb(245, 245, 245);
        }
        #classDetail-cal>table{
            background:white;
        }
        #classDetail-cal td{
            width:50px;
            height:40px;
        }
        #classDetail-cal>div{
            text-align:center; 
            border-radius:5px;
            color:white;
        }
        
        /* 날짜 선택하면 나타나는 창 */
        #classDetail-date>table{
            width:310px;
            height:100px;
            margin-top:10px;
            background:white;
            color:black;
        }
        #classDetail-date td{
            text-align:left;
        }
        #classDetail-price{
            height:85px;
            width:310px;
            margin-top:10px;
        }
        #classDetail-price>*{
            color:black;
            float:right;
            margin:5px;
        }

        /* classDetail-cal button 스타일 */
        #classDetail-cal button, #section3 button{
            border-radius:5px;
            border:none;
        }
        #classDetail-cal>table button{
            background:rgb(245, 245, 245);
            height:30px;
            width:30px;
        }
        #classDetail-cal>div>a{
            background:white;
            height:40px;
            width:150px;
            margin-top:10px;
        }
        #classDetail-cal>a{
            background:rgb(35, 104, 116);
            color:white!important;
            height:40px;
            width:300px;
            margin-top:10px;
        }
        
        /* tutor */
        #classDetail-tutor{
        	display:inline-block;
            width:350px;
            height:100px;
            padding:15px 30px;
            background:rgb(245, 245, 245);
        }
        #classDetail-tutor span{
            margin:15px;
        }

    </style>
    <!-- 카카오 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
    <div class="outer">
        <div id="classDetail-1">
            <div id="classDetail-img">
                <img src="<%=contextPath%>/<%= le.getClThumb() %>" + >
                <br><br>
                <table width="500px;">
                    <tr>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                    </tr>
                </table>
                <br>
                <div align="right" style="width:500px">
                    <div id="classDetail-short">
                        <span><%= le.getCtDno() %></span>
                        <span>난이도 <%= le.getClLevel() %></span>
                    </div>
                    <div id="classDetail-likeShare">
                        <span>❤️<%= le.getLikeCount() %></span>
                        <a href=""><img src="<%= contextPath %>/resources/images/share.png" width="25px"></a>
                    </div>
                </div>
                
                <br clear="both">
                <div>
                    <h5><b><%= le.getClName() %></b></h5>
                </div>
            </div>
            <div id="classDetail-content" data-spy="scroll" data-target=".navbar">
                <nav class="navbar navbar-expand-sm">  
                    <ul class="navbar-nav">
                        <li class="nav-item">
                        <a class="nav-link" href="#section1">&nbsp;&nbsp;&nbsp;클래스 소개&nbsp;&nbsp;&nbsp;</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#section2">&nbsp;&nbsp;&nbsp;커리큘럼&nbsp;&nbsp;&nbsp;</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#section3">&nbsp;&nbsp;&nbsp;후기&nbsp;&nbsp;&nbsp;</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#section4">&nbsp;&nbsp;&nbsp;취소/환불&nbsp;&nbsp;&nbsp;</a>
                        </li>
                    </ul>
                    </nav>
                    
                    <div id="section1" class="container-fluid">
                    <b>클래스 상세</b>
                    <br><br>
                    <b>진행 장소</b>
                    <br><br>
                    <div id="map" style="width:600px;height:300px;"></div><br>

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
                    <div style="font-size: 13px;">
                        <span><b>찾아오시는 길</b></span><br>
                        제주특별자치도 제주시 첨단로 242
                    </div>
                    
                    </div>
                    <hr>
                    <div id="section2" class="container-fluid">
                        <b>커리큘럼</b>
                        <br><br>
                        <p>
                        
                        </p>
                    </div>
                    <hr>
                    <div id="section3" class="container-fluid">
                        <b>후기</b> <br>
                        ⭐5.0 (11)
                        <br><br>
                        <table width="550" height="150">
                            <tr>
                                <td width="60" height="60">
                                    <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" width="45"  class="rounded-circle">
                                </td>
                                <td>
                                    홍길순 <br>
                                    ⭐⭐⭐⭐⭐ 2022/3/11
                                </td>
                                <td rowspan="2" width="100">
                                    <img src="" width="100">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">후기내용어쩌구저쩌구 솰라솰라솰라 존존존존존존존존존존존잼잼잼잼잼잼잼잼재맺ㅈ맺잼</td>
                            </tr>
                        </table>
                        <div align="center">
                            <button type="button">더보기</button>
                        </div>
                        
                    </div>
                    <hr>
                    <div id="section4" class="container-fluid">
                        <b>취소/환불</b>
                        <br><br>
                        <p>
						가. 클래스 환불기준 원칙 <br>
						학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br>
						- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우<br>
						  또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 <br>
						  교습비를 반환하는 등 학습자를 보호하기위하여 필요한 조치를 하여야 한다.<br><br>
						                
						1. 클래스을 제공할 수 없거나, 클래스 장소를 제공할 수 없게 된 날 : 이미 납부한 비용 등을 일한 계산한 금액 환불<br><br>
						                
						2. 클래스기간이 1개월 이내의 경우<br>
						- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br>
						- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불<br>
						- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불<br>
						- 총 레슨시간의 1/2 경과후 : 반환하지 않음<br><br>
						
						3.클래스 기간이 1개월을 초과하는 경우<br>
						- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br>
						- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비<br>
						(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불<br><br>
						                
						• 총 클래스 시간의 레슨비 징수기간 중의 총레슨시간을 말하며,<br>
						반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함<br>
                        </p>
                    </div>
                
                
               
            </div>
        </div>
        <div id="classDetail-2">
            <div>
                <form action="" id="classCalenderForm">
                    <div id="classDetail-cal">
                        <div style="background:rgb(180,180,180); height:40px; line-height:40px;">
                            <b>클래스 일정</b>
                        </div>
                        <table id="calendar" align="center">
                            <tr>
                                <td align="center"><label onclick="prevCalendar()"> < </label></td>
                                <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
                                <td align="center"><label onclick="nextCalendar()"> > </label></td>
                            </tr>
                            <tr>
                                <td align="center"><font color ="#F79DC2">일</td>
                                <td align="center">월</td>
                                <td align="center">화</td>
                                <td align="center">수</td>
                                <td align="center">목</td>
                                <td align="center">금</td>
                                <td align="center"><font color ="skyblue">토</td>
                            </tr>
                        </table>
                        <script>
                            $(function(){
                                buildCalendar();
                            })
                            var today = new Date();
                            function buildCalendar(){
                              var row = null;
                              var cnt = 0;
                              var calendarTable = document.getElementById("calendar");
                              var calendarTableTitle = document.getElementById("calendarTitle");
                              calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
                              
                              var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
                              var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
                              while(calendarTable.rows.length > 2){
                                  calendarTable.deleteRow(calendarTable.rows.length -1); 
                              }
                            
                              row = calendarTable.insertRow();
                              for(i = 0; i < firstDate.getDay(); i++){
                                  cell = row.insertCell(); 
                                  cnt += 1;
                              }
                            
                              for(i = 1; i <= lastDate.getDate(); i++){
                                  cell = row.insertCell();
                                  cnt += 1;
                            
                                cell.setAttribute('id', i);
                                  cell.innerHTML = "<a href='' class='calen'>" + i + "</a>";
                                  cell.align = "center";
                            
                                cell.onclick = function(){
                                    clickedYear = today.getFullYear();
                                    clickedMonth = ( 1 + today.getMonth() );
                                    clickedDate = this.getAttribute('id');
                            
                                    clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
                                    clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                                    clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
                            
                                    opener.document.getElementById("date").value = clickedYMD;
                                    self.close();
                                }
                            
                                if (cnt % 7 == 1) {
                                    cell.innerHTML = "<a href='' class='calen'><font color=#F79DC2>" + i + "</font></a>";
                                }
                            
                                if (cnt % 7 == 0){
                                    cell.innerHTML = "<a href='' class='calen'><font color=skyblue>" + i + "</font></a>";
                                    row = calendar.insertRow();
                                }
                              }
                            
                              if(cnt % 7 != 0){
                                  for(i = 0; i < 7 - (cnt % 7); i++){
                                      cell = row.insertCell();
                                  }
                              }
                            }
                            
                            function prevCalendar(){
                                today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
                                buildCalendar();
                            }
                            
                            function nextCalendar(){
                                today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
                                buildCalendar();
                            }
                            </script>
                        <!-- 날짜 선택하면 나타나는 창 -->
                        <div id="classDetail-date">
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;
                                        <input type="radio" id="" name="session">
                                        <label for="">날짜 시간</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                        <input type="radio" id="" name="session">
                                        <label for="">날짜 시간</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="classDetail-price">
                            <div>
                                <span style="font-size:14px;"><b>인원 선택</b></span> &nbsp;&nbsp;&nbsp;
                                <input type="number" name="amount" min="1" max="최대인원" step="1" value="1" style="width:70px; text-align:center">
                            </div>
                            <p>총 결제 금액 99,000원</p>
                        </div>
                        <div>
                            <a href="" class="btn">🤍 찜하기</a> <!-- 찜한 목록에 추가 / 로그인회원의 찜 리스트 조회 => 있으면 빨간하트로-->
                            <a href="" class="btn">💬 1:1문의</a>
                        </div>
                        <a href="<%=contextPath %>/register.reg" class="btn">클래스 신청하기</a>
                        <!-- 일정 선택 전이면 alert창 띄우기 -->
                    </div>
                </form>
                <br>
                <a href="<%=contextPath%>/ttdetail.cl" id="classDetail-tutor">
                	
                	<img src="" width="75px" height="100%">
                    <span>람보람보베이커리</span>
                    <img src="<%= contextPath %>/resources/images/right_arrow.png" width="40px;" height="40px;">
                    
                </a>
                
            </div>
        </div>
        
        	
    </div>
    <br clear="both">
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>