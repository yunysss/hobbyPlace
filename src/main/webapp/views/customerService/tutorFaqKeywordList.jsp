<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
<%
	
   	ArrayList<Faq> list  = (ArrayList<Faq>)request.getAttribute("list");
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
            
            padding:40px;
        }
       
       
        #q{
            background-color: lightgray; 
            max-width: fit-content;
            
        }
        .keyword{
        	float:right;
        }
        </style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>

    <div class="outer">
        <br>
        <div>
            <a href="" style="color: black; font-size: large; font-weight: 800;" >
                >>자주묻는질문</a>
        </div>

        <br>

			<form action="<%=request.getContextPath()%>/searchFaq.tor" method="post" class="keyword">
        
            <input type="text" name="keyword">
            <button type="submit">검색</button>
        	</form>

        
    
            <br>
            
            <%if(list.isEmpty()){ %>
            	조회된 목록이 없습니다.
			<%}else{ %>
				<%for(Faq f: list){ %>
		            <div class="qnaDetail">
		            <div id="q">
		                <%=f.getQuestion() %>
		            </div>
		            <br>
		            <div>
		                <%=f.getAnswer() %>
		            </div>
		
		            <br>
		            <hr>
		            </div>
            	<%} %>
            <%} %>
           


    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>