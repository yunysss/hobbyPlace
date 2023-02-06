<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.hp.qna.model.vo.*"%>
<%
	Qna q = (Qna)request.getAttribute("q");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .outer{
            width: 800px;
            margin: auto;
            margin-top: 30px;
           
        }
        .detail{
            text-align: center;
        }
        
    </style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp"%>
    <div class="outer">

        <h2><b>문의관리</b></h2> 
            <br><hr><br> 


            <div class="detail">
            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="background-color: lightgray;" width="100">제목</th>
                    <td width="850"><%=q.getqTitle() %></td>
                </tr>
            </table>
               
            <br></div> <br>

            <div style="border: 1px solid lightgray; padding: 10px; width: 800px; height: 300px; margin-left:auto;margin-right:auto;">
                <p><%=q.getqContent() %></p>

                
            </div>

            <br> <hr> <br>
			
            <div style="background-color:lightgray;  border:none; width: 130px; height: 30px; text-align: center; font-size:large; font-weight: 600; ">답변 등록</div><br>
			<%if(q.getaStatus().equals("N")){ %>
	            <form action="" method="post">
	            <input type="hidden" name="no" value="<%=q.getqNo()%>">
	                <table>
	                    <tr>
	                        <th style="background-color: lightgray; width: 100px; text-align: center;">
	                            제목
	                        </th>
	                        <td >
	                            <input type="text" name="atitle" style="width: 600px; height: 50px;resize: none; border-color: lightgray;" required placeholder="제목을 입력하세요.">
	                        </td>
	                    </tr>
	            
	                </table>
	                <br>
	                
	                <table>
	                    <tr>
	                        <td><textarea name="acontent" rows="10" required style="resize:none; width:800px; height: 500px; border-color: lightgray;"  ></textarea></td>
	                    </tr>
	    
	                </table>
	                <br>
	    
	                <button type="reset" style="background-color:lightgray; border:none; width: 120px; height: 50px; ">취소</button>
	                <button type="submit" style="background-color:rgb(22, 160, 133); color:white; border:none; width: 120px; height: 50px; float:right">등록하기</button>
	    
	            </form>
			<%}else{ %>
				<table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
	                <tr>
	                    <th style="background-color: lightgray;" width="150">제목</th>
	                    <td width="850"><%=q.getaTitle() %></td>
	                </tr>
	            </table>
	            <div style="border: 1px solid lightgray; padding: 10px; height:300px; margin-left:auto;margin-right:auto;">
                <p>
                	<%=q.getaContent() %>
                </p>

                
            	</div>
            <%} %>
            </div>
			<br><br><br><br><br>
  
    
</body>
</html>