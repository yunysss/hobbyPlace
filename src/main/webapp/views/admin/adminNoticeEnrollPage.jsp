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
    .button{
        float: right;
    }
</style>
</head>
<body>

    <div class="outer">

        <br>
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">공지사항</div> <br><hr>

        <form action="" method="post">
            
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; text-align: center;">
                        제목
                    </th>
                    <td >
                        <input type="text" style="width: 900px; height: 50px;resize: none; border-color: lightgray;" required placeholder="제목을 입력하세요.">
                    </td>
                </tr>
        
            </table>
            <br>
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; height: 50px; text-align: center;">분류</th>
                    <td>
                        <select name="Qcategory" style="border-color: lightgray; width: 400px; height: 50px;">
                            <option value="tutee">전체</option>
                            <option value="tutor">튜터</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <table>
                <tr>
                    <td><textarea name="" rows="10" required style="resize:none; width:1000px; height: 500px; border-color: lightgray;"  ></textarea></td>
                </tr>

            </table>
            <br>

            <input type="file">

            <div class="button">
            <button type="reset" style="background-color:lightgray; border:none; width: 120px; height: 50px; ">취소</button>
            <button type="submit" style="background-color:rgb(50, 106, 118); color:white; border:none; width: 120px; height: 50px; ">등록하기</button>
            </div>

        </form>

        





    </div>
    
</body>
</html>