<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #refundNull{
		text-align: center;
		margin-top: 71px;
	}
	#refundNull img{
		width: 65px;
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
		background-color: rgb(178, 41, 41);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}

	

	#classStatusX{
		margin: 10px;
		background-color: rgb(180, 186, 185);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}
	#classDetail table{width: 90%; margin-top: 16px; }

	#classDetail thead td{font-size: 12px; color: gray;}

	#classTitle{
		font-weight: bold;
		font-size: 20px;
		height: 43px;
	}
	#classDetail tfoot button{
		width: 270px;
		height: 35px;
		margin: 12px;
		border-radius: 5px;
		border: 0;
	}

	#btn1{background: rgb(35, 104, 116); color:white;}

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
			
		<div class="content" align="center">

			<!-- 환불한 클래스가 없을때-->
			
			<div id="refundNull">
				<img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png" alt="">
                <br>
                <br>
				<p>환불한 클래스가 없습니다.</p>
			</div>
           
            <!--취소한 클래스가 있을 때-->
            <!--환불 접수 접수 -->
			<div id="classList">
				<div id="class-area">
										
					<div id="classContent">
						<p style="text-align:left">2023-01-03 취소</p>
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
										<td height="50px"><div id="classStatusAp">환불 접수</div></td>
										<td colspan="3"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4"><button id="btn2" onclick="" data-toggle="modal" data-target="#myModal">환불 상세 내역</button></td>
									</tr>
								</tfoot>	
							</table>
						</div>

					</div>
				</div>
			

            <!--환불완료 클래스-->
			
				<div id="class-area">
										
					<div id="classContent">
						<p>2023-01-03 취소</p>
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
										<td height="50px"><div id="classStatusX">환불 완료</div></td>
										<td colspan="3"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4"><button id="btn2" data-toggle="modal" data-target="#myModal">환불 상세 내역</button></td>
									</tr>
								</tfoot>	
							</table>
						</div>

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
				  <h5 class="modal-title" style="margin-left: 163px; font-weight: bold;">환불 상세 내역</h5>
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
                            <tr>
                                <td colspan="3" height="1px" style="background: gray;"></td>
                            </tr>
                            <tr>
                                <td height="45px">최종 환불 금액</td>
                                <td colspan="3" style="text-align: right;">45,000원</td>
                            </tr>
							
						</table>
                        
                        
					</div>
				</div>
				
			  </div>
			</div>
		  
			
		 </div>

		 <div class="paging-area" style="align:center;">
			<button>&lt;</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>&gt;</button>

		 </div> 
		  
      
    </div>	
		
	<%@ include file = "../common/footerbar.jsp" %>




</body>
</html>