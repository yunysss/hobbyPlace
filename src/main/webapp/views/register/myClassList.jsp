<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.hp.register.model.vo.Register, com.hp.common.model.vo.PageInfo" %>
 <%
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
 	ArrayList<Register> list = (ArrayList<Register>)request.getAttribute("list");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	
	#classnull{
		width: 100%;
		height: 90%;
		text-align: center;
		margin-top: 70px;
	}
	#classnull img{
		width: 100px;
	}

	#classList{
		margin-top: 10px;
	}
	#classContent p {margin-top: 5px; margin-left:18px; margin-bottom: 0;}
	#classContent{
		width: 80%;
		height: 270px;
		margin: auto;
		border: 1px solid lightgray;
		border-radius: 5px;

	}
	
	#classContent img {
		width: 180px;
		height: 180px;
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
		margin: 0;
		
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

	.csBtn, #reTake{background: rgb(35, 104, 116); color:white;}

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
			<!--로그인한 유저가 결제한 클래스가 없을 때 -->
			
			<%if(loginUser != null && list.isEmpty()) {%>				
				<div  id="classnull">
					<img src="<%=contextPath%>/resources/images/myClassNull.jpg" alt="">
					<p>아직 신청 내역이 없어요!<br>
					지금 바로 합플을 시작해 보세요.</p>
					<button type="button" class="btn btn-light" id="findClass" onclick="">클래스 찾아보기</button>
				</div>
			
			<%} else{ %>
			<!--결제한 승인완료 클래스가 있을 때-->
				<%for(int i=0; i<list.size(); i++){ %>
				
					<div id="class-area">
										
						<div id="classContent">
							<p style="text-align:left"><%=list.get(i).getRegDate() %> 결제</p>
								<div id="classThumbnail">
									<img src="<%=contextPath%>/<%=list.get(i).getClThumb() %>"> 
									<br>
									<p><%=list.get(i).getTtName() %></p>
								</div>
							<div id="classDetail">
								<table  border="0">
									<thead>
										<tr>
											<td >주문번호</td>
											<td colspan="3"><%=list.get(i).getRegNo() %></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4" id="classTitle"><%=list.get(i).getClName() %></td>
										</tr>
										<tr>
											<td colspan="4"><%=list.get(i).getDistrName() %>  <%=list.get(i).getTeachDate() %> <%=list.get(i).getStartTime() %></td>
										</tr>
										
										<tr>
											<%if(list.get(i).getRegSta().equals("1")){%>
												<td height="50px"><div id="classStatusAp">승인완료</div></td>
												<td colspan="3"></td>
											<%} else if(list.get(i).getRegSta().equals("0")){%>
												<td height="50px"><div id="classStatusX">승인전</div></td>
												<td colspan="3"></td>
											<%} else if (list.get(i).getRegSta().equals("2")){%>
												<td height="50px"><div id="classStatusDone">수강완료</div></td>
												<td colspan="3"></td>
											<%} %>
										
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><button class="csBtn" onclick="">1:1문의</button></td>
											<td colspan="2"><button id="btn2" onclick="" data-toggle="modal" data-target="#myModal<%=i%>">결제상세내역</button></td>
										</tr>
									</tfoot>	
								</table>
							</div>

						</div>
					</div>
				<!-- 결제상세내역 Modal -->
				<div class="modal fade" id="myModal<%=i%>">
					<div class="modal-dialog modal-dialog-centered">
					  <div class="modal-content">
					  
						<!-- Modal Header -->
						<div class="modal-header">
						  <h5 class="modal-title" style="margin-left: 163px; font-weight: bold;">결제 상세 내역</h5>
						  
						</div>
						
						<!-- Modal body -->
						<div class="modal-body" style="margin:auto">
							<div>
								<table class="modalTB" >
									<tr>
										<td rowspan="2" >결제 금액</td>
										<%if(list.get(i).getRegPay().equals("0")){%>
											<td colspan="2" id="payment1">신용카드</td>
										<%} else {%>
											<td colspan="2" id="payment1">무통장입금</td>
										<%} %>
									</tr>
									<tr>
										<td colspan="2" id="payment2"><%=list.get(i).getRegPrice() %></td>
									</tr>
									<tr>
										<td colspan="3" id="detailLine">세부내용</td>
									</tr>
									<tr >
										<td colspan="2" style="font-size: 11px; color: gray;">주문번호 <%=list.get(i).getRegNo() %></td>								
										<td rowspan="4" style="text-align: right;" width="80px"><%=list.get(i).getRegPrice() %></td>
									</tr>
									<tr>
										<td colspan="2"><%=list.get(i).getClName() %></td>
									</tr>
									<tr>
										<td colspan="2"> <%=list.get(i).getTtName() %></td>
									</tr>
									<tr>
										<td width="120px">클래스 수강권 x </td>
										<td><%=list.get(i).getRegCount() %></td>
									</tr>
									
								</table>
							</div>
						</div>
		
						<!-- Modal footer -->
						<div class="modal-footer">
						  <button type="button" class="btn btn-secondary" data-dismiss="modal" id="refundBtn<%=i%>" onclick="location.href='<%=contextPath%>/refundReqForm.ref?no=<%=list.get(i).getRegNo() %>'">환불신청</button>
						</div>
						
					  </div>
					</div>
				</div>
				
				<%} %>
			<%} %> 		
			<script>
				$(function(){
				$("#findClass").click(function(){
					location.href="<%=contextPath%>/main.tee";
				})
	
				/* 1:1문의로 가는 버튼*/
				$(".csBtn").click(function(){
					location.href="<%=contextPath%>/..";
				})
				
				})
			</script>
			<br><br>
			<div class="paging-area" style="align:center;">
				<%if(pi.getCurrentPage()!=1){ %>
				<button onclick="location.href='<%=contextPath%>/myClassList.reg?cpage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
				<%} %>
				
				<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
					<button onclick="location.href='<%=contextPath%>/myClassList.reg?cpage=<%=p%>';"><%= p %></button>
				<%} %>
				
				<%if(pi.getCurrentPage()!=pi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/myClassList.reg?cpage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
				<%} %>
			</div>
			
		</div>
	
	</div>

	
		


	
	
		
	</div>
	<%@ include file = "../common/footerbar.jsp" %>	
</body>
	
</html>