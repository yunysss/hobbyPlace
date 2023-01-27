<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .list{
            text-align: center;
        }
        .paging-area{
            text-align: center;
            
        }
            
        
    </style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

    <div class="outer">

        <div>
            <a href="" style="color: black; font-size: large; font-weight: 800;" ><img src="resources/pin-angle-fill.svg" >
                1:1문의</a>
        </div>

        <br>

        <div style="float: left; width: 50%;"> 
            <a href="">
                <button style="background-color:lightgray;  border:none; width: 120px; height: 50px;">
                    나의 문의내역</button></a>
        </div>

        <div style="text-align: right;"> 
            <a href="">
                <button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 120px; height: 50px;">
                    문의 등록</button></a>
        </div>

        <br>

        <table align="center" class="list">
            <tr style="background-color: lightgray;">
                <th width="50">번호</th>
                <th width="600" >제목</th>
                <th width="150">등록일</th>
                <th width="150">처리일</th>
                <th width="100">상태</th>
            </tr>
            
            <tr>
                <td>1</td>
                <td>문의사항 제목1</td>
                <td>2023-01-16</td>
                <td></td>
                <td>대기</td>
            </tr>

            <tr>
                <td>2</td>
                <td>문의사항 제목2</td>
                <td>2023-01-14</td>
                <td>2023-01-16</td>
                <td>완료</td>
            </tr>

        </table>

        <br><br>

        <div class="paging-area">

            <button style="border: none;">&lt;</button>
            <button style="background-color:rgb(22, 160, 133); color:white; border:none">1</button>
            <button style="border: none;">&gt;</button>

        </div>
        

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>