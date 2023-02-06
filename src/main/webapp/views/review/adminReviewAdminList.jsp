<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     .outer{
    	width:1000px; margin:auto; padding:30px 50px;
    }
    .outer>*{font-size:small;}
    
    #selectReview-btn{
       width:60px;
       margin:0px 5px;
       background:rgb(22, 160, 133); 
       color:white;
      }
      #selectAllReview-btn{
      	width:80px;
  		background:rgb(22, 160, 133); 
   	color:white!important;
      }
    .search-area, .result-area{ 
    	width:920px;
        padding: 20px;
        border: 1px solid gray;
        border-radius: 5px;
        margin-bottom:20px;
    }
    .search-area td{
    	padding:10px;
    }
    .search-area td>label{
    	margin-right:20px;
    }
    input[type=text]{
           width: 170px;
           border: 1px solid rgb(202, 199, 199);
           height: 30px;
           border-radius: 5px;
   }
    .result-table td{
      text-align: center;
      vertical-align: middle;
      font-size:12px;
     }
    thead td{
        background:rgb(245, 245, 245);
       }
    #revContent , #classTitle{
        height: 40px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
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
	    font-size: 12px;
		color: black;
	    padding: 5px 10px;
	    box-sizing: border-box;
		text-decoration-line:none;
	}
	
	#paging li.on {
	    background: gray;
	}
	
	#paging li.on a {
	    color: white;
	}
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
        <div class="outer">
        <h5 style="font-weight: 600; font-size:18px"><b>후기 관리</b></h5><br>
        <hr>
        <div class="search-area">
            <table width="700px">
                <tbody>
                	<tr>
                    	<td><b>평점</b></td>
                   		<td>
                   		<input type="checkbox" id="chkAll"><label for="chkAll">전체</label>
                   		<input type="checkbox" name="reStar" value="1" id="1star">&nbsp;<label for="1star">⭐</label>
                        <input type="checkbox" name="reStar" value="2" id="2star">&nbsp;<label for="2star">⭐⭐</label>
                        <input type="checkbox" name="reStar" value="3" id="3star">&nbsp;<label for="3star">⭐⭐⭐</label>
                        <input type="checkbox" name="reStar" value="4" id="4star">&nbsp;<label for="4star">⭐⭐⭐⭐</label>
                        <input type="checkbox" name="reStar" value="5" id="5star">&nbsp;<label for="5star">⭐⭐⭐⭐⭐</label></td>
                    </tr>
                    <tr>
                        <td><b>클래스명</b></td>
                        <td>
                        	<input type="text" name="clName">
                        </td>
                    </tr>
                    <tr>
                    	<td><b>튜티명</b></td>
                        <td>
                        	<input type="text" name="ttName">
                        </td>
                    </tr>
                    <tr>
                        <td><b>내용</b></td>
                        <td>
                        	<input type="text" name="reContent">
                        </td>
                    </tr>
                    <tr>
                        <td><b>작성자</b></td>
                        <td>
                        	<input type="text" name="reMem">
                        </td>
                    </tr>
                </tbody>
             </table>
             <div align="center">
            	<a href="<%=contextPath %>/ttAdList.rev" class="btn btn-sm" id="selectAllReview-btn">전체조회</a>
            	<button type="button" class="btn btn-sm" id="selectReview-btn" onclick="selectReview();">조회</button>
                <button type="button" class="btn btn-sm btn-secondary" onclick="resetAll();">초기화</button>
            </div>
        </div>
       <script>
			function resetAll(){
				$("input:text").val("");
				$(".search-area input:checkbox").removeAttr("checked");
			}
			$(function(){
				$("#chkAll").click(function() {
					if($("#chkAll").is(":checked")) $("input[name=reStar]").prop("checked", true);
					else $("input[name=reStar]").prop("checked", false);
				});

				$("input[name=reStar]").click(function() {
					var total = $("input[name=reStar]").length;
					var checked = $("input[name=reStar]:checked").length;

					if(total != checked) $("#chkAll").prop("checked", false);
					else $("#chkAll").prop("checked", true); 
				});
			})
			
		</script>

        <div class=" result-area">
            <b>검색결과</b><br>
            <br>
            <table width="100%" class="table result-table">
            	<thead>
	                <tr>
	                	<td>번호</td>
	                    <td width="280px">클래스명</td>
	                    <td>튜티명</td>
	                    <td width="280px">리뷰</td>
	                    <td width="100px">별점</td>
	                    <td width="70px">작성자</td>
	                    <td>작성일</td>
	                </tr>
                </thead>
                <tbody></tbody>
            </table>
            <div align="center">
            	<ul id="paging">
				</ul>
            </div>
        </div> <!--조회영역 끝-->
        <script>
	        let totalData; 
		    let dataPerPage=10; 
		    let pageCount = 10; 
		    let globalCurrentPage=1;
		    let dataList; 
		
		    
		    
		    $(function () {
			     selectReview();
			     
		    })
	        function selectReview(){
		    	let reStar = "";
			    $("input[name=reStar]:checked").each(function(){
	          		 reStar +=  $(this).val() + ",";
			    })
	    		$.ajax({
	    			url:"<%=contextPath%>/selectReview.ad",
	    			data:{
	    				ttName:$("input[name=ttName]").val()
	    				reStar:reStar,
	    				clName:$("input[name=clName]").val(),
	    				reContent:$("input[name=reContent]").val(),
	    				reMem:$("input[name=reMem]").val()  				
	    			},
	    			success:function(list){
	    				if(list.length == 0){
	    					let value = "<tr>"
	    						+	"<td colspan='7'>조회된 내역이 없습니다.</td>"
	    						+ "</tr>"
	    					$(".result-area tbody").html(value);
	    					$("#paging").html("");
	    				} else{
	    	 		    	   totalData = list.length;
	    	 		           dataList=list;
	    	 		           displayData(1, dataPerPage, totalData);
	    	 		           paging(totalData, dataPerPage, pageCount, 1);
	    				}
	    			},error:function(){
	    				console.log("조회용 ajax 통신실패");
	    			}
	    		})
	    	}
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
		    		  value += "<tr>"
							+	"<td>" + dataList[i].reviewNo + "</td>"
							+	"<td>" + dataList[i].clName + "</td>"
							+	"<td>" + dataList[i].reviewContent + "</td>"
							+	"<td>" + dataList[i].reviewStar + "</td>"
							+	"<td>" + dataList[i].memName + "</td>"
							+	"<td>" + dataList[i].reviewDate + "</td>"
  							+	"</tr>"
					}
		    	  $(".result-area tbody").html(value);
				}
				
	  	
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
	      		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
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
	      		    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
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
    </div>
</body>
</html>