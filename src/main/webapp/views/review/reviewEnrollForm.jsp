<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{border: 1px solid;}
    .review-area{
        margin: auto;
        width: 80%;
        height: 800px;
        border: 1px solid gray;
        border-radius: 5px;

    }

    .classPart{
        margin: auto;
        width: 95%;
        height: 17%;
    }
    .classThumbnail{
        height: 100%;
        width: 180px;
        padding: 15px;
        float: left;
    }

    .classThumbnail img{
        width: 100%;
        height: 100%;
    }
    .classTitle{
        width: 350px;
        height: 134px;
        float: left;
    }
    .classTitle b{
        font-size: 18px;
        line-height:120px;
    }
    .nextBtn{
        float: left;
        width: 68px;
        height: 134px;
    }
    .nextBtn img{
        width: 55px;
        cursor: pointer;
        padding-top: 35px;
        margin-left:15px;
    }

    .starRating, #content-area{
        width:600px;
        box-sizing: border-box;
        margin: auto;
    }

    
    
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content">
            <h6 style="margin-left: 15px;"><b>수강 후기 작성</b></h6>
            <hr>
            <form class="review-area">
                <div class="classPart">
                    <div class="classThumbnail">
                        <img src="<%=contextPath%>/resources/classThumbnail_upfiles/2023012714522990657.png" >
                    </div>
                    <div class="classTitle">
                        <b> 클래스 제목 들가는 자리</b>
                    </div>
                    <div class="nextBtn">
                        <img src="<%=contextPath%>/resources/images/right_arrow.png" onclick="">
                    </div>
                </div> <!--header:클래스정보부분끝-->



                <form action="" id="enroll-form" method="post" enctype="multipart/form-data" >

                    <div class="starRating" align="center">
                        <div>
                            <span>별 별 별 별 별</span>

                        </div>
                        
                        <p>별표를 클릭하여 평가해주세요.</p>
                    </div>

                    <div id="content-area">

                        <table  align="center" border="1">
                            <tr>
                                <td><textarea name="reviewContent" rows="10" style="resize:none; width: 600px; margin: auto;" required></textarea></td>
                            </tr>
                            <tr class="img-area">
                                <td style="margin:0%"><img id="reviewImg1" width="150" height="120" onclick="clickFile(1);">
                                <img id="reviewImg2" width="150" height="120" onclick="clickFile(2);">
                                <img id="reviewImg3" width="150" height="120" onclick="clickFile(3);">
                            </td>
                            </tr>

                        </table>
                    </div>

                    <div id="file-area" style="display:none">
                        <input type="file" name="file1" onchange="loadImg(this, 1);">
                        <input type="file" name="file2" onchange="loadImg(this, 2);">
                        <input type="file" name="file3" onchange="loadImg(this, 3);">
                    </div>

                
                    <script>
                        function clickFile(num){
                            $("input[name=file" + num + "]").click();
                        }
        
                        function loadImg(inputFile, num){
                            // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                            
                            if(inputFile.files.length == 1){ 
                        
                                const reader = new FileReader();
                            
                                reader.readAsDataURL(inputFile.files[0]);
                                
        
                                
                                reader.onload = function(e){
                                    
                                    switch(num){
                                        case 1: $("#reviewImg1").attr("src", e.target.result); break;
                                        case 2: $("#reviewImg2").attr("src", e.target.result); break;
                                        case 3: $("#reviewImg3").attr("src", e.target.result); break;
                                        
                                    }
                                }
        
                            }else{ 
                                // 선택된 파일이 취소된 경우 => 미리보기 됐던게 사라지게
                                switch(num){
                                    case 1: $("#reviewImg1").attr("src", null); break;
                                    case 2: $("#reviewImg2").attr("src", null); break;
                                    case 3: $("#reviewImg3").attr("src", null); break;
                                
                                }
                            }
                        }
                        
                    </script>

                    <br>

                    <button type="submit">등록하기</button>

                </form>
    

                


            </div> <!--리뷰영역 닫는  div-->
            

            


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>