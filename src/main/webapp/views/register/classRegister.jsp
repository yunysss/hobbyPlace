<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.register.model.vo.Register"%>
<%
	Register reg = (Register)request.getAttribute("reg");
	Member m = (Member)request.getAttribute("m");
	String selectSession = (String)request.getAttribute("selectSession");
	String selectDate = (String)request.getAttribute("selectDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div, p, form, input{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; margin-top:20px; position:relative;}
        #payment>div{float:left;}
        #payment-1{height:100%; width:65%;}
        #payment-2{width:35%; height:300px; margin-top:50px;}

        tbody td, tfoot td{
            padding:10px;
        }

        tfoot td{
            font-size:12px;
        }

        tfoot input{
            height:10px;
            width:10px;
        }
        tfoot a{
        	text-decoration:none !important;
        	color:white !important;
            background:lightgray;
            padding:3px;
            border-radius:3px;
        }
        
        #payment-2>button{
            background:rgb(35, 104, 116);
            color:white;
            width:200px;
        }
        #payment-1>div, #payment-2{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            padding:10px;
        }
        #payment-1>div{
            width:600px;
            margin-top:20px;
        }

        #payment-1 label{
            margin-right:20px;
        }
        #personal-modal{
        	font-size : 12px;
        }
        #payment input{
        	border:none;
        	pointer-events: none;
        }
        #payment-1 img{
        	border-radius:5px;
        }
        
    </style>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="outer">
	    <form action="<%=contextPath %>/fin.reg" id="payment" name="payment">
	        <div id="payment-1">
	            <h5><b>결제하기</b></h5>
	            <div>
	                <table>
	                    <thead>
	                        <tr>
	                            <td colspan="2"><b>클래스 정보</b></td>
	                        </tr>
	                    </thead>
	                    
	                    <tbody>
	                        <tr>
	                            <td rowspan="2" width="110px">
	                                <img src="<%= contextPath %>/<%= reg.getClThumb() %>" height="100" width="100">
	                            </td>
	                            <td>
	                                <b>클래스명</b><br>
	                                <%=reg.getClName()%>
	                                <input type="hidden" name="clNo" value="<%=reg.getClNo()%>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <b>일시</b><br>
	                                <%=reg.getTeachDate()%> <%=reg.getRegDate()%>
	                                <input type="hidden" name="teachDate" value="<%=selectDate%>">
	    							<input type="hidden" name="schNo" value="<%=selectSession%>">
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div id="memProfile">
	                <table width="580px">
	                    <thead>
	                        <tr>
	                            <td><b>개인정보 확인</b></td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<tr>
		                        <td>
		                        	<b>이름</b><br>
		                            <%= m.getMemName() %><br><br>
		                            <b>전화번호</b><br>
		                            <%=m.getPhone()%>
		                            <br><br>
		                            <b>이메일</b><br>
		                            <%=m.getEmail()%>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th style="text-align:center">
		                            <a href="" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#edit-modal">개인정보 수정</a>
		                        </th>
		                    </tr>
	                    </tbody>
	                    <tfoot>
	                        <tr>
	                            <td>
	                                개인정보 제공안내 
	                                <a href="" data-toggle="modal" data-target="#personal-modal">보기</a><br>
	                                <input type="checkbox" id="personal">
	                                <label for="personal">위 개인 정보 제공 안내 내용을 확인하였으며, 이에 동의합니다. (필수)</label>
	                            </td>
	                        </tr>
	                    </tfoot>
	                </table>
	            </div>
	            <div>
	                <table>
	                    <thead>
	                        <tr>
	                            <td><b>결제 방법</b></td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>
	                                <input type="radio" id="card" name="regPay" value ="0" checked>
	                                <label for="card">신용/체크카드</label>
	                                
	                                <input type="radio" id="account" name="regPay" value="1">
	                                <label for="account">무통장입금</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	
	        <div id="payment-2" align="center">
	            <table width="330">
	                <thead>
	                    <tr>
	                        <td><b>결제 정보</b></td>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>클래스 수강권</td>
	                    </tr>
	                    <tr>
	                        <td align="right">
	                            <%= reg.getRegPrice() %> <br>
	                            x <input type="text" name="regCount" value="<%= reg.getRegCount() %>" size="3" style="text-align:right;" readonly>명
	                            <hr>
	                            총 결제 금액 
	                            <b id="regPrice"></b>
	                            <input type="hidden" name="regPrice" value="<%= reg.getRegSta() %>">
	                        </td>
	                    </tr>
	                </tbody>
	                <tfoot>
	                    <tr>
	                        <td>
	                            <input type="checkbox" id="pay">
	                            <label for="pay">주문 내용을 확인하였으며, 결제에 동의합니다. (필수)</label>
	                        </td>
	                    </tr>
	                </tfoot>
	            </table>
	            <button type="submit" class="btn btn-sm" id="pay-btn" disabled>결제하기</button>
	        </div>
	    </form>
   	</div>
   	<script>
   		$(function(){
   			$("form").submit(function(){
   				if($("input[name=regPay]:checked").val() == 0){
   					requestPay();
   					return false;
   				}else{
   					return true;
   				}
   			})
   		})
		function requestPay(){
   			let email = "";
   			if(<%= m.getEmail() %> != "이메일 없음"){
   				email = <%= m.getEmail() %>;
   			}
   			IMP.init('imp15436753'); 
		       IMP.request_pay({
		           pg: "html5_inicis",
		           pay_method: 'card',
		           merchant_uid: 'merchant_' + new Date().getTime(),
		           name: '<%= reg.getClName() %>',
		          amount: <%= reg.getRegSta()%>,
		          buyer_email: email,
		          buyer_name: '<%= m.getMemNo() %>',
		          buyer_tel: '<%= m.getPhone()%>'
		      }, function (rsp) {
		          if (rsp.success) {
		              document.payment.submit();
		          } else {
		              var msg = '결제에 실패하였습니다.';
		              msg += '에러내용 : ' + rsp.error_msg;
		              alert(msg);
		          }
		      })
   		}
   		function CommaFormat(x) {
  		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  		}
  	    $(function(){
  	    	let price = <%= reg.getRegSta() %>;
  		    $("#regPrice").html(CommaFormat(price)+"원");
  	    })
    </script>
    <script>
    $(function(){  
		$(document).on("click", "input:checkbox", function(){
			if($("input:checkbox:checked").length == 2) {
				$("#pay-btn").attr("disabled", false);
			} else{
				$("#pay-btn").attr("disabled", true);
			}
		})
	})
    </script>
    <div class="modal fade" id="personal-modal">
	  <div class="modal-dialog modal-dialog-centered modal-sm">
	    <div class="modal-content">
	      <div class="modal-body">
	        [ 제공받는 자 ]<br>
	        <%= reg.getTtName() %><br><br>
	        
            [ 제공 정보 ]<br>
            성명, 휴대폰 번호, 이메일 주소<br><br>

            [ 목적 ]<br>
            본인 확인을 통한 부정이용 방지, 이용자가 문의한 서비스 제공, 서비스 내 맞춤형 정보 제공<br><br>

            [ 보유 및 이용기간 ]<br>
            서비스 목적 달성 시. 단, 전자상거래 등에서의 소비자 보호에 관한 법률 및 관계 법령에 따른 보관 의무가 있을 경우 해당 기간 동안 보관함
	      </div>
	
	      <div align="center">
	        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button><br><br>
	      </div>
	
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="edit-modal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h5><b>개인정보 수정</b></h5>
	      </div>
	      <div class="modal-body" align="center">
	      	<table>
	      		<tbody>
	      			<tr>
						<td><b>이름</b></td>
						<td><input type="text" name="memName" value="<%= m.getMemName()%>"></td>
					</tr>
					<tr>
						<td><b>전화번호</b></td>
						<td><input type="text" name="phone" value="<%= m.getPhone() %>"></td>
					</tr>
					<tr>
						<td><b>이메일</b></td>
						<td><input type="email" name="email" value="<%= m.getEmail() %>"></td>
					</tr>
	      		</tbody>
	      	</table>
	      	<br>
	      	<div align="center">
	      		<button type="submit" class="btn btn-sm" onclick="reviseReg();" data-dismiss="modal" style="background:rgb(35, 104, 116); color:white;">수정</button>
	        	<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button><br><br>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<script>
		function reviseReg(){
			let email = $("input[name='email']").val();
			if(email == "이메일 없음"){
				email = null;
			}
			$.ajax({
				url:"<%=contextPath%>/revise.reg",
				data:{
					memNo:<%=loginUser.getMemNo()%>,
					memName:$("input[name='memName']").val(),
					phone:$("input[name='phone']").val(),
					email:email
				},
				success:function(m){
					value1 = "<tr>"
							+ 	"<td>"
							+		"<b>이름</b><br>"
							+		m.memName + "<br><br>"
							+		"<b>전화번호</b><br>"
							+		m.phone + "<br><br>"
							+		"<b>이메일</b><br>"
							+		m.email
							+	"</td>"
							+ "</tr>"
							+ "<tr>"
	                        +	"<th style='text-align:center'>"
                            +		"<a href='' class='btn btn-sm btn-secondary' data-toggle='modal' data-target='#edit-modal'>개인정보 수정</a>"
                            +	"</th>"
                            + "</tr>"
					value2 = "<tr>"
							+ 	"<td><b>이름</b></td>"
							+	"<td><input type='text' name='memName' value='" + m.memName + "'></td>"
							+ "</tr>"
							+ "<tr>"
							+	"<td><b>전화번호</b></td>"
							+	"<td><input type='text' name='phone' value='" + m.phone + "'></td>"
							+ "</tr>"
							+ "<tr>"
							+	"<td><b>이메일</b></td>"
							+	"<td><input type='email' name='email' value='" + m.email + "'></td>"
							+ "</tr>"
					$("#memProfile tbody").html(value1);
					$("#edit-modal tbody").html(value2);
				},error:function(){
					console.log("실패")
				}
			})
		}
    </script>
    
    <br clear="both">
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>