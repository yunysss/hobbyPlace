<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.register.model.vo.Register, com.hp.common.model.vo.PageInfo"%>
<%
	PageInfo refPi = (PageInfo)request.getAttribute("refPi"); 
	ArrayList<Register> refList = (ArrayList<Register>)request.getAttribute("refList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #refundNull{
		width: 100%;
		height: 90%;
		text-align: center;
		margin-top: 70px;
	}
	#refundNull img{
		width: 100px;
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
		<%if(loginUser != null && refList.isEmpty()) {%>	
		
			<div id="refundNull">
				<img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png">
				<br>
				<br>
				<p>환불한 클래스가 없습니다.</p>
			</div>
        
        <%} else{ %>
		
		<!--취소한 클래스가 있을 때-->
			<%for(int i=0; i<refList.size();i++){ %>
		
			<!--환불 접수 -->
			
				<div id="class-area">
												
					<div id="classContent">
						<p style="text-align:left"><%=refList.get(i).getRegDate() %>취소</p>
						<div id="classThumbnail">
							<img src="<%=contextPath%>/<%=refList.get(i).getClThumb() %>"> <!--클래스썸네일대표사진-->
							<br>
							<p><%=refList.get(i).getTtName() %></p>
						</div>
					<div id="classDetail">
						<table  border="0">
							<thead>
								<tr>
									<td >주문번호</td>
									<td colspan="3"><%=refList.get(i).getRegNo() %></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4" id="classTitle"><%=refList.get(i).getClName() %></td>
								</tr>
								<tr>
									<td colspan="4"><%=refList.get(i).getDistrName() %>  <%=refList.get(i).getTeachDate() %> <%=refList.get(i).getStartTime() %></td>
								</tr>
								<tr>
								<%if(refList.get(i).getRefSta().equals("N")){%>
									<td height="50px"><div id="classStatusAp">환불 접수</div></td>
								<%}else{ %>
									<td height="50px"><div id="classStatusX">환불 완료</div></td>
								<%} %>
									<td colspan="3"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4"><button id="btn2" onclick="" data-toggle="modal" data-target="#myModal<%=i%>">환불 상세 내역</button></td>
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
							<h5 class="modal-title" style="margin-left: 163px; font-weight: bold;">환불 상세 내역</h5>
							
						</div>
					
					<!-- Modal body -->
					<div class="modal-body" style="margin:auto">
						<div>
							<table class="modalTB" >
								<tr>
									<td rowspan="2" >결제 금액</td>
									<%if(refList.get(i).getRegPay().equals("0")){%>
										<td colspan="2" id="payment1">신용카드</td>
									<%} else {%>
										<td colspan="2" id="payment1">무통장입금</td>
									<%} %>
								</tr>
								<tr>
									<td colspan="2" id="payment2"><%=refList.get(i).getRegPrice() %></td>
								</tr>
								<tr>
									<td colspan="3" id="detailLine">세부내용</td>
								</tr>
								<tr >
									<td colspan="2" style="font-size: 11px; color: gray;">주문번호 <%=refList.get(i).getRegNo() %></td>								
									<td rowspan="4" style="text-align: right;" width="80px"><%=refList.get(i).getRegPrice() %></td>
								</tr>
								<tr>
									<td colspan="2"><%=refList.get(i).getClName() %></td>
								</tr>
								<tr>
									<td colspan="2"><%=refList.get(i).getTtName() %></td>
								</tr>
								<tr>
									<td width="120px">클래스 수강권 x </td>
									<td><%=refList.get(i).getRegCount() %></td>
								</tr>
	                            <tr>
	                                <td colspan="3" height="1px" style="background: gray;"></td>
	                            </tr>
	                            <tr>
	                                <td height="45px">최종 환불 금액</td>
	                                <td colspan="3" style="text-align: right;"><%=refList.get(i).getRegPrice() %></td>
	                            </tr>
								
							</table>
	                    </div>
					  </div>
				  	</div>
				</div>
			 </div>
		 
	    <%} %>
	
	
		 <div class="paging-area">

		 <%if(refPi.getCurrentPage()!=1){ %>
				<button onclick="location.href='<%=contextPath%>/refundList.reg?cpage=<%=refPi.getCurrentPage()-1%>'">&lt;</button>
				<%} %>
				
				<%for(int p=refPi.getStartPage(); p<=refPi.getEndPage(); p++){ %>
					<button onclick="location.href='<%=contextPath%>/refundList.reg?cpage=<%=p%>'"><%= p %></button>
				<%} %>
				
				<%if(refPi.getCurrentPage()!= refPi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/refundList.reg?cpage=<%=refPi.getCurrentPage()+1%>'">&gt;</button>
				<%} %>
		</div>
	<%} %> 	
		
	<script>
	$(function(){
		console.log(<%=refList%>)
	})
	</script>
	
	</div>  
      
    </div>	
		
	<%@ include file = "../common/footerbar.jsp" %>

</body>
</html>