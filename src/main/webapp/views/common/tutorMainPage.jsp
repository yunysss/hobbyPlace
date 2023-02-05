<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.customerService.model.vo.* , java.text.DecimalFormat , com.hp.register.model.vo.*"  %>    
<%
   ArrayList<Notice> nList = (ArrayList<Notice>)request.getAttribute("nList");
   ArrayList<Register> rList = (ArrayList<Register>)request.getAttribute("rList");
   Tutor tt =  (Tutor)request.getAttribute("tt");
  

   int ingClass =(int)request.getAttribute("ingClass");
   int qnaPer = (int)request.getAttribute("qnaPer");
   
   if(tt!= null){
   int sumMonth = tt.getSumMonth();
   int sumTotal = tt.getSumTotal();
   int sumReg = tt.getSumReg();
   
   DecimalFormat df = new DecimalFormat("###,###");
   String monthSum = df.format(sumMonth);
   String totalSum = df.format(sumTotal);
   String regSum = df.format(sumReg);
   }
   
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>



<title>Insert title here</title>
<style>
#content2{
    width: 1000px;
    padding:20px;
    height: 100%;
 
}

#content2>div{
    width: 450px;
    height: 310px;
    float: left;
    background-color: rgb(251, 251, 252);
    margin-left: 10px;
    margin-top: 10px;
}

#c2{
    padding: 10px;
}
#content2-1, content2-2{
    position: relative;
}

#c1{
              
   width: 50%;
   position: absolute;
   left: 20px;
   bottom: 30px;
   
}
#c1 h3{
    font-weight: 900; 
    margin-bottom: 5px;

}

#notice-area, #reserva-area{
position: relative;
height: 48%;
margin: 5px 5px;

}

#notice-area>table, #reserva-area>table{
width: 400px;
margin: auto;
margin-top: 5px;
}
#notice-area a, #reserva-area a{
    position: absolute;
    right: 25px;
    cursor: pointer;
    text-decoration: none;
    
}

#reservation{
  font-size : 12px;
}


/*통계*/
.s{font-weight: 600; font-size:13px; color: rgb(77, 76, 76); margin-bottom: 12px;}
.l{font-weight: 600; font-size: 26px;}



</style>
</head>
<body>
 <%@ include file="../common/tutorMenubar.jsp" %>
<div id="content2">
<div id="content2-1">
        <div id="c1">
        <span><h3><%=tutorInfo.getTtName() %> 님 <br>반갑습니다 🥰</h3> </span>
        <a href="<%=contextPath%>/qnalist.tor?MemNo=<%=MemNo%>" class="btn btn-secondary btn-sm">문의하기</a>
        <a href="<%=contextPath%>/tutorUsage.no"class="btn btn-secondary btn-sm">튜터 가이드</a>
        </div>

</div>
<%if (tt != null){ %>
<div id="content2-2">
    <div id="notice-area">
        <span style="font-size: 14px;font-weight: 600;">📌공지사항 </span>
        <a href="<%=contextPath %>/noticelist.tor?cpage=1" style="color:black; font-size: 12px;"> ➕더보기</a>
        <table id="notice" class="table table-hover table-sm" >
         <%if (nList.isEmpty()){ %>
         <tr>
         <td colspan="3">공지사항이 없습니다.</td>
         <ty>
         <%}else if(nList.size()<=2){ %>
         	<%for (int i=0; i<nList.size(); i++) {%>
            <tr>
                <td width="20">
                <input type="hidden" value="<%=nList.get(i).getNtNo()%>">
                <span class="badge badge-info">공지</span>
                </td>
                <td width="230" style="font-size:12px"><%=nList.get(i).getNtTitle() %></td>
                <td width="100" style="font-size:12px"><%=nList.get(i).getEnrollDate() %></td>
  
            </tr>
            <%} %>
          <%} else{%>
         
          <%for(int i=0; i<3; i++) {%>
            <tr>
                <td width="20">
                <input type="hidden" value="<%=nList.get(i).getNtNo()%>">
                <span class="badge badge-info">공지</span>
                </td>
                <td width="230" style="font-size:12px"><%=nList.get(i).getNtTitle() %></td>
                <td width="100" style="font-size:12px"><%=nList.get(i).getEnrollDate() %></td>
                
            </tr>
          <%} %>
         <%} %>   
        </table>
          <script type="text/javascript">
          $(function(){
              $("#notice td").click(function(){
                location.href="<%=contextPath%>/noticedetail.tor?ntNo="+$(this).siblings('td').children().eq(0).val();
              })
            })
   
          </script>
        
        
        
    </div>
    <div id="reserva-area">
        <span style="font-size: 14px;font-weight: 600;">📆예약관리</span>
         <a href="<%=contextPath %>/reservationList.tt" style="color:black; font-size: 12px;"> ➕더보기</a>
        <table id="reservation" class="table table-hover table-sm">
            <tr>
                <th width="60">날짜</th>
                <th width="150">클래스명</th>
                <th width="50">인원</th>
            </tr>
           <%if (rList.isEmpty()){ %>
            <tr>
                <td colspan="3">예약내역이 없습니다.</td>       
            </tr>
         	<%}else if(rList.size() <= 2){%>
         	 <%for (int i=0; i<rList.size(); i++) {%>
            <tr>
                <td><%=rList.get(i).getTeachDate() %></td>
                <td><%=rList.get(i).getClNo() %></td>
                <td><%=rList.get(i).getRegCount() %></td>
            </tr>
         	 <%} %>

           <%}else{%>
            <%for (int i=0; i<3; i++) {%>
            <tr>
                <td><%=rList.get(i).getTeachDate() %></td>
                <td><%=rList.get(i).getClNo() %></td>
                <td><%=rList.get(i).getRegCount() %></td>
            </tr>
          <%} %>
          <%} %>
            
        </table>
    </div>
    
    <script>
    	$(function(){
    		$("#reservation *").click(function(){
    			location.href="<%=contextPath %>/reservationList.tt"
    	  })
    	})
    
    </script>

</div>
<div id="content2-3">
    <div>
        <table align="center" style="margin-top: 10px;">
            <tr style="vertical-align:middle">
              <td style="width:200px; height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">평균평점</div>
					<%if(tt.getAvgStar() != null){%>                   
                    <div class="l"> <%=tt.getAvgStar()%> 점</div>
					<%} else{ %>
					<div class="l">- 점</div>
					<%} %>
				
                </td>
              <td style="padding-left:10px; width:200px; text-align:center  ">
                <div class="s">수강후기 수</div>
                <%if(tt.getrCount() != 0){ %>
                <div class="l"><%=tt.getrCount() %> 개</div>
                <%} else{%>
                 <div class="l">- 개</div>
            	<%} %>
            </td>
            </tr>
            <tr>
                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                    <div class="s">문의응답률</div>
                    <%if(qnaPer != 0){ %>
                    <div class="l"><%=qnaPer%> %</div>
                    <%} else{%>
                    <div class="l">0 %</div>
                    <%} %>
                </td>
                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">이번달 취소건수</div>
                    <%if(tt.getCancelCount() != 0){ %>
                    <div class="l"><%=tt.getCancelCount() %> 건</div>
                    <%} else{ %>
                    <div class="l">- 건</div>
                    <%} %>
                </td>
            </tr>
          </table>
        
    </div>
</div>
<div id="content2-4">
    <div>
        <table align="center" style="margin-top: 10px;">
            <tr style="vertical-align:middle">
              <td style="width:200px; height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">진행중인 클래스</div>
                    <div class="l"><%=ingClass %> 건</div>
                   
				
                </td>
                <% DecimalFormat df = new DecimalFormat("###,###");  %>
              <td style="padding-left:10px; width:200px; text-align:center  ">
                <div class="s">이번달 판매금액</div>
                <% if(tt.getSumMonth() !=0){%>
                <div class="l"><%=df.format(tt.getSumMonth()) %>원</div>
                <%} else{%>
                <div class="l">- 원</div>
                <%} %>
             </td>
         
            </tr>
            <tr>
                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                    <div class="s">전체 결제건수</div>
                    <% if(tt.getSumReg() !=0){ %>
                    <div class="l"><%=tt.getSumReg() %> 건</div>
                    <%} else{%>
                     <div class="l">- 건</div>
                     <%} %>
                </td>
                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">전체 판매금액</div>
                    <%if(tt.getSumTotal() != 0){ %>
                    <div class="l">
                    <%=df.format(tt.getSumTotal())%> 원</div>
                	<%} else{%>
                	<div class="l">- 원</div>
                	<%} %>
                </td>
            </tr>
          </table>
         
    </div>
</div>
</div>
<%} else{ %>
<div id="content2-2">
    <div id="notice-area">
        <span style="font-size: 14px;font-weight: 600;">📌공지사항 </span>
        <a href="<%=contextPath %>/noticelist.tor?cpage=1" style="color:black; font-size: 12px;"> ➕더보기</a>
        <table id="notice" class="table table-hover table-sm" >
          <%if (nList.isEmpty()){ %>
         <tr>
         <td colspan="3">공지사항이 없습니다.</td>
         <ty>
         <%}else if(nList.size()<=2){ %>
         	<%for (int i=0; i<nList.size(); i++) {%>
            <tr>
                <td width="20">
                <input type="hidden" value="<%=nList.get(i).getNtNo()%>">
                <span class="badge badge-info">공지</span>
                </td>
                <td width="230" style="font-size:12px"><%=nList.get(i).getNtTitle() %></td>
                <td width="100" style="font-size:12px"><%=nList.get(i).getEnrollDate() %></td>
  
            </tr>
            <%} %>
          <%} else{%>
         
          <%for(int i=0; i<3; i++) {%>
            <tr>
                <td width="20">
                <input type="hidden" value="<%=nList.get(i).getNtNo()%>">
                <span class="badge badge-info">공지</span>
                </td>
                <td width="230" style="font-size:12px"><%=nList.get(i).getNtTitle() %></td>
                <td width="100" style="font-size:12px"><%=nList.get(i).getEnrollDate() %></td>
                
            </tr>
          <%} %>
         <%} %>   
        </table>
          <script type="text/javascript">
          $(function(){
              $("#notice td").click(function(){
                location.href="<%=contextPath%>/noticedetail.tor?ntNo="+$(this).siblings('td').children().eq(0).val();
              })
            })
   
          </script>
        
        
    </div>
    <div id="reserva-area">
        <span style="font-size: 14px;font-weight: 600;">📆예약관리</span>
         <a href="<%=contextPath %>/reservationList.tt" style="color:black; font-size: 12px;"> ➕더보기</a>
        <table id="reservation" class="table table-hover table-sm">
            <tr>
                <th width="60">날짜</th>
                <th width="160">클래스명</th>
                <th width="50">인원</th>
            </tr>
           <%if (rList.isEmpty()){ %>
            <tr>
                <td colspan="3">예약내역이 없습니다.</td>       
            </tr>
         	<%}else if(rList.size() <= 2){%>
         	 <%for (int i=0; i<rList.size(); i++) {%>
            <tr>
                <td><%=rList.get(i).getTeachDate() %></td>
                <td><%=rList.get(i).getClNo() %></td>
                <td><%=rList.get(i).getRegCount() %></td>
            </tr>
         	 <%} %>

           <%}else{%>
            <%for (int i=0; i<3; i++) {%>
            <tr>
                <td><%=rList.get(i).getTeachDate() %></td>
                <td><%=rList.get(i).getClNo() %></td>
                <td><%=rList.get(i).getRegCount() %></td>
            </tr>
          <%} %>
          <%} %>
            
        </table>
    </div>
	 <script>
    	$(function(){
    		$("#reservation *").click(function(){
    			location.href="<%=contextPath %>/reservationList.tt"
    	  })
    	})
    
    </script>


</div>
<div id="content2-3">
    <div>
        <table align="center" style="margin-top: 10px;">
            <tr style="vertical-align:middle">
              <td style="width:200px; height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">평균평점</div>         
                    <div class="l"> 0 점</div>
			
				
					
				
                </td>
              <td style="padding-left:10px; width:200px; text-align:center  ">
                <div class="s">수강후기 수</div>
                <div class="l">0 개</div>
             
            
            </td>
            </tr>
            <tr>
                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                    <div class="s">문의응답률</div>
                    <div class="l">0 %</div>
                   
                </td>
                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">이번달 취소건수</div>
                 
                    <div class="l">0 건</div>
           
                </td>
            </tr>
          </table>
        
    </div>
</div>
<div id="content2-4">
    <div>
        <table align="center" style="margin-top: 10px;">
            <tr style="vertical-align:middle">
              <td style="width:200px; height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">진행중인 클래스</div>
                    <div class="l">0 건</div>
                   

                </td>
              <td style="padding-left:10px; width:200px; text-align:center  ">
                <div class="s">이번달 판매금액</div>
             
                <div class="l">0 원</div>
                
             </td>
         
            </tr>
            <tr>
                <td style="border-top: 1px solid rgb(194, 191, 191); width:200px;height: 135px; border-right:1px solid rgb(194, 191, 191); text-align:center" >
                    <div class="s">전체 결제건수</div>
                  
                    <div class="l">0 건</div>
                   
                </td>
                <td style="border-top: 1px solid rgb(194, 191, 191); text-align:center">
                    <div class="s">전체 판매금액</div>
               
                    <div class="l">0 원</div>
               
                </td>
            </tr>
          </table>
         
    </div>
</div>
</div>
<%} %>




<%@ include file="footerbar.jsp" %>

</body>
</html>