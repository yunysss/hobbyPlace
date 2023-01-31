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
    }
</style>

</head>
<body>

    <div class="outer">
        <br>
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">공지사항</div> <br><hr>

        <div class="detail">
            <table>
                <tr>
                    <th style="background-color: lightgray;" width="100">제목</th>
                    <td width="700">공지사항제목자리</td>
                </tr>
            </table>
               
            <br>

            <table >
                <tr>
                    <th width="100" style="background-color: lightgray;" width="100">첨부파일</th>
                    <td width="400">파일이름자리 <button type="" style="border: none; float: right;" >다운로드</button></td>
                    <th style="background-color: lightgray;" width="100">작성날짜</th>
                    <td width="200">2022-12-30</td>
                </tr>

            </table>

            </div>

            <br>

            <div class="content">
                <p>공지사항 내용이 들어갈 자리</p>
                <button>삭제하기</button>
                
            </div>

            <br>

            <div class="paging-area">
            <div style="float: left; width: 33%; "  >
                <button style="border: none; background-color: lightgray; ">&lt;이전글</button>
            </div>
            <div style="float:left; width: 33%;" >
                <button style="border:none; background-color: lightgray;  ">목록</button>
            </div>
            <div style="float: left; width: 33%;">
                <button style="border: none; background-color: lightgray;">다음글&gt;</button>
            </div>
           </div>
    

    </div>
    
</body>
</html>