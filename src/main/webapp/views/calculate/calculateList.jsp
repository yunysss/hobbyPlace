<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{width:1000px; margin:auto; padding:30px 50px;}
   #calList-form, #calList-result{
    border:1px solid rgb(180, 180, 180); 
    border-radius:5px;
   }
   #calList-form, #calList-result{
    padding:20px;
   }

   #calList-form td, #calList-result td{
    vertical-align: middle;
    padding:10px;
   }
   #calList-result td{
    text-align: center;
    font-size:12px;
   }
   
   #selectCal{
    width:60px;
    margin:0px 5px;
    background:rgb(22, 160, 133); 
    color:white;
   }
   #selectAllCal{
    width:80px;
    background:rgb(22, 160, 133); 
    color:white;
   }

   thead td{
    background:rgb(245, 245, 245);
   }
   .cal-detail td{
        text-align:center;
        width:300px;
    }
   input[type=radio]{display: none; margin: 10px;}
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
            width: 160px;
            border: 1px solid rgb(202, 199, 199);
            height: 30px;
            border-radius: 5px;
    }
    input[name=dateType]:checked+label, input[name=dateType]:hover+label{
        background-color: rgb(22, 160, 133);
    }
    
    input[name=calSta]+label{
        display: inline-block;
        cursor: pointer;
        padding: 5px 8px;
        text-align: center;
        border-radius: 5px;
        background-color: lightGray;
        line-height: 16px;
    }
    input[name=calSta]:checked+label, input[name=calSta]:hover+label{
        background-color: gray;
        color:white;
    }
   .calListModal table td{
   		text-align:center;
        width:320px;
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
	<div class="outer">
        <h5><b>정산 내역</b></h5><br>
        <div id="calList-form">
            <table width="700px">
            	<tr>
                	<td>정산 진행 상태</td>
                	<td>
                		<input type="radio" name="calSta" id="checkAll" value="정산" checked>
                        <label for="checkAll">전체</label>
                        <input type="radio" name="calSta" id="checkWait" value="진행">
                        <label for="checkWait">정산진행중</label>
                        <input type="radio" name="calSta" id="checkComplete" value="완료">
                        <label for="checkComplete">정산완료</label>
                	</td>
                	<td></td>
                </tr>
                <tr>
                    <td>조회 기간</td>
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
                    </td>
                    <td>
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
            </table>
            <br>
            <div align="center">
            	<button type="button" class="btn btn-sm" id="selectAllCal" onclick="selectAllCalList();">전체조회</button>
	            <button type="button" class="btn btn-sm" id="selectCal" onclick="selectCalList();">조회</button>
	            <button type="button" class="btn btn-secondary btn-sm" onclick="resetAll();">초기화</button>
            </div>
        </div>
		<script>
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
			}
		</script>
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
    <script>
	    let totalData; //총 데이터 수
	    let dataPerPage=10; //한 페이지에 나타낼 글 수
	    let pageCount = 10; //페이징에 나타낼 페이지 수
	    let globalCurrentPage=1; //현재 페이지
	    let dataList; //표시하려하는 데이터 리스트
	
	    $(function () {
		     selectCalList();
	    })
	    function selectCalList(){
    		$.ajax({
    			url:"<%=contextPath%>/selectList.cal",
    			data:{
    				startDate:$("#searchStartDate").val(),
    				endDate:$("#searchEndDate").val(),
    				status:$("input[name=calSta]:checked").val()
    			},
    			success:function(d){
    				if(d.length == 0){
    					let value = "<tr>"
    						+	"<td colspan='7'>조회된 내역이 없습니다.</td>"
    						+ "</tr>"
    					$("#calList-area tbody").html(value);
    					$("#paging").html("");
    				} else{
    					//totalData(총 데이터 수) 구하기
    	 		    	   totalData = d.length;
    	 		               //데이터 대입
    	 		           dataList=d;
    	 		           displayData(1, dataPerPage, totalData);
    	 		           paging(totalData, dataPerPage, pageCount, 1);
    				}
    				
    			},error:function(){
    				console.log("정산목록 조회용 ajax 통신실패");
    			}
    		})
    	}
	    function selectAllCalList(){
    		$.ajax({
    			url:"<%=contextPath%>/selectList.cal",
    			data:{
    				startDate:"",
    				endDate:"",
    				status:""
    			},
    			success:function(d){
    				if(d.length == 0){
    					let value = "<tr>"
    						+	"<td colspan='7'>조회된 내역이 없습니다.</td>"
    						+ "</tr>"
    					$("#calList-area tbody").html(value);
    					$("#paging").html("");
    				} else{
    					//totalData(총 데이터 수) 구하기
    	 		    	   totalData = d.length;
    	 		               //데이터 대입
    	 		           dataList=d;
    	 		           displayData(1, dataPerPage, totalData);
    	 		           paging(totalData, dataPerPage, pageCount, 1);
    				}
    				
    			},error:function(){
    				console.log("정산목록 조회용 ajax 통신실패");
    			}
    		})
    	}
	    function displayData(currentPage, dataPerPage, totalData) {
	    	  let chartHtml = "";
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
	    	    chartHtml += "<tr>"
						+	"<td>" + dataList[i].calNo + "</td>"
						+	"<td>" + dataList[i].calNm + "</td>"
						+	"<td>" + dataList[i].bank + "<br>" + dataList[i].calAcc + "</td>"
						+	"<td>" + dataList[i].price + "</td>"
						+	"<td>" + dataList[i].rqDt + "</td>"
						+	"<td>" + dataList[i].calSta + "</td>"
						+	"<td> <button type='button' class='btn btn-secondary btn-sm detail-btn'>보기</button> </td>"
						+ "</tr>"
	    	  }
	    	  $("#calList-area tbody").html(chartHtml);
	    	}
    	
    	function paging(totalData, dataPerPage, pageCount, currentPage) {
    		 
    			  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
        		  
        		  if(totalPage<pageCount){
        		    pageCount=totalPage;
        		  }
        		  
        		  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
        		  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
        		  
        		  if (last > totalPage) {
        		    last = totalPage;
        		  }

        		  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
        		  let next = last + 1;
        		  let prev = first - 1;

        		  let pageHtml = "";

        		  if (prev > 0) {
        		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
        		  }

        		 //페이징 번호 표시 
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


        		  //페이징 번호 클릭 이벤트 
        		  $("#paging li a").click(function () {
        		    let $id = $(this).attr("id");
        		    selectedPage = $(this).text();

        		    if ($id == "next") selectedPage = next;
        		    if ($id == "prev") selectedPage = prev;
        		    //전역변수에 선택한 페이지 번호를 담는다...
        		    globalCurrentPage = selectedPage;
        		    //페이징 표시 재호출
        		    paging(totalData, dataPerPage, pageCount, selectedPage);
        		    //글 목록 표시 재호출
        		    displayData(selectedPage, dataPerPage, totalData-(selectedPage-1)*dataPerPage);
        		  });
    		  
    		}
    </script>           
        <br>
        <div id="calList-result">
            <b>조회 결과</b><br><br>
            <table width="100%" class="table" id="calList-area">
                <thead>
                    <tr>
                        <td>정산번호</td>
                        <td>예금주 성함</td>
                        <td>입금 요청 은행</td>
                        <td>정산 요청 금액</td>
                        <td>정산 요청 날짜</td>
                        <td>정산 진행 상태</td>
                        <td>상세내역</td>
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
	    $(document).on("click", ".detail-btn", function(){
	    	$.ajax({
    			url:"<%= contextPath %>/detailView.cal",
    			data:{calNo:$(this).parent().siblings().eq(0).text()},
    			success:function(c){
        			let price = Number(c.price);
        			let price1 = Number(Math.ceil(price / 0.988));
        			let price2 = Number(Math.ceil(price1 * 0.003));
        			let price3 = Number(Math.ceil(price1 * 0.002));
        			let price4 = Number(Math.ceil(price1 * 0.007));
    				let value = "정산번호 : " + c.calNo + "<br>"
    							+ "주문번호 : " + c.calReg + "<br>"
    							+ "예금주 성함 : " + c.calNm + "<br>"
    							+ "입금 요청 은행 : " + c.bank + c.calAcc + "<br>"
    							+ "정산 요청 날짜 : " + c.rqDt + "<br>"
    							+ "정산 진행 상태 : " + c.calSta + "<br><br>"
    							+ "<table border='1'>"
    							+	"<tr>"
    							+		"<td style='background:rgb(245, 245, 245)'>정산 신청 금액</td>"
    							+		"<td style='text-align:right;' id='calPrice'>" + CommaFormat(price1) + "원</td>"
   								+	"</tr>"
    							+	"<tr>"
    							+		"<td style='background:rgb(245, 245, 245)'>원천 징수 세금 (3%)</td>"
    							+		"<td style='text-align:right;' id='calPrice-1'>"+ CommaFormat(price2) + "원</td>"
    							+	"</tr>"
    							+	"<tr>"
    							+		"<td style='background:rgb(245, 245, 245)'>카드사 수수료 (2%)</td>"
    							+		"<td style='text-align:right;' id='calPrice-2'>"+ CommaFormat(price3) + "원</td>"
    							+	"</tr>"
    							+	"<tr>"
    							+		"<td style='background:rgb(245, 245, 245)'>합플 이용료 (7%)</td>"
    							+		"<td style='text-align:right;' id='calPrice-3'>"+ CommaFormat(price4) + "원</td>"
    							+	"</tr>"
    							+	"<tr>"
    							+		"<td style='background:rgb(245, 245, 245)'>최종 정산 금액 </td>"
    							+		"<td style='text-align:right; color:rgb(231, 76, 60);' id='calPrice-4'>"+ CommaFormat(price) + "원</td>"
    							+	"</tr>"
    							+ "</table>";
    				$("#modal-inner").html(value);
    				$('.calListModal').modal('show'); 
    			},error:function(){
    				console.log("정산상세내역 조회용 ajax 통신실패");
    			}
    		})
	    })
    	function CommaFormat(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
    </script>
    <div class="modal fade calListModal">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            
            <div class="modal-body">
                <h5 class="modal-title"><b>정산 상세 내역</b></h5><br>
            	<div id="modal-inner">
                
                </div>
                <br>
                <div align="center">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
                </div>
            </div>
      
          </div>
        </div>
      </div>

</body>
</html>