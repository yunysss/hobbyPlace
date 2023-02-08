<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.customerService.model.vo.*"%>
    
<%
	ArrayList<Faq> list1  = (ArrayList<Faq>)request.getAttribute("list1");
	ArrayList<Faq> list2  = (ArrayList<Faq>)request.getAttribute("list2");
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
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
    <div class="outer">

        
        <h1><b>고객센터</b></h1> 
        <br><br><hr>
        <div class="title">자주묻는질문</div> <br><hr>

        <div class="tutor">
            튜터
        </div>

        <a href="<%=contextPath%>/faqEnroll.ad"><div class="enroll">작성하기</div></a>
        <a href="<%=contextPath%>/faqListTutor.ad?cpage=1"><div class="detail">더보기+</div></a>
        
        <br><br>

        <table>
            <tr>
                <th width="80">번호</th>
                <th width="600">제목</th>
                <th>작성날짜</th>
                <th></th>
            </tr>
			
			<%if(list1.isEmpty()) {%>
            <tr>
                <td>등록된 내용이 없습니다.</td>
            </tr>
			<%}else{ %>
				<%for(int i=0; i<5; i++){ %>
		            <tr>
		                <td><%=list1.get(i).getrNum() %></td>
		                <td onclick="location.href='selectFaq.ad?no=<%=list1.get(i).getFaqNO()%>'"><%=list1.get(i).getQuestion() %></td>
		                <td><%=list1.get(i).getEnrollDate() %></td>
		                <td><button onclick="location.href='<%=contextPath%>/updateFaq.ad?no=<%=list1.get(i).getFaqNO()%>'">수정하기</button></td>
		            </tr>
            	<%} %>
			<%} %>
            
        </table><br><br><br>


        <div class="tutor">
            튜티
        </div>

        <a href="<%=contextPath%>/faqEnrollTutee.ad"><div class="enroll">작성하기</div></a>
        <a href="<%=contextPath%>/faqListTutee.ad?cpage=1"><div class="detail">더보기+</div></a>
        
        <br><br>

        <table>
            <tr>
                <th width="80">번호</th>
                <th width="600">제목</th>
                <th>작성날짜</th>
                <th></th>
            </tr>

            <%if(list2.isEmpty()) {%>
            <tr>
                <td>등록된 내용이 없습니다.</td>
            </tr>
			<%}else{ %>
				<%for(int i=0; i<5; i++){ %>
		            <tr>
		                <td><%=list2.get(i).getrNum() %></td>
		                <td onclick="location.href='selectFaq.ad?no=<%=list2.get(i).getFaqNO()%>'"><%=list2.get(i).getQuestion() %></td>
		                <td><%=list2.get(i).getEnrollDate() %></td>
		                <td><button onclick="location.href='<%=contextPath%>/updateFaq.ad?no=<%=list2.get(i).getFaqNO()%>'">수정하기</button></td>
		            </tr>
            	<%} %>
			<%} %>
            
        </table>
        


        





    </div>
    
    <br><br><br><br><br>
    
</body>
</html>