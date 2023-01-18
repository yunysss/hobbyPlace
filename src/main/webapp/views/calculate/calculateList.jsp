<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input, table{box-sizing:border-box;}
    a{text-decoration: none !important; color:black !important;}

   .outer{width:1000px; margin:auto; padding:30px 50px;}
   #calList-form, #calList-result{
    border:1px solid rgb(180, 180, 180); 
    border-radius:5px;
   }
   #calList-form, #calList-result{
    padding:20px;
   }
   #calList-result{
    overflow:auto;
    height:500px;
   }

   #calList-form td, #calList-result td{
    text-align: center;
    vertical-align: middle;
    font-size:12px;
    padding:10px 0px;
   }
   #calList-form td{
    padding:10px;
   }
   
   #selectCal{
    width:60px;
    margin:0px 5px;
    background:rgb(22, 160, 133); 
    color:white;
   }

   tfoot button{
    border:none;
    border-radius:3px;
    font-size:12px;
    margin:0px 2px;
   }
   thead td{
    background:rgb(245, 245, 245);
   }
   .cal-detail td{
        text-align:center;
        width:300px;
    }
    thead td{
    background:rgb(245, 245, 245);
   }
   input[type="date"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
	<div class="outer">
        <h5><b>정산 내역</b></h5><br>
        <form id="calList-form" action="">
            <b>정산 내역 조회</b>
            <table width="850px">
                <tbody>
                    <tr>
                        <td>조회 기간</td>
                        <td>
                            <input type="date" name="startDate"> 
                            &nbsp;
                            ~
                            &nbsp;
                            <input type="date" name="endDate">
                        </td>
                        <td rowspan="2">
                            <button type="submit" class="btn btn-sm" id="selectCal">조회</button>
                            <button type="reset" class="btn btn-secondary btn-sm">초기화</button>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td>
                            <button type="button" style="background:rgb(22, 160, 133); color:white;">오늘</button>
                            <button type="button">1개월</button>
                            <button type="button">6개월</button>
                            <button type="button">1년</button>
                            <button type="button">3년</button>
                            <button type="button">전체</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
        <br>
        <div id="calList-result">
            <b>조회 결과</b><br><br>
            <table width="100%" class="table">
                <thead>
                    <tr>
                        <td>번호</td>
                        <td>예금주 성함</td>
                        <td>입금 요청 은행</td>
                        <td>정산 요청 금액 (원)</td>
                        <td>정산 요청 날짜</td>
                        <td>정산 진행 상황</td>
                        <td>상세내역</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>김길동</td>
                        <td>
                            우리은행<br>
                            1002*****7586
                        </td>
                        <td>116,410원</td>
                        <td>
                            2023-1-15(일) <br>
                            오후 4:43
                        </td>
                        <td>정산 진행중</td>
                        <td>
                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#calListModal">보기</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" id="calListModal">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            
            <div class="modal-body">
                <h5 class="modal-title"><b>정산 상세 내역</b></h5><br>
            
                예금주 성함 : 김길동 <br>
                입금 요청 은행 : 우리은행 1002*****7586 <br>
                정산 요청 날짜 : 2023-1-15(일) 오후 4:43 <br>
                정산 진행 상황 : 정산 진행중 <br><br>
                <table border="1" class="cal-detail">
                    <tr>
                        <td style="background:rgb(245, 245, 245)">정산 신청 금액</td>
                        <td style="text-align:right;">134,300원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">원천 징수 세금 (3.3%)</td>
                        <td style="text-align:right;">4,430원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">카드사 수수료 (2.53%)</td>
                        <td style="text-align:right;">3,390원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">합플 이용료 (7.5%)</td>
                        <td style="text-align:right;">10,070원&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="background:rgb(245, 245, 245)">최종 정산 금액</td>
                        <td style="text-align:right; color:rgb(231, 76, 60);">116,410원&nbsp;</td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">닫기</button>
                </div>
            </div>
      
          </div>
        </div>
      </div>

</body>
</html>