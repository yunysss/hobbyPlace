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
       .outer>*{
       	font-size:small;
       }
       #refMng-form, #refMng-result{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
        padding:20px;
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
       #selectAllRefMng-btn{
       	width:80px;
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
        
       input[name=dateType], input[name=refSta]{display: none; margin: 10px;}
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
	    
	    input[name=refSta]+label{
	        display: inline-block;
	        cursor: pointer;
	        padding: 5px 8px;
	        text-align: center;
	        border-radius: 5px;
	        background-color: lightGray;
	        line-height: 16px;
	    }
	    input[name=refSta]:checked+label, input[name=refSta]:hover+label{
	        background-color: gray;
	        color:white;
	    }
        #tutorId{
            width:310px;
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
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
        <h5 style="font-weight: 600; font-size:18px"><b>환불 신청 관리</b></h5><br>
        <div id="refMng-form">
            <table width="800px">
                <tbody>
                	<tr>
                    	<td><b>진행상태</b></td>
                    	<td colspan="3">
                    		<input type="radio" name="refSta" id="checkAll" value="환불" checked>
			                <label for="checkAll"><small>전체</small></label>
			                <input type="radio" name="refSta" id="checkWait" value="신청">
			                <label for="checkWait"><small>환불신청</small></label>
			                <input type="radio" name="refSta" id="checkComplete" value="완료">
			                <label for="checkComplete"><small>환불완료</small></label>
                    	</td>
                    </tr>
                    <tr>
                        <td><b>검색어</b></td>
                        <td width="150px;">
                            <select name="keywordType">
                                <option value="orderNo">주문번호</option>
                                <option value="memId">고객ID</option>
                            </select>
                        </td>
                        <td colspan="2">
                            <input type="text" name="keyword" size="18">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td><b>조회 기간</b></td>
                        <td>
                            <select name="searchDateType">
                                <option value="regDate">결제일자</option>
                                <option value="refDate">신청일자</option>
                            </select>
                        </td>
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
            	<button type="button" class="btn btn-sm" id="selectAllRefMng-btn" onclick="selectAllRefundMng();">전체조회</button>
            	<button type="button" class="btn btn-sm" id="selectRefMng-btn" onclick="selectRefundMng();">조회</button>
                <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
            </div>
        </div>
        <script>
			function resetAll(){
				$("input:text").val("");
				$(".searchDate input:radio").removeAttr("checked");
			}
		</script>
        <script>                
		
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
        
        <script>
	        let totalData; 
		    let dataPerPage=10; 
		    let pageCount = 10; 
		    let globalCurrentPage=1;
		    let dataList; 
		
		    $(function () {
			     selectRefundMng();
		    })
	        function selectRefundMng(){
	    		$.ajax({
	    			url:"<%=contextPath%>/selectMng.ref",
	    			data:{
	    				keywordType:$("select[name=keywordType]").val(),
	    				keyword:$("input[name=keyword]").val(),
	    				dateType:$("select[name=searchDateType]").val(),
	    				startDate:$("#searchStartDate").val(),
	    				endDate:$("#searchEndDate").val(),
	    				status:$("input[name=refSta]:checked").val()    				
	    			},
	    			success:function(list){
	    				if(list.length == 0){
	    					let value = "<tr>"
	    						+	"<td colspan='9'>조회된 내역이 없습니다.</td>"
	    						+ "</tr>"
	    					$("#refMng-result tbody").html(value);
	    					$("#paging").html("");
	    				} else{
	    	 		    	   totalData = list.length;
	    	 		           dataList=list;
	    	 		           displayData(1, dataPerPage, totalData);
	    	 		           paging(totalData, dataPerPage, pageCount, 1);
	    				}
	    			},error:function(){
	    				console.log("정산목록 조회용 ajax 통신실패");
	    			}
	    		})
	    	}
		    function selectAllRefundMng(){
	    		$.ajax({
	    			url:"<%=contextPath%>/selectMng.ref",
	    			data:{
	    				keywordType:"",
	    				keyword:"",
	    				dateType:"",
	    				startDate:"",
	    				endDate:"",
	    				status:""    				
	    			},
	    			success:function(list){
	    				if(list.length == 0){
	    					let value = "<tr>"
	    						+	"<td colspan='9'>조회된 내역이 없습니다.</td>"
	    						+ "</tr>"
	    					$("#refMng-result tbody").html(value);
	    					$("#paging").html("");
	    				} else{
	    	 		    	   totalData = list.length;
	    	 		           dataList=list;
	    	 		           displayData(1, dataPerPage, totalData);
	    	 		           paging(totalData, dataPerPage, pageCount, 1);
	    				}
	    			},error:function(){
	    				console.log("정산목록 조회용 ajax 통신실패");
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
		    		  value += "<tr class='refMngList'>"
							+	"<td>" + dataList[i].orderNo + "</td>"
								+	"<td>" + dataList[i].refBank + "</td>"
								+	"<td>" + dataList[i].refRqDt + "</td>"
								+	"<td>" + dataList[i].refFinDt + "<br>" 
								+	"<td>" + dataList[i].memNo + "</td>";
							if(dataList[i].refRea.includes('기타')){
								value += "<td>" + "<button type='button' class='btn btn-sm btn-outline-secondary refRea-btn'>기타</button>";
							}else{
								value += "<td>" + dataList[i].refRea
							}
							value += "</td><td>" + dataList[i].refPrice  + "</td>";
							if(dataList[i].refAcc == "카드"){
								value += "<td>" + dataList[i].refAcc + "</td>";
							} else{
								value += "<td>" + dataList[i].refAcc + "<button type='button' class='btn btn-sm btn-secondary refAcc-btn'>확인</button>";
							}
							value += "<td>"
							+		dataList[i].refSta
								+		"<button type='button' class='btn btn-sm btn-secondary refChange-btn'>수정</button>"
								+	"</td>"
								+ "</tr>"
					}
		    	  $("#refMng-result tbody").html(value);
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
        </script>
        <div id="refMng-result">
            <b>조회 결과</b><br>
            <br>

            <table width="100%" class="table" id="refMng-list" >
                <thead>
                    <tr>
                        <td>주문번호</td>
                        <td width="90">결제일자</td>
                        <td width="90">신청일자</td>
                        <td width="90">완료일자</td>
                        <td>고객ID</td>
                        <td width="80">취소사유</td>
                        <td>결제금액</td>
                        <td>결제방법</td>
                        <td>처리상태</td>
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
	    $(document).on("click", ".refChange-btn", function(){
	    	$(".refNo").val($(this).parent().siblings().eq(0).text());
	    	$('.refChangeModal').modal('show'); 
	    	let refChange = $(this);
	    	$(".modal-body label").each(function(){
				if($(refChange).parent().text().includes($(this).text())){
					$(this).prev().attr("checked", true);
				}
			})
	    })
    </script>
    <div class="modal refChangeModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <form action="<%= contextPath%>/update.ref">
                    <div class="modal-body">
                        <b>환불 처리상태 변경</b> <br><br>
                        <div align="center">
                        <input type="radio" id="N" value="N" name="refSt"> <label for="N">환불신청</label>
                        <input type="radio" id="Y" value="Y" name="refSt"> <label for="Y">환불완료</label> <br><br>
                        <button type="submit" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;">저장</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                    <input type="hidden" name="refNo" class="refNo">
                </form>
            </div>  
        </div>
    </div>

	<script>
	    $(document).on("click", ".refAcc-btn", function(){
	    	$.ajax({
	    		url:"<%=contextPath%>/selectDeposit.ref",
	    		data:{refNo:$(this).parent().siblings().eq(0).text()},
	    		success:function(r){
	    			value = "주문 번호 : " + r.orderNo + "<br>"
	    				  + "예금주 성함 : " + r.refName + "<br>"
	    				  + "입금 요청 계좌 : " + r.refBank + "&nbsp;" + r.refAcc + "<br>"
	    				  + "환불 금액 : " + r.refPrice + "<br>"
	    				  + "환불 신청 날짜 : " + r.refRqDt + "<br>"
	    				  + "환불 처리 상태 : " + r.refSta;
	    			$("#refAcc-inner").html(value);
	    			$('.refAccModal').modal('show'); 
	    		},error:function(){
	    			console.log("무통장상세내역 조회용 ajax 통신실패");
	    		}
	    	})
	    })
	    $(document).on("click", ".refRea-btn", function(){
	    	$.ajax({
	    		url:"<%=contextPath%>/selectDeposit.ref",
	    		data:{refNo:$(this).parent().siblings().eq(0).text()},
	    		success:function(r){
	    			value = r.refRea.substring(3,r.refRea.length-1);
	    			$("#refRea-inner").html(value);
	    			$('.refReaModal').modal('show'); 
	    		},error:function(){
	    			console.log("무통장상세내역 조회용 ajax 통신실패");
	    		}
	    	})
	    })
    </script>
    <div class="modal refAccModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
	            <div class="modal-body">
	                <b>무통장입금 환불 계좌 정보</b> <br><br>
	                <div id="refAcc-inner">
	                </div>
	                <br>
	                <div align="center"><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button></div>
	            </div>
            </div>  
        </div>
    </div>
    <div class="modal refReaModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
	            <div class="modal-body">
	                <b>취소사유</b> <br><br>
	                <div id="refRea-inner" align="center">
	                </div>
	                <br>
	                <div align="center"><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button></div>
	            </div>
            </div>  
        </div>
    </div>
</body>
</html>