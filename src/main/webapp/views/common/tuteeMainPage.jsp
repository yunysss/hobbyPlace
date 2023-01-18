<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p, form, input{box-sizing:border-box;}
    .outer{width:1000px; height:1300px; margin:auto; margin-top:20px;}
    a{text-decoration: none !important; color:black !important;}

    .outer>div{width:100%;}
    #demo{height:25%;}
    #mainPageRec{height:75%;}

    /* 배너 */
    .carousel-inner, .carousel-inner img{width:100%; height:100%;}

    /* 추천 클래스 */
    #mainPageRec{margin-top:20px;}
    #mainPageRec>div{width:100%; padding:10px;}
    #mainPageRec-1, #mainPageRec-2{height:30%;}
    #mainPageRec-3{height:40%;}

    .allView{float:right; font-size:12px;}

    #mainPageRec table{
        width:100%;
        height:100%;
    }
    #mainPageRec-1 img, #mainPageRec-2 img{
        width:160px;
        height:160px;
        margin-left:10px;
        margin-right:10px;
    }

    #mainPageRec-3 img{
        width:200px;
        height:200px;
    }

    #mainPageRec button{
        background:none;
        color:rgb(180, 180, 180); 
        border:1px solid rgb(180, 180, 180); 
        border-radius:50%;
        height:30px;
        width:30px;
    }
    
</style>
</head>
<body>

	<%@ include file="../common/tuteeMenubar.jsp" %>
	
	<div class="outer">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
          
            <!-- The slideshow -->
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://umclassupload.s3.ap-northeast-2.amazonaws.com/app/web_um_coupon_220530.png" alt="">
              </div>
              <div class="carousel-item">
                <img src="https://post-phinf.pstatic.net/MjAxOTExMjhfOTMg/MDAxNTc0OTE5MDA0OTYw.hyFb4e85nGeKGZyF4CZhEce16yWo9hM9R_Q9ALHV4RUg.2Yhm6vm0ButtlO5JHrIlzcl_e9AiF7KmC8SS0SaZ9Vsg.JPEG/20191125_%EC%9D%B8%EC%8A%A4%ED%83%80_%EC%9B%90%EB%8D%B0%EC%9D%B4%ED%81%B4%EB%9E%98%EC%8A%A4.jpg?type=w1200" alt="">
              </div>
              <div class="carousel-item">
                <img src="https://og-data.s3.amazonaws.com/media/artworks/half/A0880/A0880-0019.jpg" alt="">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>

          <div id="mainPageRec">
            <div id="mainPageRec-1">
                <!-- 로그인 전 -->
                <table>
                    <tr>
                        <td colspan="5"><b>1월의 추천 클래스 👍</b></td>
                        <td colspan="2"><a href="" class="allView">전체보기</a></td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <button>&lt;</button>
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td rowspan="2">
                            <button>&gt;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                    </tr>
                </table>
                
                <!-- 로그인 후 -->
                <!-- <table>
                    <tr>
                        <td colspan="5"><b>xxx님이 좋아할만한 클래스 🥰</b></td>
                        <td colspan="2"><a href="" class="allView">전체보기</a></td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <button>&lt;</button>
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td rowspan="2">
                            <button>&gt;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                    </tr>
                </table> -->
                
            </div>

            <div id="mainPageRec-2">
                <table>
                    <tr>
                        <td colspan="5"><b>찜이 가장 많은 클래스 ❤️</b></td>
                        <td colspan="2"><a href="" class="allView">전체보기</a></td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <button>&lt;</button>
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td rowspan="2">
                            <button>&gt;</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                        <td>
                            지역 <br>
                            제목 <br>
                            가격
                            별점
                        </td>
                    </tr>
                </table>
            </div>

            <div id="mainPageRec-3">
                <table>
                    <tr height="50px">
                        <td colspan="7"><b>클래스 후기</b></td>
                    </tr>
                    <tr height="200px">
                        <td rowspan=3">
                            <button>&lt;</button>
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        <td>
                            <img src="">
                        </td>
                        
                        <td rowspan="3">
                            <button>&gt;</button>
                        </td>
                    </tr>
                    <tr height="30px">
                        <td>별점</td>
                        <td>별점</td>
                        <td>별점</td>
                        <td>별점</td>
                    </tr>
                    <tr>
                        <td>
                            후기내용
                        </td>
                        <td>
                            후기내용
                        </td>
                        <td>
                            후기내용
                        </td>
                        <td>
                            후기내용
                        </td>
                        
                        
                    </tr>
                </table>
            </div>
          </div>

    </div>
    
    <%@ include file="../common/footerbar.jsp" %>

	

</body>
</html>