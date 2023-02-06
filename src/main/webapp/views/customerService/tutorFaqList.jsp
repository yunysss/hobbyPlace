<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*, com.hp.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
        .paging-area{
            text-align: center;
            
        }
       
        #q{
            background-color: lightgray; 
            max-width: fit-content;
            
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

            <div align="right">
                <input type="text">
                <button><img src="resources/search.svg"></button>
                
            </div>

        
    
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
            

            <div class="paging-area">

                <%if(pi.getCurrentPage()!=1){ %>
	            	<button style="border: none; " 
	            			onclick="location.href='<%=request.getContextPath()%>/faqlist.tor?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	            <%} %>
	            <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){ %>
	            	<button style="background-color:rgb(22, 160, 133); color:white; border:none"
	            			onclick="location.href='<%=request.getContextPath()%>/faqlist.tor?cpage=<%=i%>';"><%=i %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!= pi.getMaxPage()) {%>
	            	<button style="border: none;"
	            			onclick="location.href='<%=request.getContextPath()%>/faqlist.tor?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
				<%} %>
    
            </div>


    </div>
    
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>