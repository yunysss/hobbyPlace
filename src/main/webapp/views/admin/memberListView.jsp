<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	div{box-sizing:border-box;}
	/*div{border:solid 1px black;}*/
	.cWrap{width:100%; padding:10px; padding-right:0;}
	.sGroup{width:33px;}
	.searchWrap{width:90%; border:1px solid lightgray; border-radius:10px; padding:15px; padding-left:40px;}
	.fCategory{width:120px; height:35px; margin-left:10px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.sCategory{width:120px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}

	.lineup{width:120px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	#searchKey1{width:250px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	#searchKey2{width:150px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185); margin-bottom:0; padding-bottom:0;}
	#warningInfo{margin-left:130px; margin-top:0; padding-top:0;}
	.sButton{width:80px; height:35px; border:0; background-color: lightgray; border-radius: 3px; margin-left:10px;}
	.dtButton{float:left;}
	.switchButton{box-sizing:border-box; width:50px; padding-top:0px; float:left;}
	#flexSwitchCheck{box-sizing:border-box; width:40px; margin-left:0px; height:20px;}
	.dtCate{margin-left:68px;}
	#selectValue{width:100px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.listTable{width:auto;}
	thead{background:rgb(245, 245, 245);}
	.listTable>tbody>tr:hover{cursor:pointer;}
	.listTable td, .listTable th{vertical-align: middle; text-align: center; font-size:14px;}
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
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap" align="center">
		<div class="searchArea">

			<h4 align="left">전체 회원 관리</h4>
			<br>
			<div class="searchWrap" align="left">
				<input type="radio" name="sGroup" class="sGroup" id="entire" value="all" checked><label for="entire">전체</label>
				<input type="radio" name="sGroup" class="sGroup" id="tutorMem" value="tutor"><label for="tutorMem">튜터 등록 회원</label>
				<input type="radio" name="sGroup" class="sGroup" id="generalMem" value="general"><label for="generalMem">튜터 미등록 회원</label>

				<br>
				<p>기본검색</p>
				<select name="fCategory" class="fCategory">
					<option value="enroll_date">회원가입일</option>
					<option value="mem_no">회원번호</option>
					<option value="mem_name">이름</option>
					<option value="regcount">수강횟수</option>
					<option value="revcount">리뷰</option>
					<option value="likecount">찜</option>
					<option value="totalpay">결제금액</option>
				</select>

				<select name="lineup" class="lineup">
					<option value="desc">내림차순</option>
					<option value="asc">오름차순</option>
				</select>

				<button type="button" class="sButton" id="basicSearch" onclick="bSearch();">검색</button>
				
				<br>
				
				<div class="dtButton">
				세부검색	  
				</div>
				
				<div class="form-check form-switch form-check switchButton">
					<input class="form-check-input" type="checkbox" id="flexSwitchCheck">
				</div>
				
				<br clear="both">
				
				<div class="dtCate" style="display:none">
				<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				
					<br>
				
					가입기간 &nbsp;&nbsp;
					<input type="text" id="datepicker1" name="enroll-start">
					 - 
					<input type="text" id="datepicker2" name="enroll-end">
					
					<script>
				        $(function() {
				            //모든 datepicker에 대한 공통 옵션 설정
				            $.datepicker.setDefaults({
				                dateFormat: 'yy-mm-dd' //Input Display Format 변경
				                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
				                ,changeYear: true //콤보박스에서 년 선택 가능
				                ,changeMonth: true //콤보박스에서 월 선택 가능                
				                //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
				                //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
				                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
				                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
				                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
				                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
				                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
				                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
				                ,minDate: "-2Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				                ,maxDate: "TODAY" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				            });
				 
				            //input을 datepicker로 선언
				            $("#datepicker1").datepicker();                    
				            $("#datepicker2").datepicker();
				            
				            //From의 초기값을 오늘 날짜로 설정
				            $('#datepicker1').datepicker('setDate', '-2Y'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				            //To의 초기값을 내일로 설정
				            $('#datepicker2').datepicker('setDate', 'TODAY'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				        });
			    	</script>	
					
					<br><br>
					
					<select name="sCategory" class="sCategory">
						<option value="mem_name">이름</option>
						<option value="mem_email">이메일</option>
						<option value="mem_addr">주소</option>
						<option value="mem_phone">연락처</option>
						<option value="regcount">수강횟수</option>
						<option value="revcount">리뷰</option>
						<option value="likecount">찜</option>
						<option value="totalpay">결제금액</option>
						<option value="gender">성별</option>
						<option value="mem_status">탈퇴여부</option>
					</select>
				
					<input type="text" name="searchKey1" id="searchKey1">
					<input type="text" name="searchKey2" id="searchKey2" style="display:none">
					<select name="selectValue" id="selectValue" style="display:none"></select>
					
					<button type="button" class="sButton" id="detailSearch" onclick="dSearch();">검색</button>
					<br>
					<p id="warningInfo"></p>
					<br>
				</div>
		</div>
		<script>
			$(function(){
				// 세부검색창에서 성별과 탈퇴여부 옵션 선택하면 텍스트검색창사라지고 select창 나타내기
				$(".sCategory").change(function(){
					if($(this).val()=='gender'){
						$("#searchKey1").empty();
						$("#searchKey1").css("display", "none");
						$("#searchKey2").empty();
						$("#searchKey2").css("display", "none");
						$("#warningInfo").html("");
						$("#selectValue").show();
						$("#selectValue").empty();
						$("#selectValue").append("<option value='M'> 남성 </option>");
						$("#selectValue").append("<option value='F'> 여성 </option>");
						$("#selectValue").append("<option value='X'> 선택안함 </option>");
					}else if($(this).val()=='mem_status'){
						$("#searchKey1").empty();
						$("#searchKey1").css("display", "none");
						$("#searchKey2").empty();
						$("#searchKey2").css("display", "none");
						$("#warningInfo").html("");
						$("#selectValue").show();
						$("#selectValue").empty();
						$("#selectValue").append("<option value='Y'> 탈퇴X </option>");
						$("#selectValue").append("<option value='N'> 탈퇴O</option>");
					}else if($(this).val()=='regcount' || $(this).val()=='revcount' || $(this).val()=='likecount' ||  $(this).val()=='totalpay'){
						$("#searchKey1").empty();
						$("#searchKey1").css("display", "none");
						$("#searchKey2").show();
						$("#warningInfo").html("숫자만 입력하세요").css("color", "red");
						$("#selectValue").empty();
						$("#selectValue").css("display", "none");
					}else{
						$("#searchKey1").empty();
						$("#searchKey1").show();
						$("#searchKey2").empty();
						$("#searchKey2").css("display", "none");
						$("#warningInfo").html("");
						$("#selectValue").empty();
						$("#selectValue").css("display", "none");
					}
				});
				
				// 스위치 버튼 누르면 세부검색창 보여지기+기존검색버튼 사라짐
				$("#flexSwitchCheck").click(function(){
					var checked = $("#flexSwitchCheck").is(":checked");
					if(checked){
						$("#basicSearch").css("display", "none");
						$(".dtCate").show();
					}else{
						$("#basicSearch").show();
						$(".dtCate").css("display", "none");
						//$(".dtCate").children().val('');
					}
				});	
			})
		</script>
		
		
		<script>
			let totalData; 
		    let dataPerPage=10; 
		    let pageCount = 10; 
		    let globalCurrentPage=1; 
		    let dataList;
		    
			<!-- 기본검색용 -->
			function bSearch(){
				$.ajax({
					url:"<%=contextPath%>/memberBasicSearch.ad",
					data:{
						sGroup:$('[name=sGroup]:checked').val(),
						fCategory:$(".fCategory").val(),
						lineup:$(".lineup").val()
					},
					type:"post",
					success:function(result){
						console.log(result);
						if(result.length == 0) {
							let value = "<tr>" + "<td colspan='13'>조회된 내역이 없습니다.</td>" + "</tr>";
							$(".listTable tbody").html(value);
							$(".paging-area").html("");
						} else{
							totalData = result.length;
    	 		            dataList=result;
    	 		            displayData(1, dataPerPage, totalData);
    	 		            paging(totalData, dataPerPage, pageCount, 1);
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
				
			}
		
			<!-- 세부검색용 -->
			function dSearch(){
				//console.log($("#datepicker1").val());
				$.ajax({
					url:"<%=contextPath%>/memberDetailSearch.ad",
					data:{
						sGroup:$('[name=sGroup]:checked').val(),
						fCategory:$(".fCategory").val(),
						lineup:$(".lineup").val(),
						enrollStart:$("#datepicker1").val(),
						enrollEnd:$("#datepicker2").val(),
						sCategory:$(".sCategory").val(),
						searchKey1:$("#searchKey1").val(),
						searchKey2:$("#searchKey2").val(),
						selectValue:$("#selectValue").val(),
						
					},
					type:"post",
					success:function(result){
						if(result.length == 0) {
							let value = "<tr>" + "<td colspan='13'>조회된 내역이 없습니다.</td>" + "</tr>";
							$(".listTable tbody").html(value);
							$(".paging-area").html("");
						} else{
							totalData = result.length;
    	 		            dataList=result;
    	 		            displayData(1, dataPerPage, totalData);
    	 		            paging(totalData, dataPerPage, pageCount, 1);
						}
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
			}
			
			<!-- 결과 리스트 디스플레이 -->
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
			        			+ "<td>" +dataList[i].memNo +"</td>"
			        			+ "<td>" +dataList[i].memName +"</td>"
			        			+ "<td>" +dataList[i].grade +"</td>"
			        			+ "<td>" +dataList[i].enrollDate +"</td>"
			        			+ "<td>" +dataList[i].regCount +"</td>"
			        			+ "<td>" +dataList[i].revCount +"</td>"
			        			+ "<td>" +dataList[i].likeCount +"</td>"
			        			+ "<td>" +dataList[i].totalpay +"</td>"
			        			+ "<td>" +dataList[i].email +"</td>"
			        			+ "<td>" +dataList[i].phone +"</td>"
			        			+ "<td>" +dataList[i].address +"</td>"
			        			+ "<td>" +dataList[i].gender +"</td>"
			        			+ "<td>" +dataList[i].memDrop +"</td>"
					        + "</tr>";
		    	  }
		    	  $(".listTable tbody").html(chartHtml);
		    	  $("#resultNt").html("<br>** 총 " + dataList.length + "명이 조회되었습니다 **");
		    }
			
			<!-- 페이징처리 -->
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
		
		<div class="contentMain">
  			
  			<p align="left" id="resultNt">
  				
  			</p>
			<div class="container mt-3 table-responsive-xxl" style="overflow-x: auto;">

			  <table class="table table-hover table-responsive-xxl listTable" style="table-layout:fixed;">
			    <colgroup>
					<col style="width:100px;">
					<col style="width:100px;">
					<col style="width:100px;">
					<col style="width:120px;">
					<col style="width:100px;">
					<col style="width:80px;">
					<col style="width:80px;">
					<col style="width:130px;">
					<col style="width:170px;">
					<col style="width:150px;">
					<col style="width:300px;">
					<col style="width:80px;">
					<col style="width:100px;">
				</colgroup>
				<thead>
			      <tr>
			        <th>회원번호</th>
			        <th>이름</th>
					<th>튜터등록</th>
			        <th>가입일</th>
			        <th>수강횟수</th>
			        <th>리뷰</th>
			        <th>찜</th>
			        <th>총결제금액</th>
			        <th>이메일</th>
			        <th>연락처</th>
			        <th>주소</th>
			        <th>성별</th>
			        <th>탈퇴여부</th>
			      </tr>
			    </thead>
			    <tbody class="table-group-divider" id="tbd">
	                <tr>
	                    <td colspan="13">조회된 게시글이 없습니다.</td>
	                </tr>
			    </tbody>
			  </table>
			</div>
			<br>
			<div align="center">
            	<ul id="paging">
				</ul>
            </div>
			<br><br><br><br><br><br>
			<script>
	        	$(function(){
	        		 $("#tbd").on("click", "tr", function(){
	        			 location.href = '<%=contextPath%>/memDetail.ad?no=' + $(this).children().eq(0).text(); 
	                 })
	        	})
        	</script>
        	
        	
		</div>
		
	</div>
	</div>
</body>
</html>