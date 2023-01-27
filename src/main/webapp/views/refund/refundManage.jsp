<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.hp.refund.model.vo.Refund"%>
<% ArrayList<Refund> list = (ArrayList<Refund>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div, p, form, input, table{box-sizing:border-box;}

       .outer{width:1000px; margin:auto; padding:20px 50px;}
       #refMng-form, #refMng-result{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
       }
       #refMng-form, #refMng-result{
        padding:20px;
       } 
       #refMng-result{
        overflow:auto;
        height:500px;
       }

       #refMng-result td{
        text-align: center;
        vertical-align: middle;
        font-size:12px;
       }
       #refMng-form td{
        padding:10px;
       }

       #selectRefMng-btn{
        width:60px;
        margin:0px 5px;
        background:rgb(22, 160, 133); 
        color:white;
       }
       thead td{
        background:rgb(245, 245, 245);
       }

        #refMng-result>div{float:left; width:50%;}
        
       input[name=dateType], input[name=calSta]{display: none; margin: 10px;}
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
        <h5><b>환불 신청 관리</b></h5><br>
        <div id="refMng-form">
            <b>환불 내역 조회</b>
            <table width="850px">
                <tbody>
                	<tr>
                    	<td>진행상태</td>
                    	<td colspan="2">
                    		<input type="radio" name="calSta" id="checkAll" value="환불" checked>
			                <label for="checkAll"><small>전체</small></label>
			                <input type="radio" name="calSta" id="checkWait" value="신청">
			                <label for="checkWait"><small>환불신청</small></label>
			                <input type="radio" name="calSta" id="checkComplete" value="완료">
			                <label for="checkComplete"><small>환불완료</small></label>
                    	</td>
                    </tr>
                    <tr>
                        <td width="150">검색어</td>
                        <td width="150px;">
                            <select name="" class="form-control">
                                <option value="">주문번호</option>
                                <option value="">고객ID</option>
                                <option value="">클래스명</option>
                            </select>
                        </td>
                        <td width="200">
                            <input type="text" name="tutorId" size="18">
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>조회 기간</td>
                        <td colspan="2">
                            <div colspan="2" class="clearfix">
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
                        <td colspan="4" align="center">
                            <button type="button" class="btn btn-sm" id="selectRefMng-btn">조회</button>
                            <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
                        </td>
                        
                    </tr>
                </tfoot>
            </table>
        </div>
        <script>
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
			}
		</script>
        <script>                
		
		    $(function() {
		
		        //datepicker 한국어로 사용하기 위한 언어설정
		        $.datepicker.setDefaults($.datepicker.regional['ko']);     
		    
		        // Datepicker            
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
		
		        $(".dateclick").dateclick();    // DateClick
		        $(".searchDate").schDate();        // searchDate
		        
		    });
		
		    // Search Date
		    jQuery.fn.schDate = function(){
		        let $obj = $(this);
		        let $chk = $obj.find("input[type=radio]");
		        $chk.click(function(){                
		            $('input:not(:checked)').parent(".chkbox2").removeClass("on");
		            $('input:checked').parent(".chkbox2").addClass("on");                    
		        });
		    };
		
		    // DateClick
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
		
		        //var year = today.getFullYear();
		        //var month = today.getMonth() + 1;
		        //var day = today.getDate();
		        
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
		                
		        // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		        $("#searchEndDate").datepicker( "option", "minDate", startDate );
		        
		        // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		        $("#searchStartDate").datepicker( "option", "maxDate", endDate );
		
		    }

        </script>
        <br>
        
        <div id="refMng-result">
            <div>
                <b>조회 결과</b><br><br>
            </div>
            <!-- <div align="right">
                <button id="refChangeY-btn" style="background:rgb(22, 160, 133); color:white;">저장</button>
            </div> -->
            <br>

            <table width="100%" class="table" id="refMng-list" >
                <thead>
                    <tr>
                        <td>주문번호</td>
                        <td width="90">결제일자</td>
                        <td width="90">신청일자</td>
                        <td width="90">완료일자</td>
                        <td>고객ID</td>
                        <td width="60">클래스</td>
                        <td width="80">취소사유</td>
                        <td>결제금액</td>
                        <td>결제방법</td>
                        <td>처리상태</td>
                    </tr>
                </thead>
                
            	<tbody>
            		<% for(int i=0; i<list.size(); i++){ %>
		                <tr>
		                    <td><%= list.get(i).getOrderNo() %></td>
		                    <td><%= list.get(i).getRefBank() %></td>
		                    <td><%= list.get(i).getRefRqDt() %></td>
		                    <td><%= list.get(i).getRefFinDt() %></td>
		                    <td><%= list.get(i).getMemNo() %></td>
		                    <td><%= list.get(i).getRefName() %></td>
		                    <td><%= list.get(i).getRefRea()%></td>
		                    <td><%= list.get(i).getRefPrice() %></td>
		                    <td><% if(list.get(i).getRefAcc().equals("카드")){ %>
		                    		<%= list.get(i).getRefAcc() %>
		                    	<% } else{ %>
		                    		<%= list.get(i).getRefAcc() %> 
		                    		<button type="button" class="btn btn-sm btn-secondary refAcc-btn">확인</button>
		                    	<% } %>
		                    </td>
		                    <td>
		                        <div class="refSt">
		                            <%= list.get(i).getRefSta() %>
		                            <button type="button" class="btn btn-sm btn-secondary refChange-btn">수정</button>
		                        </div>
		                    </td>
		                </tr>
					<% } %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal" id="refChangeModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="">
                    <div class="modal-body">
                        <b>환불 처리상태 변경</b> <br><br>
                        <input type="radio" id="refRequest" value="refRequest" name="refSt"> <label for="refRequest">환불신청</label>
                        <input type="radio" id="refFin" value="refFin" name="refSt"> <label for="refFin">환불완료</label> <br><br>
                        <div align="center">
                        <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">저장</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </form>
            </div>  
        </div>
    </div>

    <div class="modal" id="refAccModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="">
                    <div class="modal-body">
                        <b>무통장입금 환불 계좌 정보</b> <br><br>
                        예금주 성함 : 김길동 <br>
                        입금 요청 계좌 : 우리은행 1002394857384 <br>
                        환불 금액 : 99,000원 <br>
                        환불 신청 날짜 : 2023-01-15(일) 16:34 <br><br>
                        <div align="center"><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button></div>
                        
                    </div>
                </form>
            </div>  
        </div>
    </div>

    <script> 
        $(function(){
            $(".refChange-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#refChangeModal");
            })
            $(".refAcc-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#refAccModal");
            })
        })
    </script>
</body>
</html>