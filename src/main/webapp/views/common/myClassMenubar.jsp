<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page Main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        div{box-sizing:border-box;}
        .wrap{width:1200px; height:100vh; margin:auto;}
        
        .menubar{width:200px; height:100%; float:left; padding-top:0; background: white;}
        .content{width:1000px; height:100%; float:left; }
        
        .categoryMain {
            width:90%;
            height:50px;
            font-size:13px;
            margin:auto;
            margin-bottom:5px;
            line-height:50px;
            border:1px solid; border-color: rgb(35, 104, 116);  
            color:rgb(64, 64, 64);
            background-color: white;
            border-radius:5px;
            font-size: 14px;
        }
        .categoryMain:hover{
            cursor: pointer;
            background-color:rgb(35, 104, 116);
            font-size:15; color:white;
        }
        
        .menubar ul{
            color:rgb(64, 64, 64);
            list-style-type:none;
            line-height:2;
            text-align:left;
            display:none;
        }
        .menubar li:hover{
            cursor: pointer;
            color:black;
            font-weight: bolder;
        }
        

    </style>
    <script>
        $(function(){
            $(".categoryMain").click(function(){
                const category1 = $(this).html();

                if($(this)){
                    $(this).css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $(this).siblings("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");

                    if($(this).next().css("display")=="none"){
                        $(this).siblings("ul").slideUp();
                        $(this).next().slideDown();
                    }else{
                        $(this).next().slideUp();
                    }
                }
                $(".pageRoute1").html("> <a>" + category1 + "</a>");

            })

            $(".categoryMain").next().children("li").click(function(){
                const category2 = $(this).html();
                    $(".pageRoute2").html("> <a>" + category2 + "</a>");
                
            })
            


            
        })
    </script>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
    <div class="wrap">
        <div class="menubar">
            <h3 align="center">마이클래스</h3>

            <div class="categoryMain" align="center" id="myClass" onclick="">수강 내역</div>
            <ul class="categoryDetail">
                <li id="payMyClass" onclick="">결제 완료 클래스</li>
                <li id="refundMyClass" onclick="">수강 취소 클래스</li>
            </ul>
            <div class="categoryMain" align="center" id="myReview" onclick="">나의 후기</div>
            <ul class="categoryDetail">
                <li id="writingReview" onclick="">후기 작성</li>
                <li id="viewMyReview" onclick="">내가 작성한 후기</li>
            </ul>
            <div class="categoryMain" align="center" id="likeList" onclick="">찜목록</div>
            <ul class="categoryDetail">
            </ul>
        </div>


        <div class="content">
            

        </div>



    </div>

   

</body>
</html>