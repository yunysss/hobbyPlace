<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
    
<%
	ArrayList<Notice> list  = (ArrayList<Notice>)request.getAttribute("list");
	ArrayList<Faq> list2  = (ArrayList<Faq>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .outer{
        width: 1000px;
        margin: auto;
        margin-top: 30px;
    }
   .list-area{
    width: 800px;
    height: 200px;
   }
   .NtTitle{
   		text-decoration: none;
   		color: black;
   }
   
   	.faq:hover{
        	cursor:pointer;
        	
    }
   
   		
  
    
</style>

</head>
<body>

<%@ include file="../common/tuteeMenubar.jsp" %>

 <div class="outer">
        <br>
    <h1><b>고객센터</b></h1> 
        <br><br>  

    <hr>
    <br>

    <table class="list-area">
        <div align="right" style="width:1000px"><a href="<%=request.getContextPath()%>/notice.tee?cpage=1"
        " style="background-color:rgb(22, 160, 133); color:white; border:none">더보기+</a></div><br>
        <tr>
            <td 
            	style="background-color: lightgray;" 
            	width="200" height="200" align="center";>
                <b>공지사항</b>
            </td>
            <td style="text-align: left; line-height:200%; padding: 50px;" >
                <%if(list.isEmpty()){ %>
                <li>공지사항이 없습니다.</li>
                <%}else{ %>
                	<%for(int i=0; i<5; i++){ %>
                	
                      <a href="<%=request.getContextPath()%>/ntDetail.no?ntNo=<%=list.get(i).getNtNo() %>" class="NtTitle"><li><%=list.get(i).getNtTitle() %></li></a>
                      <%} %>
                <%} %>
                
            </td>
        </tr>
       

    </table>

    <hr>

    <table class="list-area">
        <div align="right" style="width:1000px"><a href="<%=request.getContextPath()%>/faq.tee?cpage=1" style="background-color:rgb(22, 160, 133); color:white; border:none">더보기+</a></div><br>

        <tr>
            <td style="background-color: lightgray; " width="200" height="200" align="center">
                <b>자주묻는질문</b>
            </td>
            <td style="text-align: left; line-height: 200%; padding: 50px;">
                <%if(list2.isEmpty()){ %>
                <li>자주묻는질문이 없습니다.</li>
                <%}else{ %>
                	<%for(int i=0; i<5; i++){ %>
                      <li class="faq" onclick="location.href='<%=contextPath%>/faq.tee?cpage=1'"><%=list2.get(i).getQuestion() %></li>
                      <%} %>
                <%} %>
            </td>
        </tr>
      

    </table>

</div>

<%@ include file="../common/footerbar.jsp" %>

</body>
</html>