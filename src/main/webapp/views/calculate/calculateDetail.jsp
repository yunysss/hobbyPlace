<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int calPrice = (Integer)request.getAttribute("calPrice");
	String regNo = (String)request.getAttribute("regNo");
	int sta = (Integer)request.getAttribute("sta");
%>
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
        <form id="cal-form" action="<%= contextPath %>/insert.cal">
        	<input type="hidden" name="calPrice" id="calPrice">
        	<input type="hidden" name="regNo" value="<%= regNo %>">
            <table id="cal-form-1">
                <tr>
                    <td width="550">
                        정산 신청 금액
                    </td>
                    <td class="calPrice">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        은행선택 <br>
                        <select name="bank" class="custom-select" required>
                            <option>국민은행</option>
                            <option>우리은행</option>
                            <option>농협</option>
                            <option>신한은행</option>
                            <option>하나은행</option>
                            <option>IBK기업은행</option>
                            <option>우체국</option>
                            <option>신협</option>
                            <option>수협</option>
                            <option>카카오뱅크</option>
                            <option>토스뱅크</option>
                            <option>새마을금고</option>
                            <option>씨티은행</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        계좌번호 <br>
                        <input type="text" name="account" placeholder="&nbsp;-을 생략하고 입력하세요." class="form-control" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        예금주 <br>
                        <input type="text" name="acHolder" placeholder="&nbsp;이름" class="form-control" required>
                        <br><br>
                    </td>
                </tr>
                <tr>
                    <table border="1" class="cal-detail">
                        <tr>
                            <td style="background:rgb(245, 245, 245)">정산 신청 금액</td>
                            <td style="text-align:right;" class="calPrice"></td>
                        </tr>
                        <tr>
                            <td style="background:rgb(245, 245, 245)">원천 징수 세금 (3%)</td>
                            <td style="text-align:right;" id="calPrice-1"></td>
                        </tr>
                        <tr>
                            <td style="background:rgb(245, 245, 245)">카드사 수수료 (2%)</td>
                            <td style="text-align:right;" id="calPrice-2"></td>
                        </tr>
                        <tr>
                            <td style="background:rgb(245, 245, 245)">합플 이용료 (7%)</td>
                            <td style="text-align:right;" id="calPrice-3"></td>
                        </tr>
                        <tr>
                            <td style="background:rgb(245, 245, 245)">최종 정산 금액</td>
                            <td style="text-align:right; color:rgb(231, 76, 60);" id="calPrice-4"></td>
                        </tr>
                    </table>
                </tr>
            </table>
            <div align="right" style="width:650px">
            	<p>신청 후 영업일 기준 1~3일 소요될 수 있습니다.</p>
            </div>
            <script>
        		$(function(){
        			let price = <%= calPrice %>;
        			let price1 = price * 0.003;
        			let price2 = price * 0.002;
        			let price3 = price * 0.007;
        			let price4 = price - price1 - price2 - price3
        			$(".calPrice").text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
        			$("#calPrice-1").text(price1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
        			$("#calPrice-2").text(price2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
        			$("#calPrice-3").text(price3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
        			$("#calPrice-4").text(price4.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
        			$("#calPrice").val(price4);
        		})
            </script>
            <br>
            <div align="center">
                <button type="submit" class="btn btn-sm">정산 신청</button>
            </div>

        </form>
        
        <!-- 모달 -->
        <div class="modal fade" id="calModal">
          <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
        
              <div class="modal-body" align="center">
                정산 신청 완료되었습니다. <br><br>
                <a href="<%= contextPath %>/tutorMain.tt" class="btn btn-secondary">튜터 홈으로</a>
                <a href="<%= contextPath %>/list.cal?memNo=<%= MemNo %>" class="btn btn-secondary">정산 내역 조회</a>
              </div>
        
            </div>
          </div>
        </div>
        <% if(sta == 1){ %>
        	<script>
        		$(function(){
        			$("#calModal").modal("show");
        		})
        	</script>
        <% } %>
    </div>

</body>
</html>