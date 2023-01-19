<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input, table{box-sizing:border-box;}
    a{text-decoration: none !important; color:black !important;}

   .outer{width:1000px; margin:auto; padding:20px 50px;}
   #calMng-form, #calMng-result{
    border:1px solid rgb(180, 180, 180); 
    border-radius:5px;
   }
   #calMng-form, #calMng-result{
    padding:20px;
   }
   #calMng-result{
    overflow:auto;
    height:500px;
   }

   #calMng-result td{
    text-align: center;
    vertical-align: middle;
    font-size:12px;
    padding:10px 0px;
   }
   #calMng-form td{
    padding:10px;
   }

   #selectCalMng-btn{
    width:60px;
    margin:0px 5px;
    background:rgb(22, 160, 133); 
    color:white;
   }
   input[type=radio]{display: none; margin: 10px;}
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
    input[type="text"]{
            width: 150px;
            border: 1px solid rgb(202, 199, 199);
            height: 30px;
            border-radius: 5px;
    }
    input[type=radio]:checked+label{
        background-color: rgb(22, 160, 133);
    }
    input[type=radio]:hover+label{
        background-color: rgb(22, 160, 133);
    }
    #tutorId{
        width:310px;
    }

   thead td{
    background:rgb(245, 245, 245);
   }
    #calMng-result>div{float:left; width:50%;}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
        <h5><b>튜터 정산 관리</b></h5><br>
        <form id="calMng-form" action="">
            <b>정산 내역 조회</b>
            <table width="850px">
                <tbody>
                    <tr>
                        <td>튜터ID</td>
                        <td width="340">
                            <input type="text" name="tutorId" id="tutorId">
                        </td>
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
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" align="center">
                            <button type="button" class="btn btn-sm" id="selectCalMng-btn">조회</button>
                            <button type="reset" class="btn btn-sm btn-secondary">초기화</button>
                        </td>
                        
                    </tr>
                </tfoot>
            </table>
        </form>
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
        <br>
        
        <form action="" id="calMng-result">
            <div>
                <b>조회 결과</b><br><br>
            </div>
            <br>

            <table width="100%" class="table" id="calMng-list">
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>신청일자</td>
                        <td>튜터ID</td>
                        <td>주문번호</td>
                        <td>정산금액</td>
                        <td>진행상태</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>2023-01-15</td>
                        <td>
                            tutor01
                        </td>
                        <td>B2939R23</td>
                        <td>
                            99,000원
                        </td>
                        <td>
                            <div class="calSt">
                                정산 미신청
                                <button type="button" class="btn btn-sm btn-secondary calChange-btn">수정</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    
    </div>
    
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="">
                    <div class="modal-body">
                        <b>정산 처리상태 변경</b> <br><br>
                        <input type="radio" id="calNotRequest" value="calNotRequest" name="calSt"> <label for="calNotRequest">정산 미신청</label>
                        <input type="radio" id="calIng" value="calIng" name="calSt"> <label for="calIng">정산 진행중</label> 
                        <input type="radio" id="calFin" value="calFin" name="calSt"> <label for="calFin">정산완료</label> <br><br>
                        <div align="center">
                        <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">저장</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </form>
            </div>  
        </div>
    </div>

    <script>
        $(function(){
            $(".calChange-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal");
            })
        })
    </script>
    
</body>
</html>