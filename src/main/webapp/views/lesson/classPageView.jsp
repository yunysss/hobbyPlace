<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.lesson.model.vo.Lesson, java.util.ArrayList, com.hp.common.model.vo.Attachment, com.hp.review.model.vo.Review"%>
<%
	Lesson le = (Lesson)request.getAttribute("le");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
	int likeStatus = 0;
	if((Member)session.getAttribute("loginUser") != null){
		likeStatus = (int)request.getAttribute("likeStatus");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div, p, form, input, table{box-sizing:border-box;}
        a{text-decoration: none !important; color:black!important}

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
        .calendar {text-align:center; background:white; cursor:default;}
	    .calendar > thead td { width:50px;height:50px;}
	    .calendar > thead > tr:first-child > td {font-weight:bold;}
	    .calendar div {
	    	text-align:center;
	    	line-height:33px;
	    	width:35px; 
	    	height:35px; 
	    	border-radius:50%; 
	    	margin:auto;
    	}
	    .possibleDay{background:lightgray; color:white;}
	    .possibleDay:hover{cursor:pointer; opacity:0.5;}
        
        #classDetail-cal>table{
            background:white;
        }
        #classDetail-cal td{
            width:50px;
            height:40px;
        }
        
        /* 날짜 선택하면 나타나는 창 */
        #classDetail-date{
        	margin-top:10px;
            overflow-y:auto; 
            overflow-x:hidden;
        }
        #classDetail-date::-webkit-scrollbar{height: 8px;}
		#classDetail-date::-webkit-scrollbar-track{background-color: rgb(240,240,240);}
		#classDetail-date::-webkit-scrollbar-thumb{
		  border-radius: 3px;
		  background-color: rgb(180, 180, 180);
		}
        #classDetail-date>table{
            width:100%;
            background:white;
            color:black;
        }
        #classDetail-date td{
            text-align:left;
            padding-left:20px;
            padding-top:10px;
        }
        #classDetail-date label{
        	display:inline-block;
        	width:300px
        }
        #classDetail-price *{
            float:right;
            color:black;
        }
        #classDetail-price>div>p{
        	margin-top:10px;
        }

        /* classDetail-cal button 스타일 */
        #classDetail-cal button{
            border-radius:5px;
            border:none;
        }
        #classDetail-cal>table button:hover{
        	background:lightgray;
        }
        #classDetail-cal>div>a{
            background:white;
            height:40px;
            width:150px;
        }
        #classDetail-cal>div>a:hover{
        	background:lightgray;
        }
        #classDetail-cal>button{
            background:rgb(35, 104, 116);
            color:white!important;
            height:40px;
            width:300px;
            margin-top:10px;
        }
        #classDetail-cal>button:hover{
        	opacity:0.8;
        }
        /* tutor */
        #classDetail-tutor{
        	display:inline-block;
            width:350px;
            height:100px;
            padding:15px 0px 15px 30px;
            background:rgb(245, 245, 245);
        }
		#classDetail-tutor>*{
			margin-right:5px;
		}
		
		#paging{
		    text-align: center;
		    display: inline-block;
			padding-left :0;
		}
		#paging li {
		    text-align: center;
		    float: left;
			list-style:none;
			border-radius:10px;
		}
		
		#paging li a {
		    display: block;
		    font-size: 12px;
			color: black;
		    padding: 5px 10px;
		    box-sizing: border-box;
			text-decoration-line:none;
		}
		
		#paging li.on {
		    background: gray;
		}
		
		#paging li.on a {
		    color: white!important;
		}
		
		.modal-body input{
            border: none;
            font-size: 15px;
            outline: none;
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
                    <div id="classDetail-likeShare" class="dropdown">
                        <span>❤️<%= le.getLikeCount() %></span>
                        <a href="#" data-toggle="modal" data-target="#shareModal"><img src="<%= contextPath %>/resources/images/share.png" width="25px"></a>
                    </div>
                </div>
                <div class="modal fade" id="shareModal">
				  <div class="modal-dialog modal-sm modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-body">
				        <input id="myInput" value="http://localhost:8327<%= contextPath %>/page.cl?no=<%=le.getClNo() %>" size="35" readonly>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-secondary btn-sm" style="background:rgb(35, 104, 116)" onclick="copy_to_clipboard()">url복사</button>
				        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				<script>
					function copy_to_clipboard() {    
						  const copyText = document.getElementById('myInput');
						  copyText.select();
						  copyText.setSelectionRange(0, 99999);
						  document.execCommand("Copy");
						}
				</script>
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
                    <div id="map" style="width:550px;height:300px;"></div><br>

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
                    <a href="<%=contextPath%>/ttdetail.cl?no=<%=le.getClNo() %>" id="classDetail-tutor">
	                    <%if(le.getTutorProfile() == null){%>
	                    	<img src="<%= contextPath %>/resources/tutorProfile_upfiles/defaultimg.jpg" width="70" height="70" class="rounded-circle">
	                    <% }else{ %>
	                    	<img src="<%= contextPath %>/<%= le.getTutorProfile() %>" width="70" height="70" class="rounded-circle">
	                	<% } %>
	                    <span><%= le.getMemNo() %></span>
	                    <img src="<%= contextPath %>/resources/images/right_arrow.png" width="30px;" height="30px;" style="margin-left:100px;">
                  	</a>
                    </div>
                    
                    <hr>
                    <div id="section2" class="container-fluid">
                        <b>커리큘럼</b>
                        <br><br>
                        <%= le.getCurriculum() %>
                    </div>
                    <hr>
                    <script>
				        let totalData; 
					    let dataPerPage=5; 
					    let pageCount = 5; 
					    let globalCurrentPage=1;
					    let dataList; 
					
					    $(function () {
						     selectReview();
					    })
				        function selectReview(){
				    		$.ajax({
				    			url:"<%=contextPath%>/selectReview.cl",
				    			data:{
				    				clNo:<%=le.getClNo()%> 				
				    			},
				    			success:function(list){
				    				if(list.length == 0){
				    					let value = "<tr>"
				    						+	"<td colspan='3'>작성된 후기가 없습니다.</td>"
				    						+ "</tr>"
				    					$("#reviewList tbody").html(value);
				    					$("#paging").html("");
				    				} else{
				    	 		    	   totalData = list.length;
				    	 		           dataList=list;
				    	 		           displayData(1, dataPerPage, totalData);
				    	 		           paging(totalData, dataPerPage, pageCount, 1);
				    				}
				    			},error:function(){
				    				console.log("정산목록 조회용 ajax 통신실패");
				    			}
				    		})
				    	}
					    function displayData(currentPage, dataPerPage, totalData) {
					    	  let value = "<tr>"
				    		  			+	"<td width='60' height='60' colspan='3'>"
				    		  			+		"⭐<%= le.getClStarAvg() %>.0 (<%= le.getClStarCount() %>)"
				    		  			+	"</td>"
				    		  			+ "</tr>";
					    	  currentPage = Number(currentPage);
					    	  dataPerPage = Number(dataPerPage);
					    	  if(totalData < dataPerPage){
					    		  num = totalData;
					    	  } else{
					    		  num = dataPerPage;
					    	  }
					    	  for (let i = (currentPage - 1) * dataPerPage; 
					    	    i < (currentPage - 1) * dataPerPage + num;
					    	    i++
					    	  ) {
					    		  value += "<tr>"
					    		  		+	"<td>";
					    		  if(dataList[i].memProfile == null){
				                  	value += "<img src='<%= contextPath %>/resources/tutorProfile_upfiles/defaultimg.jpg' width='45' height='45' class='rounded-circle'>"
					    		  }else{ 
				                	value += "<img src='<%=contextPath%>/" + dataList[i].memProfile + " width='45' height='45' class='rounded-circle'>"
				                  }
				                  value += "</td>"
		                            	+	"<td>"
		                            	+		dataList[i].memNickName + "<br>";
	                            	for(let j=1; j<=dataList[i].reviewStar; j++){
	               						value += "⭐";
	               					}
	                            	if(dataList[i].reviewUpdate == null){
	                            		value += dataList[i].reviewDate;
	                            	} else{
	                            		value += dataList[i].reviewUpdate;
	                            	}
                            		value += "</td>"
                            		  		+  "<td rowspan='2' width='100'>"
                            		  		+"<img src='' width='100'>"
                          		  		  	+  "</td>"
                          		  		  + "</tr>"
                          		  		  +	"<tr>"
                          		  		  +		"<td colspan='2'>" + dataList[i].reviewContent + "</td>"
                          		  		  +	"</tr>"
								}
					    	  $("#reviewList tbody").html(value);
							}
							
				  	
				  		function paging(totalData, dataPerPage, pageCount, currentPage) {
				  		 
				  			  totalPage = Math.ceil(totalData / dataPerPage); 
				      		  
				      		  if(totalPage<pageCount){
				      		    pageCount=totalPage;
				      		  }
				      		  
				      		  let pageGroup = Math.ceil(currentPage / pageCount); 
				      		  let last = pageGroup * pageCount; 
				      		  
				      		  if (last > totalPage) {
				      		    last = totalPage;
				      		  }
				
				      		  let first = last - (pageCount - 1); 
				      		  let next = last + 1;
				      		  let prev = first - 1;
				
				      		  let pageHtml = "";
				
				      		  if (prev > 0) {
				      		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
				      		  }
				
				      		  for (let i = first; i <= last; i++) {
				      		    if (currentPage == i) {
				      		      pageHtml +=
				      		        "<li class='on'><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
				      		    } else {
				      		      pageHtml += "<li><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
				      		    }
				      		  }
				
				      		  if (last < totalPage) {
				      		    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
				      		  }
				
				      		  $("#paging").html(pageHtml);
				
				      		  $("#paging li a").click(function () {
				      		    let $id = $(this).attr("id");
				      		    selectedPage = $(this).text();
				
				      		    if ($id == "next") selectedPage = next;
				      		    if ($id == "prev") selectedPage = prev;
				      		    globalCurrentPage = selectedPage;
				      		    paging(totalData, dataPerPage, pageCount, selectedPage);
				      		    displayData(selectedPage, dataPerPage, totalData-(selectedPage-1)*dataPerPage);
				      		  });
				  		  
				  		}
			        </script>
                    <div id="section3" class="container-fluid">
                    	<table width="550" height="150" id="reviewList">
                    		<thead>
	                    		<tr>
	                    			<td><b>후기</b></td>
	                    		</tr>
                    		</thead>
                    		<tbody></tbody>
                    	</table>
                    	<div align="center">
			            	<ul id="paging">
							</ul>
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
                <form action="<%=contextPath %>/register.reg" id="classCalenderForm">
                	<input type="hidden" name="clNo" value="<%=le.getClNo() %>">
                	<input type="hidden" name="memNo" value="<%=loginUser.getMemNo() %>">
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
					        $(function(){
					            buildCalendar();
					        });
					    
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
					            document.getElementById("calMonth").innerText = today.getMonth() + 1;   // MM월
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
					            let calYear = document.getElementById("calYear").innerText.substr(0,4);
					            let calMonth = document.getElementById("calMonth").innerText.substr(-2)-1;
					            // 달력 출력
					            // 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
					            for(let day = 1 - doMonth.getDay(); day <= daysLength ; day++) {
					    			
					                let column = row.insertCell();
					    			let calDay = new Date(calYear, calMonth, day).getDay();
					    			switch(calDay){
					    			case 0 : calDay = "일"; break;
					    			case 1 : calDay = "월"; break;
					    			case 2 : calDay = "화"; break;
					    			case 3 : calDay = "수"; break;
					    			case 4 : calDay = "목"; break;
					    			case 5 : calDay = "금"; break;
					    			case 6 : calDay = "토"; break;
					    			}
					                // 평일( 전월일과 익월일의 데이터 제외 )
					                if(day > 0 && lastDate.getDate() >= day) {
					                    // 평일 날짜 데이터 삽입
					                    column.innerHTML = "<div>" + day + "</div>";
					    
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
					                        if(date.getDate() > day && day > 0) {
					                            column.style.color = "rgb(224, 224, 224)";
					                        }
					    
					                        // 현재일보다 이후이면서 현재월에 포함되는 일인경우
					                        else if(date.getDate() <= day && lastDate.getDate() >= day) {
					                            if(new Date(calYear, calMonth, day) >= startDate && new Date(calYear, calMonth, day) <= endDate && "<%=le.getClDay()%>".includes(calDay)){
					                            	column.firstChild.classList.add('possibleDay');
					                            	column.onclick = function(){ calendarChoiceDay(this,calYear, calMonth, day); }
					                            }
					                        }
					                    // 현재월보다 이전인경우
					                    } else if(today.getMonth() < date.getMonth()) {
					                        if(day > 0 && day <= lastDate.getDate()) {
					                            column.style.color = "rgb(224, 224, 224)";
					                        }
					                    }
					    
					                    // 현재월보다 이후인경우
					                    else {
					                        if(day > 0 && day <= lastDate.getDate()) {
					                        	if(new Date(calYear, calMonth, day) >= startDate && new Date(calYear, calMonth, day) <= endDate && "<%=le.getClDay()%>".includes(calDay)){
					                        		column.firstChild.classList.add('possibleDay');
					                            	column.onclick = function(){ calendarChoiceDay(this, calYear, calMonth, day); }
					                            }
					                        }
					                    }
					                }
					    
					                // 선택한년도가 현재년도보다 작은경우
					                else if(today.getFullYear() < date.getFullYear()) {
					                    if(day > 0 && day <= lastDate.getDate()) {
					                        column.style.color = "rgb(224, 224, 224)";
					                    }
					                }
					    
					                // 선택한년도가 현재년도보다 큰경우
					                else {
					                    if(day > 0 && day <= lastDate.getDate()) {
					                    	if(new Date(calYear, calMonth, day) >= startDate && new Date(calYear, calMonth, day) <= endDate && "<%=le.getClDay()%>".includes(calDay)){
					                    		column.firstChild.classList.add('possibleDay');
					                        	column.onclick = function(){ calendarChoiceDay(this, calYear, calMonth, day); }
					                    	}
					                    }
					                }
					                dom++;
					    
					            }
					        }
					    
					        // 날짜 선택
					        function calendarChoiceDay(column, calYear, calMonth, day) {
					    
					            // 기존 선택일의 표시형식 초기화
					            if(document.getElementsByClassName("choiceDay")[0]) {
					                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "lightgray";
					                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
					            }
					            // 선택일 체크 표시
					            column.firstChild.style.backgroundColor = "rgb(107, 155, 164)";
					            
					            // 선택일 클래스명 변경
					            column.firstChild.classList.add("choiceDay");
					            
					            $("#classDetail-date").css({width : "310", height: "80"})
					            
					            if(("" + calMonth + "").length == 1){
					            	calMonth = "0" + (calMonth+1);
					            }
					            if(("" + day + "").length == 1){
					            	day = "0" + day;
					            }
					            $.ajax({
					            	url:"<%=contextPath%>/getSchedule.cl",
					            	data:{
					            		clNo:<%=le.getClNo()%>,
					            		calYear:calYear,
					            		calMonth:calMonth,
					            		day:day
					            	},
					            	success:function(list){
					            		let value1 = "<table>";
					            		let value2 = "";
					            		for(let i=0; i<list.length; i++){
					            			value1 += "<tr>"
					            					+	"<td>"
					            					+		"<input type='radio' name='session' id='session" + i + "' value='"+ list[i].schNo + "'>"
					            					+		"<input type='hidden' value='" + list[i].regCount + "'>"
				            						+	"</td>"
					            					+	"<td>"
					            					+		"<label for='session" + i + "'>" + calYear + "년 " + calMonth + "월 " + day + "일<br>"
					            					+		list[i].startTime + " - " + list[i].endTime 
					            					+		" (" + list[i].regCount + "명/" + list[i].clMax + "명)</label>"
					            					+	"</td>"
					            					+ "</tr>"
					            		}
					            		value1 += "</table>"
					            				+ "<input type='hidden' name='selectDate' value='" + calYear + calMonth + day + "'>'"
				            			value2 += "<div>"
				            				+	"인원 선택&nbsp;&nbsp;&nbsp;"
				            				+	"<select name='people'>"
			            					+   "</select><br>"
				            				+	"<p>총 결제 금액  0원</p>"
				            				+ "</div>"
					            		
					            		$("#classDetail-date").html(value1);
					            		$("#classDetail-price").html(value2);
					            		
					            	},error:function(){
					            		
					            	}
					            })
					        }
					        $(document).on("change", "input[name=session]", function(){
					        	value2 = "<div>"
		            				+	"인원 선택&nbsp;&nbsp;&nbsp;"
		            				+	"<select name='people'>";
		            			for(let j=1; j<=<%=le.getClMax()%> - $(this).next().val(); j++){
		            				value2 += "<option value='" + j + "'>" + j + "명</option>"
		            			}
            					value2 +=   "</select><br>"
		            				+	"<p id='totalPrice'>총 결제 금액  "+ CommaFormat(<%=le.getClPrice()%>)+"원</p>"
		            				+ "</div>"
	            				$("#classDetail-price").html(value2);
					        })
					        
					        $(document).on("change", "select[name=people]", function(){
					        	$("#totalPrice").text("총 결제 금액  " + CommaFormat($(this).val() * <%=le.getClPrice()%>) + "원")
					        })
					        function CommaFormat(x) {
							  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							}
					    
					    </script>
                        <!-- 날짜 선택하면 나타나는 창 -->
                        <div id="classDetail-date">
                        </div>
                        <br>
                        <div id="classDetail-price">
                        </div>
                        <div>
                        	<% if(likeStatus == 0) {%>
                            	<a class="btn like-btn">🤍 찜하기</a> 
                            <%}else{ %>
                            	<a class="btn like-btn">❤️ 찜하기 해제</a>
                            <%} %>
                            <a href="" class="btn">💬 1:1문의</a>
                        </div>
                        <button class="btn">클래스 신청하기</button>
                    </div>
                </form>
                <br>
                
            </div>
        </div>
        
    </div>
    <script>
	   	$(function(){
   			$(".like-btn").click(function(){
   				<% if(loginUser != null){ %>
   					if($(this).text().includes("🤍")){
		   				$.ajax({
		   					url:"<%=contextPath%>/classLike.cl",
		   					data:{
		   						clNo:<%=le.getClNo()%>,
		   						memNo:<%=loginUser.getMemNo()%>
		   					},
		   					success:function(result){
		   						if(result > 0){
		   							$(".like-btn").text("❤️ 찜하기 해제");
		   						}
		   					},error:function(){
		   						
		   					}
		   				})
   					} else{
   						$.ajax({
   		   					url:"<%=contextPath%>/classDislike.cl",
   		   					data:{
   		   						clNo:<%=le.getClNo()%>,
   		   						memNo:<%=loginUser.getMemNo()%>
   		   					},
   		   					success:function(result){
   		   						if(result > 0){
   		   							$(".like-btn").text("🤍 찜하기");
   		   						}
   		   					},error:function(){
   		   						
   		   					}
   		   				})
   					}	
   				<%} else{%>
	   				$(this).attr("data-toggle", "modal");
	   				$(this).attr("data-target", "#myModal1");
   				<%}%>
	   		})
	   	})
	</script>
    <div class="modal" id="myModal1">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body" align="center">
                	로그인 후 이용 가능한 서비스 입니다.<br><br>
                    <a href="" type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white!important;">로그인</a>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
            	</div>  
        	</div>
    	</div>
   	</div>
    
    <br clear="both">
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>