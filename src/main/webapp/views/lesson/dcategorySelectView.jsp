<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList, com.hp.lesson.model.vo.*, com.hp.common.model.vo.PageInfo" %>    
<%
	ArrayList<Lesson> classList = (ArrayList<Lesson>)request.getAttribute("classList");
	ArrayList<Dcategory> cList = (ArrayList<Dcategory>)request.getAttribute("cList");
	
	int count = (int)request.getAttribute("count");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
 <style>
        .outer{
            width: 1000px;
            margin: auto;


        }
        h4>a{
          color: rgb(65, 64, 64);
          margin-right: 5px;
          text-decoration: none;
          font-size: 20px;
          font-weight: 550;
        
        }
        h4>a:hover{
          text-decoration: none;
          cursor: pointer;
          color:  rgb(35, 104, 116);
        
        }
        .thumbnail{
        width: 190px;
        display: inline-block;
        margin: 10px;
        text-align: left;
      }
      #detail-category a{
          color: rgb(65, 64, 64);
          font-size: 12px;
          margin-right: 5px;
      }
      #detail-category a:hover{
        cursor: pointer;
        color: black;
        font-size: 12.5px;
      }
      #button-area{
        margin-top: 10px;
      }
      #btn-area{
        display: inline-block;
        width: 770px;
        text-align: right;
      }
      #btn-area>button{
        width: 60px;
        height: 30px;
        line-height: 10px;
        background-color: rgb(35, 104, 116);
        border: none;
        font-size: 13px;
        color: whitesmoke;
        border-radius: 5px;
      }
      #btn-area>button:hover{
        background-color:  rgba(35, 104, 116, 0.685);
      }
     
     .paging-area{
        text-align: center;
    }
    .paging-area>*{
        border: none;
        border-radius: 3px;

    }

    #thumbnail img{
      border-radius: 5px;
     };   

    </style>
</head>
<body>
<%@include file="../common/tuteeMenubar.jsp" %>
  <div class="outer">
  		<%if (classList.isEmpty()) {%>
  			<div align="center">
  			<h5>등록된 클래스가 없습니다.🥲</h5>
  			</div>
  		<%}else{ %>
        <h4> <a href="<%=contextPath %>/ctselect.cl?cpage=1&ct=<%=classList.get(0).getCtNo() %>"><%=classList.get(0).getCtNo() %></a><span class="material-symbols-outlined symbol">expand_more</span></h4>
     	 
        <div id="detail-category">
      	 <%for (Dcategory d : cList){ %>
       	<a><%=d.getCtDname() %></a>
       <%} %>
        </div>
        
         <script>
        	$(function(){
        		$("#detail-category>a").click(function(){
        			location.href = "<%=contextPath%>/dctselect.cl?cpage=1&dct="+ $(this).eq(0).text();
        			$(this).css("color","blue");
        					
        		})
        		
        	})

        </script>
        
        <div id="button-area">
            <button class="btn btn-secondary btn-sm"> 지역 </button>
            <button class="btn btn-secondary btn-sm"> 날짜 </button>
        </div>

        <br><br>
        <span style="font-size: 12px; font-weight: 550; color: rgb(75, 72, 72);">검색결과 <%=count %> 건</span>
        <div id="btn-area" style="border: 1px sold black;">
         <button class="btn btn-secondary btn-sm"> 인기순 </button>
          <button class="btn btn-secondary btn-sm"> 평점순 </button>
        </div>
        <div class="container">
               <div class="list-area">
          			<%if (classList.isEmpty()){ %>
                    <h5>등록된 클래스가 없습니다. </h5>
                 	<%} else{%>
            	<% for(Lesson l : classList){%>
                <table class="thumbnail"  >
                  <input type="hidden"  value="<%=l.getClNo() %>">
                  <tr>
                    <td>
                    <div id="thumbnail">
                    <img src="<%=contextPath %>/<%=l.getClThumb() %>"  width="180" height="180">
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="font-size: 11px;">
                    	<%=l.getDistrCode()%>
                    </td>
                  </tr>
                  <tr>
                    <th><%=l.getClName() %> </th>  
                  </tr>
                 
                  <tr>
                    <th><%=l.getClPrice() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>⭐<%=l.getClStarAvg()+".0("+ l.getClStarCount()%>)</small> </th>
                  </tr>

                </table>
             <%} %>

			<%} %>
              </div>   
              
               <script>
              	$(function(){
              		$(".thumbnail").click(function(){
              			location.href="<%=contextPath%>/page.cl?no="+$(this).children('input').val();
              		})
              	})
       
              </script>
              
              
              
              
               <div class="paging-area">
        
        	<%if(pi.getCurrentPage() != 1){ %>    
        		
            		<button onclick="location.href='<%=contextPath%>/dctselect.cl?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
			
			<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           		 <button onclick="location.href='<%=contextPath%>/dctselect.cl?cpage=<%=p%>';"><%= p %></button>
           		 
            <%} %>
          
            <%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
            <button onclick="location.href='<%=contextPath%>/dctselect.cl?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
            
           
       	 </div>
              <%} %>
              
              
              
			
    </div>
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>