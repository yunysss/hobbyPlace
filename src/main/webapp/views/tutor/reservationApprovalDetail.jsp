<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.register.model.vo.Register"%>
<% Register r = (Register)request.getAttribute("r"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{box-sizing:border-box;}
	.outer{width:1000px; margin:auto; padding:30px 50px;}
	.outer>div{
		margin-left:50px;
		width:600px; 
		height:300px;
		border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
        padding:20px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">
        <h5><b>예약 승인 상세</b></h5><br>
        <div>
        	<%= r.getRegDate() %> <br>
	        <h5><%= r.getClNo() %></h5> <br>
	        수강생 : <%= r.getMemNo() %> <br>
	        휴대폰 : <%= r.getMemPhone() %> <br>
	        이메일 : <%= r.getMemEmail() %> <br><br>
	        <%= r.getTeachDate() %> <%= r.getSchNo() %> <br>
	        신청인원 : <%= r.getRegCount() %> <br>
	        수강료 : <%= r.getRegPrice() %> <br><br>
	        <div align="center">
	        	<button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-toggle="modal" data-target="#approveModal">예약 승인</button>
                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#rejectModal">신청반려</button>
                <button type="button" class="btn btn-sm" style="border:0.1px solid" onclick="location.href='<%=contextPath%>/approval.tt?cpage=1'">뒤로가기</button>
	        </div>
        </div>
    </div>
    <div class="modal" id="approveModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    <b>수강 신청 내역 승인하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal" onclick="location.href='<%=contextPath%>/updateReg.tt?regSta=1&memNo=<%= MemNo %>&regNo=<%=r.getRegNo()%>'">확인</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>  
        </div>
    </div>
    <div class="modal" id="rejectModal">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    <b>수강 신청 반려하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal" onclick="location.href='<%=contextPath%>/updateReg.tt?regSta=4&memNo=<%= MemNo %>&regNo=<%=r.getRegNo()%>'">확인</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>  
        </div>
    </div>
</body>
</html>