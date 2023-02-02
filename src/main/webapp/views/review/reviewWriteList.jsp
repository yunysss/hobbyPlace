<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.hp.review.model.vo.Register, com.hp.common.model.vo.PageInfo"%>
    
 <%
 	ArrayList<Register> list = (ArrayList<Register>)request.getAttribute("list");
 	PageInfo wpi = (PageInfo)request.getAttribute("wpi"); 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*div{box-sizing:border-box; border: 1px solid; }
    .cwrap{width:1000px; height:1300px; margin:auto; padding:2px;}
    
    .menubar{width:200px; height:1299px; float:left; padding-top:30px; background: white; }
    .content {width:793px; height:1300px;  float: right; padding-top:65px;}*/

    .classnull{
        width: 100%;
        height:300px;
        margin-top: 70px;
    }
    .classnull img{width: 100px}
    
    .class-area{margin: 5px;}
    .classContent{
        width: 85%;
        height: 200px;
        margin: auto;
        padding-left: 20px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    .classThumbnail {
        width: 150px;
        height: 200px;
        float: left;
        padding: 10px;
    }

    .classThumbnail img{
        width: 100%;
        height: 85%;
        margin-top:10px;
    }

    .classDetail{width: 340px; height: 200px; float: left; padding:5px;}

    #classStatusDone{
    margin: 10px;
    background-color: rgb(180, 186, 185);
    color: white;
    border-radius: 5px;
    font-size: 13px;
    width: 75px;
    height: 23px;
    text-align: center;
    }

    .classDetail table{width: 85%; height:80%; margin-top: 15px;}
    .classTitle{
    font-weight: bold;
    font-size: 20px;
    height: 50px;
    }
    .writeBtn-area{width: 150px; height: 100%; float: left; padding-top: 75px;}
    #writeBtn{
        margin:auto; 
        display:block;
        border: 0;
        border-radius: 5px;
        background: rgb(35, 104, 116); 
        color:white;
        font-size: 17px;
        height: 35px;
        width: 140px;
    }


</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
			
		<div class="content" align="center">

            <!-- 리뷰를 쓸 클래스가 없을 때-->
            <%if(loginUser != null && list.isEmpty()) {%>
            <div class="classnull">
                <img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png" >
                <br><br>
					<p>리뷰를 작성할 클래스가 없어요!</p>
					
            </div>
            
            <%}else{ %>

            <!-- 리뷰를 작성할 클래스가 있을 때 -->
	            <%for(int i=0; i<list.size();i++){ %>
		            <div class="class-area">
		                <div class="classContent">
		                    <div class="classThumbnail">
		                        <img src="<%=contextPath%>/<%=list.get(i).getClThumb() %>">
		                    </div>
		                    <div class="classDetail">
		                        <table border="0">
		                            <tr>
		                                <td class="classTitle"><%=list.get(i).getClName() %></td>
		                            </tr>
		                            
		                            <tr>
		                                <td height="30px"><%=list.get(i).getDistrName() %> <%=list.get(i).getTeachDate() %> <%=list.get(i).getStartTime() %></td>
		                            </tr>
		
		                            <tr>
		                            <%if(list.get(i).getRegSta().equals("2")){ %>
		                                <td height="50px"><div id="classStatusDone">수강완료</div></td>
		                            <%} %>
		                            </tr>
		
		                        </table>
		                    </div>
		                    <div class="writeBtn-area">
		                        <button type="button" id="writeBtn" onclick="location.href='<%=contextPath%>/enrollForm.rev?no=<%=list.get(i).getRegNo()%>'">수강 후기 작성</button>
		                    </div>
		                </div>
		                
		            </div> <!--리뷰작성 가능 클래스 끝div-->
		            
	            <%} %>
	            
	            <div class="paging-area" align="center">
				<%if(wpi.getCurrentPage()!=1){ %>
				<button onclick="location.href='<%=contextPath%>/wList.rev?cpage=<%=wpi.getCurrentPage()-1%>'">&lt;</button>
				<%} %>
				
				<%for(int p=wpi.getStartPage(); p<=wpi.getEndPage(); p++){ %>
					<button onclick="location.href='<%=contextPath%>/wList.rev?cpage=<%=p%>'"><%= p %></button>
				<%} %>
				
				<%if(wpi.getCurrentPage()!=wpi.getMaxPage()){ %>
				<button onclick="location.href='<%=contextPath%>/wList.rev?cpage=<%=wpi.getCurrentPage()+1%>'">&gt;</button>
				<%} %>
				</div>

		    <%} %>
		
		
    	</div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>