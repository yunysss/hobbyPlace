<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
   page import= "java.util.ArrayList, com.hp.lesson.model.vo.Lesson, com.hp.common.model.vo.PageInfo"
%>    
    
<%
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String category = (String)request.getAttribute("category");
	String dcategory = (String)request.getAttribute("dcategory");
	String sido = (String)request.getAttribute("sido");
	String sigungu = (String)request.getAttribute("sigungu");
	String price = (String)request.getAttribute("price");
	String day = (String)request.getAttribute("day");
	int count = (int)request.getAttribute("count");
	

	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
 <style>
.outer {
	width: 1000px;
	margin: auto;
}

h4>a {
	color: rgb(65, 64, 64);
	margin-right: 5px;
	text-decoration: none;
	font-size: 20px;
	font-weight: 550;
}

h4>a:hover {
	text-decoration: none;
	cursor: pointer;
	color: rgb(35, 104, 116);
}

.thumbnail {
	width: 190px;
	display: inline-block;
	margin: 10px;
	text-align: left;
}

#detail-category a {
	color: rgb(65, 64, 64);
	font-size: 12px;
	margin-right: 5px;
}

#detail-category a:hover {
	cursor: pointer;
	color: black;
	font-size: 12.5px;
}

#button-area {
	margin-top: 10px;
}

#btn-area {
	display: inline-block;
	width: 770px;
	text-align: right;
}

#btn-area>button {
	width: 60px;
	height: 30px;
	line-height: 10px;
	background-color: rgb(35, 104, 116);
	border: none;
	font-size: 13px;
	color: whitesmoke;
	border-radius: 5px;
}

#btn-area>button:hover {
	background-color: rgba(35, 104, 116, 0.685);
}

#thumbnail img {
	border-radius: 5px;
}

.paging-area {
	text-align: center;
}

.paging-area>* {
	border: none;
	border-radius: 3px;
}

#thumbnail img, .a img {
	border-radius: 5px;
}
#thumbnail:hover {
		opacity:0.8;
	}
	
img:hover{
	opacity:0.8;
}
.dropdown {
	display: inline;
}

.dropdown-menu a {
	font-size: 12px;
}

.pop {
	width: 30px
}

.a {
	width: 190px;
	display: inline-block;
	margin: 10px;
	text-align: left;
	box-sizing: border-box;
}

#clName {
	height: 50px;
}

#range img {
	margin-left: 10px;
	margin-right: 10px;
}

a {
	text-decoration: none !important;
	color: black !important;
}


#paging{
	    text-align: center;
	    display: inline-block;
		padding-left :0;
	}
	#paging li {
	    text-align: center;
	    float: left;
		list-style:none;
		border-radius:10px;
	}
	
	#paging li a {
	    display: block;
	    font-size: 15px;
		color: black;
	    padding: 5px 10px;
	    box-sizing: border-box;
		text-decoration-line:none;
	}
	
	#paging li.on {
	    background: gainsboro;
	}
	
	#paging li.on a {
	    color: white;
	}
</style>
</head>
<body>
<%@include file="../common/tuteeMenubar.jsp" %>
 <div class="outer">
 	<%if (list.isEmpty()) {%>
 		<div align="center">
  		<h5> 검색된 클래스가 없습니다.🥲</h5>
  		</div>
  		<%} else {%>
        <h4> <a href=""><%=keyword%> 검색결과</a><span class="material-symbols-outlined symbol">expand_more</span></h4>
    
        <div id="button-area">
             <div class="dropdown">
            <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown">
              지역
            </button>
            <div class="dropdown-menu filter" id="region">
              <a class="dropdown-item" id="10" href="#">서울</a>
              <a class="dropdown-item" id="20" href="#">인천</a>
              <a class="dropdown-item" id="30" href="#">경기</a>
            </div>
            </div>
            <div class="dropdown">
              <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown">
                일정
              </button>
              <div class="dropdown-menu filter" id="schedule">
                <a class="dropdown-item" id="weekday" href="#">평일</a>
                <a class="dropdown-item" id="sat" href="#">토요일</a>
                <a class="dropdown-item" id="sun" href="#">주말</a>
              </div>
    
        </div>
        
          <script>
	      	let url = document.location.href;
	      	console.log(url);  
	 
	      	let query = window.location.search;        
	      	let param = new URLSearchParams(query);   
	      	  
	     
	      	let allbtn = document.querySelectorAll(".filter a");
	      	allbtn.forEach(function(b){
	      		b.addEventListener('click',filterButton);
	      	
	      	});
	      	
	      	function filterButton(e){
	      		let type = e.target.parentNode.id;
	      		let id = e.target.getAttribute('id');
	      	
	      		if(type == 'region'){
	      			if(id != null){
	      			param.set('sido', id);
	      			}
	      		}
	      		
	      		if(type == 'schedule'){
	      			if(id != null){
	      			param.set('day',id);
	      			}
	      		}
	    
	    
	      		location.href = "<%=contextPath%>/detail.sc?" +  param.toString();
	      	}
	      	
	      	
	 
      	  </script>
      	  

        
        

        <br><br>
        <span style="font-size: 12px; font-weight: 550; color: rgb(75, 72, 72);">검색결과 <%=count%> 건</span>
        <div id="btn-area">
         <div class="dropdown">
		    <button id="sortBtn"  type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		      정렬
		    </button>
		    <div class="dropdown-menu " id="sort">
		      <a class="dropdown-item">낮은가격순</a>
		      <a class="dropdown-item">높은가격순</a>
		      <a class="dropdown-item">인기순</a>
		      <a class="dropdown-item">평점순</a>
		      
		    </div>
       	 </div>
        </div>

		<script>
			let totalData; 
		    let dataPerPage=16; 
		    let pageCount = 5; 
		    let globalCurrentPage=1;
		    let dataList; 
			
			$("#sort a").click(function(){
        		   
        		   $.ajax({
                       url:"<%=contextPath%>/sort.cl",
                       data:{keyword : '<%=keyword%>',
                       		  category : '<%=category%>',
                             dcategory : '<%=dcategory%>',
                             sido : '<%=sido%>',
                             sigungu : '<%=sigungu%>',
                             price : '<%=price%>',
                             day : '<%=day%>',
                             sort : $(this).text()
                        
                       },
                       type:"post",
                       success:function(list){
   	                      // console.log(list);
   	                       if(list.length ==0){
   	                    	   let value = "<div align='center'><h5>조회된 내역이 없습니다.</h5></div>"
   	                    	$(".thumbnail").html("");
   	            			$("#area1").html("");
   	            			
   	        				$("#area1").append(value);
   	                       
   	                       }else{
   	                    	  totalData = list.length;
	    	 		           dataList=list;
	    	 		           displayData(1, dataPerPage, totalData);
	    	 		           paging(totalData, dataPerPage, pageCount, 1);
   	                       }
   	                       	
   						},
   						error : function(){
   								console.log("조회용 ajax통신 실패");
   								}
        				  
   					})
   				})
   				
   				function displayData(currentPage, dataPerPage, totalData) {
		    	  let value = "";
		    	  currentPage = Number(currentPage);
		    	  dataPerPage = Number(dataPerPage);
		    	  if(totalData < dataPerPage){
		    		  num = totalData;
		    	  } else{
		    		  num = dataPerPage;
		    	  }
		    	  for (let i = (currentPage - 1) * dataPerPage; 
		    	    i < (currentPage - 1) * dataPerPage + num;
		    	    i++
		    	  ) {
		    		  value += "<table class='a'><tr><td>"
							+ "<a href='" + '<%=contextPath%>' + "/page.cl?no=" + dataList[i].clNo + "'>"
								+ "<img width='180' height='180' src='" + '<%=contextPath%>' + "/" + dataList[i].clThumb + "'><br>"
								+ "<small  style='font-size: 11px;'>" + dataList[i].distrCode + "</small><br>"
					 			+ "<div id='clName'><b>" + dataList[i].clName 
					 if(dataList[i].clName.length >=25){
									value += "..";
						}
								
						value  += "</b></div>"
								+ "<b>"+ dataList[i].clPrice +"</b>" + "&nbsp&nbsp&nbsp;&nbsp;<small>⭐" + dataList[i].clStarAvg+".0(" + dataList[i].clStarCount + ")"
								+ "</small></a>"
								+ "</td>"
						}
					
					$(".thumbnail").html("");
	    			$("#area1").html("");
	    			$(".paging-area").html("");
					$("#area1").append(value);
				}
				
	  	
   				
   				
   				<!-- 페이징처리 -->
	  		function paging(totalData, dataPerPage, pageCount, currentPage) {
	  		 
	  			  totalPage = Math.ceil(totalData / dataPerPage); 
	      		  
	      		  if(totalPage<pageCount){
	      		    pageCount=totalPage;
	      		  }
	      		  
	      		  let pageGroup = Math.ceil(currentPage / pageCount); 
	      		  let last = pageGroup * pageCount; 
	      		  
	      		  if (last > totalPage) {
	      		    last = totalPage;
	      		  }
	
	      		  let first = last - (pageCount - 1); 
	      		  let next = last + 1;
	      		  let prev = first - 1;
	
	      		  let pageHtml = "";
	
	      		  if (prev > 0) {
	      		    pageHtml += "<li><a href='#' id='prev'> &lt; </a></li>";
	      		  }
	
	      		  for (let i = first; i <= last; i++) {
	      		    if (currentPage == i) {
	      		      pageHtml +=
	      		        "<li class='on'><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
	      		    } else {
	      		      pageHtml += "<li><a href='#' id='" + i + "' class='page-btn'>" + i + "</a></li>";
	      		    }
	      		  }
	
	      		  if (last < totalPage) {
	      		    pageHtml += "<li><a href='#' id='next'> &gt; </a></li>";
	      		  }
	
	      		  $("#paging").html(pageHtml);
	
	      		  $("#paging li a").click(function () {
	      		    let $id = $(this).attr("id");
	      		    selectedPage = $(this).text();
	
	      		    if ($id == "next") selectedPage = next;
	      		    if ($id == "prev") selectedPage = prev;
	      		    globalCurrentPage = selectedPage;
	      		    paging(totalData, dataPerPage, pageCount, selectedPage);
	      		    displayData(selectedPage, dataPerPage, totalData-(selectedPage-1)*dataPerPage);
	      		  });
	  		  
	  		}
   	
		</script>
		
		
		
		<div class="container">

			<div class="list-area">
				<div id="area1"></div>

				<% for(Lesson l : list) {%>
				<table class="thumbnail">
					<input type="hidden" value="<%=l.getClNo()%>">
					<tr>
						<td>
							<div id="thumbnail">
								<img src="<%=contextPath%>/<%=l.getClThumb()%>" width="180"
									height="180">

							</div>
						</td>
					</tr>
					<tr>
						<td style="font-size: 11px;"><%=l.getDistrCode()%></td>
					</tr>
					<tr>
						<th height="50px">	
						<%if(l.getClName().length() >= 25){ %>
						<%=l.getClName()%>..
						<%} else {%>
						<%=l.getClName()%>
						<%} %>
						</th>
					</tr>

					<tr>
						<th><%=l.getClPrice()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small>⭐<%=l.getClStarAvg() + ".0(" + l.getClStarCount()%>)
						</small></th>
					</tr>

				</table>
				<%} %>

			</div>
		</div>	
			<script>
              	$(function(){
              		$(".thumbnail").click(function(){
              			location.href="<%=contextPath%>/page.cl?no="+ $(this).children('input').val();
						})
				})
			</script>
	<%} %>
	
			<div align="center">
            	<ul id="paging">
				</ul>
            </div>	
			<div class="paging-area">
			                                                       
				<%if (pi.getCurrentPage() != 1) {%>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=pi.getCurrentPage() - 1%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%>';">&lt;</button>
				<%}%>

				<%for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=p%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%> ';"><%= p %></button>
				<%} %>

				<%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
				<button onclick="location.href='<%=contextPath%>/detail.sc?cpage=<%=pi.getCurrentPage()+1%>&keyword=<%=keyword%>&category=<%=category%>&dcategory=<%=dcategory%>&sido=<%=sido%>&sigungu=<%=sigungu%>&price=<%=price%>';">&gt;</button>
				<%} %>

			</div>


	</div>
		<%@ include file="../common/footerbar.jsp" %>



</body>
</html>