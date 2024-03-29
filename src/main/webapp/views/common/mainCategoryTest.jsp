<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
     <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        #membership{width:25%;}
        #logo{width:15%; position:relative; cursor:pointer;}
    
        #header2{
            width: 350px;
            margin: 0px 20px;
        }
        #header2>div>input{
            margin-top: 20px;
        }
        
        #symbol *{
            vertical-align: middle;
            margin-top: 30px;
        }
        
        /* menubar 세부 스타일 */
        #membership>img{vertical-align:middle; cursor:pointer;}
        #membership>*{margin-left:20px; font-size:12px;}
        /* menubar-1 */
        #menubar-1>a{font-size:12px; margin:15px; line-height: 30px;}
        /* 로고 이미지, 검색창 공통스타일 */
        #logo img{
            margin:auto;
            position:absolute;
            top:0;
            bottom:0;
            left:0;
            right:0;
        }


        .ct-area *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            list-style-type: none;
            text-decoration: none;
            
        }
        .category{
            width: 200px; }
        .menu a:hover{ text-decoration: none;}

        .bookmark-lists{
            height: 100%;
            width: 100%;
     
        }
        
        .bookmark-lists>li>a{
            display: block;
            height: 35px;
            color: aliceblue;
            background-color: rgb(35, 104, 116);
            text-align: left;
            line-height: 35px;
            border-radius: 5px;   
            font-weight: 600;  
            font-size: 13px;
            padding: 0px 10px;
        }
        .bookmark-lists>li *{
        color: white;
       }

      
        .bookmark>ul>li{
            height: 30px;
            border: 0.5px solid rgba(214, 213, 213, 0.881);
            border-radius: 5px;
        
        }

        .bookmark>ul>li>a{
            display: block;
            color: black;
            height: 30px;
            text-align: left;
            line-height: 30px;
            font-weight: 500;
            font-size: 12px;
            padding: 0px 10px;
            
        }

        .bookmark span{
            float:right;
            line-height: 35px;
            font-size: 12px;
            
            
        }
        .submenu>li:hover{
            background-color: rgb(243, 242, 242)     
        }
        #symbol{  
            height: 100px;
            padding: 0px 10px
            
        
        }
        .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
    }
    .ct-area{height: 60px;
        display: inline-block;
    }



    /*검색*/
    #search-form{
        border: 1px solid rgb(206, 204, 204);
        border-radius: 5px;
        width: 600px;
        height: 380px;
        font-size: 13px;
        margin: auto;
        padding: 20px;
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
        color: rgb(92, 89, 89);

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
        width: 100%;
        height: 5px;
        border-radius: 5px;
        background: #a3a2a2;
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
.selectfrom{
    height: 300px;
}
#header{
    margin: auto;
}
.has-search input{
        width: 320px;
        height: 35px;
        border-radius: 5px;  
        border: 1px solid rgb(219, 217, 217);
        text-align: center;
    
    }

 #icon{
    position: absolute;
    right: 350px;
    top: 62px;
 }   
       
   
    </style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>


<style src="@vueform/slider/themes/default.css"></style>
<script>                
  
  $(document).ready(function() {

      //datepicker 한국어로 사용하기 위한 언어설정
      $.datepicker.setDefaults($.datepicker.regional['ko']);     
  
      // Datepicker            
      $(".datepicker").datepicker({
          showButtonPanel: true,
          dateFormat: "yy-mm-dd",
          onClose : function ( selectedDate ) {
          
              var eleId = $(this).attr("id");
              var optionName = "";

              if(eleId.indexOf("StartDate") > 0) {
                  eleId = eleId.replace("StartDate", "EndDate");
                  optionName = "minDate";
              } else {
                  eleId = eleId.replace("EndDate", "StartDate");
                  optionName = "maxDate";
              }

              $("#"+eleId).datepicker( "option", optionName, selectedDate );        
              $(".searchDate").find(".chkbox2").removeClass("on"); 
          }
      }); 

     

      $(".dateclick").dateclick();    // DateClick
      $(".searchDate").schDate();        // searchDate
      
  });

 
  // DateClick
  jQuery.fn.dateclick = function(){
      var $obj = $(this);
      $obj.click(function(){
          $(this).parent().find("input").focus();
      });
  }    

      
  </script>           

</head>
<body>

    <div class="wrap">
		<div id="menubar">
	        <div id="menubar-1">
	            <a href="">튜터센터</a>
	            <a href="">튜터등록</a>
	        </div>
	        <div id="menubar-2">
	            <div class="dropdown">  
                <div class="dropdown ct-area">
                <div id="symbol" style="width: 150px;">
                    <span  data-toggle="dropdown"> 
                        <img src="<%= contextPath %>/resources/images/list.png" alt="" height="20px" width="25px">
                        <label style="font-size: 13px;">전체 카테고리</label>
                    </span> 
                </div>
                <div class="category dropdown-menu ">
                
                        <ul class="bookmark-lists menu">
                            <li class="bookmark"><a href=""><label>교육</label>
                                <span class="material-symbols-outlined"> arrow_forward_ios</span>
                                </a>
                                <ul class="submenu">
                                    <li><a href="">외국어</a></li>
                                    <li><a href="">IT</a></li>
                                    <li><a href="">자격증</a></li>

                                </ul>
                            </li>
                            <li class="bookmark"><a href=""><label>공예 DIY</label>
                                <span class="material-symbols-outlined"> arrow_forward_ios</span>
                            </a>
                                <ul class="submenu">
                                    <li><a href="">가죽 / 라탄</a></li>
                                    <li><a href="">비누 / 꽃 / 향</a></li>
                                    <li><a href="">뜨개 / 자수 </a></li>
                                    <li><a href="">기타 </a></li>
                                </ul>
                            
                            </li>
                            <li class="bookmark"><a href=""><label>드로잉</label>
                                <span class="material-symbols-outlined"> arrow_forward_ios</span>
                            </a>
                                <ul class="submenu">
                                    <li><a href="">취미미술</a></li>
                                    <li><a href="">캘리그래피</a></li>
                                    <li><a href="">웹디자인 </a></li>
                                
                                </ul>
                            </li>
                            <li class="bookmark"><a href=""><label>쿠킹</label>
                                <span class="material-symbols-outlined"> arrow_forward_ios</span>
                            </a>
                                <ul class="submenu">
                                    <li><a href="">요리</a></li>
                                    <li><a href="">베이킹</a></li>
                                
                                </ul>
                            </li>
                            <li class="bookmark"><a href=""><label>스포츠/피트니스</label>
                                <span class="material-symbols-outlined"> arrow_forward_ios</span>
                            </a>
                                <ul class="submenu">
                                    <li><a href="">실내스포츠</a></li>
                                    <li><a href="">야외스포츠</a></li>
                                    <li><a href="">레저 / 액티비티 </a></li>
                                    <li><a href="">요가 / 필라테스 </a></li>
                                    <li><a href="">헬스 / PT </a></li>
                                </ul>
                            </li>
                        </ul>

                    </div>   
                    
                </div>   
                </div>
                  
	            <div id="logo">
	            	<a href="../common/tuteeMainPage.jsp">
	            		<img src="<%= contextPath %>/resources/images/logo.png" width="100%" height="50%">
	            	</a>
	            </div>

                <div id="header2">
                    <div data-toggle="dropdown">
                        <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요"  placeholder="Search">
                        <span id="icon"class="fa fa-search form-control-feedback"></span>
                    <div class="dropdown-menu selectform">
                        <div id="search-area" align="center">
                            <br>
                            <form action="" id="searchForm">  
                            <div class="form-group has-search">
                                <span class="fa fa-search form-control-feedback"></span>
                                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요"  placeholder="Search">
                            </div>
                            
                            <table id="select">
                               
                                <tr>
                                    <th>카테고리</th>
                                    <td>
                                        <select name="category" id="category">
                                        <option value="교육">교육</option>
                                        <option value="">공예 DIY</option>
                                        <option value="">베이킹</option>
                                        <option value="">쿠킹</option>
                                        <option value="">스포츠/피트니스</option>
                    
                                         </select>
                                         <select name="category_detail" id="category">
                                            <option value="교육">교육</option>
                                            <option value="">공예 DIY</option>
                                            <option value="">베이킹</option>
                                            <option value="">쿠킹</option>
                                            <option value="">스포츠/피트니스</option>
                        
                                             </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>지역</th>
                                    <td>
                                        <select name="region" id="region">
                                        <option value="서울">서울</option>
                                        <option value="">경기도</option>
                                        <option value="">인천</option>
                                        <option value=""></option>
                                         </select>
                    
                                         <select name="region" id="region" >
                                            <option value="서울">서울</option>
                                            <option value="">경기도</option>
                                            <option value="">인천</option>
                                            <option value=""></option>
                                             </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th height="30"width="100">날짜</th>
                                    <td>
                                        <div class="clearfix">
                                            <!-- 시작일 -->
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <!-- 종료일 -->
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" > 
                                                <span class="material-symbols-outlined"></span>
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div>    
                    
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th height="30"width="100">가격</th>
                                    <td>
                                    <div class="Container" >
                                                                 
                                        <input style = "width:100%;" class="slider_range slider" type="range"  min="0" max="200000" ></input>
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
                    
                            </table>
                            <br>
                            <div id="btn-area">
                                <button>&nbsp;검색&nbsp;</button>
                                <button type="reset">초기화</a>
                            </div>
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
                           
                        </form>
                        </div>
                       </div>
                       
                    </div>
                    </div>
                    <div id="membership" align="center">
                        <br>
                        <!-- 로그인 전 -->
                        <a href="<%=contextPath%>/login.me">로그인</a>
                        <a href="">회원가입</a>
        
                        <!-- 로그인 후 -->
                        <!-- <a href="">마이 클래스</a> -->
                        
                        <img src="<%=request.getContextPath()%>/resources/images/sampleimg.jpg" type="button" width="45"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
                        
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
                            <a class="dropdown-item" href="#">내가 찜한 목록</a>
                            <a class="dropdown-item" href="#">로그아웃</a>
                        </div>
                        
                    </div>
    
</body>
</html>