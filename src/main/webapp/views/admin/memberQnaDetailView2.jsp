<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<style>
div{box-sizing:border-box;}
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
<div class="cWrap">
       <h3>1:1 문의</h3>
       <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" href="#">튜터 QnA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">관리자 QnA</a>
        </li>
      </ul>


       <div>
         튜터 QnA
         <table>
            <colgroup>
                <col style="width:150px;">
                <col style="width:150px;">
                <col style="width:400px;">
                <col style="width:150px;">
                <col style="width:100px;">
            </colgroup>
            <tr>
                <td>튜터이름</td>
                <td>클래스이름</td>
                <td>제목</td>
                <td>작성일</td>
                <td>답변여부</td>
            </tr>
            <tbody>

            </tbody>
         </table>
       </div>

       <div>
         관리자 Qna

       </div>





    </div>

</body>
</html>