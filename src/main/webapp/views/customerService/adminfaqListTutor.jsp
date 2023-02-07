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
        }
        .title{
        font-size: 20px;
        font-weight: bolder;
        float: left;
        width: 200px;
        
    }
    .tutor{
        color: rgb(192, 57, 43);
        background-color: rgb(255, 251, 231);
        width: 200px;
        height: 30px;
        text-align: center;
        font-weight: bolder;
        float: left;
    }
    .detail{
        background-color: rgb(50, 106, 118);
        color: white;
        width: 100px;
        height: 25px;
        text-align: center;
        float: right;
    }
    .enroll{
        background-color: rgb(230, 126, 34);
        color: white;
        width: 100px;
        height: 25px;
        text-align: center;
        float: right;
        
    }
    table{
        text-align: center;
        width: 100%;
        
    }
    th, td {
        border: 1px solid gray;
        padding: 10px;
    }
    th{
        background-color: lightgray;
        border: 1px solid gray;
        padding: 10px;
    }
    .paging-area{
            text-align: center;
            
        }
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">

        <br>
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">자주묻는질문</div> <br><hr>

        <div class="tutor">
            튜터
        </div>

        <a href="<%=contextPath%>/faqEnroll.ad"><div class="enroll">작성하기</div></a>
        
        
        <br><br>

        <table>
            <tr>
                <th width="80">번호</th>
                
                <th width="600">제목</th>
                <th>작성날짜</th>
                
                <th></th>
            </tr>
		<%if(list.isEmpty()){ %>
            <tr>
                <td>조회된 내용이 없습니다.</td>
            </tr>
		<%}else{ %>
			<%for(Faq f : list){ %>
	            <tr>
	                <td><%=f.getrNum() %></td>
	                <td><%=f.getQuestion() %></td>
	                <td><%=f.getEnrollDate() %></td>
	                <td ><button onclick="location.href='<%=contextPath%>/updateFaq.ad?no=<%=f.getFaqNO()%>'">수정하기</button></td>
	            </tr>
            <%} %>
		<%} %>
            
        </table>


    </div><br><br><br>

    <div class="paging-area">

        <%if(pi.getCurrentPage()!=1){ %>
	            	<button style="border: none; " 
	            			onclick="location.href='<%=request.getContextPath()%>//faqListTutor.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	            <%} %>
	            <%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){ %>
	            	<button style="background-color:rgb(22, 160, 133); color:white; border:none"
	            			onclick="location.href='<%=request.getContextPath()%>/faqListTutor.ad?cpage=<%=i%>';"><%=i %></button>
	            <%} %>
	            <%if(pi.getCurrentPage()!= pi.getMaxPage()) {%>
	            	<button style="border: none;"
	            			onclick="location.href='<%=request.getContextPath()%>/faqListTutor.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
				<%} %>

    </div>
    
    <br><br><br><br><br>
    
</body>
</html>