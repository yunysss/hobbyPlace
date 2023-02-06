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
           
        }
        .list{
            text-align: center;
        }
        .list>tbody>tr:hover{
        	cursor:pointer;
        	
        }
        
        .keyword{
        	float:right;
        }
        
    </style>
</head>
<body>

<%@ include file="../common/tuteeMenubar.jsp" %>

 <div class="outer">
		<br>
        <h1><b onclick="location.href='<%=contextPath%>/cs.tee'">튜티 고객센터</b></h1> 
            <br><br> 
            
            <form action="<%=request.getContextPath()%>/searchNotice.tee" method="post" class="keyword">
        
            <input type="text" name="keyword">
            <button type="submit">검색</button>
        	</form>
       
        <div>
            <a href=""><button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 150px; height: 60px; font-size: large;" >공지사항</button></a>
        </div>

        <br>

        <table align="center" class="list">
	        <thead>
	        	<tr style="background-color: lightgray;">
	                <th width="100">번호</th>
	                <th width="400" >제목</th>
	                <th width="300">작성날짜</th>
	            </tr>
	         </thead>
	         <tbody>
		        <%if(list.isEmpty()){ %>
		        	<tr>
		        		<td>등록된 공지사항이 없습니다.</td>
		        	</tr>
		        <%}else{ %>
		            
		            <%for(int i=0; i<list.size(); i++){ %>
			            <tr>
			                <td><%=i+1 %></td>
			                <td onclick="location.href = '<%=contextPath%>/ntDetail.no?ntNo=<%=list.get(i).getNtNo()%>'"><%=list.get(i).getNtTitle() %></td>
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