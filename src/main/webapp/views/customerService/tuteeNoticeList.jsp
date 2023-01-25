<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
    
<%
   	ArrayList<Notice> list  = (ArrayList<Notice>)request.getAttribute("list");
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
            margin-top: 100px;
        }
        .list{
            text-align: center;
        }
        .paging-area{
            text-align: center;
            
        }
        
    </style>
</head>
<body>

<%@ include file="../common/tuteeMenubar.jsp" %>

 <div class="outer">

        <div align="right">
            <input type="text">
            <button><img src="resources/search.svg"></button>
            
        </div>

        <div>
            <a href=""><button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 150px; height: 60px; font-size: large;" >공지사항</button></a>
        </div>

        <br>

        <table align="center" class="list">
        <%if(list.isEmpty()){ %>
        	<tr>
        		<td>등록된 공지사항이 없습니다.</td>
        	</tr>
        <%}else{ %>
            <tr style="background-color: lightgray;">
                <th width="100">번호</th>
                <th width="400" >제목</th>
                <th width="300">작성날짜</th>
            </tr>
            
            <tr>
            <%for(Notice n : list){ %>
                <td><%=n.getNtNo() %></td>
                <td><%=n.getNtTitle() %></td>
                <td><%=n.getEnrollDate() %></td>
            </tr>
            <%} %>
          <%} %>

        </table>
        
        <br><br><br>

        <div class="paging-area">

            <button style="border: none;">&lt;</button>
            <button style="background-color:rgb(22, 160, 133); color:white; border:none">1</button>
            <button style="border: none;">&gt;</button>

        </div>
        

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>