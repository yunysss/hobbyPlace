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
    #cal-form{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
        padding:40px;
    }
    #cal-form>* {
        margin:auto;
    }
    #cal-form-1 td{
        padding:10px;
    }
    .cal-detail td{
        text-align:center;
        width:320px;
    }
    #cal-form button{
        width:90px;
        background:rgb(22, 160, 133);
        color:white;
        height:30px;
    }
    #cal-form p{
        font-size:12px;
        color:gray;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
	<div class="outer">
        <h5><b>정산 신청</b></h5><br>
        <form id="cal-form" action="">
            <table id="cal-form-1">
                <tr>
                    <td width="550">
                        정산 신청 금액
                    </td>
                    <td>
                        134,300원
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        은행선택 <br>
                        <select name="bank" class="custom-select">
                            <option value="">국민은행</option>
                            <option value="">우리은행</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        계좌번호 <br>
                        <input type="text" name="account" placeholder="&nbsp;계좌번호를 입력하세요." class="form-control">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        예금주 <br>
                        <input type="text" name="acHolder" placeholder="&nbsp;이름" class="form-control">
                        <br><br>
                    </td>
                </tr>
                <tr>
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
                    <div align="right" style="width:650px">
                        <p>신청 후 영업일 기준 1~3일 소요될 수 있습니다.</p>
                    </div>
                </tr>
            </table>
            <br>
            <div align="center">
                <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#calModal">정산 신청</button>
            </div>

        </form>

        <!-- 모달 -->
        <div class="modal fade" id="calModal">
          <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
        
              <div class="modal-body" align="center">
                정산 신청 완료되었습니다. <br><br>
                <a href="<%= contextPath %>/views/common/tutorMainPage.jsp" class="btn btn-secondary">튜터 홈으로</a>
                <a href="<%= contextPath %>/views/calculate/calculateList.jsp" class="btn btn-secondary">정산 내역 조회</a>
              </div>
        
            </div>
          </div>
        </div>
    </div>

</body>
</html>