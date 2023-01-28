<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.register.model.vo.Register" %>
<%
	ArrayList<Register> rList = (ArrayList<Register>)request.getAttribute("rList");
	ArrayList<Register> nList = (ArrayList<Register>)request.getAttribute("nList");
	ArrayList<Register> wList = (ArrayList<Register>)request.getAttribute("wList");
	ArrayList<Register> cList = (ArrayList<Register>)request.getAttribute("cList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;}

    .outer{width:1000px; margin:auto; padding:30px 50px;}
    #calculate{width:800px; margin:auto;}
    #cal-2-1{
    	padding:20px;
    }
    #cal-2-1>div{padding:20px;}
    .calList{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
        height:150px;
        margin-bottom:20px;
    }
    .calList>div{float:left; height:100%; width:50%}

    #cal-2 button{
        background:rgb(22, 160, 133);
        color:white;
        margin-top:20px;
    }
    #cal-2 span{
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
        <h5><b>정산 신청</b></h5><br>
        <div id="calculate">
	        <br>
	        <div align="center">
	        	<input type="radio" id="selectAll" name="regCal" value="정산" checked><label for="selectAll">전체</label>
				<input type="radio" id="selectNew" name="regCal" value="미신청"><label for="selectNew">정산 미신청</label>
				<input type="radio" id="selectWait" name="regCal" value="진행중"><label for="selectWait">정산 진행중</label>
				<input type="radio" id="selectComplete" name="regCal" value="완료"><label for="selectComplete">정산완료</label>
	        </div>
	        
	        <script>
			    let totalData; //총 데이터 수
			    let dataPerPage=5; //한 페이지에 나타낼 글 수
			    let pageCount = 10; //페이징에 나타낼 페이지 수
			    let globalCurrentPage=1; //현재 페이지
			    let dataList; //표시하려하는 데이터 리스트
			
			    $(function () {
				     selectCal();
			    })
			    $("input[type=radio]").change(function(){
			    	selectCal();
		    	})
			    function selectCal(){
		    		$.ajax({
		    			url:"<%=contextPath%>/select.cal",
		    			data:{
		    				status:$("input[name=regCal]:checked").val()
		    			},
		    			success:function(d){
		    				if(d.length == 0){
		    					let value = "<div align='center'><b>조회된 내역이 없습니다.</b></div>"
		    						
		    					$("#cal-2-1").html(value);
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
			    	  let value = "";
			    	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
			    	  currentPage = Number(currentPage);
			    	  dataPerPage = Number(dataPerPage);
			    	  if(totalData < dataPerPage){
			    		  dataPerPage = totalData;
			    	  }
			    	  for (let i = (currentPage - 1) * dataPerPage; 
			    	    i < (currentPage - 1) * dataPerPage + dataPerPage;
			    	    i++
			    	  ) {
			    	    value += "<div class='calList'>"
	                    		+ "<div>"
                        		+	"결제일자 : " + dataList[i].teachDate + "<br>"
                        		+	"<h5>" + dataList[i].memNo + "</h5> <br>"
                        		+	"수업일자 : " + dataList[i].clNo + "&nbsp;" + dataList[i].regDate + "<br>"
                       			+	"신청인원 : " + dataList[i].regPrice
                    			+ "</div>"
                    			+ "<div align='right'>";
                    	if(dataList[i].regSta == 'N'){
                    		value += "<span style='background:rgb(241, 196, 15)'>"
                    				+	"<b>미신청</b></span><br><br><br><br>"	
                    	} else if(dataList[i].regSta == 'W'){
                    		value += "<span style='background:rgb(22, 160, 133)'>"
                				+	"<b>정산진행중</b></span><br><br><br><br>"	
                    	} else if(dataList[i].regSta == 'C'){
                    		value += "<span style='background:rgb(231, 76, 60)'>"
                				+	"<b>정산완료</b></span><br><br><br><br>"	
                    	} 
                    	value += 	"<b><label for='" + i + "'>" + dataList[i].schNo + "</label></b>";
                    	if(dataList[i].regSta == 'N'){
                    		value += "<input type='checkbox' name='regNo' id='" + i + "' value=" + dataList[i].regNo + ">"
                    	}
                    	value += "</span></div></div>"
			    	  }
			    	  $("#cal-2-1").html(value);
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
	        <form action="<%= contextPath %>/detail.cal" id="cal-2">
	        	<input type="hidden" name ="sta" value="0">
	        	<div align="right" style="width:780px">
           			<button type="submit" class="btn btn-sm" id="cal-btn" disabled>정산 신청</button>
           		</div>
	        	<div id="cal-2-1">
	        	
	        	</div>
               	<div align="center">
               		<ul id="paging"></ul>
               	</div>
	        </form>
		</div>
		<script>
			$(function(){  
				$(document).on("click", "input:checkbox[name='regNo']", function(){
					if($("input:checkbox[name='regNo']:checked").length>0) {
						$("#cal-btn").attr("disabled", false);
					} else{
						$("#cal-btn").attr("disabled", true);
					}
				})
			})
		</script>
		<!-- 모달 -->
        <div class="modal fade" id="calModal">
          <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
        
              <div class="modal-body" align="center">
                정산 신청 완료되었습니다. <br><br>
                <a href="<%= contextPath %>/views/common/tutorMainPage.jsp" class="btn btn-secondary">튜터 홈으로</a>
                <a href="<%= contextPath %>/views/calculate/calculateList.jsp" class="btn btn-secondary">정산 내역 조회</a>
              </div>
        
            </div>
          </div>
        </div>
	</div>
</body>
</html>