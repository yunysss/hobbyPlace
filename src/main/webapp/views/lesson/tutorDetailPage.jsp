<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hp.tutor.model.vo.Tutor, java.util.ArrayList, com.hp.lesson.model.vo.Lesson,com.hp.review.model.vo.Review " %>    
<%
   Tutor t = (Tutor)request.getAttribute("t");
   String ttProfile = t.getTtProfile() ==  null? "resources/tutorProfile_upfiles/defaultimg.jpg" : t.getTtProfile();

   ArrayList<Lesson> cList = (ArrayList<Lesson>)request.getAttribute("cList");
   ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList");
   
   int cCount = (int)request.getAttribute("cCount");
   int rCount = (int)request.getAttribute("rCount");
   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
    .outer{
        margin: auto;
          width: 1000px;
      }
     
     
      #profile>div{
          width: 50%;
          float: left;
         

      }
      #tutorProfile{
          height: 200px;
          padding: 45px;
          
      }
      #tutorProfile p{
          height: 200px;
          border-radius: 5px;
          padding: 45px;
          
      }
      #p {
        vertical-align: middle;
        
        
      }
      #introduce{
          padding: 45px 0px;
          height: 200px;
      }

     #introduce>div{
      height: 100px;
     }
     #introduce a{ color: rgb(89, 86, 86); 
      font-size: 12px;
      
      }
      #class-area *{
          clear: both;
          width: 100%;
          
      }


  .container{
      width: 1000px;
      margin:auto;      
  }

  .list-area{width:900px;}
  .thumbnail{
    width: 190px;
    display: inline-block;
    margin: 10px;
  }


</style>
</head>

<body>
<%@include file="../common/tuteeMenubar.jsp" %>
<div class="outer">
        
    <h5 style="font-weight: 600;">튜터 상세페이지</h5>
    <hr>

   
        <div id="profile">
            <div id="tutorProfile" align="center">
                <p style="border: 1px solid rgb(201, 199, 199);" id="p">
            
                <img src="<%=request.getContextPath()%>/<%=ttProfile %>" width="60" class="rounded-circle" alt="Cinque Terre">
                <span style="font-weight: 600;"><%=t.getTtName() %></span><br>
                <span style="font-size: 11px; color: g;">클래스 <%=cCount %> </span> | 
                <span style="font-size: 11px;"> 후기 <%=rCount %></span>
                <a><span class="badge badge-danger">문의하기</span><a/>
                
              </p>
                
            </div>
            <div id="introduce">
                <h6 style="font-weight: 600;">튜터 소개</h6>
                <div style="font-size: 13px;">
                    <%=t.getIntroduce() %>

                </div>
               
                <a href="#demo" data-toggle="collapse" data-target="#demo">더보기</a>

                <div id="demo" class="collapse show">
                  
                </div>
            </div>
            
        </div>
        <div class="container">
            <h2 style="color:white;">.</h2>
            <br><br><br>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home" style="font-weight: 600; font-size: 20px;">클래스</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1" style="font-weight: 600; font-size: 20px;">후기</a>
              </li>
              
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content">
              <div id="home" class="container tab-pane active"><br>
               
                <br>
                 <div class="list-area">
                 <% if (cList.isEmpty()){ %>
                   <h6>등록된 클래스가 없습니다..???</h6>
                  <%}else{ %>
                  	 <% for (Lesson l : cList){ %>
                  <table class="thumbnail"  >
                    <tr>
                      <td>
                      <div id="thumbnail">
                      <img src="<%=request.getContextPath()%>/<%=l.getClThumb() %>"  width="180" height="180">
                      </div>
                      </td>
                    </tr>
                    <tr>
                      <td style="font-size: 11px;">
                       <%=l.getDistrCode() %>
                      </td>
                    </tr>
                    <tr>
                      <th><%=l.getClName() %></th>  
                    </tr>
                    <tr>
                      <td>
                    	 <%=l.getClPrice() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>⭐ <%=l.getClStarAvg()+".0("+ l.getClStarCount()%>)</small>
                      </td>
                      
                    </tr>
           
                  </table>
                  <%} %>
               	 <%} %>


                </div>   
                  
                  
                  <button onclick="$('.nav-link').trigger('click');">test</button>
                  
                  
                 
              </div>
              <div id="menu1" class="container tab-pane fade"><br>
                <div id="review-area">
                	<%if(rList.isEmpty()){ %>
                	<table>
                		<tr>
                		<th>등록된 리뷰가 없습니다.</th>
                		</tr>              		
                	</table>
                	<%}else %>
                	<%for(Review r : rList){ %>
                    <table style="text-align: left;">
                      <tr>
                        <th width="70" height="60"><img src="<%=request.getContextPath()%>/<%=r.getMemProfile() %>" width="60" class="rounded-circle" alt="Cinque Terre"></th>
                        <td>
                          <label id="review-nick" style="font-weight: 550;"></label><%=r.getMemNickName() %><br>
                            <% 
	                            String value = "";
	                         for(int j=1; j<=r.getReviewStar(); j++){
	                			value += "⭐";
	                			} %>
	                			<%= value %> 
	                			<span id="review-date" style="font-size:12px;">
	                			<% if(r.getReviewDate() == null){ %>
	                                    	<%= r.getReviewDate() %>
	                                    <% } else{%>
	                                    	<%= r.getReviewUpDate() %>
	                                    <% } %>
	                            </span>
                      </td>
                          <td rowspan="3" width="150">
                              <img src="<%=request.getContextPath()%>/resources/images/sample1.png" width="150" height="150" alt="">
                          </td>
                      </tr>
                      <tr>
                        <td width="60">
                            
                        </td>
                        <td style="font-size: 11px;" height="20">
                           <%=r.getClName() %>
                        </td>
                    </tr>
                      <tr>
                          <td colspan="2" width="700" style="font-size: 14px;">
                            <div style="width: 600px;">
                           <%=r.getReviewContent() %>
                           </div>
                          </td>
                      </tr>
                   </table>
                    <hr>
                    
                 <%} %>
                  </div>
              
                
                 
                  

              </div>
              
            </div>
          </div>
          
    
    
   
                

        
    </div>
    <%@ include file="../common/footerbar.jsp" %>




</body>
</html>