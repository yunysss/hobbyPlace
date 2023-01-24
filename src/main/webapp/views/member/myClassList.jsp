<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#classnull{
		text-align: center;
		margin-top: 71px;
	}
	#classnull img{
		width: 100px;
	}

	#classList{
		margin-top: 71px;
	}
	#classContent p {margin-top: 5px; margin-left:18px; margin-bottom: 0;}
	#classContent{
		width: 80%;
		height: 300px;
		margin: auto;
		border: 1px solid lightgray;
		border-radius: 5px;

	}
	
	#classContent img {
		width: 200px;
		height: 200px;
		padding: 10px;
	}

	#class-area{
		margin-bottom: 10px;
	}

	#classThumbnail{
		text-align: center;
		width: 200px;
		float: left;
		margin:5px;
	}
	#classDetail{
		width: 400px;
		float: left;
		margin: 5px;;
		
	}
	#classStatusAp{
		margin: 10px;
		background-color: rgb(26, 188, 156);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}


	#classStatusX, #classStatusDone{
		margin: 10px;
		background-color: rgb(180, 186, 185);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}
	#classDetail table{width: 90%; margin-top: 16px;}

	#classDetail thead td {font-size: 12px; color: gray;}

	#classTitle{
		font-weight: bold;
		font-size: 20px;
		height: 43px;
	}
	#classDetail tfoot button{
		width: 150px;
		height: 35px;
		margin: 12px;
		border-radius: 5px;
		border: 0;
	}

	#btn1, #reTake{background: rgb(35, 104, 116); color:white;}

	.modalTB { width: 420px; margin: 0;}
	#payment1 {text-align: right; font-size: 10px;}
	#payment2 {text-align: right;}
	#detailLine{
		background: lightgray; 
		text-align: center; 
		font-weight: bold; 
		font-size: small;
	}


</style>
</head>
<body>
	<%@ include file = "../common/myClassMenubar.jsp" %>
			
		<div class="content">

			<!-- 결제한 클래스가 없을때-->
			
			<div id="classnull">
				<img src="<%=contextPath%>/resources/images/myClassNull.jpg" alt="">
				<p>아직 신청 내역이 없어요!<br>
				지금 바로 합플을 시작해 보세요.</p>
				<button type="button" class="btn btn-light" id="findClass" onclick="">클래스 찾아보기</button>
			</div>


			<!--결제한 승인완료 클래스가 있을 때-->
			<div id="classList">
				<div id="class-area">
										
					<div id="classContent">
						<p>2023-01-03 결제</p>
						<div id="classThumbnail">
							<img src="<%=contextPath%>/resources/classThumbnail_upfiles/sjLesson01.jpg" alt=""> <!--클래스썸네일대표사진-->
							<br>
							<p>강보람<br>튜터</p>
						</div>
						<div id="classDetail">
							<table  border="0">
								<thead>
									<tr>
										<td >주문번호</td>
										<td colspan="3">B3425R23</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" id="classTitle">가장 쉽게 배우는 JAVA</td>
									</tr>
									<tr>
										<td colspan="4">사당 / 2023-01-07(토) 17:00</td>
									</tr>
									<tr>
										<td height="50px"><div id="classStatusAp">승인완료</div></td>
										<td colspan="3"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><button id="btn1" onclick="">1:1문의</button></td>
										<td colspan="2"><button id="btn2" onclick="" data-toggle="modal" data-target="#myModal">결제상세내역</button></td>
									</tr>
								</tfoot>	
							</table>
						</div>

					</div>
				</div>
			</div>

			<!--결제한 승인 전 클래스-->
			
				<div id="class-area">
										
					<div id="classContent">
						<p>2023-01-03 결제</p>
						<div id="classThumbnail">
							<img src="<%=contextPath%>/resources/classThumbnail_upfiles/sjLesson01.jpg" alt=""> <!--클래스썸네일대표사진-->
							<br>
							<p>강보람<br>튜터</p>
						</div>
						<div id="classDetail">
							<table  border="0">
								<thead>
									<tr>
										<td >주문번호</td>
										<td colspan="3">B3425R23</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" id="classTitle">가장 쉽게 배우는 JAVA</td>
									</tr>
									<tr>
										<td colspan="4">사당 / 2023-01-07(토) 17:00</td>
									</tr>
									<tr>
										<td height="50px"><div id="classStatusX">승인 전</div></td>
										<td colspan="3"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><button id="btn1" onclick="">1:1문의</button></td>
										<td colspan="2"><button id="btn2" data-toggle="modal" data-target="#myModal">결제상세내역</button></td>
									</tr>
								</tfoot>	
							</table>
						</div>

					</div>
				</div>
			

		

			<!--결제한 승인 전 클래스-->
			<div id="class-area">
									
				<div id="classContent">
					<p>2023-01-03 결제</p>
					<div id="classThumbnail">
						<img src="<%=contextPath%>/resources/classThumbnail_upfiles/sjLesson01.jpg" alt=""> <!--클래스썸네일대표사진-->
						<br>
						<p>강보람<br>튜터</p>
					</div>
					<div id="classDetail">
						<table  border="0">
							<thead>
								<tr>
									<td >주문번호</td>
									<td colspan="3">B3425R23</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" id="classTitle">가장 쉽게 배우는 JAVA</td>
								</tr>
								<tr>
									<td colspan="4">사당 / 2023-01-07(토) 17:00</td>
								</tr>
								<tr>
									<td height="50px"><div id="classStatusDone">수강 완료</div></td>
									<td colspan="3"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"><button id="reTake" onclick="">재수강</button></td>
									<td colspan="2"><button id="btn2" data-toggle="modal" data-target="#myModal">결제상세내역</button></td>
								</tr>
							</tfoot>	
						</table>
					</div>

				</div>
			</div>
		
		</div>

		<!-- 결제상세내역 Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
			  <div class="modal-content">
			  
				<!-- Modal Header -->
				<div class="modal-header">
				  <h5 class="modal-title" style="margin-left: 163px; font-weight: bold;">결제 상세 내역</h5>
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" style="margin:auto">
					<div>
						<table class="modalTB" >
							<tr>
								<td rowspan="2" >결제 금액</td>
								<td colspan="2" id="payment1">신용카드</td>
							</tr>
							<tr>
								<td colspan="2" id="payment2">45,000</td>
							</tr>
							<tr>
								<td colspan="3" id="detailLine">세부내용</td>
							</tr>
							<tr >
								<td colspan="2" style="font-size: 11px; color: gray;">주문번호 B3425R23</td>								
								<td rowspan="4" style="text-align: right;" width="80px">45,000원</td>
							</tr>
							<tr>
								<td colspan="2">쉽게 배우는 JAVA</td>
							</tr>
							<tr>
								<td colspan="2"> 강보람 튜터</td>
							</tr>
							<tr>
								<td width="120px">클래스 수강권 x </td>
								<td>1</td>
							</tr>
							
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal" id="refundBtn" onclick="">환불신청</button>
				</div>
				
			  </div>
			</div>
		  </div>
		  
      
    </div>	



	<script>
		$(function(){
			$("#findClass").click(function(){
				location.href="<%=contextPath%>/main.tee";
			})

			/* 1:1문의로 가는 버튼*/
			$("#btn1").click(function(){
				location.href="<%=contextPath%>/..";
			})
			/*환불신청 버튼*/
			$("#refundBtn").click(function(){
				location.href="<%=contextPath%>/refundReqForm.tee";
			})
			/*재수강 버튼*/
			$("#reTake").click(function(){
				location.href="<%=contextPath%>/..";
			})
		})
	</script>
	
		
		
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>