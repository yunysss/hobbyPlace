<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@
	page import="com.hp.register.model.vo.Register, com.hp.refund.model.vo.Refund"
%>
    
<%
 	Register r = (Register)request.getAttribute("r");
	Refund ref = (Refund)request.getAttribute("ref");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;}
    .outer{width:1000px; height: 1000px; margin: auto; padding:4%}
    .content{width:100%; margin-top:5px;}

    #class-area{
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 10px;
        width: 720px;
        height: 250px;
    }
    .area1{
        width: 720px;
        height: 150px;
        
    }
    #classThumbnail {
        float: left;
        width: 230px;
        height: 180px;
        padding-left:15px
    }
    #classThumbnail img{ 
        width: 150px; 
        height: 150px; 
        margin:20px; 
        float: left;
        margin-bottom: 0;
    }
    #classInf {
        float: left;
        width: 490px;
        height: 150px;
        margin-top: 17px;
    }
    #classInf li{
        list-style-type: none;
        margin-bottom:5px;
    }

    .area2{
        width: 720px;
    }
    .area2 table{
        margin: auto;
        width: 690px;
    }

    #refundCard{
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 10px;
        width: 720px;
        height: 80px;
        padding: 20px;
    }

    #refundBank{
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 10px;
        width: 720px;
        height: 200px;
        padding: 20px;
    }


</style>
</head>
<body>
    <%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">
    <h4 style="font-weight: bold;">환불 접수 완료</h4>
    <hr>
    <br>
    <h5><b>환불 접수가 완료 되었습니다.</b></h5>
    <p style="font-size:small; margin-left: 15px; ">영업일 기준 5~7일 이내에 환불이 완료됩니다.</p>
    <br>
    <div id="class-area">
        <div class="area1">
            <div id="classThumbnail">
                <img src="<%=contextPath%>/<%=r.getClThumb() %>">
            </div>
            <div id="classInf">
                <ul style="padding: 5px;">
                    <li style="font-size: small; color: gray;">주문번호 <%=r.getRegNo() %></li>
                    <li style="font-size:large"><b><%=r.getClName() %></b></li>
                    <li><%=r.getDistrName() %>  <%=r.getTeachDate() %> <%=r.getStartTime() %></li>
                </ul>
            </div>
        </div>
        <br>
        </noscript>
        
        <div class="area2">
            <table>
                <tr>
                    <td colspan="2" style="background: lightgray; height: 1px;"></td>
                </tr>
                <tr>
                    <td rowspan="2">총 결제 금액</td>
                    <td style="text-align: right;"><%=r.getRegPrice() %></td>
                </tr>
                <tr>
                <%if(r.getRegPay().equals("0")){ %>
                    <td style="text-align: right; font-size: smaller; color: gray;">(신용카드)</td>
                <%} else { %>
                	<td style="text-align: right; font-size: smaller; color: gray;">(무통장입금)</td>
                <%} %>
                </tr>
            </table>
        </div>
    </div>  
    <br>

    <div id="refundCard">
        <!--카드결제 일때-->
        <table width="690px">
            <tr>
                <td style="font-size: 15px;"><b>환불 금액</b></td>
                <td  style="color: rgb(255, 104, 112); text-align: right;"><b><%=ref.getRefPrice() %>원</b></td>
            </tr>
        </table>
    </div>

        <!--무통장 결제 일때-->
    <%if(r.getDepositSta().equals('Y') &&r.getRegPay().equals("1")){ %>
    <div id="refundBank">
        <table width="690px" >
            <tr>
                <td colspan="2" style="font-size: 15px;"><b>무통장입금 환불 금액</b></td>
                <td  style="color: rgb(255, 104, 112); text-align: right;"><b><%=ref.getRefPrice() %>원</b></td>
            </tr>
            <tr>
                <td colspan="3" style="background:lightgray; height: 1px;"></td>
            </tr>
            <tr>
                <td colspan="3" style="font-size:13px; color: gray;">환불 받을 계좌 정보</td>
            </tr>
            <tr>
                <td width="100px"><b>예금주</b></td>
                <td><%=ref.getRefName() %></td>
                <td></td>
            </tr>
            <tr>
                <td><b>입금 은행</b></td>
                <td><%=ref.getRefBank() %></td>
                <td></td>
            </tr>

            <tr>
                <td><b>계좌 번호</b></td>
                <td><%=ref.getRefAcc() %></td>
                <td></td>
            </tr>

        </table>


    </div>
	<%} %>



        <br>
        <button type="button" class="btn btn-primary btn-block" style="background: rgb(255, 104, 112); border: 0ch; width: 85%; margin: auto;" id="refundListBtn" onclick="">수강 취소 내역으로 돌아가기</button> 
    </div>

    <script>
    	$(function(){
    		$("#refundListBtn").click(function(){
				location.href = "<%=contextPath%>/refundList.reg?cpage=1";    			
    		})
    	})
    </script>
    <%@ include file="../common/footerbar.jsp" %>

</div>

</body>
</html>
