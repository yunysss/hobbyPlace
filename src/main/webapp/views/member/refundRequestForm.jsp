<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;}
    .outer{width:1000px; height: 1350px; margin: auto; padding:4%}
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
        height: 555px;
        padding: 20px;
    }
    #refundTB th{background: lightgray;}
    
    #bankForm{
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

    <form action="" id="reasonForm"  > 
        <div id="refundReasonForm">
            <p style="font-size: small; color: gray;">- 환불 신청을 클릭하시면 환불이 진행됩니다. 이후 '취소 수강 목록'에서 해당 클래스를 확인하실 수 있습니다.</p>
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
            <br>
            <table style="text-align: center; font-size: 13px; width: 500px; border: 1px solid rgb(216, 212, 212);" id="refundTB" class="table">
                <tr>
                    <th width="100px">클래스 3일 이전 취소</th>
                    <td width="80px">100% 환불</td>
                    <td width="140px">~23.01.04 </td> 
                </tr>
                <tr>
                    <th height="30px">클래스 2일 이전 취소</th>
                    <td>50% 환불</td>
                    <td>23.01.05</td>
                </tr>
                <tr>
                    <th height="30px">클래스 당일<br>/하루 전 취소</th>
                    <td style="line-height: 35px;">환불 불가</td>
                    <td style="line-height: 35px;">23.01.06~23.01.07</td>
                </tr>
            </table>
            <br>
            <input type="checkbox" name="agree" id="agree"> 
            <label for="agree" style="color: rgb(255, 104, 112);"><u>주의 사항을 확인하였으며, 동의합니다.</u></label>
            <br><br>

            <!--카드결제일때-->
            <table width="690px">
                <tr>
                    <td style="font-size: 15px;"><b>환불 금액</b></td>
                    <td  style="color: rgb(255, 104, 112); text-align: right;"><b>39,000원</b></td>
                </tr>
            </table>
         </div>

        <!--무통장 결제 일때-->
         <br>
    
         <div id="bankForm">
         
            <table width="690px">
                <tr>
                    <td colspan="2" style="font-size: 15px;"><b>무통장입금 환불 금액</b></td>
                    <td  style="color: rgb(255, 104, 112); text-align: right;"><b>39,000원</b></td>
                </tr>
                <tr>
                    <td colspan="3" style="background: lightgray; height: 1px;"></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size:13px; color: gray;">환불 받을 계좌 정보</td>
                </tr>
                <tr>
                    <td><b>예금주</b></td>
                    <td><input type="text" name="name"></td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>입금 은행</b></td>
                    <td>
                        <select name="bank" id="bank">
                            <option value="국민은행">국민은행</option>
                            <option value="신한은행">신한은행</option>
                            <option value="하나은행">하나은행</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><b>계좌 번호</b></td>
                    <td><input type="text" name="accountNumber" placeholder="- 제외 입력"></td>
                    <td></td>
                </tr>

            </table>

        </div>
         <br>
         <button type="button" class="btn btn-primary btn-block" style="background: rgb(255, 104, 112); border: 0ch; width: 85%; margin: auto;" id="refundBtn" onclick="">환불신청</button>
    </form> 
    
    <script>
    	$(function(){
    		$("#refundBtn").click(function(){
				location.href = "<%=contextPath%>/refundReqFinish.tee";    			
    		})
    	})
    </script>
    
        
        
</div>
<br>

<%@ include file="../common/footerbar.jsp" %>

</body>
</html>