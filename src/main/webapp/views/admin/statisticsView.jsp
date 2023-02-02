<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.lesson.model.vo.*" %>
<%
	ArrayList<Category> cList = (ArrayList<Category>)session.getAttribute("cList");
	ArrayList<Dcategory> dList = (ArrayList<Dcategory>)session.getAttribute("dList");
	ArrayList<District> lList = (ArrayList<District>)session.getAttribute("lList");
    ArrayList<District> disList = (ArrayList<District>)session.getAttribute("disList");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div, p, form, input, table{box-sizing:border-box;}
    .outer{width:1000px; margin:auto; padding:20px 50px;}
    .outer a{text-decoration: none !important; color:black!important}
    .outer>*{
    	font-size:small;
    }
    #statSearch, #statResult{
     border:1px solid rgb(180, 180, 180); 
     border-radius:5px;
     margin-top:20px;
     padding:20px;
    }
    #statResult td{
     text-align: center;
     vertical-align: middle;
     font-size:12px;
    }
    #statSearch td{
     padding:5px;
    }
    #statSearch-btn{
     width:60px;
     margin:0px 5px;
     background:rgb(22, 160, 133); 
     color:white;
    }
    thead td{
     background:rgb(245, 245, 245);
    }
    select{
     width: 150px;
     border: 1px solid rgb(202, 199, 199);
     height: 32px;
     border-radius: 5px;
    }
    input[type=text]{
           width: 150px;
           border: 1px solid rgb(202, 199, 199);
           height: 30px;
           border-radius: 5px;
   }
   input[name=dateType]{display: none; margin: 10px;}
   input[name=dateType]+label{
        display: inline-block;
        cursor: pointer;
        padding: 5px 8px;
        text-align: center;
        font-size: 12px;
        border-radius: 5px;
        background-color: rgb(101, 99, 99);
        color: white;
        line-height: 16px;
    }
    input[type=text]{
            width: 150px;
            border: 1px solid rgb(202, 199, 199);
            height: 30px;
            border-radius: 5px;
    }
    input[name=dateType]:checked+label, input[name=dateType]:hover+label{
        background-color: rgb(22, 160, 133);
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
	    color: white;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
    	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#menu1" style="font-weight: 600; font-size: 15px;">리스트로 보기</a>
		  </li>
		  <li class="nav-item">	
		    <a class="nav-link" data-toggle="tab" href="#menu2" style="font-weight: 600; font-size: 15px;">차트로 보기</a>
		  </li>
		</ul>
		<div class="tab-content">
		  <div class="tab-pane container active" id="menu1">
		  	<div id="statSearch">
			  	<table width="750px">
	                <tbody>
	                	<tr>
	                		<td><b>검색어</b></td>
	                		<td width="150px;">
	                			<select name="keyword">
	                				<option value="clName">클래스명</option>
	                				<option value="ttName">튜터명</option>
	                            </select>
	                        </td>
	                        <td width="180px;">
	                            <input type="text" name="keyword" size="18">
	                        </td>
	                	</tr>
	                	<tr>
	                    	<td><b>카테고리</b></td>
	                    	<td>
	                    		<select name="category">
	                            </select>
	                    	</td>
	                    	<td>
	                    		<select name="dCategory">
	                    		</select>
	                    	</td>
	                    </tr>
	                    <tr>
	                        <td><b>지역</b></td>
	                        <td>
	                            <select name="location">
	                            </select>
	                        </td>
	                        <td>
	                            <select name="district">
	                            </select>
	                        </td>
	                        
	                    </tr>
	                    <tr>
	                    	<td><b>기타 필터링</b></td>
	                    	<td>
	                    		<select name="filtering">
	                    			<option value="likeCount">찜</option>
	                    			<option value="reviewCount">후기</option>
	                    			<option value="memberCount">누적수강생</option>
	                    		</select>
	                    	</td>
	                    	<td>
	                    		<select name="orderF">
	                    			<option value="desc">많은순</option>
	                    			<option value="asc">적은순</option>
	                    		</select>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<td><b>가격</b></td>
	                    	<td colspan="2"><input type="range" name="price"></td>
	                    	<td>
	                    		<select name="orderP">
	                    			<option value="desc">높은순</option>
	                    			<option value="asc">낮은순</option>
	                    		</select>
	                    	</td>
	                    </tr>
	                    <tr>
	                        <td><b>조회 기간</b></td>
	                        <td colspan="2">
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
	                                    <a href="#none" class="btncalendar dateclick"></a>
	                                </span>
	                            </div>
	                        </td>
	                        <td>
	                        	<select name="orderD">
	                    			<option value="desc">최신순</option>
	                    			<option value="asc">오래된순</option>
	                    		</select>
	                        </td>
	                    </tr>
	                   	<tr>
	                   		<td></td>
	                        <td colspan="2" align="center">
	                            <div class="searchDate">
	                                <span class="chkbox2">
	                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
	                                    <label for="dateType1">&nbsp;오늘&nbsp;</label>
	                                 </span>
	                                 <span class="chkbox2">
	                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
	                                    <label for="dateType5">1개월</label>
	                                 </span>
	                                 <span class="chkbox2">
	                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
	                                    <label for="dateType6">3개월</label>
	                                 </span>
	                                 <span class="chkbox2">
	                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
	                                    <label for="dateType7">6개월</label>
	                                 </span>
	                                </div>  
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
            <br>
            <div align="center">
            	<button type="button" class="btn btn-sm" id="statSearch-btn" onclick="selectRefundMng();">조회</button>
                <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
            </div>
		  </div>
		  <script>
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
			}            
			
		    $(function() {
		
		        $.datepicker.setDefaults($.datepicker.regional['ko']);     
		    
		        $(".datepicker").datepicker({
		            showButtonPanel: true,
		            dateFormat: "yy-mm-dd",
		            onClose : function ( selectedDate ) {
		            
		                let eleId = $(this).attr("id");
		                let optionName = "";
		
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
		        $(".dateclick").dateclick();    
		        $(".searchDate").schDate();        
		    });
		
		    jQuery.fn.schDate = function(){
		        let $obj = $(this);
		        let $chk = $obj.find("input[type=radio]");
		        $chk.click(function(){                
		            $('input:not(:checked)').parent(".chkbox2").removeClass("on");
		            $('input:checked').parent(".chkbox2").addClass("on");                    
		        });
		    };
		
		    jQuery.fn.dateclick = function(){
		        let $obj = $(this);
		        $obj.click(function(){
		            $(this).parent().find("input").focus();
		        });
		    }    
		
		    
		    function setSearchDate(start){
		
		        let num = start.substring(0,1);
		        let str = start.substring(1,2);
		
		        let today = new Date();
		        
		        let endDate = $.datepicker.formatDate('yy-mm-dd', today);
		        $('#searchEndDate').val(endDate);
		        
		        if(str == 'd'){
		            today.setDate(today.getDate() - num);
		        }else if (str == 'w'){
		            today.setDate(today.getDate() - (num*7));
		        }else if (str == 'm'){
		            today.setMonth(today.getMonth() - num);
		            today.setDate(today.getDate() + 1);
		        }
		
		        let startDate = $.datepicker.formatDate('yy-mm-dd', today);
		        $('#searchStartDate').val(startDate);   
		        
		        $("#searchEndDate").datepicker( "option", "minDate", startDate );
		        
		        $("#searchStartDate").datepicker( "option", "maxDate", endDate );
		    }
        </script>
       	<br>
       	<div id="statResult">
           	<b>조회 결과</b><br>
           <br>

           <table width="100%" class="table" id="refMng-list" >
               <thead>
                   <tr>
                       <td>클래스번호</td>
                       <td>대분류</td>
                       <td>소분류</td>
                       <td>클래스명</td>
                       <td>튜터명</td>
                       <td>찜</td>
                       <td>후기</td>
                       <td>누적 수강생</td>
                       <td>수강료</td>
                       <td>클래스 등록일</td>
                   </tr>
               </thead>
           	<tbody>
               </tbody>
           </table>
           <div align="center">
           	<ul id="paging">
			</ul>
           </div>
        </div>
      </div>
		  
		  <div class="tab-pane container fade" id="menu2">
		  	
		  </div>
		</div>
    </div>
</body>
</html>