<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.qna.model.vo.*"%>
<%
	ArrayList<Qna> list  = (ArrayList<Qna>)request.getAttribute("list");
	
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
            margin-top: 40px;
        }
        .list{
            text-align: center;
        }
        .paging-area{
            text-align: center;
            
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
</style>
</head>
<body>

    <div class="outer">

        <h2><b>문의관리</b></h2> 
            <br><br> 

        <h4>나의문의목록</h4>
        <hr>

        <table align="center" class="list">
            <tr style="background-color: lightgray;">
                <th width="60">번호</th>
                <th width="500" >제목</th>
                <th width="100">등록일</th>
                <th width="100">처리일</th>
                <th width="50">상태</th>
            </tr>
            
            <%if(list.isEmpty()){ %>
	            <tr>
	                <td colspan="5">등록된 문의사항이 없습니다.</td>
	            </tr>
			<%}else{ %>
				<%for(int i=0; i<list.size(); i++){ %>
		            <tr>
		                <td><%= i+1 %></td>
		                <td><%=list.get(i).getqTitle() %></td>
		                <td><%=list.get(i).getqDate() %></td>
		                <%if(list.get(i).getaMemNick().equals("N")){ %>
			                <td></td>
			                <td>대기</td>
		                <%}else{ %>
			                <td><%=list.get(i).getaDate() %></td>
			                <td>완료</td>
		                <%} %>
		            </tr>
	            <%} %>
			<%} %>
        </table>
			
        <br><br>

    </div>
    
</body>
</html>