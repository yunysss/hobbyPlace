<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.lesson.model.vo.*" %>
<%
	ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("catList");
	ArrayList<Dcategory> dList = (ArrayList<Dcategory>)request.getAttribute("dcList");
	ArrayList<District> lList = (ArrayList<District>)request.getAttribute("lList");
    ArrayList<District> disList = (ArrayList<District>)request.getAttribute("disList");
    ArrayList<Lesson> ch1List = (ArrayList<Lesson>)request.getAttribute("ch1List");
    ArrayList<Lesson> ch2List = (ArrayList<Lesson>)request.getAttribute("ch2List");
    ArrayList<Lesson> ch3List = (ArrayList<Lesson>)request.getAttribute("ch3List");
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
     padding:8px;
    }
    #statSearch-btn{
     width:60px;
     margin:0px 5px;
     background:rgb(22, 160, 133); 
     color:white;
    }
    #statSearchAll-btn{
     width:80px;
     background:rgb(22, 160, 133); 
     color:white!important;
    }
    thead td{
     background:rgb(245, 245, 245);
    }
    #statClass-list>tbody>tr{
    	cursor:pointer;
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
	    color: white!important;
	}
	#menu2>table{
		margin-top:70px;
		margin-left:auto;
	}
	#menu2 td{
		vertical-align : top;
		padding-right:100px;
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
			  	<table width="700px">
	                <tbody>
	                	<tr>
	                		<td width="150px"><b>검색어</b></td>
	                		<td width="100px">
	                			<select name="keywordType">
	                				<option value="clName">클래스명</option>
	                				<option value="ttName">튜터명</option>
	                            </select>
	                        </td>
	                        <td width="100px">
	                            <input type="text" name="keyword" size="18">
	                        </td>
	                	</tr>
	                	<tr>
	                    	<td><b>카테고리</b></td>
	                    	<td>
	                    		<select name="category" onchange="changeCt(this.value);">
	                    			<option value="all">전체</option>
	                    			<% for(Category c:cList){ %>
	                    				<option value = "<%=c.getCtNo() %>"><%=c.getCtName() %></option>
	                    			<% } %>
	                            </select>
	                    	</td>
	                    	<td>
	                    		<select name="dCategory">
	                    			<option value="all">전체</option>
	                    		</select>
	                    	</td>
	                    </tr>
	                    <tr>
	                        <td><b>지역</b></td>
	                        <td>
	                            <select name="location" onchange="changeLocal(this.value);">
	                            	<option value="all">전체</option>
	                            	
	                            	<% for(District l:lList){ %>
	                    				<option value = "<%=l.getLocalCode() %>"><%=l.getDistrName() %></option>
	                    			<% } %>
	                            </select>
	                        </td>
	                        <td>
	                            <select name="district">
	                            	<option value="all">전체</option>
	                            </select>
	                        </td>
	                        
	                    </tr>
	                    <tr>
	                    	<td><b>기타 필터링</b></td>
	                    	<td>
	                    		<select name="filtering">
	                    			<option value="all">전체</option>
	                    			<option value="likeCount">찜</option>
	                    			<option value="reviewCount">후기</option>
	                    			<option value="starAvg">별점</option>
	                    			<option value="memberSum">누적수강생</option>
	                    			<option value="priceSum">누적매출</option>
	                    		</select>
	                    	</td>
	                    	<td>
	                    		<select name="order">
	                    			<option value="0">높은순</option>
	                    			<option value="1">낮은순</option>
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
	                        <td colspan="2">
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
           	    <a href="<%=contextPath %>/statistics.ad" class="btn btn-sm" id="statSearchAll-btn">전체조회</a>
            	<button type="button" class="btn btn-sm" id="statSearch-btn" onclick="selectStat();">조회</button>
                <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
            </div>
		  </div>
		  <script>   
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
				$("select").each(function(){
					$(this).children().removeAttr("selected");
				})
				$("select[name='dCategory']").html("<option value='all'>전체</option>");
				$("select[name='district']").html("<option value='all'>전체</option>");
			}
		  	function changeCt(a){
		  		$("select[name='dCategory']").html("");
		  		let value = "<option value='all'>전체</option>";
		  		<%for(Dcategory d:dList){%>
		  			if(a == <%=d.getCtNo()%>){
		  				value += "<option value='" + <%=d.getCtDno()%> + "'>" + "<%=d.getCtDname()%>" + "</option>"
		  			}
		  		<%}%>
		  		$("select[name='dCategory']").html(value)
		  	}
		  	function changeLocal(a){
		  		$("select[name='district']").html("");
		  		let value = "<option value='all'>전체</option>";
		  		<%for(District dis:disList){%>
		  			if(a == <%=dis.getLocalCode()%>){
		  				value += "<option value='" + <%=dis.getDistrCode()%> + "'>" + "<%=dis.getDistrName()%>" + "</option>"
		  			}
		  		<%}%>
		  		$("select[name='district']").html(value)
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

           <table width="100%" class="table" id="statClass-list" >
               <thead>
                   <tr>
                       <td>클래스번호</td>
                       <td width="150px">클래스명</td>
                       <td>튜터명</td>
                       <td>찜</td>
                       <td>후기</td>
                       <td>별점</td>
                       <td>누적수강생</td>
                       <td>누적매출</td>
                       <td>등록일</td>
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
		<script>
	        let totalData; 
		    let dataPerPage=10; 
		    let pageCount = 10; 
		    let globalCurrentPage=1;
		    let dataList; 
		
		    $(function () {
			     selectStat();
		    })
	        function selectStat(){
	    		$.ajax({
	    			url:"<%=contextPath%>/search.stat",
	    			data:{
	    				keywordType:$("select[name=keywordType]").val(),
	    				keyword:$("input[name=keyword]").val(),
	    				category:$("select[name=category]").val(),
	    				dCategory:$("select[name=dCategory]").val(),
	    				location:$("select[name=location]").val(),
	    				district:$("select[name=district]").val(),
	    				filtering:$("select[name=filtering]").val(),
	    				order:$("select[name=order]").val(),
	    				startDate:$("#searchStartDate").val(),
	    				endDate:$("#searchEndDate").val()
	    			},
	    			success:function(list){
	    				if(list.length == 0){
	    					let value = "<tr>"
	    						+	"<td colspan='8'>조회된 내역이 없습니다.</td>"
	    						+ "</tr>"
	    					$("#statClass-list tbody").html(value);
	    					$("#paging").html("");
	    				} else{
	    	 		    	   totalData = list.length;
	    	 		           dataList=list;
	    	 		           displayData(1, dataPerPage, totalData);
	    	 		           paging(totalData, dataPerPage, pageCount, 1);
	    				}
	    			},error:function(){
	    				console.log("ajax 통신실패");
	    			}
	    		})
	    	}
		    function displayData(currentPage, dataPerPage, totalData) {
		    	  let value = "";
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
							+ "<td>" + dataList[i].clNo + "</td>"
							+ "<td>" + dataList[i].clName + "</td>"
							+ "<td>" + dataList[i].tutorProfile + "</td>"
							+ "<td>" + dataList[i].likeCount + "</td>"
							+ "<td>" + dataList[i].reviewCount + "</td>"
							+ "<td>" + dataList[i].clStarAvg + "</td>"
							+ "<td>" + dataList[i].studentSum + "</td>"
							+ "<td>" + dataList[i].priceSum + "</td>"
							+ "<td>" + dataList[i].clDay + "</td>"
							+ "<tr>"
					}
		    	  $("#statClass-list tbody").html(value);
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
	  		$(document).on("click", "#statClass-list>tbody>tr", function(){
	  			location.href="<%=contextPath%>/cldetail.ad?no=" + $(this).children().eq(0).text();
	  		})
        </script>		  
		  
		  
		  
		  <div class="tab-pane container fade" id="menu2">
		  	<table>
		  		<tr>
		  			<td>
		  				<b>최근 3개월간 수강, 찜, 리뷰 추이</b><br><br>
		  				<canvas id="myChart1" style="width:460px; height:270px;"></canvas>
		  			</td>
		  			<td>
		  				<b>지역별 누적 매출 분포 (상위 5개 지역)</b><br><br>
		  				<canvas id="myChart2"></canvas>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<br><b>카테고리별 누적 매출 분포</b><br><br>
		  				<canvas id="myChart3" style="width:460px; height:300px"></canvas>
		  			</td>
		  			<td></td>
		  		</tr>
		  	</table>
		  </div>
		  <script>
		  	let regCount = [];
		  	let likeCount = [];
		  	let reviewCount = [];
		  	let districtList = [];
		  	let districtSales = [];
		  	let today = new Date();
		  	let lastMonth = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate()).getMonth() + 1;
		  	let lastlastMonth = new Date(today.getFullYear(), today.getMonth() - 2, today.getDate()).getMonth() + 1;
		  	let catList = [];
		  	let catSales = [];
		  	$(function(){
			  	<%for(int i=0; i<ch1List.size(); i++){%>
			  		regCount.push(<%=ch1List.get(i).getStudentSum()%>);
			  		likeCount.push(<%=ch1List.get(i).getLikeCount()%>);
			  		reviewCount.push(<%=ch1List.get(i).getReviewCount()%>);
			  	<% }%>
			  	<%for(int i=0; i<ch2List.size(); i++){%>
			  		districtList.push("<%=ch2List.get(i).getDistrCode()%>");
			  		districtSales.push(<%=ch2List.get(i).getClPrice()%>);
			  	<% }%>
			  	<% for(int i=0; i<ch3List.size(); i++){%>
			  		catList.push("<%=ch3List.get(i).getDistrCode()%>");
			  		catSales.push(<%=ch3List.get(i).getClPrice()%>)
			  	<% }%>
		  	})
            var context = document
                .getElementById('myChart1')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [lastlastMonth + '월', lastMonth + '월', (today.getMonth() + 1) + '월'],
                    datasets: [ 
                        { //데이터
                            label: '수강수', //차트 제목
                            lineTension:0,
                            data: regCount,
                            fill: false,
                            borderColor: 'rgba(255, 99, 132)'
                        },{
                        	label: '찜수',
                        	lineTension:0,
                        	data: likeCount,
                        	fill: false,
                        	borderColor: 'rgba(54, 162, 235)'
                        },{
                        	label: '리뷰수',
                        	lineTension:0,
                        	data: reviewCount,
                        	fill: false,
                        	borderColor: 'rgba(255, 206, 86)'
                        }]
                },
                options:{
                	scales:{
                		yAxes:[{
                			ticks:{
                				beginAtZero:true
                			}
                		}]
                	}
                }
            });
            var context2 = document.getElementById('myChart2').getContext('2d');
	        var myChart = new Chart(context2, {
	        	type:'pie',
	        	data:{
	        		labels:districtList,
	        		datasets:[{
	        			data:districtSales,
	        			backgroundColor:['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',  'rgba(153, 102, 255, 0.2)']
	        		}]
	        	}
	        })
	        var context3 = document.getElementById('myChart3').getContext('2d');
	        var myChart = new Chart(context3, {
	            type: 'bar', // 차트의 형태
	            data: { // 차트에 들어갈 데이터
	                labels:catList,
	                datasets: [
	                    { //데이터
	                        label: '원', //차트 제목
	                        data: catSales,
	                        backgroundColor: 'rgba(255, 99, 132, 0.2)'
	                    }
	                ]
	            }
	        });
        </script>
		</div>
	</div>
</body>
</html>