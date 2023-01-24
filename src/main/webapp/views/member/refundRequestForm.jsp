<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    #refundReasonForm{
        margin: auto;
        border: 1px solid lightgray;
        border-radius: 10px;
        width: 720px;
        height: 600px;
    }

</style>
</head>
<body>
<%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">
    <h4 style="font-weight: bold;">환불 접수</h4>
    <hr>
    <br>
    <h5><b>* 환불 규정을 꼭 확인해 주시고 신청을 완료해주시기 바랍니다.</b></h5>
    <p style="font-size:small; margin-left: 15px; ">이미 수강하셨거나 수강기간이 경과한 클래스는 환불이 불가함을 알려드립니다.</p>
    <br>
    <div id="class-area">
        <div class="area1">
            <div id="classThumbnail">
                <img src="<%=contextPath%>/resources/classThumbnail_upfiles/sjLesson01.jpg">
            </div>
            <div id="classInf">
                <ul style="padding: 5px;">
                    <li style="font-size: small; color: gray;">주문번호 B133R2344</li>
                    <li style="font-size:large"><b>라탄 소품 만들기, 마음을 담아 엮어요</b></li>
                    <li>구로 / 2023-01-07 (토) 17:00</li>
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
                    <td style="text-align: right;">39,000원</td>
                </tr>
                <tr>
                    <td style="text-align: right; font-size: smaller; color: gray;">(신용카드)</td>
                </tr>
            </table>
        </div>
    </div>  
    <br>
    <div id="refundReasonForm">
        <p style="font-size: small; color: gray; margin: 10px;">- 환불 신청을 클릭하시면 환불이 진행됩니다. 이후 '취소 수강 목록'에서 해당 클래스를 확인하실 수 있습니다.</p>
        
        <form action="" id="reasonForm" style="padding: 20px;"> 
            <h6><b>환불 사유</b></h6>
            <hr>
            <input type="radio" name="refundReason" value="changeMind" id="changeMind">
            <label for="changeMind">단순변심</label>
            <br>
            <input type="radio" name="refundReason" value="mistake" id="mistake">
            <label for="mistake">클래스 시간 착오 등과 같은 주문 실수</label>
            <br>
            <input type="radio" name="refundReason" value="refuse" id="refuse">
            <label for="refuse">튜터의 신청 반려</label>
            <br>
            <input type="radio" name="refundReason" value="reason" id="reason" checked>
            <label for="reason"><input type="text" maxlength="50" placeholder="기타 (50자이하)" style="width: 440px;"></label>
            <br>
            <table>
                <tr>
                    <th>클래스 3일 이전 취소</th>
                    <td></td>
                </tr>
            </table>

        </form>
    </div>
      
</div>
<br>




</body>
</html>