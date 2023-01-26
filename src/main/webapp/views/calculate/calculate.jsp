<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.register.model.vo.Register" %>
<%
	ArrayList<Register> rList = (ArrayList<Register>)request.getAttribute("rList");
	ArrayList<Register> nList = (ArrayList<Register>)request.getAttribute("nList");
	ArrayList<Register> wList = (ArrayList<Register>)request.getAttribute("wList");
	ArrayList<Register> cList = (ArrayList<Register>)request.getAttribute("cList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;}

    .outer{width:1000px; margin:auto; padding:30px 50px;}
    #calculate{width:800px; margin:auto;}
    #cal-2{
    	padding:20px;
        overflow: auto;
        height:500px;
    }
    #cal-2>div{padding:20px;}
    .calList-1, .calList-2, .calList-3, .calList-4{
        border:1px solid rgb(180, 180, 180); 
        border-radius:5px;
        height:145px;
        margin-bottom:20px;
    }
    .calList-1>div, .calList-2>div, .calList-3>div, .calList-4>div{float:left; height:100%; width:50%}

    #cal-2 button{
        background:rgb(22, 160, 133);
        color:white;
        margin-top:20px;
    }
    #cal-2 span{
        color:white;
        border-radius:15px;
        display: inline-block;
        height:30px;
        width:80px;
        text-align:center;
        font-size: 12px;
        line-height: 28px;
    }
    .calList-2, .calList-3, .calList-4{
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
        <h5><b>정산 신청</b></h5><br>
        <div id="calculate">
	        <br>
	        <div align="center">
	        	<input type="radio" id="selectAll" name="selectCalculate" value="all" checked><label for="selectAll">전체</label>
				<input type="radio" id="selectNew" name="selectCalculate" value="new"><label for="selectNew">정산 미신청</label>
				<input type="radio" id="selectWait" name="selectCalculate" value="wait"><label for="selectWait">정산 진행중</label>
				<input type="radio" id="selectComplete" name="selectCalculate" value="complete"><label for="selectComplete">정산완료</label>
	        </div>
	        <script>
        		$("input[type=radio]").change(function(){
           			switch($("input[type=radio]:checked").val()){
           			case "all": $(".calList-1").show(); $(".calList-2").hide(); $(".calList-3").hide(); $(".calList-4").hide(); break;
           			case "new": $(".calList-1").hide(); $(".calList-2").show(); $(".calList-3").hide(); $(".calList-4").hide(); break;
           			case "wait": $(".calList-1").hide(); $(".calList-2").hide(); $(".calList-3").show(); $(".calList-4").hide(); break;
           			case "complete": $(".calList-1").hide(); $(".calList-2").hide(); $(".calList-3").hide(); $(".calList-4").show();
           			}
           		})
       		
            </script>
	        <form action="<%= contextPath %>/detail.cal?" id="cal-2">
	        	<input type="hidden" name ="sta" value="0">
	           	<% if(rList.isEmpty()){ %>
	           		<div align="center">
	           			<b>조회된 내역이 없습니다.</b>
	           		</div>
	           	<% } else{%>
	            	<% for(int i=0; i<rList.size(); i++){ %>
	            		<div class="calList-1">
		                    <div>
		                        결제일자 : <%= rList.get(i).getRegDate() %> <br>
		                        <h5><%= rList.get(i).getClNo() %></h5> <br>
		                        수업일자 : <%= rList.get(i).getTeachDate() %> <%= rList.get(i).getSchNo() %><br>
		                        신청인원 : <%= rList.get(i).getRegCount() %>
		                    </div>
		                    <div align="right">
		                    	<% String regSta=""; String regColor="";
		                    	switch(rList.get(i).getMemEmail()){ 
		                    	case "N": regSta = "미신청"; regColor = "rgb(241, 196, 15)"; break;
		                    	case "W": regSta = "정산진행중"; regColor = "rgb(22, 160, 133)"; break;
		                        case "C": regSta = "신청완료"; regColor = "rgb(231, 76, 60)";
		                        } %>
		                        <span style="background:<%=regColor%>"><b><%= regSta %></b></span><br><br><br>	
		                        <b><%= rList.get(i).getRegPrice() %></b>
		                        <% if(rList.get(i).getMemEmail().equals("N")){ %>
		                        	<input type="checkbox" name="regNo" value="<%=rList.get(i).getRegNo()%>">
		                        <%} %>
		                    </div>
	                    </div>
	                <% } %>
	                <% if(nList.isEmpty()){ %>
	                	<div class="calList-2" align="center">
	           				<b>정산 미신청 내역이 없습니다.</b>
	           			</div>
	                <% }else{ %>
		                <% for(int i=0; i<nList.size(); i++){ %>
			                <div class="calList-2">
			                    <div>
			                        결제일자 : <%= nList.get(i).getTeachDate() %> <br>
			                        <h5><%= nList.get(i).getMemNo() %></h5> <br>
			                        수업일자 : <%= nList.get(i).getClNo() %> <%= nList.get(i).getRegDate() %><br>
			                        신청인원 : <%= nList.get(i).getRegPrice() %>
			                    </div>
			                    <div align="right">
			                        <span style="background:rgb(241, 196, 15);"><b>미신청</b></span><br><br><br>	
			                        <b><%= nList.get(i).getSchNo() %></b>
			                        <input type="checkbox" name="regNo" value="<%=nList.get(i).getRegNo()%>">
			                    </div>
		                    </div>
	                    <% } %>
	                <% } %>
	                <% if(wList.isEmpty()){ %>
	                	<div class="calList-3" align="center">
	           				<b>정산 진행중인 내역이 없습니다.</b>
	           			</div>
	                <% }else{ %>
	                    <% for(int i=0; i<wList.size(); i++){ %>
			                <div class="calList-3">
			                    <div>
			                        결제일자 : <%= wList.get(i).getTeachDate() %> <br>
			                        <h5><%= wList.get(i).getMemNo() %></h5> <br>
			                        수업일자 : <%= wList.get(i).getClNo() %> <%= wList.get(i).getRegDate() %><br>
			                        신청인원 : <%= wList.get(i).getRegPrice() %>
			                    </div>
			                    <div align="right">
			                        <span style="background:rgb(22, 160, 133);"><b>정산진행중</b></span><br><br><br>	
			                        <b><%= wList.get(i).getSchNo() %></b>
			                    </div>
		                    </div>
	                    <% } %>
	                <% } %>
	                <% if(cList.isEmpty()){ %>
	                	<div class="calList-4" align="center">
	           				<b>정산 완료된 내역이 없습니다.</b>
	           			</div>
	                <% }else{ %>
	                    <% for(int i=0; i<cList.size(); i++){ %>
			                <div class="calList-4">
			                    <div>
			                        결제일자 : <%= cList.get(i).getTeachDate() %> <br>
			                        <h5><%= cList.get(i).getMemNo() %></h5> <br>
			                        수업일자 : <%= cList.get(i).getClNo() %> <%= cList.get(i).getRegDate() %><br>
			                        신청인원 : <%= cList.get(i).getRegPrice() %>
			                    </div>
			                    <div align="right">
			                        <span style="background:rgb(231, 76, 60)"><b>정산완료</b></span><br><br><br>	
			                        <b><%= cList.get(i).getSchNo() %></b>
			                    </div>
		                    </div>
	                    <% } %>
                    <% } %>
               	<% } %>
           		<div align="center">
           			<button type="submit" class="btn btn-sm" id="cal-btn" disabled>정산 신청</button>
           		</div>
	        </form>
		</div>
		<script>
			$(function(){  
				$("input:checkbox[name='regNo']").click(function(){
					if($("input:checkbox[name='regNo']:checked").length>0) {
						$("#cal-btn").attr("disabled", false);
					} else{
						$("#cal-btn").attr("disabled", true);
					}
				})
			})
		</script>
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