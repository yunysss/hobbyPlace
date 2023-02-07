<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.hp.customerService.model.vo.Notice, com.hp.common.model.vo.*"%>
    
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
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
    }
    .title{
        font-size: 20px;
        font-weight: bolder;
        float: left;
        width: 100px;
        
    }
    table{
        border: 1px solid lightgray;
        margin-left: auto;
        margin-right: auto;
    }
    .paging-area{
        text-align: center;
    }
    .content{
        border: 1px solid lightgray;
        padding: 10px;
        width: 800px;
        margin-left: auto;
        margin-right: auto;
        height: 500px;
    }
    .reset{
        background-color: rgb(230, 126, 34);
        color: white;
        border: none;
        float: right;
    
    }
    .button{
        width: 800px;
        margin-left: auto;
        margin-right: auto;
    }
</style>

</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">
        <br>
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">공지사항</div> <br><hr>

        <div class="detail">
            <table>
                <tr>
                    <th style="background-color: lightgray;" width="100">제목</th>
                    <td width="700"><%=n.getNtTitle() %></td>
                </tr>
            </table>
               
            <br>

            <table >
                <tr>
                    <th width="100" style="background-color: lightgray;" width="100">첨부파일</th>
                    <td width="400">
                    <% if(at==null){ %>
                    <!-- case1. 첨부파일 없을 경우 -->
                    첨부파일이 없습니다.
					<%}else{ %>
                    <!-- case2. 첨부파일 있을 경우 -->
                    <a download="<%= at.getOriginName() %>" href="<%=contextPath%>/<%=at.getFilePath()+ at.getChangeName() %>"><%= at.getOriginName() %></a>
					<%} %>
					</td>
                    <th style="background-color: lightgray;" width="100">작성날짜</th>
                    <td width="200"><%=n.getEnrollDate() %></td>
                </tr>

            </table>

            </div>

            <br>

            <div class="content">
                <p><%=n.getNtContent() %></p>
               
                
            </div><br>
            <div class="button">
            <a href="<%=contextPath%>/delete.nt?ntNo=<%=n.getNtNo()%>"><button class="reset">삭제하기</button></a>
            </div>

            <br><br>

            <div class="paging-area">
            <div style="float: left; width: 33%; "  >
                <button style="border: none; background-color: lightgray; ">&lt;이전글</button>
            </div>
            <div style="float:left; width: 33%;" >
                <a href="<%=contextPath%>/noticeList.ad?cpage=1"><button style="border:none; background-color: lightgray;" >목록</button></a>
            </div>
            <div style="float: left; width: 33%;">
                <button style="border: none; background-color: lightgray;">다음글&gt;</button>
            </div>
           </div>
    

    </div>
    
    <br><br><br><br><br><br>
    
</body>
</html>