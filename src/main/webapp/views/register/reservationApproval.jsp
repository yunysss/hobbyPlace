<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; padding:30px 50px;}
        #rsvApproval{width:800px; margin:auto;}
        #rsvApproval>div, #rsvListAll>div{padding:20px;}

        .rsvList{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            height:180px;
            cursor: pointer;
            margin-bottom:20px;
        }
        .rsvList>div{
        	float:left;
        	height:100%;
            width:50%;
        }
        #rsvListAll span{
            color:white;
            border-radius:15px;
            display: inline-block;
            height:30px;
            width:80px;
            text-align:center;
            font-size: 12px;
            line-height: 28px;
        }
        
        input[type=radio]{display: none;}
	   	input[type=radio]+label{
	   		margin:10px;
	       display: inline-block;
	       cursor: pointer;
	       padding: 5px 8px;
	       text-align: center;
	       border-radius: 5px;
	       background-color: lightgray;
	       line-height: 16px;
	       height:40px;
        	width:120px;
        	line-height:30px;
	   }
	   input[type=radio]:checked+label{
	       background-color: gray;
	       color:white;
	   }
	   input[type=radio]:hover+label{
	       background-color: gray;
	       color:white;
	   }
	   input[name=regNo]{
        	border:none;
        	pointer-events: none;
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">
        <h5><b>예약 승인</b></h5><br>
        <div id="rsvApproval">
            <div align="center">
                <input type="radio" id="selectAll" name="appSta" value="승인" checked><label for="selectAll">전체</label>
				<input type="radio" id="selectNew" name="appSta" value="전"><label for="selectNew">NEW</label>
				<input type="radio" id="selectFin" name="appSta" value="완료"><label for="selectFin">승인완료</label>
				<input type="radio" id="selectReject" name="appSta" value="반려"><label for="selectReject">신청반려</label>
            </div>
            <script>
			    let totalData; 
			    let dataPerPage=5; 
			    let pageCount = 10; 
			    let globalCurrentPage=1; 
			    let dataList; 
			
			    $(function () {
				     selectApproval();
				     $(document).on("click", ".rsvList", function(){
				    	 location.href = "<%=contextPath%>/regDetail.tt?no=" + $(this).find($("input[name='regNo']")).val();
				     })
			    })
			    $("input[type=radio]").change(function(){
			    	selectApproval();
		    	})
			    function selectApproval(){
		    		$.ajax({
		    			url:"<%=contextPath%>/approvalList.tt",
		    			data:{
		    				status:$("input[name=appSta]:checked").val()
		    			},
		    			success:function(d){
		    				if(d.length == 0){
		    					let value = "<div align='center'><b>조회된 내역이 없습니다.</b></div>"
		    						
		    					$("#rsvListAll").html(value);
		    					$("#paging").html("");
		    				} else{
		    	 		    	   totalData = d.length;
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
			    		  value += "<div class='rsvList'>"
			    		  		+ 	"<div>"
			    		  		+ 		"주문번호 <input type='text' name='regNo' value='"+ dataList[i].regNo + "'><br>"
			    		  		+		dataList[i].regDate + "<br>"
			    		  		+		dataList[i].memNo + " 수강생<br>"
			    		  		+		"<h5>" + dataList[i].clNo + "</h5><br>"
			    		  		+		"진행일시 : " + dataList[i].teachDate + "&nbsp;" + dataList[i].schNo
			    		  		+	"</div>"
			    		  		+ 	"<div align='right'>";
			    		  if(dataList[i].regSta == '0'){
	                    		value += "<span style='background:rgb(241, 196, 15)'>"
	                    				+	"<b>NEW</b></span>"	
	                    	} else if(dataList[i].regSta == '1' || dataList[i].regSta == '2'){
	                    		value += "<span style='background:rgb(22, 160, 133)'>"
	                				+	"<b>승인완료</b></span>"	
	                    	} else if(dataList[i].regSta == '4'){
	                    		value += "<span style='background:rgb(180, 180, 180)'>"
	                				+	"<b>신청반려</b></span>"	
	                    	} 
			    		  value += "</span></div></div>";
			    	  }
			    	  $("#rsvListAll").html(value);
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
            <div id="rsvListAll">
            </div>
            <div align="center">
            	<ul id="paging"></ul>
        	</div>
        </div>
        
    </div>
    
</body>
</html>