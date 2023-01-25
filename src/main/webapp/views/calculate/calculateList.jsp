<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.hp.calculate.model.vo.Calculate"%>
<% ArrayList<Calculate> aList = (ArrayList<Calculate>)request.getAttribute("aList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input, table{box-sizing:border-box;}
    a{text-decoration: none !important; color:black !important;}

   .outer{width:1000px; margin:auto; padding:30px 50px;}
   #calList-form, #calList-result{
    border:1px solid rgb(180, 180, 180); 
    border-radius:5px;
   }
   #calList-form, #calList-result{
    padding:20px;
   }
   #calList-result{
    overflow:auto;
    height:500px;
   }

   #calList-form td, #calList-result td{
    text-align: center;
    vertical-align: middle;
    font-size:12px;
    padding:10px 0px;
   }
   #calList-form td{
    padding:10px;
   }
   
   #selectCal{
    width:60px;
    margin:0px 5px;
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
    thead td{
    background:rgb(245, 245, 245);
   }
   .searchDate input[type=radio]{display: none; margin: 10px;}
   .searchDate input[type=radio]+label{
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
   input[type="text"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
   }
   .searchDate input[type=radio]:checked+label{
       background-color: rgb(22, 160, 133);
   }
   .searchDate input[type=radio]:hover+label{
       background-color: rgb(22, 160, 133);
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
            <b>정산 내역 조회</b>
            <table width="850px">
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
	                        &nbsp;
	                        <button type="button" class="btn btn-secondary btn-sm" onclick="resetAll();">초기화</button>
	                    </div>    
                    </td>
                    <td>
                        <button type="button" class="btn btn-sm" id="selectCal" onclick="selectCalList();">조회</button>
                    </td>
                <tr>
                    <td></td>
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
                <tr>
                	<td></td>
                	<td>
                		<input type="radio" name="calSta" id="checkAll" value="All" checked>
                        <label for="checkAll">전체</label>
                        <input type="radio" name="calSta" id="checkWait" value="W">
                        <label for="checkWait">정산진행중</label>
                        <input type="radio" name="calSta" id="checkComplete" value="C">
                        <label for="checkComplete">정산완료</label>
                	</td>
                </tr>
            </table>
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
    	function selectCalList(){
    		$.ajax({
    			url:"<%=contextPath%>/select.cal",
    			data:{
    				memNo:<%=MemNo%>,
    				startDate:$("#searchStartDate").val(),
    				endDate:$("#searchEndDate").val(),
    				status:$("input[name=calSta]:checked").val()
    			},
    			success:function(list){
    				
    				let value = "";
    				$("#calList-area tbody").html("");
    				if(list.length == 0){ 
    					value += "<tr>"
    							+	"<td colspan='7'>조회된 내역이 없습니다</td>"
    							+ "</tr>"
    				}else{
						for(let i=0; i<list.length; i++){
    						value += "<tr>"
    								+	"<td>" + list[i].calNo + "</td>"
    								+	"<td>" + list[i].calNm + "</td>"
    								+	"<td>" + list[i].bank + "<br>" + list[i].calAcc + "</td>"
    								+	"<td>" + list[i].price + "</td>"
    								+	"<td>" + list[i].rqDt + "</td>"
    								+	"<td>" + list[i].calSta + "</td>"
    								+	"<td> <button type='button' class='btn btn-secondary btn-sm'>보기</button> </td>"
    								+ "</tr>"
    					}
					}
    				$("#calList-area tbody").html(value);
    			},error:function(){
    				console.log("댓글목록 조회용 ajax 통신실패");
    			}
    		})
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
                        <td>정산 요청 금액 (원)</td>
                        <td>정산 요청 날짜</td>
                        <td>정산 진행 상황</td>
                        <td>상세내역</td>
                    </tr>
                </thead>
                <tbody>
                	<% if(aList == null){ %>
                		<tr>
    						<td colspan='7'>조회된 내역이 없습니다</td>
    					</tr>
                	<% } else{%>
	                	<% for(int i=0; i<aList.size(); i++){ %>
		                   <tr>
		                       <td><%= aList.get(i).getCalNo() %></td>
		                       <td><%= aList.get(i).getCalNm() %></td>
		                       <td><%= aList.get(i).getBank() %><br><%= aList.get(i).getCalAcc() %></td>
		                       <td><%= aList.get(i).getPrice() %></td>
		                       <td><%= aList.get(i).getRqDt() %></td>
		                       <td><%= aList.get(i).getCalSta() %></td>
		                       <td><button type='button' class='btn btn-secondary btn-sm'>보기</button></td>
		                   </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" id="calListModal">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            
            <div class="modal-body">
                <h5 class="modal-title"><b>정산 상세 내역</b></h5><br>
            
                예금주 성함 : 김길동 <br>
                입금 요청 은행 : 우리은행 1002*****7586 <br>
                정산 요청 날짜 : 2023-1-15(일) 오후 4:43 <br>
                정산 진행 상황 : 정산 진행중 <br><br>
                <table border="1" class="cal-detail">
                    <tr>
                        <td style="background:rgb(245, 245, 245)">정산 신청 금액</td>
                        <td style="text-align:right;">134,300원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">원천 징수 세금 (3.3%)</td>
                        <td style="text-align:right;">4,430원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">카드사 수수료 (2.53%)</td>
                        <td style="text-align:right;">3,390원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">합플 이용료 (7.5%)</td>
                        <td style="text-align:right;">10,070원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">최종 정산 금액</td>
                        <td style="text-align:right; color:rgb(231, 76, 60);">116,410원&nbsp;</td>
                    </tr>
                </table>
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