<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.hp.review.model.vo.Register"%>
<% 
	Register er = (Register)request.getAttribute("er");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
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
    

    .starRating, #content-area{
        width:600px;
        box-sizing: border-box;
        margin: auto;
    }

   
    .btn-area button{
        border: 0;
        background: lightgray;
        border-radius: 5px;
    }

    .rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: rgb(245, 222, 78);
}

    
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content">
            <h6 style="margin-left: 15px;"><b>수강 후기 작성</b></h6>
            <hr>
            <form class="review-area">
                <br>
                <div class="classPart">
                    <div class="classThumbnail">
                        <img src="<%=contextPath%>/<%=er.getClThumb() %>" >
                    </div>
                    <div class="classTitle">
                        <b> <%=er.getClName() %></b>
                    </div>
                    
                </div> <!--header:클래스정보부분끝-->



                <form action="<%=contextPath %>/insert.rev" id="enroll-form" method="post" enctype="multipart/form-data" >
                

                    <div class="starRating" align="center">

                        
                        <div class="starpoint_wrap" height="20px">
                            <div class="rating">
                                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                                <label for="rating1">
                                    <img width="61px" src="<%=contextPath%>/resources/images/starrate.png" >
                                </label>
                                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                                <label for="rating2">
                                    <img src="<%=contextPath%>/resources/images/starrate.png" >
                                </label>
                                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                                <label for="rating3">
                                    <img src="<%=contextPath%>/resources/images/starrate.png" >
                                </label>
                                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                                <label for="rating4">
                                    <img src="<%=contextPath%>/resources/images/starrate.png" >
                                </label>
                                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                                <label for="rating5">
                                    <img src="<%=contextPath%>/resources/images/starrate.png" >
                                </label>
                            </div>
                          </div>

                        <script>
                            function Rating(){};
                                Rating.prototype.rate = 0;
                                Rating.prototype.setRate = function(newrate){
                                    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
                                    this.rate = newrate;
                                    let items = document.querySelectorAll('.rate_radio');
                                    items.forEach(function(item, idx){
                                        if(idx < newrate){
                                            item.checked = true;
                                        }else{
                                            item.checked = false;
                                        }
                                    });
                                }
                                let rating = new Rating();//별점 인스턴스 생성

                                document.addEventListener('DOMContentLoaded', function(){
                                //별점선택 이벤트 리스너
                                document.querySelector('.rating').addEventListener('click',function(e){
                                    let elem = e.target;
                                    if(elem.classList.contains('rate_radio')){
                                        rating.setRate(parseInt(elem.value));
                                    }
                                })
                            });
                            //저장 전송전 필드 체크 이벤트 리스너
                            document.querySelector('#save').addEventListener('click', function(e){
                                //별점 선택 안했으면 메시지 표시
                                if(rating.rate == 0){
                                    rating.showMessage('rate');
                                    return false;
                                }
                               
                                //폼 서밋
                            });

                        </script>

                        <p>별표를 클릭하여 평가해주세요.</p>
                    </div>

                    <div id="content-area">

                        <table  align="center" >
                            <tr>
                                <td><textarea name="reviewContent" rows="10" style="resize:none; width: 600px; margin: auto;" required></textarea></td>
                            </tr>
                            <tr class="img-area" align="center">
                                <td style="margin:0%">
                                <img id="reviewImg1" width="180" height="120" onclick="clickFile(1);">
                                <img id="reviewImg2" width="180" height="120" onclick="clickFile(2);">
                                <img id="reviewImg3" width="180" height="120" onclick="clickFile(3);">
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
                    <div align="center" class="btn-area"> 
                        <button type="submit" id="save">등록하기</button>
                    </div>
                    

                </form>
    
            </div> <!--리뷰영역 닫는  div-->
            

            


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>