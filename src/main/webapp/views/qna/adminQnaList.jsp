<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.qna.model.vo.*"%>
    
<%
	ArrayList<Qna>list1 = (ArrayList<Qna>)request.getAttribute("list1");
	ArrayList<Qna>list2 = (ArrayList<Qna>)request.getAttribute("list2");
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
            margin-top: 20px;
        }
        .title{
        font-size: 20px;
        font-weight: bolder;
        float: left;
        width: 200px;
        
    }
    .tutor{
        color: rgb(192, 57, 43);
        background-color: rgb(255, 251, 231);
        width: 200px;
        height: 30px;
        text-align: center;
        font-weight: bolder;
        float: left;
    }
    .detail{
        background-color: rgb(50, 106, 118);
        color: white;
        width: 100px;
        height: 25px;
        text-align: center;
        float: right;
    }
    table{
        text-align: center;
        width: 100%;
        
    }
    th, td {
        border: 1px solid gray;
        padding: 10px;
    }
    th{
        background-color: lightgray;
        
    }
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">

        <br>
        <h1><b>고객센터</b></h1> 
        <hr>
        <div class="title">1:1문의/답변</div> <br><hr>

        <div class="tutor">
            튜터문의내역
        </div>
        
        <a href="<%=contextPath%>/tutorQnaList.ad"><div class="detail">더보기+</div></a>
        
        <br><br>

        <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성날짜</th>
                <th>처리상태</th>
            </tr>
		</thead>
		<tbody>
		<%if(list1.isEmpty()){ %>
            <tr>
                <td colspan="4">등록된 문의가 없습니다.</td>
            </tr>
		<%}else{ %>
		<%if(list1.size()>5){ %>
			<%for(int i=0; i<5; i++){%>
	            <tr>
	            
	                <td><%=i+1 %></td>
	                <td><%=list1.get(i).getqTitle() %></td>
	                <td><%=list1.get(i).getqDate() %></td>
	                <td><%if(list1.get(i).getaMemNick().equals("N")){ %>
			                		대기
			                <%}else{ %>
			                		완료
			                <%} %></td>
	            
	            </tr>
	            <%} %>
            <%}else{ %>
            	<%for(int i=0; i<list1.size(); i++){%>
	            <tr>
	            
	                <td><%=i+1 %></td>
	                <td><%=list1.get(i).getqTitle() %></td>
	                <td><%=list1.get(i).getqDate() %></td>
	                <td><%if(list1.get(i).getaMemNick().equals("N")){ %>
			                		대기
			                <%}else{ %>
			                		완료
			                <%} %></td>
	            
	            </tr>
	            <%} %>
            <%} %>
         <%} %>
		</tbody>
           
        </table><br><br><br>
        
        


        <div class="tutor">
            튜티문의내역
        </div>
        
        <a href="<%=contextPath%>/tuteeQnaList.ad"><div class="detail">더보기+</div></a>
        
        <br><br>
        
        <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성날짜</th>
                <th>처리상태</th>
            </tr>
		</thead>
		<tbody>
		<%if(list2.isEmpty()){ %>
            <tr>
                <td colspan="4">등록된 문의가 없습니다.</td>
            </tr>
		<%}else{ %>
		<%if(list2.size()>5){ %>
			<%for(int i=0; i<5; i++){%>
	            <tr>
	            
	                <td><%=i+1 %></td>
	                <td><%=list2.get(i).getqTitle() %></td>
	                <td><%=list2.get(i).getqDate() %></td>
	                <td><%if(list2.get(i).getaMemNick().equals("N")){ %>
			                		대기
			                <%}else{ %>
			                		완료
			                <%} %></td>
	            
	            </tr>
	            <%} %>
            <%}else{ %>
            	<%for(int i=0; i<list2.size(); i++){%>
	            <tr>
	            
	                <td><%=i+1 %></td>
	                <td><%=list2.get(i).getqTitle() %></td>
	                <td><%=list2.get(i).getqDate() %></td>
	                <td><%if(list2.get(i).getaMemNick().equals("N")){ %>
			                		대기
			                <%}else{ %>
			                		완료
			                <%} %></td>
	            
	            </tr>
	            <%} %>
	            <%} %>
         <%} %>
		</tbody>
           
        </table>

        
    </div>
    <br><br><br><br><br>
</body>
</html>