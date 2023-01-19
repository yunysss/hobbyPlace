<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h5><b>결제완료</b></h5>
            <!-- 무통장 입금 -->
            <!-- <b>신청완료</b> -->
            <div>
                <table width="950">
                    <thead>
                        <tr>
                            <td colspan="4">
                                주문 번호 B3205R23
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
                                <b>결제 내역</b>
                                <!-- 무통자입금 -->
                                <!-- <b>입금 안내</b> -->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="" height="150" width="150">
                                <b>앙금플라워떡케이크 만들기</b> <br>
                            </td>
                            <td>
                                <!-- 카드결제 -->
                                <small> 클래스 수강권 x 1</small>
                                <br><br>
                                최종 결제 금액 <br>
                                결제 수단
                                <br><br><br>
                                <!-- 무통장 입금 -->
                                <!-- 최종 결제 금액 <br>
                                계좌 정보 <br>
                                예금주 <br>
                                입금기한 
                                <br><br><br> -->
                            </td>
                            <td>
                                <!-- 카드 결제 -->
                                <br><br>
                                <b>99,000원</b><br>
                                신용카드
                                <br><br><br>
                                <!-- 무통장 입금 -->
                                <!-- <b>99,000원</b><br>
                                우리은행 10203948584 <br>
                                주식회사 합플 <br>
                                2023-01-15 23:59까지
                                <br><br><br> -->

                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
                                <small>
                                    2023년 1월 27일 토요일 오전 10:00 - 오후 12:00 <br>
                                    인원 : 1명
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
</html>