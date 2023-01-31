
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*, com.hp.common.model.vo.PageInfo"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
   	ArrayList<Notice> list  = (ArrayList<Notice>)request.getAttribute("list");
   	String keyword = (String)request.getAttribute("keyword");
   	
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
        margin-top: 100px;
    }
    .title{
        font-size: 20px;
        font-weight: bolder;
        float: left;
        width: 100px;
    }
    .category1{
        float: left;
        width: 50px;
        background-color: rgb(255, 251, 231);
        text-align: center;
        margin-right: 10px;

    }
    .category2{
        float: left;
        width: 50px;
        background-color: rgb(255, 251, 231);
        text-align: center;
    }
    a{
        text-decoration: none;
        color: rgb(192, 57, 43);
        font-weight: bolder;
    }
    .content{
        width: 900px;
        margin: auto;
        
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
    .paging-area{
            text-align: center;
            
    }
     form{
        float: right;
    }
    
   
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">
        <br>
        <h1><b>고객센터</b></h1> 
        <br><hr>

        
        <form action="<%=request.getContextPath()%>/search.nt?cpage=1">
            <input type="text" name="keyword">
            <button type="submit">검색</button>
        </form>

        <div class="title">공지사항</div>
        <div class="category1" style="color: rgb(192, 57, 43);">
            <a href="">튜터</a>
        </div>
        <div class="category2">
            <a href="">전체</a>
        </div>

        
        <br><hr><br>
        <div class="content">
            <table>
            <%if(list.isEmpty()){ %>
            	<tr>"<%=keyword %>"로 등록된 공지사항이 없습니다.</tr>
            <%}else{ %>
            	<%for(Notice n : list){ %>
                <tr>
                    <td style="background-color:rgb(255, 251, 231); width: 100px; text-align:center;color:rgb(192, 57, 43); font-weight: bolder;">
                        <%String grade = n.getGrade();
	                        switch(String.valueOf(grade)){
	                        case "1" : grade ="전체"; break;
	                        case "2" : grade ="튜터"; break;
                         }%>
                         <%=grade %>
                         </td>
                    <td><%=n.getNtTitle() %></td>
                    <td><%=n.getEnrollDate() %></td>
                </tr>
                <%} %>
            <%} %>
            </table>
            
        </div>

        <br><br><br>

        <div class="paging-area">
			
			<%if(pi.getCurrentPage()!=1){ %>
            <button style="border: none;"
            		onclick="location.href='<%=request.getContextPath()%>/search.nt?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
            <%for(int i=pi.getStartPage(); i<pi.getEndPage(); i++){ %>
            <button style="background-color:rgb(22, 160, 133); color:white; border:none"
            		onclick="location.href='<%=request.getContextPath()%>/search.nt?cpage=<%=i%>';"><%= i %></button>
            <%} %>
            <%if(pi.getCurrentPage()!= pi.getMaxPage()) {%>
            <button style="border: none;"
            		onclick="location.href='<%=request.getContextPath()%>/search.nt?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
			<%} %>
        </div>

        


    </div>
    
</body>
</html>