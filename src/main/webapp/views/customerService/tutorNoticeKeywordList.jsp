<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
    
<%
	
   	ArrayList<Notice> list  = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            
            padding:40px;
        }
        .list{
            text-align: center;
        }
        
            
        .list>tbody>tr:hover{
        	cursor:pointer;
        	
        }
        table {
        width: 100%;
        border-top: 1px solid lightgray;
        border-collapse: collapse;
	    }
	    th, td {
	        border-bottom: 1px solid lightgray;
	        padding: 10px;
	    }
	    .keyword{
        	float:right;
        }
        
    </style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

    <div class="outer">

        <div>
            <a href="" style="color: black; font-size: large; font-weight: 800;" >
                >>공지사항</a>
        </div><br>

        	<form action="<%=request.getContextPath()%>/searchNotice.tor" method="post" class="keyword">
        
            <input type="text" name="keyword">
            <button type="submit">검색</button>
        	</form>

        <br><br><br>

        <table align="center" class="list">
        	<thead>
	            <tr style="background-color: lightgray;">
	                <th width="150">번호</th>
	                <th width="500" >제목</th>
	                <th width="350">작성날짜</th>
	            </tr>
            </thead>
            
            <tbody>
	            <%if(list.isEmpty()){ %>
	            <tr>
	                <td colspan="3">조회된 공지사항이 없습니다.</td>
	            </tr>
				<%}else{ %>
					<%for(int i=0; i<list.size(); i++){ %>
			            <tr>
			                <td><%=i+1 %></td>
			                <td onclick="location.href = '<%=contextPath%>/noticedetail.tor?ntNo=<%=list.get(i).getNtNo()%>'"><%=list.get(i).getNtTitle() %></td>
			                <td><%=list.get(i).getEnrollDate() %></td>
			            </tr>
		            <%} %>
				<%} %>
			</tbody>
        </table>

        
        
        <br><br><br>

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>