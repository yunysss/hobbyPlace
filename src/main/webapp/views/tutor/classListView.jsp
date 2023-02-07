<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.hp.common.model.vo.PageInfo, com.hp.lesson.model.vo.*"  %>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");	
	int memNo = (int)request.getAttribute("no");
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
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

        //시작일.
        /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
            // 시작일 datepicker가 닫힐때
            // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
        */

        //종료일.
        /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
            // 종료일 datepicker가 닫힐때
            // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
        */

        $(".dateclick").dateclick();    // DateClick
        $(".searchDate").schDate();        // searchDate
        
    });

    // Search Date
    jQuery.fn.schDate = function(){
        var $obj = $(this);
        var $chk = $obj.find("input[type=radio]");
        $chk.click(function(){                
            $('input:not(:checked)').parent(".chkbox2").removeClass("on");
            $('input:checked').parent(".chkbox2").addClass("on");                    
        });
    };

    // DateClick
    jQuery.fn.dateclick = function(){
        var $obj = $(this);
        $obj.click(function(){
            $(this).parent().find("input").focus();
        });
    }    

    
    function setSearchDate(start){

        var num = start.substring(0,1);
        var str = start.substring(1,2);

        var today = new Date();

        //var year = today.getFullYear();
        //var month = today.getMonth() + 1;
        //var day = today.getDate();
        
        var endDate = $.datepicker.formatDate('yy-mm-dd', today);
        $('#searchEndDate').val(endDate);
        
        if(str == 'd'){
            today.setDate(today.getDate() - num);
        }else if (str == 'w'){
            today.setDate(today.getDate() - (num*7));
        }else if (str == 'm'){
            today.setMonth(today.getMonth() - num);
            today.setDate(today.getDate() + 1);
        }

        var startDate = $.datepicker.formatDate('yy-mm-dd', today);
        $('#searchStartDate').val(startDate);
                
        // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
        $("#searchEndDate").datepicker( "option", "minDate", startDate );
        
        // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
        $("#searchStartDate").datepicker( "option", "maxDate", endDate );

    }

        
    </script>           

<title>Insert title here</title>
<style>
 #content2{
            width: 1000px;
        }

        .outer{
            padding: 30px 50px;

        }
        .outer>*{
            font-size: small;
        }
        #class-select input{
            margin: 5px 5px;
           
        } 
        #class-select input[type="checkbox"]+label{
        margin-right: 10px;
       
    } 
        #class-select>tr{
           margin: 10px;
        }

        input[type=radio]{display: none; margin: 10pt;}
        input[type=radio]+label{
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
        input[type=radio]:checked+label{
            background-color: rgb(22, 160, 133);
        }
        input[type=radio]:hover+label{
            background-color: rgb(22, 160, 133);
        }

        .clearfix{display: inline-block;}
        .searchDate{display: inline;}

	



        /*테이블*/
        #table-area{
            text-align:center;
            cursor: pointer;
        }
        input[type="text"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        
    }
        input[type="search"]{
        width: 330px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    
        #class-select{margin-left: 30px;}
        
        
        
        .paging-area{
        text-align: center;
    }
    	.paging-area>*{
        border: none;
        border-radius: 3px;

    }
  	 #clTable{
  	  	font-size: 12px;
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
	    padding: 5px 9px;
	    box-sizing: border-box;
		text-decoration-line:none;
	}
	
	#paging li.on {
	    background: rgb(234, 234, 234);
	}
	
	#paging li.on a {
	    color: black;
	}
 

</style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>
	  <div class="outer">
                    
                   
                    <h5 style="font-weight: 900;">내 클래스 목록</h5>
                    <br>
                    <h6 style="font-weight:600">클래스 조회</h6>
                    <hr><br>
                    <table id="class-select">
                        <tr>
                            <th width="100">검색어</th>
                            <input type="hidden" name ="no" value="<%=memNo %>">
                            <td><input type="search" name="keyword">
                               
                            </td>

                        </tr>

                        <tr>
                            <th>조회기간</th>
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
                                        <a href="#none" class="btncalendar dateclick"></a>
                                    </span>
                                </div>    

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
                        <tr>
                            <th>등록상태</th>
                            <td>
                                <input type="checkbox" name="all" id="chkAll" >
                                <label for="">전체</label>
                                <input type="checkbox" name="status" id="" value="0">
                                <label for="">검수요청</label>
                                <input type="checkbox" name="status" id="" value="1">
                                <label for="">검수반려</label>
                                <input type="checkbox" name="status" id="" value="2">
                                <label for="">판매중</label>
                                <input type="checkbox" name="status" id="" value="3">
                                <label for="">판매중지</label>
                            </td>
                        </tr>
                    </table>    
                    <script>
                        $(function(){
                            $("#chkAll").click(function(){
                                if($(this).is(":checked")){
                                    $("input[name=status]").attr("checked",true);
                                }else{
                                    $("input[name=status]").attr("checked",false);
                                }
                            })
                        })
                    </script>

                    <br>
                    <hr>
                    <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm" onclick="searchcl();" >조회하기</button>
                    
                    </div>
                    
              <script>
             	 let totalData; 
			    let dataPerPage= 10; 
			    let pageCount = 5; 
			    let globalCurrentPage=1; 
			    let dataList; 
              
            	function searchcl(){
            		
					let status = "";
                	
                	$("input[name=status]:checked").each(function(){
               		 let arr = $(this).val(); 
               		 status += arr + ","
      
               	})
 
            		$.ajax({
            			url: "<%=contextPath%>/search.tt",
            			data : {
            				keyword: $("input[name=keyword]").val(),
            				startDate : $("input[name=searchStartDate]").val(),
            				endDate : $("input[name=searchEndDate]").val(),
            				status : status,
            				no : $("input[name=no]").val()
  								
            			},
            			type:"post",
            			success : function(result){
            				console.log(result);
            				
            				if(result.length == 0){
            				  let value = "<tr>"
            					      + "<td colspan='5'> 조회된 클래스가 없습니다."
            					      + "</tr>"
            				 $("#clTable tbody").html("");
              				 $(".paging-area").html("");
              				 $("#clTable tbody").html(value);
              				      
            				}else{
            					totalData = result.length;
		    	 		        dataList=result;
		    	 		        displayData(1, dataPerPage, totalData);
		    	 		        paging(totalData, dataPerPage, pageCount, 1);
            				
            				}
            			
            			},
            			error: function(){
            				console.log("조회용 ajax통신 실패");
            			}
            		})
            		
            	}
            	
            	 function displayData(currentPage, dataPerPage, totalData) {
  			    	  let value = "";
  			    	  let num = 0;
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
							   + "<td>" + dataList[i].clNo  + "</td>"
							   + "<td>" + dataList[i].ctDno + "</td>"
							   + "<td>" + dataList[i].clName + "</td>"  
							
							   
					   if(dataList[i].enrollDate <= dataList[i].updateDate){
							   	value+= "<td>" + dataList[i].updateDate + "</td>"
						}else{
								value +=  "<td>" + dataList[i].enrollDate + "</td>"
						}
							   
						value  += "<td>" + dataList[i].clStatus + "</td>"
							   
						
						       if(dataList[i].clRefuse !=null && dataList[i].clStatus == "1"){
						    	  value += "<td>" + dataList[i].clRefuse + "</td>"
						       } else{
						    	   value += "<td> </td>"
						       }
							   + "</tr>"
  			    	  }
  			    	 $("#clTable tbody").html("");
      				 $(".paging-area").html("");
      				 $("#clTable tbody").html(value);
  				
      				 $(function(){
	        		$("#clTable>tbody>tr").click(function(){
	        			location.href="<%=contextPath%>/cldetail.ad?no="+$(this).children().eq(0).text();
	        		})
  				})  	
  				  	
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
  		        		    pageHtml += "<li><a href='#' id='prev'> &lt; </a></li>";
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
  		        		    pageHtml += "<li><a href='#' id='next'> &gt; </a></li>";
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

                   
                    <br><br>

                    <div id="list">
                        <h6 style="font-weight:600">조회 결과</h6>
                        <hr>
                        <div id="table-area" align="center">
                        <table class="table table-hover" id="clTable">
                            <thead class="thead-light">
                            <tr>
                                <th>클래스번호</th>
                                <th width="120">카테고리</th>
                                <th width="400">클래스명</th>
                                <th width="100">최종수정일</th>
                                <th width="80">상태</th>
                                <th width="100">반려사유</th>
                            </tr>
                            </thead>
                            <tbody>
                          	<%if (list.isEmpty()){ %>
                            <tr>
                                <td colspan="5">등록된 클래스가 없습니다.</td>
                                
                            </tr>
                            <%} else{%>
                            <!-- 등록된 클래스 있을 경우 -->
                            	<%for (Lesson l : list) {%>
                                <tr>
                                    <td><%=l.getClNo() %></td>
                                    <td><%=l.getCtDno() %></td>
                                    <td><%=l.getClName() %></td>
                                    <td><%=l.getEnrollDate() %></td>
                                    <td>
                                     <%String status = l.getClStatus();
			                            switch(String.valueOf(status)){
			                              case "0" : status ="검수요청"; break;
			                              case "1" : status ="검수반려"; break;
			                              case "2" : status ="판매중"; break;
			                              case "3" : status ="판매중지"; break;
			                                }
                                
                
                               		 %>
                         				 <%=status %>

                                    </td>
                                    <td>
                                    <% if(l.getClStatus() == "1"){ %>
                                     <%= l.getClRefuse()==null ? "" : l.getClRefuse() %>
                                    <%} %>
                                    </td>
                                </tr>
                                <%} %>
                             <%} %>
                            </tbody>
                        </table>
                        </div>

                    </div>

                </div>
                
                 <script>
		        	$(function(){
		        		$("#clTable>tbody>tr").click(function(){
		        			location.href="<%=contextPath%>/cldetail.tt?no="+$(this).children().eq(0).text();
		        		})
		        	})
		        
		        
		        </script>
                
		<div align="center">
			<ul id="paging"></ul>
		</div>

         <div class="paging-area">
        	<%if(pi.getCurrentPage() != 1){ %>    
        		
            		<button onclick="location.href='<%=contextPath%>/ttclass.tt?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
			
			<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           		 <button onclick="location.href='<%=contextPath%>/ttclass.tt?cpage=<%=p%>';"><%= p %></button>
           		 
            <%} %>
          
            <%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
            <button onclick="location.href='<%=contextPath%>/ttclass.tt?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
        	
               
        </div>
                  <%@ include file="../common/footerbar.jsp" %>
	
</body>
</html>