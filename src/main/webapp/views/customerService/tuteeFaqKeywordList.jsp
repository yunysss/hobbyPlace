<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
    
<%
	
   	ArrayList<Faq> list  = (ArrayList<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">
        <br>
        <h1><b onclick="location.href='<%=contextPath%>/cs.tee'">튜티 고객센터</b></h1> 
            <br><br>  
			
			<form action="<%=request.getContextPath()%>/searchFaq.tee" method="post" class="keyword">
        
            <input type="text" name="keyword">
            <button type="submit">검색</button>
        	</form>

            <div> 
                <a href="">
                    <button style="background-color:rgb(22, 160, 133); color:white; border:none; width: 150px; height: 60px; font-size: large;">
                        자주묻는질문</button></a>
            </div>
    
            <br>
            <%if(list.isEmpty()){ %>
            <div>자주묻는 질문 목록이 없습니다.</div>
            <%}else{ 
            	for(Faq f : list){%>
            <div class="datailOuter" style="width: 800px; margin: auto;">
                    <div>
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
                        
            </div>
            	<%} %>
            <%} %>
            

    </div>
    

<%@ include file="../common/footerbar.jsp" %>

</body>
</html>