<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .review-table th{
        background-color: rgb(232, 230, 230);
        text-align: center;
        height: 30px;
    }

    #review-content{
        margin: 10px;
    }
    #list-btn, #del-btn{
        border: 0;
        border-radius: 5px;
        margin: 5px; 

    }

    #del-btn{
        background: rgb(35, 104, 116); 
        color:white;
    }

</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
    <div class="content" >
        <h6 style="margin-left: 15px;"><b>후기 조회</b></h6>
        <hr>
        <br>
        <form action="">
            <table class="review-table" border="1" align="center">
                <tr>
                    <th>클래스명</th>
                    <td colspan="3">클래스명입력하는 곳</td>
                    <th>카테고리</th>
                    <td>공예 / 뜨개</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>작성자명</td>
                    <th>별점</th>
                    <td>⭐⭐⭐⭐</td>
                    <th>등록일</th>
                    <td>23/01/02</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <p id="review-content">리뷰내용와라라랄라라라라ㅏ라리뷰내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라내용와라라랄라라라라ㅏ라라리뷰내용와라라랄라라라라ㅏ라라라</p>
                        <img src="첨부사진 들어가는 곳" width="100px" height="100px" style="margin:10px">
                        <img src="첨부사진 들어가는 곳" width="100px" height="100px" style="margin:10px">
                        <img src="첨부사진 들어가는 곳" width="100px" height="100px" style="margin:10px">
                        
                    </td>
                </tr>
                
            </table>
            <div class="btn-area" align="right">
                <button id="list-btn">목록</button>
                <button id="del-btn">삭제</button>
                
            </div>



        </form> 



    

    </div> <!--제일 위 cotent닫는 div-->
</div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
<%@ include file = "../common/footerbar.jsp" %>	
    

</body>
</html>