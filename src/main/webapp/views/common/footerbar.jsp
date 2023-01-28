<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, p{box-sizing:border-box;}
    #footer a{text-decoration: none !important; color:black !important;}

    /* footer 전반적인 틀 */
    #footer{width:1000px; height:200px; margin:auto; background-color: rgb(247,247,247); padding:20px; margin-top:20px;}
    #footer>div{width:100%;}
    #footer-1{height:20%; text-align: center;}
    #footer-2{height:80%;}

    /* footer 세부 스타일 */

    /* footer-1 */
    #footer-1>a{
        text-decoration:none;
        color:rgb(110, 110, 110);
        margin:25px;
        vertical-align:middle;
        font-size:12px;
        font-weight: 600;
    }
    
    /* footer-2 */
    #footer-2>p{
        margin:10px 280px;
        width:100%;
        font-size:12px;
        color:rgb(110, 110, 110);
    }

    

</style>
</head>
<body>
	
	<div id="footer">
	    <div id="footer-1">
	        <a href="">이용약관</a>
	        <a href="">개인정보취급방침</a>
	        <a href="">공지사항</a>
	        <a href="<%=request.getContextPath()%>/cs.tee">고객센터</a>
	    </div>
	    <div id="footer-2">
	        <p>
	            (주)합플 | 대표 홍길동 | 사업자등록번호 : 123-456-789876 <br>
	            주소 : 서울시 금천구 가산디지털2로 115 대륭테크노타운 2차 1109호 (가산동 448) <br>
	            Tel : 02-123-456(평일 10:00 ~ 18:00) | E-mail:help@hobbyplace.com <br>
	        
	        </p>
	        <p>
	            Copyright ⓒ GooDee Academy. All rights reserved.
	        </p>
	
	    </div>
	</div>

</body>
</html>