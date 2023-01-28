<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hp.common.model.vo.PageInfo, java.util.ArrayList, com.hp.register.model.vo.Register" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Register> list = (ArrayList<Register>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; padding:30px 50px;}
        #rsvApproval{width:800px; margin:auto;}
        #rsvApproval>div, #rsvListAll>div{padding:20px;}

        .rsvList{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            height:150px;
            cursor: pointer;
            margin-bottom:20px;
        }
        .rsvList>div{
        	float:left;
        	height:100%;
            width:50%;
        }
        #rsvListAll span{
            color:white;
            border-radius:15px;
            display: inline-block;
            height:30px;
            width:80px;
            text-align:center;
            font-size: 12px;
            line-height: 28px;
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
	   .paging-area{
        	text-align: center;
    	}
    	.paging-area>*{
        	border: none;
        	border-radius: 3px;
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
            
            <div id="rsvListAll">
            	<% if(list.isEmpty()){ %>
            		<div class='rsvList' align='center'>
            			<b>조회된 내역이 없습니다.</b>
            		</div>
            	<% } else{%>
	            	<% for(int i=0; i<list.size(); i++){ %>
		                <div class="rsvList" onclick="location.href='<%=contextPath%>/regDetail.tt?no=<%=list.get(i).getRegNo()%>'">
		                    <div>
		                        <%= list.get(i).getRegDate() %> <br>
		                        <%= list.get(i).getMemNo() %> 수강생 <br>
		                        <h5><%= list.get(i).getClNo() %></h5> <br>
		                        진행일시 : <%= list.get(i).getTeachDate() %> <%= list.get(i).getSchNo() %>
		                    </div>
		                    <div align="right">
		                    	<% String regSta=""; String regColor="";
		                    	switch(list.get(i).getRegSta()){ 
		                    	case "0": regSta = "NEW"; regColor = "rgb(241, 196, 15)"; break;
		                    	case "1": case "2": regSta = "승인완료"; regColor = "rgb(22, 160, 133)"; break;
		                        case "4": regSta = "신청반려"; regColor = "rgb(180, 180, 180)";
		                        } %>
		                        <span style="background:<%=regColor%>"><b><%= regSta %></b></span>
		                    </div>
	                	</div>
	                <% } %>
                <% } %>
            </div>
            
            
            <div class="paging-area">
				<% if(pi.getCurrentPage() != 1) { %>
	            	<button onclick="location.href='<%= contextPath %>/approval.tt?cpage=<%= pi.getCurrentPage() - 1 %>';">&lt;</button>
	            <% } %>
	            
				<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	            	<button onclick="location.href='<%= contextPath %>/approval.tt?cpage=<%= p %>';"><%= p %></button>
	            <% } %>
				
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<button onclick="location.href='<%= contextPath %>/approval.tt?cpage=<%= pi.getCurrentPage() + 1 %>';">&gt;</button>
	            <% } %>
        </div>
        </div>
        
    </div>
    
</body>
</html>