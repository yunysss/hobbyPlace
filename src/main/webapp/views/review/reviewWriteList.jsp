<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*div{box-sizing:border-box; border: 1px solid; }
    .cwrap{width:1000px; height:1300px; margin:auto; padding:2px;}
    
    .menubar{width:200px; height:1299px; float:left; padding-top:30px; background: white; }
    .content {width:793px; height:1300px;  float: right; padding-top:65px;}*/

    .classnull{
        width: 100%;
        height:300px;
        margin-top: 70px;
    }
    .classnull img{width: 100px}
    
    .classContent{
        width: 85%;
        height: 200px;
        margin: auto;
        padding-left: 20px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    .classThumbnail {
        width: 150px;
        height: 200px;
        float: left;
        padding: 10px;
    }

    .classThumbnail img{
        width: 100%;
        height: 85%;
        margin-top:10px;
    }

    .classDetail{width: 340px; height: 200px; float: left;}

    #classStatusDone{
    margin: 10px;
    background-color: rgb(180, 186, 185);
    color: white;
    border-radius: 5px;
    font-size: 13px;
    width: 75px;
    height: 23px;
    text-align: center;
    }

    .classDetail table{width: 85%; height:80%; margin-top: 15px;}
    .classTitle{
    font-weight: bold;
    font-size: 20px;
    height: 50px;
    }
    .writeBtn-area{width: 150px; height: 100%; float: left; padding-top: 75px;}
    #writeBtn{
        margin:auto; 
        display:block;
        border: 0;
        border-radius: 5px;
        background: rgb(35, 104, 116); 
        color:white;
        font-size: 17px;
        height: 35px;
        width: 140px;
    }


        


</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
			
		<div class="content" align="center">

            <!-- 리뷰를 쓸 클래스가 없을 때-->
            <div class="classnull">
                <img src="<%=contextPath%>/resources/images/myClassNull.jpg" >
					<p>리뷰를 작성할 클래스가 없어요!<br>
					더 많은 클래스를 찾아 보세요.</p>
					<button type="button" class="btn btn-light" id="findClass" onclick="">클래스 찾아보기</button>
            </div>

            <!-- 리뷰를 작성할 클래스가 있을 때 -->
            <div class="class-area">
                <div class="classContent">
                    <div class="classThumbnail">
                        <img src="<%=contextPath%>/resources/classThumbnail_upfiles/2023012714522990657.png">
                    </div>
                    <div class="classDetail">
                        <table border="0">
                            <tr>
                                <td class="classTitle">제목들어가는 자리</td>
                            </tr>
                            
                            <tr>
                                <td height="30px">사당 2023/11/11 17:00</td>
                            </tr>

                            <tr>
                                <td height="50px"><div id="classStatusDone">수강완료</div></td>
                            </tr>

                        </table>
                    </div>
                    <div class="writeBtn-area">
                        <button type="button" id="writeBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="">수강 후기 작성</button>
                    </div>
                </div>
                
            </div> <!--리뷰작성 가능 클래스 끝div-->

        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>