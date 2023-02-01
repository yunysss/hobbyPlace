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
    .enroll{
        background-color: rgb(230, 126, 34);
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
        border: 1px solid gray;
        padding: 10px;
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

        <div class="tutor">
            튜티
        </div><br><br>

        
        <form action="<%=contextPath %>/insertTuteeFaq.ad" method="post">
            
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; text-align: center;">
                        제목
                    </th>
                    <td >
                        <input type="text" name="title" style="width: 900px; height: 50px;resize: none; border-color: lightgray; border: none;" required placeholder="제목을 입력하세요.">
                    </td>
                </tr>
        
            </table>
            <br>
            
            <table>
                <tr>
                    <td><textarea name="content" rows="10" required style="resize:none; width:1000px; height: 500px; border-color: lightgray; border: none;"  ></textarea></td>
                </tr>

            </table>
            <br>

            <button type="reset" style="background-color:lightgray; border:none; width: 120px; height: 50px; ">취소</button>
            <button type="submit" style="background-color:rgb(50, 106, 118); color:white; border:none; width: 120px; height: 50px; float:right">등록하기</button>

        </form>


    </div>
    <br><br><br><br><br>
    
</body>
</html>