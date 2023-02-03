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
</style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">

        <div>
            <a href="" style="color: black; font-size: large; font-weight: 800;" >
                >>1:1문의등록</a>
        </div>

        <br>

        <form action="insertQna.tor" method="post">
            <input type="hidden" name="no" value="<%=MemNo%>">
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; text-align: center;">
                        제목
                    </th>
                    <td >
                        <input type="text" name="title" style="width: 900px; height: 50px;resize: none; border-color: lightgray;" required placeholder="제목을 입력하세요.">
                    </td>
                </tr>
        
            </table>
            <br>
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; height: 50px; text-align: center;">분류</th>
                    <td>
                        <select name="Qcategory" style="border-color: lightgray; width: 400px; height: 50px;">
                            <option value="20">결제/환불</option>
                            <option value="30">운영</option>
                            <option value="40">기타</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <table>
                <tr>
                    <td><textarea name="content" rows="10" required style="resize:none; width:1000px; height: 500px; border-color: lightgray;"  ></textarea></td>
                </tr>

            </table>
            <br>

            <button type="reset" style="background-color:lightgray; border:none; width: 120px; height: 50px; ">취소</button>
            <button type="submit" style="background-color:rgb(22, 160, 133); color:white; border:none; width: 120px; height: 50px; float:right">등록하기</button>

        </form>

        





    </div>
    
</body>
</html>