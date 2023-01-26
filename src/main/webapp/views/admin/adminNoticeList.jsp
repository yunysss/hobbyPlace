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
    
   
</style>
</head>
<body>

<%@ include file="../common/adminMenubar.jsp" %>

    <div class="outer">
        <br>
        <h1><b>고객센터</b></h1> 
        <br><hr>

        <div align="right">
            <input type="text">
            <button><img src="resources/search.svg"></button>
            
        </div>

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
                <tr>
                    <td style="background-color:rgb(255, 251, 231); width: 100px; text-align:center;color:rgb(192, 57, 43); font-weight: bolder;">
                        튜터</td>
                    <td>공지사항제목</td>
                    <td>작성일</td>
                </tr>
            </table>
            
        </div>

        <br><br><br>

        <div class="paging-area">

            <button style="border: none;">&lt;</button>
            <button style="background-color:rgb(50, 106, 118); color:white; border:none">1</button>
            <button style="border: none;">&gt;</button>

        </div>

        


    </div>
    
</body>
</html>