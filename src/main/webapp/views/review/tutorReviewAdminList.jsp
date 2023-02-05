<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{border: 1px solid;}
    .search-table{
       margin: 30px;
    }

</style>
</head>
<body>
<%@ include file = "../common/myClassMenubar.jsp" %>
    <div class="content">
        <h6 style="margin-left: 15px;"><b>후기 조회</b></h6>
        <hr>
        <div class="search-area">
            <form action="">
                <p>상품 후기 목록 58건</p>
                <table class="search-table">
                    <tr>
                        <th>평점</th>
                        <th><input type="checkbox" name="reStar" value="1" id="1star">⭐</th>
                        <th><input type="checkbox" name="reStar" value="2" id="2star">⭐⭐</th>
                        <th><input type="checkbox" name="reStar" value="3" id="3star">⭐⭐⭐</th>
                        <th><input type="checkbox" name="reStar" value="4" id="4star">⭐⭐⭐⭐</th>
                        <th><input type="checkbox" name="reStar" value="5" id="5star">⭐⭐⭐⭐⭐</th>
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
                        <td colspan="5"><input type="search"></td>
                    </tr>
            </form>



            </table>


        </div>
        
    










    </div> <!--제일 위 cotent닫는 div-->
</div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
<%@ include file = "../common/footerbar.jsp" %>	


</body>
</html>