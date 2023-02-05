<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    .search-table{
       margin: 30px;
    }
    .search-table{
        width: 700px;
        height: 220px;
        margin: auto;
    }
    .search-table td{ margin: 5px;}
    .search-form p , .result-area p {
        padding: 10px;
        font-weight: bold;
    }
    
    #reviewSearch-btn{
        border: 0;
        background: rgb(35, 104, 116); 
        color:white;
        width: 50px;
        border-radius: 5px;
    }
    .search-area{ 
        padding: 15px;
        border: 1px solid gray;
        border-radius: 5px;
    }
    .result-area{
        width: 920px;
        height: 895px;
        padding: 15px;
    }
    .result-table{
        width: 900px;
        text-align: center;
        table-layout: fixed;
        
    }

    .result-table th{
        background-color: lightgray;
        margin: auto;
        
    }
    .result-table td{
        height: 40px;
       
    }
    #revContent , #classTitle{
        height: 40px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

  

   
    
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp" %>
    <div class="content" style="margin:15px">
        <h6 style="margin-left: 15px;"><b>후기 조회</b></h6>
        <hr>
        <div class="search-area">
            <form action="" class="search-form">
                <p>상품 후기 목록 58건</p>
                <table class="search-table" style="text-align: center;">
                    <tr>
                        <th width="80px">평점</th>
                        <th width="40px">
                            <input type="checkbox" name="reStar" value="1" id="1star">
                            <label for="1star">&nbsp;⭐</label>
                        </th>

                        <th width="40px">
                            <input type="checkbox" name="reStar" value="2" id="2star">
                            <label for="2star">&nbsp;⭐⭐</label>
                        </th>

                        <th width="110px">
                            <input type="checkbox" name="reStar" value="3" id="3star">
                            <label for="3star">&nbsp;⭐⭐⭐</label>
                        </th>

                        <th width="140px">
                            <input type="checkbox" name="reStar" value="4" id="4star">
                            <label for="4star">&nbsp;⭐⭐⭐⭐⭐</label>
                        </th>

                        <th width="110px" colspan="2">
                            <input type="checkbox" name="reStar" value="5" id="5star">
                            <label for="5star">&nbsp;⭐⭐⭐⭐⭐</label>
                        </th>
                        
                    </tr>
                   
                    <tr>
                        <th>튜티명</th>
                        <td colspan="2"><input type="search" name="memName"></td>
                        <th>튜터명</th>
                        <td colspan="3" align="left"><input type="search" name="ttName"></td>
                        
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="2"><input type="search" name="revContent"></td>
                        <th >클래스명</th>
                        <td align="left" colspan="2"><input type="search" name="clName"></td>
                        <td><button id="reviewSearch-btn">검색</button></td>
                    </tr>
                    
            </form>
            </table>
        </div> <!-- 검색영역 끝-->
        
        <script>
                    function starRating(){
                		
    					let reStar = "";
                    	
                    	$("input[name=reStar]:checked").each(function(){
                   		 let arr = $(this).val(); 
                   		reStar += arr + ","
          
                 	  	})
                   	
                   	$.ajax({
                   		url:"<%=contextPath%>/revSearch.ad",
                   		data:{
                   			reStar: reStar,
                   			memName: $("input[name=memName]").val(),
                   			ttName: $("input[name=ttName]").val(),
                   			revContent: $("input[name=revContent]").val(),
                   			clName: $("input[name=clName]").val()
                   		},
                   		type:"post",
                   		success : function(result){
                   			//console.log(result);
                   			
                   			if(result.length == 0){
                				let	value = "<tr>"
                					      + "<td colspan='5'> 조회된 리뷰가 없습니다."
                					      + "</tr>"
                				  $(".result-table tbody").html(value); 
                				}else{
                					value += "<tr>"
         							   + "<td>" + result[i].ttName  + "</td>"
         							   + "<td>" + result[i].clName + "</td>"
         							   + "<td>" + result[i].revContent + "</td>"
         							   + "<td>" + result[i].reStar + "</td>"   
         							   + "<td>" + result[i].memName  + "</td>"
         							   +"</tr>"
            			    	  }
            			    	$(".result-table tbody").html("");
            			    	$(".result-table tbody").html(value); 
            				  	
            				 $(function(){
          	        		$(".result-table>tbody>tr").click(function(){
          	        			location.href="<%=contextPath%>/adAdDetail.rev?no=result[i].regNo 
          	        		})
            				})
                				}
                			},
                			error: function(){
                				console.log("조회용 ajax통신 실패");
                			}
                		})
                		
                	}
                   	
        </script>

        <div class=" result-area">
            <p>검색결과</p>
            <table class="result-table" border="1">
            <thead>
                <tr>
                	<th width="70px">튜티명</th>
                    <th width="250px">클래스명</th>
                    <th width="250px">리뷰</th>
                    <th width="100px">별점</th>
                    <th width="60px">작성자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                	
                </tr>
            </tbody>    
               
            </table>
        </div> <!--조회영역 끝-->
        
    





</body>
</html>