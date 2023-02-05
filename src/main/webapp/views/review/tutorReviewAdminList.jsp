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
        width: 920px;
        height: 895px;
        padding: 15px;
    }
    .result-table{
        width: 900px;
        text-align: center;
        table-layout: fixed;
        
    }

    .result-table th{
        background-color: lightgray;
        margin: auto;
        
    }
    .result-table td{
        height: 40px;
       
    }
    #revContent , #classTitle{
        height: 40px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .search-table input{
        width: 200px;
    }
    
</style>
</head>
<body>
<%@ include file = "../common/myClassMenubar.jsp" %>
    <div class="content">
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
                    <th width="70px">작성자</th>
                </tr>
                <tr>
                    <td id="classTitle">초보자도 쉽게 만드는 코바늘 뜨개 코스터</td>
                    <td id="revContent">선물용으로 쁘띠 목도리 짜봤는데 너무 맘에으로 쁘띠 목도리 짜봤는데 너무 맘에으로 쁘띠 목도리 짜봤는데 너무 맘에 들어요~ 처음에는 다른 분들도 하루만에 만들었다고 해서 안믿l음에는 다른 분들도 하루만에 만들었다고 해서 안믿l</td>
                    <td>⭐⭐⭐⭐⭐</td>
                    <td>김수정</td>
                </tr> 
                <tr>
                    <td id="classTitle">초보자도 쉽게 만드는 코바늘 뜨개 코스터</td>
                    <td id="revContent">선물용으로 쁘띠 목도리 짜봤는데 너무 맘에 들어요~ 처음에는 다른 분들도 하루만에 만들었다고 해서 안믿l음에는 다른 분들도 하루만에 만들었다고 해서 안믿l</td>
                    <td>⭐⭐⭐⭐⭐</td>
                    <td>김수정</td>
                </tr>
            </table>
        </div> <!--조회영역 끝-->
        
    










    </div> <!--제일 위 cotent닫는 div-->
</div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
<%@ include file = "../common/footerbar.jsp" %>	


</body>
</html>