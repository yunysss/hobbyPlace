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
        

</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
            <form action="<%=contextPath%>/search.ad" method="post">
            <table id="class-select">
                <tr>
                    <th width="100">검색어</th>
                    <td>
                        <input type="search" name="keyword">

                    </td>

                </tr>

                <tr>
                    <th width="100">카테고리</th>
                    <td>
                        <select id="category" name="category" onchange="changeCt();">
                        <%for(Category c : cList){ %>
                            <option value="<%=c.getCtNo()%>"><%=c.getCtName() %></option>
                        <%} %>
                        </select>
                        <select id="Dcategory" name ="dCategory">
                        
                        </select>
                    </td>


                </tr>

                <tr>
                    <th>조회기간</th>
                            <td>
                                <div class="clearfix">
                                    <!-- 시작일 -->
                                    <span class="dset">
                                        <input type="text" class="datepicker inpType" name="startDate" id="searchStartDate" >
                                        <a href="#none" class="btncalendar dateclick"></a>
                                    </span>
                                    <span class="demi">-</span>
                                    <!-- 종료일 -->
                                    <span class="dset">
                                        <input type="text" class="datepicker inpType" name="endDate" id="searchEndDate" >
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
                        <input type="checkbox" name="status" id="chkAll" value="">
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
            <button class="btn btn-secondary btn-sm" >조회하기</button>

            </div>
            </form>
            <script>
            
            
           </script>
		</div>
            <br><br>
        <table class="table table-hover" id="classList" >
            <thead class="thead-light">
                <tr>
                    <th width="100">클래스번호</th>
                    <th width="120">카테고리</th>
                    <th width="400">클래스명</th>
                    <th width="100">등록일</th>
                    <th width="100">튜터명</th>
                    <th width="100">상태</th>
                </tr>
            </thead>
            
            <tbody>
            		<!-- 등록된 클래스 없을경우  -->
                	<%if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="5">등록된 클래스가 없습니다.</td>
                        
                    </tr>
                	<%} else{%>
                	<!-- 등록된 클래스 있을경우  -->
	                	<%for(Lesson c : list){ %>
	                    <tr>
	                        <td><%=c.getClNo() %></td>
	                        <td><%=c.getCtNo() %></td>
	                        <td><%=c.getClName() %></td>
	                        <td><%=c.getEnrollDate() %></td>
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
        
         <script>
                        function changeCt(){
                        	var study = ["외국어","자격증","IT"];
                        	var diy = ["가죽/라탄","비누/꽃/향","뜨개/자수","기타"];
                        	var draw = ["취미미술","캘리그래피"];
                        	var cook = ["요리","베이킹"];
                        	var sport = ["실내스포츠","야외스포츠","레저/액티비티","요가필라테스/헬스PT"];
     	
                        	var changeDct;
                        	
                        	if( $("#category").val() == "11"){
                        		changeDct = study;
                        		
                        	}else if( $("#category").val() == "22"){
                        		changeDct = diy;
                        	}else if( $("#category").val() == "33"){
                        		changeDct = draw;

                        	}else if( $("#category").val() == "44"){
                        		changeDct = cook;
                        	}else if( $("#category").val()== "55"){
                        		changeDct = sport;
                        	}
                        	
                        	$("#Dcategory").empty();
                        	for(var i=0; i<changeDct.length; i++){
                        		var option = $("<option>"+changeDct[i]+"</option>");
                        		$("#Dcategory").append(option);
                        	}
                        	
                        }
                        
                        </script>
                        
                    
                    
        
        


     



    </div>
    
</body>
</html>