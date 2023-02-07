<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.hp.register.model.vo.Register"%>
<%
	ArrayList<Register> bfList = (ArrayList<Register>)request.getAttribute("bfList"); 
	ArrayList<Register> atList = (ArrayList<Register>)request.getAttribute("atList"); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
div {
	margin: auto;
}

.outer {
	width: 1000px;
	height: 100vh;
	margin: auto;
	padding: 25px;
}

.btn_area {
	text-align: right;
	width: 85%;
}

.btn_area button {
	width: 70px;
	height: 30px;
	border: 0;
	background: rgb(218, 217, 217);
	border-radius: 3px;
}

#click_btn {
	background: rgb(22, 160, 133);
	color: white;
}

.tb_box {
	height: 40%;
	width: 100%;
}

table {
	margin: auto;
	border: 1px solid rgb(99, 99, 99);
	border-collapse: collapse;
}

th {
	background: rgb(243, 240, 240);
}

#select-area {
	margin: auto;
	width: 50px;
	background: rgb(22, 160, 133);
}

#select-area a {
	color: white;
	text-decoration: none;
}

.paging-area {
	text-align: center;
}

.paging-area button {
	width: 25px;
	height: 23px;
}

#bfBtn {
	background: rgb(22, 160, 133);
	color: white;
}

#af-classList {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp"%>
	<div class="outer">
		<h5>
			<b>예약 관리</b>
		</h5>
		<br>

		<div class="btn_area">
			<button type="button" id="bfBtn" >수강전</button>
			<button type="button" id="atBtn" >수강완료</button>
		</div>

		<!-- 수강전 버튼을 눌렀을때-->
		<div class="tb_box classList" id="bf-classList">
			<table class="table-bordered" id = "before-table-bordered" style="text-align: center;">
				<br>
				<thead>
					<tr>
						<th width="70px" height="25px">상태</th>
						<th width="60px">튜티명</th>
						<th width="125px">전화번호</th>
						<th width="350px">예약 클래스</th>
						<th width="100px">예약 날짜</th>
						<th width="45px">인원</th>
						<th width="100px">상세조회</th>
					</tr>
				</thead>
				
				<tbody id = "before-class-body" class = "before-class-body">
					
				</tbody>
				
			</table>
			<br> <br>

		</div>

		

		<!--수강완료 버튼을 눌렀을때-->
		<div class="tb_box classList" id="af-classList">
			<table class="table-bordered" id="after-table-bordered" style="text-align: center;">
				<br>
				<thead>
				<tr>
					<th width="70px" height="25px">상태</th>
					<th width="60px">튜티명</th>
					<th width="125px">전화번호</th>
					<th width="350px">수강 클래스</th>
					<th width="100px">수강 날짜</th>
					<th width="45px">인원</th>
					<th width="100px">상세조회</th>
				</tr>
				</thead>
				
				<tbody >
					
					
				</tbody>

			</table>
		</div>
		

		<script>
			
			$(function(){
				$("#atBtn").click(function(){
					$.ajax({
						url:"<%=contextPath%>/atList.tt",
						success:function(a){
							if(a.length==0){
								let value = "<tr>"
											  +	"<td colspan='7' height='30px'>수강완료 클래스가 없습니다.</td>"
										 + "</tr>"
							    $("#table-bordered tbody").html(value);
								
							}else{
								let value = "";
								for (let i = 0; i < a.length; i++) {
	            					value += "<tr>"
	        		                    		+ "<td height='25px'>" + a[i].regSta + "</td>"
	        		                    		+ "<td>" + a[i].memName + "</td>"
	        		                    		+ "<td>" + a[i].memPhone + "</td>"
	        		                   			+ "<td>" + a[i].clName + "</td>"
	        		                    		+ "<td>" + a[i].teachDate + a[i].startTime + "</td>"
	        		                    		+ "<td>" + a[i].regCount + "명 </td>"
	        		                    		+ "<td><div id='select-area'>"
	        		                    		+ "<a href='<%=contextPath %>/reservationDetail.tt?no="+ a[i].regNo +"'> 조회</a></div>"
												+ "</td>"
											+ "</tr>";
							} //end of for
							$("#after-table-bordered tbody").html(value);
							$("#atBtn").css("background-color", "rgb(22, 160, 133)").css("color", "white");
				        	$("#bfBtn").css("background-color", "rgb(218, 217, 217)").css("color", "black");
				
				            // div display 변화
				            $("#bf-classList").hide();
				            $("#af-classList").show();
							} // end of else
						}
							,error:function(){
							console.log("ajax 통신 실패");
						}// end of error
					   
					})
				 })	
				})
			$(function(){
				$("#bfBtn").click(function(){
					$.ajax({
						url:"<%=contextPath%>/bfList.tt",
						success:function(b){
							if(b.length==0){
								let value = "<tr>"
											  +	"<td colspan='7' height='30px'>수강전 클래스가 없습니다.</td>"
										 + "</tr>"
							    $("#table-bordered tbody").html(value);
								
							}else{
								let value = "";
								for (let i = 0; i < b.length; i++) {
	            					value += "<tr>"
	        		                    		+ "<td height='25px'>수강전</td>"
	        		                    		+ "<td>" + b[i].memName + "</td>"
	        		                    		+ "<td>" + b[i].memPhone + "</td>"
	        		                   			+ "<td>" + b[i].clName + "</td>"
	        		                    		+ "<td>" + b[i].teachDate + b[i].startTime + "</td>"
	        		                    		+ "<td>" + b[i].regCount + "명 </td>"
	        		                    		+ "<td><div id='select-area'>"
	        		                    		+ "<a href='<%=contextPath %>/reservationDetail.tt?no="+ b[i].regNo +"'> 조회</a></div>"
												+ "</td>"
											+ "</tr>";
							} //end of for
							$("#before-table-bordered tbody").html(value);
							$("#bfBtn").css("background-color", "rgb(22, 160, 133)").css("color", "white");
				        	$("#atBtn").css("background-color", "rgb(218, 217, 217)").css("color", "black");
				
				            // div display 변화
				            $("#af-classList").hide();
				            $("#bf-classList").show();
							} // end of else
						}
							,error:function(){
							console.log("ajax 통신 실패");
						}// end of error
					   
					})
				 })	
				})
		</script>
		
		

	

	</div>
	</div>
</body>
</html>