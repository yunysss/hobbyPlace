<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.hp.customerService.model.vo.Faq"%>
<%
	Faq f = (Faq)request.getAttribute("f");
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
        .detail{
            text-align: center;
         
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
     .button{
        text-align: right;
     }   
    </style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">
    
        
        <br>
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">자주묻는질문</div> <br><hr>

          
            <div class="detail">
            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="background-color: lightgray;" width="150">제목</th>
                    <td width="850"><%=f.getQuestion() %></td>
                </tr>
            </table>
               
            <br></div> <br>

            <div style="border: 1px solid lightgray; padding: 10px; width: 1000px; height: 600px; margin-left:auto;margin-right:auto;">
                <p><%=f.getAnswer() %></p>

                
            </div> <br>

            <div class="button"> 
                <a href="<%=contextPath%>/updateFaq.ad?no=<%=f.getFaqNO()%>"><button style="background-color:rgb(230, 126, 34); color:white; border:none; width: 120px; height: 50px;">수정하기</button></a>
                <a href="<%=contextPath%>/deleteFaq.ad?no=<%=f.getFaqNO()%>"><button style="background-color:rgb(230, 126, 34); color:white; border:none; width: 120px; height: 50px;">삭제하기</button></a>
                <a href="">
                    <button style="background-color:rgb(50, 106, 118); color:white; border:none; width: 120px; height: 50px;">
                        문의 목록</button></a>
            </div>

            <br><br><br><br>
    </div>
    
</body>
</html>