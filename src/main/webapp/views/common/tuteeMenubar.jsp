<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.member.model.vo.Member"%>
<% 
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : null
	// 로그인 후 : 로그인한 회원의 정보가 담겨있는 Member객체
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Font Awesome CSS -->
 <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

 <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
 <!-- datepicker 한국어로 -->
 <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>


 <style src="@vueform/slider/themes/default.css"></style>
<style>
    div, p, form, input{box-sizing:border-box;}
    #menubar a{text-decoration: none !important; color:black !important;}

    .wrap{width:1000px; height:120px; margin:auto;}
    #menubar{width:1000px; height:120px; background:white; z-index: 100; position: fixed;}

    /* menubar 전반적인 틀 */
    #menubar>div{width:100%;}
    #menubar-1{height:25%; background-color: rgb(247,247,247);}
    #menubar-2{height:75%;}
    
    #menubar-2>*{height:100%; float:left;}
    #category{width:20%; font-size:14px;}
    #logo{width:15%; position:relative; cursor:pointer;}
    #search{width:40%; position:relative;}
    #membership{width:25%;}

    /* menubar 세부 스타일 */

    /* menubar-1 */
    #menubar-1>a{font-size:12px; margin:15px; line-height: 30px;}

    /* menubar-2 */
    /* 로고 이미지, 검색창 공통스타일 */
    #search-form, #logo img{
        margin:auto;
        position:absolute;
        top:0;
        bottom:0;
        left:0;
        right:0;
    }
    /* 검색창 추가 스타일 */
    #search-form{
        width:80%; 
        height:40%; 
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
    }
    #search-form>div{height:100%; float:left;}
    #search-text{width:80%;}
    #search-btn{width:20%;}
    #search-form button, #search-form input{
        width:100%; 
        height:100%;
        box-sizing:border-box;
        border:none;
        background:none;
        cursor:pointer;
    }

    /* 카테고리, 멤버십 스타일 */
    #category{line-height:90px;}
    #category>img, #membership>img{vertical-align:middle; cursor:pointer;}
    #category>*{margin:5px; font-size:14px;}
    #membership>*{margin-left:15px; font-size:12px;}
    #membership>p{display:inline-block;}



    /*카테고리 영역*/
    .dropdown *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            list-style-type: none;
 
        }
      
        .category{width: 210px;
       }
      
     
        .bookmark-lists{
            height: 100%;
            width: 100%;
        }
        
        .bookmark-lists>li>a{
            display: block;
            height: 31px;
            background-color: rgb(35, 104, 116);
            text-align: left;
            line-height: 31px;
            border-radius: 5px;   
            font-weight: 600;  
            font-size: 13px;
            padding: 0px 10px;
            color: white;
        }

        .bookmark>ul>li{
            height: 30px;
            border: 0.01px solid rgba(238, 235, 235, 0.881);
            border-radius: 5px;
          
        }

        .bookmark>ul>li>a{
            display: block;
            height: 30px;
            text-align: left;
            line-height: 30px;
            font-weight: 500;
            font-size: 12px;
            padding: 0px 10px;
           
            
        }

        .bookmark span{
            float:right;
            line-height: 30px;
            font-size: 12px;
            
            
        }
        .submenu>li:hover{
            background-color: rgb(243, 242, 242)     
        }
        #symbol>span{  
            height: 45px;
            font-size: 14px;
        
        }
        .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
    }
       .bookmark-lists>li *{
        color: white;
       }

       .ct-area{height: 60px;
        display: inline-block;
    }
         #symbol{  
            height: 90px;
            padding: 0px 10px
            
        
        }
        #symbol *{
            vertical-align: middle;
            margin-top: 30px;
        }
        



    
   
    /*검색바*/
    #search-area{
            border: 1px solid rgb(206, 204, 204);
            border-radius: 5px;
            width: 600px;
            height: 380px;
            font-size: 13px;
            margin: auto;
            padding: 20px;
            display: none;
            
        }
       
        #select>tr{
            height: 20px;
        }

        .form-control{
            width: 300px;
        }    
        .fa{
            margin-left: 140px;
        }
        .has-search .form-control {
            padding-left: 2.375rem;
        }
 
        .has-search .form-control-feedback {
            position: absolute;
           
            z-index: 2;
            display: block;
            line-height: 2.375rem;
            text-align: center;
            pointer-events: none;
            color: #aaa;

        }

        #select th{
            text-align: right; 
        }

        #select td{ width: 400px; 
            padding: 8px 30px;
            }

        input[type="search"]{
            width: 300px;
            border: 1px solid rgb(202, 199, 199);
            height: 32px;
            border-radius: 5px;
        }
        .inpType{
            width: 120px;
            border: 1px solid rgb(202, 199, 199);
            height: 32px;
            border-radius: 5px;
        }

        input[type="date"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }


      
        select{
            width: 100px;
            border: 1px solid rgb(202, 199, 199);
            height: 32px;
            border-radius: 5px;
        }

        #btn-area button{
            width: 65px;
            height: 30px;
            border: none;
            color: white;
            background-color: rgb(192, 57, 43);
            padding: 6px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 550;
            line-height: 1px;
        }
        #btn-area button:hover{
            background-color: rgba(192, 58, 43, 0.685);
        }



        
        .slider {
            -webkit-appearance: none;
            width: 10px;
            height: 5px;
            border-radius: 5px;
            background: rgb(202, 195, 195);
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }
        .slider:hover {
            opacity: 1;
        }
        .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: rgb(35, 104, 116);
            cursor: pointer;
        }

        .slider::-moz-range-thumb {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: rgb(35, 104, 116);
            cursor: pointer;
        }

        #tickmarks {
        display: flex;
        justify-content: space-between;
        padding: 0 3px;
    }

    #tickmarks p {
        position: relative;
        display: flex;
        justify-content: center;
        text-align: center;
        width: 1px;
        background: #D3D3D3;
        height: 10px;
        line-height: 40px;
        margin: 0 0 1px 0;
        font-size: 10px;
    }
    #slider-value{
       text-align: center;
    }
    .has-search input{
        width: 320px;
        height: 35px;
        border-radius: 5px;  
        border: 1px solid rgb(219, 217, 217);
        text-align: center;
    
    }

        .schedule{display: none; margin: 10pt;}
       
        .schedule+label{
            display: inline-block;
            cursor: pointer;
            padding: 4px 10px;
            text-align: center;
            font-size: 13px;
            border-radius: 5px;
            background-color: gray;
            color: white;
           
            
        }
        .schedule:checked+label{
            background-color: rgb(35, 104, 116);
        }
		.schedule+label:hover{
            background-color: rgb(35, 104, 116);
        }
 
 
    </style>
       


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	<div class="wrap">
		<div id="menubar">
	        <div id="menubar-1">
	        	<% if(loginUser == null) {%>
	                <!--로그인전-->
	                <a href="<%=contextPath%>/login.me">튜터센터</a>
                <% }else { %>
	                <!--로그인후-->
	                <%if(loginUser.getGrade().equals("2") ){%>
		            <a href="<%=contextPath%>/tutorMain.tt">튜터센터</a>
		            <%}else { %>
		            <a href="<%=contextPath%>/enrollForm.tt">튜터등록</a>
		            <%} %>
	            <%} %>
	        </div>
	        <div id="menubar-2">
                <div class="dropdown">  
                    <div class="dropdown ct-area">
                    <div id="symbol" style="width: 150px;">
                        <span  data-toggle="dropdown"> 
                            <img src="<%= contextPath %>/resources/images/list.png" height="20px" width="25px">
                            <label style="font-size: 13px;">전체 카테고리</label>
                        </span> 
                    </div>
                    <div class="category dropdown-menu ">
                    
                            <ul class="bookmark-lists menu">
                                <li class="bookmark"><a><label>교육</label>
                                    <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                    </a>
                                    <ul class="submenu">
                                        <li><a>외국어</a></li>
                                        <li><a>IT</a></li>
                                        <li><a>자격증</a></li>
    
                                    </ul>
                                </li>
                                <li class="bookmark"><a><label>공예DIY</label>
                                    <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                </a>
                                    <ul class="submenu">
                                        <li><a>가죽/라탄</a></li>
                                        <li><a>비누/꽃/향</a></li>
                                        <li><a>뜨개/자수</a></li>
                                        <li><a>기타</a></li>
                                    </ul>
                                
                                </li>
                                <li class="bookmark"><a><label>드로잉</label>
                                    <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                </a>
                                    <ul class="submenu">
                                        <li><a>취미미술</a></li>
                                        <li><a>캘리그래피</a></li>
                                    
                                    
                                    </ul>
                                </li>
                                <li class="bookmark"><a><label>쿠킹</label>
                                    <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                </a>
                                    <ul class="submenu">
                                        <li><a>요리</a></li>
                                        <li><a>베이킹</a></li>
                                    
                                    </ul>
                                </li>
                                <li class="bookmark"><a><label>스포츠/피트니스</label>
                                    <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                </a>
                                    <ul class="submenu">
                                        <li><a>실내스포츠</a></li>
                                        <li><a>야외스포츠</a></li>
                                        <li><a>레저/액티비티</a></li>
                                        <li><a>요가 필라테스/ 헬스 PT</a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
    
                        </div>   
                        
                    </div>   
                    </div>
                    
             	<script>
		        	$(function(){
		        		$(".bookmark a").click(function(){
		        			location.href="<%=contextPath%>/ctselect.cl?cpage=1&ct="+ $(this).children().eq(0).text();
		        			
		        		})
		        	})
		        	
		        	$(function(){
		        		$(".submenu>li a").click(function(){
		        			location.href="<%=contextPath%>/dctselect.cl?cpage=1&dct="+ $(this).eq(0).text()
		        			
		        		})
		        	})
		        </script>

                
                
	            <div id="logo">
	            	<a href="<%=contextPath%>/main.tee">
	            		<img src="<%= contextPath %>/resources/images/logo.png" width="100%" height="50%">
	            	</a>
	            </div>
	            <div id="search">
	                <form action="<%=contextPath %>/keyword.cl" id="search-form" method="get">
	                		<input type="hidden" name="cpage" value="1">
	                        <div id="search-text"  >
	                            <input type="search" name="keyword" placeholder="&nbsp;검색어를 입력하세요">
	                        </div>

	                        <div id="search-btn">
	                            <button type="submit"><img src="<%= contextPath %>/resources/images/search.png" height="25px" width="25px"></button>
	                        </div>
	                </form>


                    <script>
                        $(function(){
                            $("#search-text").click(function(){
                                  $("#search-area").show();
                             
                            })

                            document.addEventListener('mouseup', function(e){
                            var search = document.getElementById('search-area');
                            if(!search.contains(e.target)){
                                search.style.display = 'none';
                            }

                        }
                
                        )
                        })
                    </script>
	            </div>
         
	            <div id="membership" align="center">
	            	<br>
	                <!-- 로그인 전 -->
	                <%if(loginUser == null) {%>
		                <a href="<%=contextPath%>/login.me">로그인</a>
		                <a href="<%=contextPath%>/enrollForm.me">회원가입</a>
					<%}else{ %>
		                <!-- 로그인 후 -->
		                <a href="<%=contextPath%>/myClassList.reg">마이클래스</a>
		                <p><%=loginUser.getMemNick()%>님</p> 
		                <%if(loginUser.getMemProfile() == null) {%>
		                	<img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" type="button" width="45"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
		                <%} else {%>
							<img src="<%=contextPath%><%=loginUser.getMemProfile()%>" type="button" width="45"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
						<%} %>
						<div class="dropdown-menu">
						    <a class="dropdown-item" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
						    <a class="dropdown-item" href="#">내가 찜한 목록</a>
						    <a class="dropdown-item" href="<%=contextPath%>/logout.me">로그아웃</a>
						</div>
	                <%} %>
	            </div>
	        </div>
		</div>
    </div>
    
    <div id="search-area" align="center">
        <br>
        <form action="<%=contextPath %>" id="searchForm">  
        <div class="form-group has-search">
            <span class="fa fa-search form-control-feedback"></span>
            <input type="search" class="form-control" name="keyword" placeholder="검색어를 입력하세요"  placeholder="Search">
        </div>
        
        <table id="select">
           
            <tr>
                <th>카테고리</th>
                <td>
                    <select name="category" id="ct" onchange="changeCt();">
                    <option value="00">전체</option>   
                    <option value="11">교육</option>
                    <option value="22">공예 DIY</option>
                    <option value="33">드로잉</option>
                    <option value="44">쿠킹</option>
                    <option value="55">스포츠/피트니스</option>

                     </select>
                     <select name="category_detail" id="dct">
                    
                    </select>
                    
                    
                    <script>
                        function changeCt(){
                        	var study = ["외국어","자격증","IT"];
                        	var diy = ["가죽/라탄","비누/꽃/향","뜨개/자수","기타"];
                        	var draw = ["취미미술","캘리그래피"];
                        	var cook = ["요리","베이킹"];
                        	var sport = ["실내스포츠","야외스포츠","레저/액티비티","요가필라테스/헬스PT"];
     	
                        	var changeDct;
                        	
                        	if( $("#ct").val() == "11"){
                        		changeDct = study;
                        		
                        	}else if( $("#ct").val() == "22"){
                        		changeDct = diy;
                        	}else if( $("#ct").val() == "33"){
                        		changeDct = draw;

                        	}else if( $("#ct").val()  == "44"){
                        		changeDct = cook;
                        	}else if( $("#ct").val() == "55"){
                        		changeDct = sport;
                        	}
                        	
                        	$("#dct").empty();
                        	for(var i=0; i<changeDct.length; i++){
                        		var option = $("<option>"+changeDct[i]+"</option>");
                        		$("#dct").append(option);
                        	}
                        	
                        }
                        
                        </script>
                    
                    
                </td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
                    <select name="sido "id="region" onchange="sidoChange();">
                    <option value="10">서울</option>
                    <option value="20">인천</option>
                    <option value="30">경기</option>
                    
                     </select>

                </td>
 
            </tr>

            
            <tr>
                <th height="30"width="100">요일</th>
                <td>
                     <div class="clearfix">
                    
                         <input type="checkbox" class="schedule" name="weekday" id="weekday"><label for="weekday">평일</label>
                         <input type="checkbox" class="schedule" name="sat" id="sat"><label for="sat">토요일</label>
                         <input type="checkbox" class="schedule" name="sun" id="sun"><label for="sun">일요일</label>
                    
                        <!--   시작일 
                            <input type="date"  name="searchStartDate" id="startDate" >
                          종료일 
                            <input type="date"  name="searchEndDate" id="endDate" > 
                        --> 
                    </div>    
                </td>
              <!-- <script>
                    var now_utc = Date.now()
                    var timeOff = new Date().getTimezoneOffset()*60000;
                    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
                    document.getElementById("startDate").setAttribute("min", today);
                    document.getElementById("endDate").setAttribute("min", today);
                    
                    
                    </script>
                -->
            </tr>
            <tr>
                <th height="30"width="100">가격</th>
                <td>
                <div class="Container" >
                                             
                    <input style = "width:100%" class="slider_range slider" type="range"  min="0" max="200000" ></input>
                    <div id="tickmarks">
                        <p>0</p>
                        <p></p>
                        <p></p>
                        <p>100,000</p>
                        <p></p>
                        <p></p>
                        <p>200,000</p>
                    </div>
                   <br>
                   <div id="slider-value">
                    <font size = 2 id = "slider_value_view"></font>		
                     </div>				  
                  </div>
                </td>
            </tr>
            <tr>
            <td colspan="2" align="center" style="width: 400px;">
            <div id="btn-area" style="display: inline;">
                <button>&nbsp;검색&nbsp;</button>
                <button type="reset">초기화</button>
            </div>
            </td>
             </tr>
        </table>
        <br>
        
        <script language = "javascript">
              
            function ShowSliderValue(sVal)
            {
                var obValueView = document.getElementById("slider_value_view");
                obValueView.innerHTML = sVal
            }
            
            var RangeSlider = function(){
                var range = $('.slider_range');
                
                range.on('input', function(){		
                    ShowSliderValue(this.value);
                });
            };
            
            RangeSlider();
            
            
          </script>
          
            <script>
         	function sidoChange(){
         	var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
         	var incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
         	var gyeonggi= ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
         	

         	var change;
         	
         	if( $("#region").val() == "10"){
         		change = seoul;
         		
         	}else if( $("#region").val() == "20"){
         		change = incheon;
         	}else if( $("#region").val() == "30"){
         		change = gyeonggi;

         	}
         	$("#district").empty();
         	for(var i=0; i<change.length; i++){
         		var option = $("<option>"+change[i]+"</option>");
         		$("#district").append(option);
         	}
         	
         }
        
         
         </script>   
       
  
    </form>
    </div>

</body>
</html>
  