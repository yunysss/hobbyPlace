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
            width: 1000px;
            margin: auto;
            margin-top: 100px;
            padding: 40px;
        }
        .detail{
            text-align: center;
         
        }
        
    </style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">


            <div>
                <a href="" style="color: black; font-size: large; font-weight: 800;" >
                    >>나의 문의내역</a>
            </div>
    
            <br>


            <div class="detail">
            <table border="1" style="border:1px solid lightgray;margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="background-color: lightgray;" width="150">제목</th>
                    <td width="850"><%=q.getqTitle() %></td>
                </tr>
            </table>
               
            <br>

        
            </div>

            <br>

            <div style="border: 1px solid lightgray; padding: 10px; height:300px; margin-left:auto;margin-right:auto;">
                <p><%=q.getqContent() %></p>

                
            </div>

            <br>

            <hr>

            <br>

            <div>
                <a href="" style="color: black; font-size: large; font-weight: 800;" >
                    >>관리자 답변</a>
            </div>
    
            <br>

            <div style="border: 1px solid lightgray; padding: 10px; height:300px; margin-left:auto;margin-right:auto;">
                <p>
                <%if(q.getaStatus().equals("Y")){ %>
                	<%=q.getaContent() %>
                <%}else{ %>
                	아직 답변이 등록되지 않았습니다.
                	최대한 빠른 답변 드리겠습니다. 항상 감사합니다^^
                <%} %>
                </p>

                
            </div>

            <br>

            <div style="text-align: right;"> 
                <a href="<%=contextPath%>/qnalist.tor?MemNo=<%=MemNo%>">
                    <button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 120px; height: 50px;">
                        문의 목록</button></a>
            </div>

            
                
                
                

           




    </div>
    <br><br>
    <br><br>
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>