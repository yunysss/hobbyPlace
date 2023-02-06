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
            
            padding:40px;
        }
        .detail{
            text-align: center;
         
        }
        .abc{
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

    <div class="outer">

         

            <div align="right">
                <input type="text">
                <button><img src="resources/search.svg"></button>
                
            </div>

            <div>
                <a href="" style="color: black; font-size: large; font-weight: 800;" >
                    >>공지사항</a>
            </div>
    
            <br>


            <div class="detail">
            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="background-color: lightgray;" width="150">제목</th>
                    <td width="850"><%=n.getNtTitle() %></td>
                </tr>
            </table>
               
            <br>

            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th width="150" style="background-color: lightgray;" width="100">첨부파일</th>
                    <td width="400">
                    <% if(at==null){ %>
                    <!-- case1. 첨부파일 없을 경우 -->
                    첨부파일이 없습니다.
					<%}else{ %>
                    <!-- case2. 첨부파일 있을 경우 -->
                    <a download="<%= at.getOriginName() %>" href="<%=contextPath%>/<%=at.getFilePath()+ at.getChangeName() %>"><%= at.getOriginName() %></a>
					<%} %>
					</td>
                    <th style="background-color: lightgray;" width="150">작성날짜</th>
                    <td width="250"><%=n.getEnrollDate() %></td>
                </tr>

            </table>

            </div>

            <br>

            <div style="border: 1px solid lightgray; padding: 10px; width: 1000px; margin-left:auto;margin-right:auto;">
                <p><%=n.getNtContent() %></p>

                
            </div>

            <br>

            <div class="abc">
            <div style="float: left; width: 33%; text-align: left;"  >
                <button style="border: none; background-color: lightgray; ">&lt;이전글</button>
            </div>
            <div style="float:left; width: 33%;" >
                <a href="<%=contextPath%>/noticelist.tor?cpage=1"><button style="border:none; background-color: lightgray;  ">목록</button></a>
            </div>
            <div style="float: left; width: 33%; text-align: right;">
                <button style="border: none; background-color: lightgray;">다음글&gt;</button>
            </div>
           </div>
    
            
                
                

           




    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>