<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        .detail{
            text-align: center;
         
        }
        .abc{
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">

        <br>
        <h1><b>튜티 고객센터</b></h1> 
            <br><br>  

            <div align="right">
                <input type="text">
                <button><img src=""></button>
                
            </div>

            <div> 
                <a href=""><button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 150px; height: 60px; font-size: large;">공지사항</button></a>
            </div>
    
            <br>


            <div class="detail">
            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="background-color: lightgray;" width="100">제목</th>
                    <td width="700">공지사항제목자리</td>
                </tr>
            </table>
               
            <br>

            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th width="100" style="background-color: lightgray;" width="100">첨부파일</th>
                    <td width="400">파일이름자리 <button type="" style="border: none; float: right;" >다운로드</button></td>
                    <th style="background-color: lightgray;" width="100">작성날짜</th>
                    <td width="200">2022-12-30</td>
                </tr>

            </table>

            </div>

            <br>

            <div style="border: 1px solid lightgray; padding: 10px; width: 800px; margin-left:auto;margin-right:auto;">
                <p>공지사항 내용이 들어갈 자리</p>

                
            </div>

            <br>

            <div class="abc">
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
    
    <%@ include file="../common/footerbar.jsp" %>
    

</body>
</html>