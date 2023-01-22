<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.lesson.model.vo.Lesson, java.util.ArrayList, com.hp.common.model.vo.Attachment"%>
<%
	Lesson le = (Lesson)request.getAttribute("le");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
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
        #classDetail-cal>div{
            text-align:center; 
            border-radius:5px;
            color:white;
        }
        .calendar {text-align:center; background:white;}
	    .calendar > thead td { width:50px;height:50px;}
	    .calendar > thead > tr:first-child > td { font-weight:bold;}
	    .calendar > tbody td { width:50px;height:50px;}
        
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
                <img src="<%=contextPath%>/<%= le.getClThumb() %>">
                <br><br>
                <table width="500px;">
                    <tr>
                    	<% for(int i=0; i<aList.size(); i++){ %>
                    		<td>
                    		<img src="<%= contextPath %>/<%= aList.get(i).getFilePath() + aList.get(i).getChangeName() %>">
                    		</td>
                    	<% } %>
                    	<% if(aList.size()<3) {%>
                    		<% for(int i=0; i<3-aList.size(); i++){ %>
                    			<td>
                    			<img src="<%= contextPath %>/resources/images/classimg.png">
                    			</td>
                    		<% } %>
                    	<%} %>
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
                    <b>클래스 상세</b><br><br>
                    CLOB 출력..?<br><br>
                    <b>진행 장소</b><br><br>
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
                    geocoder.addressSearch('<%= le.getClAddress() %>', function(result, status) {
                    
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
                        <%= le.getClAddress() %>
                    </div><br>
                    <b>준비물</b><br><br>
                    <%= le.getClSupplies() %> <br><br>
                    
                    <b>강사소개</b><br><br>
                    <a href="<%=contextPath%>/ttdetail.cl" id="classDetail-tutor">
                	<img src="" width="75px" height="100%">
                    <span>람보람보베이커리</span>
                    <img src="<%= contextPath %>/resources/images/right_arrow.png" width="40px;" height="40px;">
                  	</a>
                    </div>
                    
                    <hr>
                    <div id="section2" class="container-fluid">
                        <b>커리큘럼</b>
                        <br><br>
                        <%= le.getCurriculum() %>
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
						<%= le.getRefundPolicy() %>
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
                        <table class="calendar">
						    <thead>
						        <tr>
						            <td onClick="prevCalendar();" style="cursor:pointer;">&lt;</td>
						            <td colspan="5">
						                <span id="calYear">YYYY</span>년
						                <span id="calMonth">MM</span>월
						            </td>
						            <td onClick="nextCalendar();" style="cursor:pointer;">&gt;</td>
						        </tr>
						        <tr>
						            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
						        </tr>
						    </thead>
						    <tbody></tbody>
						</table>
                        <script>
						    window.onload = function(){
						        buildCalendar();
						    };
						
						    var today = new Date();
						    var date = new Date(); 
						
						    // 이전달 
						    function prevCalendar() {
						        this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
						        buildCalendar();
						    }
						
						    // 다음달
						    function nextCalendar() {
						        this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
						        buildCalendar();   
						    }
						
						    function buildCalendar() {
						
						        let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
						        let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
						
						        let tbCalendar = document.querySelector(".calendar > tbody");
						
						        document.getElementById("calYear").innerText = today.getFullYear();   // YYYY월
						        document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // MM월
						       
						        while(tbCalendar.rows.length > 0) {
						            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
						        }
						
						        let row = tbCalendar.insertRow();
						        let dom = 1;
						
						        // 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
						        // 7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
						        let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();
								
						        // 시작일, 종료일
						        const startDate = new Date('<%= le.getStartDate() %>');
						        const endDate = new Date('<%= le.getEndDate() %>');
						        
						        // 달력 출력
						        // 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
						        for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
						
						            let column = row.insertCell();
						
						            // 평일( 전월일과 익월일의 데이터 제외 )
						            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
						
						
						                // 평일 날짜 데이터 삽입
						                column.innerText = autoLeftPad(day, 2);
						
						
						                // 일요일인 경우
						                if(dom % 7 == 1) {
						                    column.style.color = "#FF4D4D";
						                }
						
						                // 토요일인 경우
						                if(dom % 7 == 0) {
						                    column.style.color = "#4D4DFF";
						                    row = tbCalendar.insertRow();
						                }
						
						            }
						
						            // 현재년과 선택 년도가 같은경우
						            if(today.getFullYear() == date.getFullYear()) {
						
						                // 현재월과 선택월이 같은경우
						                if(today.getMonth() == date.getMonth()) {
						
						                    // 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
						                    if(date.getDate() > day && Math.sign(day) == 1) {
						                        column.style.textDecorationLine = "line-through";
						                    }
						
						                    // 현재일보다 이후이면서 현재월에 포함되는 일인경우
						                    else if(date.getDate() < day && lastDate.getDate() >= day) {
						                        column.style.backgroundColor = "#FFFFFF";
						                        column.onclick = function(){ calendarChoiceDay(this); }
						                    }
						
						                    // 현재일인 경우
						                    else if(date.getDate() == day) {
						                        column.style.backgroundColor = "#FFFFE6";
						                        column.onclick = function(){ calendarChoiceDay(this); }
						                    }
						
						                // 현재월보다 이전인경우
						                } else if(today.getMonth() < date.getMonth()) {
						                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
						                        column.style.backgroundColor = "#E5E5E5";
						                    }
						                }
						
						                // 현재월보다 이후인경우
						                else {
						                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
						                        column.style.backgroundColor = "#FFFFFF";
							                    column.onclick = function(){ calendarChoiceDay(this); }  
						                    }
						                }
						            }
						
						            // 선택한년도가 현재년도보다 작은경우
						            else if(today.getFullYear() < date.getFullYear()) {
						                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
						                    column.style.backgroundColor = "#E5E5E5";
						                }
						            }
						
						            // 선택한년도가 현재년도보다 큰경우
						            else {
						                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
						                    column.style.backgroundColor = "#FFFFFF";
						                    column.onclick = function(){ calendarChoiceDay(this); }
						                }
						            }
						            dom++;
						
						        }
						    }
						
						    // 날짜 선택
						    function calendarChoiceDay(column) {
						
						        // 기존 선택일의 표시형식 초기화
						        if(document.getElementsByClassName("choiceDay")[0]) {
						            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
						            document.getElementsByClassName("choiceDay")[0].style.color = "black";
						            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
						        }
								
						        // 선택일 체크 표시
						        column.style.backgroundColor = "#266C78";
						        column.style.color = "white";
						
						        // 선택일 클래스명 변경
						        column.classList.add("choiceDay");
						    }
						
						    // 두자리수 변경
						    function autoLeftPad(num, digit) {
						        if(String(num).length < digit) {
						            num = new Array(digit - String(num).length + 1).join("0") + num;
						        }
						        return num;
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
                
            </div>
        </div>
        	
    </div>
    <br clear="both">
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>