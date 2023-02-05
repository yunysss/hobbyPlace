<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
       #regMng-form, #regMng-result{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
       }
       #regMng-form, #regMng-result{
        padding:20px;
       } 
       #regMng-result td{
        text-align: center;
        vertical-align: middle;
        font-size:12px;
       }
       #regMng-form td{
        padding:10px;
       }

       #selectRegMng-btn{
        width:60px;
        margin:0px 5px;
        background:rgb(22, 160, 133); 
        color:white;
       }
       #selectAllRegMng-btn{
       	width:80px;
   		background:rgb(22, 160, 133); 
    	color:white!important;
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
        
       input[name=dateType], input[name=regSta]{display: none; margin: 10px;}
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
	    
	    input[name=regSta]+label{
	        display: inline-block;
	        cursor: pointer;
	        padding: 5px 8px;
	        text-align: center;
	        border-radius: 5px;
	        background-color: lightGray;
	        line-height: 16px;
	    }
	    input[name=regSta]:checked+label, input[name=regSta]:hover+label{
	        background-color: gray;
	        color:white;
	    }
        #tutorId{
            width:310px;
        }

       thead td{
        background:rgb(245, 245, 245);
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
        <h5 style="font-weight: 600; font-size:18px"><b>결제 내역 관리</b></h5><br>
        <div id="regMng-form">
            <table width="700px">
                <tbody>
                	<tr>
                    	<td><b>진행상태</b></td>
                    	<td colspan="2">
                    		<input type="radio" name="regSta" id="checkAll" value="입금" checked>
			                <label for="checkAll"><small>전체</small></label>
			                <input type="radio" name="regSta" id="checkWait" value="대기">
			                <label for="checkWait"><small>입금대기</small></label>
			                <input type="radio" name="regSta" id="checkComplete" value="완료">
			                <label for="checkComplete"><small>결제완료</small></label>
                    	</td>
                    </tr>
                    <tr>
                        <td><b>검색어</b></td>
                        <td colspan="2">
                            <select name="keywordType">
                                <option value="regNo">주문번호</option>
                                <option value="memId">고객ID</option>
                            </select>
                            <input type="text" name="keyword" size="18">
                        </td>
                    </tr>
                    <tr>
                        <td><b>조회 기간</b></td>
                        <td width="335">
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
            	<a href="<%=contextPath %>/manage.reg" class="btn btn-sm" id="selectAllRegMng-btn"">전체조회</a>
            	<button type="button" class="btn btn-sm" id="selectRegMng-btn" onclick="selectRegMng();">조회</button>
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
			     selectRegMng();
		    })
	        function selectRegMng(){
	    		$.ajax({
	    			url:"<%=contextPath%>/selectMng.reg",
	    			data:{
	    				keywordType:$("select[name=keywordType]").val(),
	    				keyword:$("input[name=keyword]").val(),
	    				startDate:$("#searchStartDate").val(),
	    				endDate:$("#searchEndDate").val(),
	    				status:$("input[name=regSta]:checked").val()    				
	    			},
	    			success:function(list){
	    				if(list.length == 0){
	    					let value = "<tr>"
	    						+	"<td colspan='7'>조회된 내역이 없습니다.</td>"
	    						+ "</tr>"
	    					$("#regMng-result tbody").html(value);
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
		    		  value += "<tr class='regMngList'>"
							+	"<td>" + dataList[i].regNo + "</td>"
							+	"<td>" + dataList[i].regDate + "</td>"
							+	"<td>" + dataList[i].memNo + "</td>"
							+	"<td>" + dataList[i].regPrice + "<br>" 
							+	"<td>" + dataList[i].regPay + "</td>"
							+	"<td>" + dataList[i].depositSta 
							+ 	"<button type='button' class='btn btn-sm btn-secondary regChange-btn'>수정</button>" + "</td>"
							+	"<td>" + dataList[i].regSta + "</td></tr>"
					}
		    	  $("#regMng-result tbody").html(value);
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
        <div id="regMng-result">
            <b>조회 결과</b><br>
            <br>

            <table width="100%" class="table" id="regMng-list" >
                <thead>
                    <tr>
                        <td>주문번호</td>
                        <td>결제일자</td>
                        <td>고객ID</td>
                        <td>결제금액</td>
                        <td>결제수단</td>
                        <td>결제상태</td>
                        <td>수강상태</td>
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
	    $(document).on("click", ".regChange-btn", function(){
	    	$(".regNo").val($(this).parent().siblings().eq(0).text());
	    	$('.regChangeModal').modal('show'); 
	    	let regChange = $(this);
	    	$(".modal-body label").each(function(){
				if($(regChange).parent().text().includes($(this).text())){
					$(this).prev().attr("checked", true);
				}
			})
	    })
    </script>
    <div class="modal regChangeModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <form action="<%= contextPath%>/update.reg">
                    <div class="modal-body">
                        <b>결제 상태 변경</b> <br><br>
                        <div align="center">
                        <input type="radio" id="N" value="N" name="depositSt"> <label for="N">입금대기</label>
                        <input type="radio" id="Y" value="Y" name="depositSt"> <label for="Y">결제완료</label> <br><br>
                        <button type="submit" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;">저장</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                    <input type="hidden" name="regNo" class="regNo">
                </form>
            </div>  
        </div>
    </div>
</head>
<body>
    
</body>
</html>