<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.register.model.vo.Register"%>
<%
	Register r = (Register)request.getAttribute("reg");
	int regNo = (Integer)request.getAttribute("regNo"); // 주문번호
	String regPay = (String)request.getAttribute("regPay");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div, p, form, input{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; margin-top:20px;}

        .outer>div{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            padding:20px;
            margin-top:20px;
        }

        tbody td, tfoot td{
            padding:10px;
        }

        #checkbutton{
            margin-left:40px;
            width:120px;
            color:white;
            background:rgb(35, 104, 116);
        }

        
    </style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
    <div class="outer">
            <!-- 카드결제 -->
            <% if(regPay.equals("0")){ %>
            	<h5><b>결제완료</b></h5>
            <% } else{ %>
            <!-- 무통장 입금 -->
            	<h5><b>신청완료</b></h5>
            <% } %>
            <div>
                <table width="950">
                    <thead>
                        <tr>
                            <td colspan="4">
                                주문 번호 <%= regNo %>
                            </td>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <tr>
                            <td>
                                <b>신청한 클래스</b>
                            </td>
                            <td colspan="2">
                            	<!-- 카드결제 -->
					            <% if(regPay.equals("0")){ %>
					            	<b>결제 내역</b>
					            <% } else{ %>
					            <!-- 무통장 입금 -->
					            	<b>입금 안내</b>
					            <% } %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<%= contextPath %>/<%= r.getClThumb() %>" height="150" width="150">
                                <b><%= r.getClName() %></b> <br>
                            </td>
                            <td>
                                <small> 클래스 수강권 x <%= r.getRegCount() %></small><br><br>
                                최종 결제 금액 <br>
                                <!-- 카드결제 -->
					            <% if(regPay.equals("0")){ %>
					            	결제 수단<br><br><br>
					            <% } else{ %>
					            <!-- 무통장 입금 -->
					            	결제 수단<br>
					            	계좌 정보 <br>
                                	예금주 <br>
                                	입금기한 
                                	<br><br><br>
					            <% } %>
                            </td>
                            <td>
                            	<br><br><b id="regPrice"></b><br>
                                <!-- 카드 결제 -->
                                <% if(regPay.equals("0")){ %>
                                	신용/체크카드<br><br><br>
					            <% } else{ %>
					            <!-- 무통장 입금 -->
					            	무통장입금 <br>
	                                우리은행 1234567898765 <br>
	                                주식회사 합플 <br>
	                                <span id="payDate"></span>
	                                <br><br><br>
					            <% } %>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
                                <small>
                                    <%= r.getTeachDate() %> <%= r.getRegDate() %> <br>
                                    인원 : <%= r.getRegCount() %>명
                                </small>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <div align="center">
                    <a href="<%=contextPath %>/main.tee" class="btn btn-secondary btn-sm">홈으로 이동</a>
                    <a href="" class="btn btn-sm" id="checkbutton">수강 내역 확인</a>
                </div>
            </div>
    </div>
    <script>
	    function CommaFormat(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	    $(function(){
	    	let price = <%= r.getRegSta() %>;
		    $("#regPrice").html(CommaFormat(price)+"원");
		    
		   	let today = new Date();
		   	let year = today.getFullYear();
		   	let month = ('0' + (today.getMonth() + 1)).slice(-2);
		   	let day = ('0' + today.getDate()).slice(-2);
		   	
		   	let dateString = year + '-' + month  + '-' + day;
		   	
		   	$("#payDate").html(dateString + " 23:59:59까지")
	    })
    </script>
</html>