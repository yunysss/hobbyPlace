<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        padding: 30px;
        font-size: smaller;
    }
    h5{font-weight: 800;}
   

    #newClass{
        text-align: center;
    }
    #btn-area {float: right;}

    #btn-area {width: 600px;}
  
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
 
<div class="outer">
    <br>
    <h5 style="font-weight: 900;">신규클래스 신청내역</h5>
    <br><br>
    <span style="font-weight: 600;">신규클래스 목록</span>
    
    <div id="btn-area" align="right">
    <button class="btn btn-secondary btn-sm">승인</button>
    <button class="btn btn-secondary btn-sm">반려</button>
    </div>
    <hr>
    <table class="table table-hover" id="newClass" >
        <thead class="thead-light">
            <tr>
                <th width="100">클래스번호</th>
                <th width="500">클래스명</th>
                <th width="100">등록일</th>
                <th width="100">튜터명</th>
                <th width="100">상태</th>
            </tr>
        </thead>
        
        <tbody>
           
                <tr>
                    <td colspan="5">신규클래스 신청내역이 없습니다.</td>
                    
                </tr>
           
                <tr>
                    <td>1</td>
                    <td>클래스명자리</td>
                    <td>2023-01-16</td>
                    <td>튜터명자리</td>
                    <td>검수요청</td>

                </tr>
          
         </tbody>

    </table>


    <div class="paging-area">
     페이징바 
     </div>


</div>

</body>
</html>