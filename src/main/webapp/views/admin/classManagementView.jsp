<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.common.model.vo.PageInfo, com.hp.lesson.model.vo.*" %>    
<%
	PageInfo pi = (PageInfo)session.getAttribute("pi");
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
    ArrayList<Category> cList = (ArrayList<Category>)session.getAttribute("cList");
    ArrayList<Dcategory> dList = (ArrayList<Dcategory>)session.getAttribute("dList");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        padding: 30px;
    }
    .outer>*{
        font-size: small;
    }
   
    #class-select input[type="checkbox"]+label{
        margin-right: 15px;
       
    } 
    #class-select input{
       margin: 10px 0px;
    }

   
    input[type=radio]{display: none; }
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
        margin: 2px;
        
    }
    input[type=radio]:checked+label{
        background-color: rgb(35, 104, 116)
    }
    input[type=radio]:hover+label{
        background-color: rgb(35, 104, 116)
    }


    .clearfix{display: inline-block;}
    .searchDate{display: inline;}

    input[type="search"]{
    width: 300px;
    border: 1px solid rgb(202, 199, 199);
    height: 32px;
    border-radius: 5px;
}
    select{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    input[type="text"]{
    width: 145px;
    border: 1px solid rgb(202, 199, 199);
    height: 30px;
    border-radius: 5px;
    
}

    /*테이블*/
    #table-area{
        text-align:center;
        cursor: pointer;
    }
    h5{font-weight: 600;}
    h6{font-weight: 600;}

    #classList{
        text-align: center;
        font-size: 12px;
    }

    .paging-area{
        text-align: center;
    }
    .paging-area>*{
        border: none;
        border-radius: 3px;

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



<script>                


$(document).ready(function() {
	changeCt();
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

</head>
<body>
    <%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
        <br>
        <h5 style="font-weight: 600; font-size:18px">클래스 관리</h5>
        <br>
        <h6 style="font-weight: 600; font-size:15px">클래스 조회</h6>
        <hr>
        
        
            <div id="select-area">
          
            <table id="class-select">
                <tr>
                    <th width="100">검색어</th>
                    <td>
                        <input type="search" name="keyword" required>

                    </td>

                </tr>
			
			   
                <tr>
                    <th width="100">카테고리</th>
                    <td>
                       <select name="category" id="ct" onchange="changeCt();">
	                    <option value="00" selected>전체</option>   
	                    <option value="11">교육</option>
	                    <option value="22">공예 DIY</option>
	                    <option value="33">드로잉</option>
	                    <option value="44">쿠킹</option>
	                    <option value="55">스포츠/피트니스</option>

                     </select>
                     <select name="dcategory" id="dct">
                    	
                    </select>
                    </td>
                    
                    
                     <script>
                     
                        function changeCt(){
                        	var all = ["전체"];
                        	var study = ["전체","외국어","자격증","IT"];
                        	var diy = ["전체","가죽/라탄","비누/꽃/향","뜨개/자수","기타"];
                        	var draw = ["전체","취미미술","캘리그래피"];
                        	var cook = ["전체","요리","베이킹"];
                        	var sport = ["전체","실내스포츠","야외스포츠","레저/액티비티","요가 필라테스/ 헬스 PT"];
     	
                        	var changeDct;
                        	if($("#ct").val()== "00"){
                        		changeDct = all;
                        	}
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
                        <input type="checkbox" name=all" id="chkAll" value= "전체">
                        <label for="">전체</label>
                        <input type="checkbox" name="status" id="beforeApproval" value="0">
                        <label for="beforeApproval">검수요청</label>
                        <input type="checkbox" name="status" id="rejectClass" value="1">
                        <label for="rejectClass">신청반려</label>
                        <input type="checkbox" name="status" id="saleClass" value="2">
                        <label for="saleClass">판매중</label>
                        <input type="checkbox" name="status" id="stopClass" value="3">
                        <label for="stopClass">판매중지</label>
                       
                    </td>
                </tr>
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

            </table>  
            
            <hr>
            <div align="center">
            <button type="button" class="btn btn-secondary btn-sm" onclick="searchcl();">조회하기</button>

            </div>
            
       
           <script>
	            let totalData; 
			    let dataPerPage=10; 
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
            			url: "<%=contextPath%>/search.ad",
            			data : {
            				keyword: $("input[name=keyword]").val(),
            				category : $("select[name=category]").val(),
            				dcategory: $("select[name=dcategory]").val(),
            				startDate : $("input[name=searchStartDate]").val(),
            				endDate : $("input[name=searchEndDate]").val(),
            				status : status
  
            			},
            			type:"post",
            			success : function(result){
            				//console.log(result);
            			
            				if(result.length == 0){
            				let	value = "<tr>"
            					      + "<td colspan='6'> 조회된 클래스가 없습니다."
            					      + "</tr>"
            				  $("#classList tbody").html("");
            				  $(".paging-area").html("");
            				  $("#classList tbody").html(value); 
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
							   + "<td>" + dataList[i].ctNo + "</td>"
							   + "<td>" + dataList[i].ctDno + "</td>"
							   + "<td>" + dataList[i].clName + "</td>"   
							   + "<td>" + dataList[i].updateDate  + "</td>"
							   + "<td>" + dataList[i].memNo + "</td>"
							   + "<td>" + dataList[i].clStatus + "</td>"
							   +"</tr>"
   			    	  }
   			    	$("#classList tbody").html("");
   				    $(".paging-area").html("");
   				  	$("#classList tbody").html(value); 
   				  	
   				 $(function(){
 	        		$("#classList>tbody>tr").click(function(){
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
         
		</div>
            <br><br>
        <table class="table table-hover" id="classList" >
            <thead class="thead-light">
                <tr>
                    <th width="100">클래스번호</th>
                    <th width="100">카테고리</th>
                    <th width="100">세부</th>
                    <th width="400">클래스명</th>
                    <th width="100">최종수정일</th>
                    <th width="100">튜터명</th>
                    <th width="100">상태</th>
                </tr>
            </thead>
            
            <tbody>
            		<!-- 등록된 클래스 없을경우  -->
                	<%if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="6">등록된 클래스가 없습니다.</td>
                        
                    </tr>
                	<%} else{%>
                	<!-- 등록된 클래스 있을경우  -->
	                	<%for(Lesson c : list){ %>
	                    <tr>
	                        <td><%=c.getClNo() %></td>
	                        <td><%=c.getCtNo() %></td>
	                        <td><%=c.getCtDno() %></td>
	                        <td><%=c.getClName() %></td>
	                        <td><%=c.getUpdateDate() %></td>
	                        <td><%=c.getMemNo() %></td>
	                        <td>
                                <%String status = c.getClStatus();
                                switch(String.valueOf(status)){
                                	case "0" : status ="검수요청"; break;
                                	case "1" : status ="검수반려"; break;
                                	case "2" : status ="판매중"; break;
                                	case "3" : status ="판매중지"; break;
                                	
                                }
                                
                
                                %>
                                <%=status %>

                            </td>
	
	                    </tr>
	                    <%} %>
                    <%} %>
                
             </tbody>

        </table>
        
        <script>
        	$(function(){
        		$("#classList>tbody>tr").click(function(){
        			location.href="<%=contextPath%>/cldetail.ad?no="+$(this).children().eq(0).text();
        		})
        	})
        
        
        </script>

		<div align="center">
			<ul id="paging"></ul>
		</div>

		<div class="paging-area">
        
        	<%if(pi.getCurrentPage() != 1){ %>    
        		
            		<button onclick="location.href='<%=contextPath%>/classmg.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
			
			<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           		 <button onclick="location.href='<%=contextPath%>/classmg.ad?cpage=<%=p%>';"><%= p %></button>
           		 
            <%} %>
          
            <%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
            <button onclick="location.href='<%=contextPath%>/classmg.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
            
           
        </div>


    </div>
    
</body>
</html>