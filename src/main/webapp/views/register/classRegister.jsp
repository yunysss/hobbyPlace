<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.lesson.model.vo.Lesson"%>
<%
	Lesson le = (Lesson)request.getAttribute("le");
	Member m = (Member)request.getAttribute("m");
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
        	color:black !important;
            background:rgb(245, 245, 245);
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
        
    </style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="outer">
    <form action="<%=contextPath %>/fin.reg" id="payment">
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
                                <img src="" height="100" width="100">
                            </td>
                            <td>
                                <b>클래스명</b><br>
                                <%= le.getClName() %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>일시</b><br>
                                <%= le.getStartDate() %> 토요일 오전 10:00 - 오후 12:00
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <table width="580px">
                    <thead>
                        <tr>
                            <td><b>개인정보 확인</b></td>
                        </tr>
                    </thead>
    
                    <tbody>
                        <tr>
                        <td>
                            <b>이메일</b><br>
                            goodee@naver.com <br><br>
                            <b>이름</b><br>
                            김말순<br><br>
                            <b>전화번호</b><br>
                            010-1111-2222
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align:center">
                            <a href="" class="btn btn-sm btn-secondary">개인정보 수정</a>
                        </th>
                    </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td>
                                개인정보 제공안내 
                                <a href="" >보기</a><br>
                                <!-- [ 제공받는 자 ]


                                    [ 제공 정보 ]
                                    성명, 휴대폰 번호, 이메일 주소

                                    [ 목적 ]
                                    본인 확인을 통한 부정이용 방지, 이용자가 문의한 서비스 제공, 서비스 내 맞춤형 정보 제공

                                    [ 보유 및 이용기간 ]
                                    서비스 목적 달성 시. 단, 전자상거래 등에서의 소비자 보호에 관한 법률 및 관계 법령에 따른 보관 의무가 있을 경우 해당 기간 동안 보관함 -->
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
                                <input type="radio" id="card" name="payMethod">
                                <label for="card">신용/체크카드</label>
                                
                                <input type="radio" id="account" name="payMethod">
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
                        <td>
                            99,000원 <br>
                            x 1명
                            <hr>
                            총 결제 금액 <b>99,000원</b>
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
            <button type="submit" class="btn btn-sm" id="pay-btn">결제하기</button>
        </div>
    </form>
    </div>
    
    <br clear="both">
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>