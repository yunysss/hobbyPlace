<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.register.model.vo.Register" %>
<%
	ArrayList<Register> rList = (ArrayList<Register>)request.getAttribute("rList");
	ArrayList<Register> nList = (ArrayList<Register>)request.getAttribute("nList");
	ArrayList<Register> fList = (ArrayList<Register>)request.getAttribute("fList");
	ArrayList<Register> rjList = (ArrayList<Register>)request.getAttribute("rjList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; padding:20px 50px;}
        #rsvApproval{width:800px; margin:auto;}
        #rsvApproval>div, #rsvListAll>div{padding:20px;}
        
        #rsvListAll{
            overflow: auto;
            height:500px;
        }

        .rsvList-1, .rsvList-2, .rsvList-3, .rsvList-4{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            height:150px;
            cursor: pointer;
            margin-bottom:20px;
        }
        .rsvList-1>div, .rsvList-2>div, .rsvList-3>div, .rsvList-4>div{float:left; height:100%; width:50%}
        .rsvList-1 span, .rsvList-2 span, .rsvList-3 span, .rsvList-4 span{
            color:white;
            border-radius:15px;
            display: inline-block;
            height:30px;
            width:80px;
            text-align:center;
            font-size: 12px;
            line-height: 28px;
        }
        .rsvList-2, .rsvList-3, .rsvList-4{
        	display:none;
        }
        input[type=radio]{display: none;}
	   	input[type=radio]+label{
	   		margin:10px;
	       display: inline-block;
	       cursor: pointer;
	       padding: 5px 8px;
	       text-align: center;
	       border-radius: 5px;
	       background-color: lightgray;
	       line-height: 16px;
	       height:40px;
        	width:120px;
        	line-height:30px;
	   }
	   input[type=radio]:checked+label{
	       background-color: gray;
	       color:white;
	   }
	   input[type=radio]:hover+label{
	       background-color: gray;
	       color:white;
	   }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">
        <h5><b>예약 승인</b></h5><br>
        <div id="rsvApproval">
            <div align="center">
                <input type="radio" id="selectAll" name="selectApproval" value="all" checked><label for="selectAll">전체</label>
				<input type="radio" id="selectNew" name="selectApproval" value="new"><label for="selectNew">NEW</label>
				<input type="radio" id="selectFin" name="selectApproval" value="fin"><label for="selectFin">승인완료</label>
				<input type="radio" id="selectReject" name="selectApproval" value="reject"><label for="selectReject">신청반려</label>
            </div>
            <script>
        		$("input[type=radio]").change(function(){
           			switch($("input[type=radio]:checked").val()){
           			case "all": $(".rsvList-1").show(); $(".rsvList-2").hide(); $(".rsvList-3").hide(); $(".rsvList-4").hide(); break;
           			case "new": $(".rsvList-1").hide(); $(".rsvList-2").show(); $(".rsvList-3").hide(); $(".rsvList-4").hide(); break;
           			case "fin": $(".rsvList-1").hide(); $(".rsvList-2").hide(); $(".rsvList-3").show(); $(".rsvList-4").hide(); break;
           			case "reject": $(".rsvList-1").hide(); $(".rsvList-2").hide(); $(".rsvList-3").hide(); $(".rsvList-4").show();
           			}
           		})
       		
            </script>
            <div id="rsvListAll">
            	<% if(rList.isEmpty()){ %>
            		<div align="center">
            			<b>조회된 내역이 없습니다.</b>
            		</div>
            	<% } else{%>
	            	<% for(int i=0; i<rList.size(); i++){ %>
		                <div class="rsvList-1">
		                    <div>
		                        <%= rList.get(i).getRegDate() %> <br>
		                        <%= rList.get(i).getMemNo() %> 수강생 <br>
		                        <h5><%= rList.get(i).getClNo() %></h5> <br>
		                        진행일시 : <%= rList.get(i).getTeachDate() %> <%= rList.get(i).getSchNo() %>
		                    </div>
		                    <div align="right">
		                    	<% String regSta=""; String regColor="";
		                    	switch(rList.get(i).getRegSta()){ 
		                    	case "0": regSta = "NEW"; regColor = "rgb(241, 196, 15)"; break;
		                    	   case "1": case "2": regSta = "승인완료"; regColor = "rgb(22, 160, 133)"; break;
		                           case "4": regSta = "신청반려"; regColor = "rgb(180, 180, 180)";
		                        } %>
		                        <span style="background:<%=regColor%>"><%= regSta %></span>
		                    </div>
		                    
	                	</div>
	                <% } %>
	                <% for(int i=0; i<nList.size(); i++){ %>
		                <div class="rsvList-2">
		                    <div>
		                        <%= nList.get(i).getRegDate() %> <br>
		                        <%= nList.get(i).getMemNo() %> 수강생 <br>
		                        <h5><%= nList.get(i).getClNo() %></h5> <br>
		                        진행일시 : <%= nList.get(i).getTeachDate() %> <%= nList.get(i).getSchNo() %>
		                    </div>
		                    <div align="right">
		                        <span style="background:rgb(241, 196, 15);"><b>NEW</b></span>
		                        
		                    </div>
	                    </div>
                    <% } %>
                    <% for(int i=0; i<fList.size(); i++){ %>
		                <div class="rsvList-3">
		                    <div>
		                        <%= fList.get(i).getRegDate() %> <br>
		                        <%= fList.get(i).getMemNo() %> 수강생 <br>
		                        <h5><%= fList.get(i).getClNo() %></h5> <br>
		                        진행일시 : <%= fList.get(i).getTeachDate() %> <%= fList.get(i).getSchNo() %>
		                    </div>
		                    <div align="right">
		                        <span style="background:rgb(22, 160, 133);"><b>승인완료</b></span>
		                    </div>
	                    </div>
                    <% } %>
                    <% for(int i=0; i<rjList.size(); i++){ %>
		                <div class="rsvList-4">
		                    <div>
		                        <%= rjList.get(i).getRegDate() %> <br>
		                        <%= rjList.get(i).getMemNo() %> 수강생 <br>
		                        <h5><%= rjList.get(i).getClNo() %></h5> <br>
		                        진행일시 : <%= rjList.get(i).getTeachDate() %> <%= rjList.get(i).getSchNo() %>
		                    </div>
		                    <div align="right">
		                        <span style="background:rgb(180, 180, 180)"><b>신청반려</b></span>
		                    </div>
	                    </div>
                    <% } %>
                <% } %>
            </div>
        </div>
    </div>
    <!-- The Modal1 -->
    <div class="modal" id="myModal1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body">
                    <h5 class="modal-title"><b>예약 승인 상세</b></h5><br>
                    2023-01-20 16:40:45 <br>
                    <h5>제빵왕 원데이클래스</h5> <br>
                    수강생 : 김개똥 <br>
                    휴대폰 : 010-2345-6789 <br>
                    이메일 : gaeddong@naver.com <br><br>
                    2023-01-25 14:00 - 16:00 <br>
                    신청인원 : 1명 <br>
                    수강료 : 33,000원 <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-secondary btn-sm" id="reject-btn">신청반려</button>
                        <button type="button" class="btn btn-sm" id="approval-btn" style="background:rgb(22, 160, 133); color:white;">예약승인</button>
                    </div>
            	</div>  
        	</div>
    	</div>
   	</div>

    <!-- The Modal2 (신청반려) -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    <b>수강 신청 반려하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
            </div>  
        </div>
    </div>

    <!-- The Modal3 (신청승인) -->
    <div class="modal" id="myModal3">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    수강 신청 내역 승인하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                    
                </div>
            </div>  
        </div>
    </div>

    <script>
        $(function(){
            $(".rsvList").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal1");
            })

            $("#reject-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal2");
            })

            $("#approval-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal3");
            })

        })
        
    </script>
</body>
</html>