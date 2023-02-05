<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    .search-table{
       margin: 30px;
    }
    .search-table{
        width: 700px;
        height: 220px;
        margin: auto;
    }
    .search-table td{ margin: 5px;}
    .search-form p , .result-area p {
        padding: 10px;
        font-weight: bold;
    }
    
    #reviewSearch-btn{
        border: 0;
        background: rgb(35, 104, 116); 
        color:white;
        width: 50px;
        border-radius: 5px;
    }
    .search-area{ 
        padding: 15px;
        border: 1px solid gray;
        border-radius: 5px;
    }
    .result-area{
        height: 895px;
        padding: 15px;
    }

    .result-table{
        background-color: lightgray;
        text-align: center;
        margin: auto;
    }

    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
    <div class="content" style="margin:15px">
        <h6 style="margin-left: 15px;"><b>후기 조회</b></h6>
        <hr>
        <div class="search-area">
            <form action="" class="search-form">
                <p>상품 후기 목록 58건</p>
                <table class="search-table" >
                    <tr>
                        <th width="80px">평점</th>
                        <th width="60px"><input type="checkbox" name="reStar" value="1" id="1star">&nbsp;⭐</th>
                        <th width="80px"><input type="checkbox" name="reStar" value="2" id="2star">&nbsp;⭐⭐</th>
                        <th width="90px"><input type="checkbox" name="reStar" value="3" id="3star">&nbsp;⭐⭐⭐</th>
                        <th width="110px"><input type="checkbox" name="reStar" value="4" id="4star">&nbsp;⭐⭐⭐⭐</th>
                        <th width="110px"><input type="checkbox" name="reStar" value="5" id="5star">&nbsp;⭐⭐⭐⭐⭐</th>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5"><input type="search"></td>
                    </tr>
                    <tr>
                        <th>클래스명</th>
                        <td colspan="5"><input type="search"></td>
                    </tr>
                    <tr>
                        <th>튜티명</th>
                        <td colspan="4"><input type="search"></td>
                        <td><button id="reviewSearch-btn">검색</button></td>
                    </tr>
            </form>
            </table>
        </div> <!-- 검색영역 끝-->

        <div class=" result-area">
            <p>검색결과</p>
            <table class="result-table" border="1">
                <tr>
                    <th width="280px">클래스명</th>
                    <th width="280px">리뷰</th>
                    <th width="100px">별점</th>
                    <th width="100px">작성자</th>
                </tr>
            </table>
        </div> <!--조회영역 끝-->
        
    





</body>
</html>