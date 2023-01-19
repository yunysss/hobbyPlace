<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
    <style>
        *{margin: 0; padding: 0;}
        div{
            /* border:1px solid red; */
        box-sizing: border-box;}
        .wrap{
            width: 1200px;
            height: 100vh;
            background: url(<%=request.getContextPath()%>/resources/images/back2.png)no-repeat center;
            background-size: cover;
            margin: 0 auto;
            margin-top:5px;
        }
        #back1{
            width: 100%;
            height: 37%;
            }
        .log_area{
            height: 34%;
            width:100%;
        }

        .log_area #header_logo {width:330px; margin: 0 auto;}
        #header_logo img{width: 100%;}
        
        #log_box{width:330px; height:70px; margin: 0 auto; }
        #login {width:75%; height: 70px; float: left;}
        #login input { width: 100%; height: 40%; margin: 2px 0;}

        #log_btn {width: 23%; height: 70px; float: right;}
        button{width: 100%; height: 100%;}

        #footer_logo{width:230px; margin: 0 auto; margin-top: 10px;}
        #footer_logo img{width: 100%;}


    </style>
</head>
<body>
    <div class="wrap">
        <div id="back1"></div>
        
        <div class="log_area">
            <div id="header_logo">
                <img src="<%=request.getContextPath()%>/resources/images/adminLoginLogo1.jpg" alt="logo">
            </div>

            <div id="log_box">
                <form action="xxxxxx" method="post">
                    <div id="login">
                        
                        <input type="text" placeholder="UserId" name="userId">
                        <label for=""></label>

                        
                        <input type="password" placeholder="********" name="userPwd">
                        <label for=""></label>
                    </div>

                    <div id="log_btn">
                        <button type="submit">login</button>
                    </div>
     
                </form>
            </div>    

            <div id="footer_logo">
                <img src="<%=request.getContextPath()%>/resources/images/adminLoginLogo2.jpg" alt="">
            </div>
        </div>

    </div>

</body>
</html>