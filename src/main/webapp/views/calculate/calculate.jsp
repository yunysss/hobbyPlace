<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input{box-sizing:border-box;}

   .outer{width:1000px; margin:auto; padding:30px 50px;}
    #cal-1>div, .calList>div{float:left; width:50%; padding:20px; margin-bottom: 10px;}
    #cal-1, .calList{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
    }
    #cal-1{
        background:rgb(245, 245, 245);
    }
    #cal-2{
        overflow: auto;
        height:400px;
        padding:20px;
    }

    #cal-button>button{
        border:none;
        border-radius:3px;
        margin-left:20px;
        height:40px;
        width:120px;
    }
    #submit{
        background:rgb(22, 160, 133);
        color:white;
        margin-top:20px;
        width:90px;
        height:30px;
    }
    .calList span{
        color:white;
        border-radius:15px;
        display: inline-block;
        height:30px;
        width:80px;
        text-align:center;
        font-size: 12px;
        line-height: 28px;
    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
	<div class="outer">
        <h5><b>정산 신청</b></h5><br>
        <div id="cal-1" style="height:90px">
            <div>
                받을 금액 <br>
                120,450원
            </div>
            <div>
                받은 금액 <br>
                50,500원
            </div>
        </div>
        <br>
        정산 미신청 <b>2건</b>
        <div id="cal-button" align="center">
            <button type="button" class="">전체</button>
            <button type="button">정산 미신청</button>
            <button type="button">정산 진행중</button>
            <button type="button">정산완료</button>
        </div>
        <br>
        <form action="calculateDetail.jsp">
            <div id="cal-2">
                <div class="calList" style="height:130px">
                    <div>
                        <small>결제일자 : 2023-01-15 16:44:45</small><br>
                        <h5>제빵왕 원데이클래스</h5>
                        수업일자 : 2023-01-16 10:00 - 12:00 <br>
                        <small>신청 인원 : 2명</small>
                    </div>
                    <div align="right">
                        <span style="background:rgb(241, 196, 15)"><b>미신청</b></span> <br><br><br>
                        <b>54,500원</b>
                        <!-- 미신청일 경우에만 체크박스 노출 -->
                        <input type="checkbox" name="calPrice">
                    </div>
                </div>
                <br>
                <div class="calList" style="height:130px">
                    <div>
                        <small>결제일자 : 2023-01-15 16:44:45</small><br>
                        <h5>제빵왕 원데이클래스</h5>
                        수업일자 : 2023-01-16 10:00 - 12:00 <br>
                        <small>신청 인원 : 2명</small>
                    </div>
                    <div align="right">
                        <span style="background:rgb(231, 76, 60)"><b>정산완료</b></span> <br><br><br>
                        <b>54,500원</b>
                    </div>
                </div>
                <br>
            </div>
    
            <div align="center">
                <button type="submit" class="btn btn-sm" id="submit">정산 신청</button>
            </div>
        </form>

    </div>
</body>
</html>