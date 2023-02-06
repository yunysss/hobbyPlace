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
     
     #introduce textarea{
      border: none;
      width: 410px;
      resize: none;
      margin-top : 10px;
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

  #thumbnail img, #reimg img{ border-radius: 5px;}

  .rimg>a>img{
  width: 130px;
  height:130px;
  border-radius  : 5px
  }

</style>
</head>

<body>
<%@include file="../common/tuteeMenubar.jsp" %>
<div class="outer">
        
    <h5 style="font-weight: 600;">튜터 상세페이지</h5>
    <hr>

   
        <div id="profile">
            <div id="tutorProfile" align="center" >
                <p style="border: 1px solid rgb(201, 199, 199);" id="p">
            
                <img src="<%=request.getContextPath()%>/<%=ttProfile %>" width="80"height="80" class="rounded-circle" alt="Cinque Terre">
                &nbsp;<span style="font-weight: 600;"><%=t.getTtName() %></span><br>
                <span style="font-size: 12px; color: g;">클래스 <%=cCount %> </span> | 
                <span style="font-size: 12px;"> 후기 <%=rCount %></span>
                <a href="<%=contextPath %>/qnaEnroll.tee"><span class="badge badge-danger">문의하기</span></a>
                
              </p>
                
            </div>
            <div id="introduce">
                <h6 style="font-weight: 600;">튜터 소개</h6>
                <div style="font-size: 13px;">
                  <% if( t.getIntroduce() !=null){%>
                   <textarea rows="10"><%=t.getIntroduce() %></textarea>
                   <%}%>
                </div>
             
                <a href="#demo" data-toggle="collapse" data-target="#demo"></a>
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
                    <input type="hidden" value="<%=l.getClNo() %>">
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
                      <th height="50px"><%=l.getClName() %></th>  
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


                <script>
                  $(function(){
                    $(".thumbnail").click(function(){
                      location.href="<%=contextPath%>/page.cl?no="+$(this).children('input').val();
                    })
                  })
         
                </script>
 
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
                	<input type="hidden" name="reNo" value="<%=r.getReviewNo()%>">
                    <table style="text-align: left;">
                      <tr>
                       <%if(r.getMemProfile() == null) {%>
		                 <th width="70" height="60"><img src="<%=contextPath%>/resources/tutorProfile_upfiles/defaultimg.jpg" type="button" width="60" height="60"  class="rounded-circle" class="dropdown-toggle" data-toggle="dropdown">
		                <%} else {%>
                        <th width="70" height="60"><img src="<%=contextPath%>/<%=r.getMemProfile() %>" width="60" height="60" class="rounded-circle" alt="Cinque Terre"></th>
                        <%} %>
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
                      
                        <!-- 
                          <td rowspan="3" width="150" id="reimg">
                              <%if(r.getTitleImg() != null){ %>
                              <img src="<%=request.getContextPath()%>/<%=r.getTitleImg() %> " width="150" height="150" alt="">
							<%} else{ %>
							 <img src="<%=request.getContextPath()%>/resources/images/classimg.png " width="150" height="150" alt="">
							<%} %>
								                        
                          </td>
						-->
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
                      <tr>
                       
			  				<td colspan="2" id="reContent-<%=r.getReviewNo()%>" class="rimg"> 
			  				<br>	
			  				</td>
			  		</tr>
                   </table>
                    <hr>
                    
                 <%} %>
                  </div>
              <script>
              $(function(){
					$("input[name='reNo']").each(function(){
						let regNo = $(this).val();
						$.ajax({
							url:"<%=contextPath%>/selectReAttachment.cl",
							data:{reNo:regNo},
							success:function(list){
								let value=""
									for(let i=0; i<list.length; i++){
										value += "<a href='<%= contextPath %>/" + list[i].filePath + list[i].changeName + "' data-toggle='lightbox' data-gallery='example-gallery'><img src='<%= contextPath %>/" + list[i].filePath + list[i].changeName + "' class='img-fluid'> </a>";
									}
								$("#reContent-" + regNo).append(value);
							}
						})
					})
		        })
              
              
              
              
              
              
              </script>
                <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
					<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
					<script>
					$(document).on('click', '[data-toggle="lightbox"]', function(event) {
					    event.preventDefault();
					    $(this).ekkoLightbox();
					});
					</script>
                 
                  

              </div>
              
            </div>
          </div>
          
    
    
   
                

        
    </div>
    <%@ include file="../common/footerbar.jsp" %>




</body>
</html>