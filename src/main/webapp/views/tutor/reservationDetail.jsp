<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hp.register.model.vo.Register"%>
    
<% 
	Register r = (Register)request.getAttribute("r");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        div{margin: auto;}
        
        .outer{
            width: 1000px; 
            height: 100vh;
            margin: auto;
            padding:25px;
        }
       
      
        .detail-area{ width: 90%; height: 60%;}

        #content_box{ 
            width:99%; 
            height: 470px;
            border: 1px solid black; 
            border-radius: 7px;
        }
        
        #status_area{
            text-align: right;
            width: 95%;
            margin: 20px;
        }
       
        table {margin:35px;}
        #memo {margin-left: 35px; width: 770px; height: 150px; resize: none;}

        #btn_area{margin: 10px; text-align: right; width: 95%;}
        
    </style>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">    
        <h5><b>예약 관리</b></h5><br>
        
        <div class="detail-area">
            <h6 style="font-weight:bold; padding: 7px; margin-top: 10px;"> 예약 상세 조회</h6>

            <div id="content_box">
               	 <input type="hidden" name="no" id="regNo" value="<%=r.getRegNo()%>">
                    <div id="status_area">
                        <select id="status" name="regSta">
                            <option value="1">수강전</option>
                            <option value="2">수강완료</option>
                            <option value="3">수강취소</option>
                        </select>
                         <script>
                			$(function(){
	                     		// option 요소들의 innerText값이 현재 게시글의 카테고리명과 일치하는 
	                			// option 요소를 찾아서 selected 속성 부여해주기
                				$("#reservationform option").each(function(){
                					if($(this).text() == "<%=r.getRegSta()%>"){
                						$(this).attr("selected", true); 
                					}
                				})
                			})
                        </script>
                        
                    </div>
                    
                    <table>
                        <tr>
                            <th colspan="3" width="550px"><h4 style="font-weight: bold;"><%=r.getClName() %></h4></th>
                            <th colspan="2" width="300px"><%=r.getTeachDate() %> <%=r.getStartTime() %>~<%=r.getEndTime() %></th>
                        </tr>

                        <tr>
                            <td height="30px" colspan="5"></td>
                        </tr>
                        
                        <tr>
                            <th>튜티명</th>
                            <td><%=r.getMemName() %></td>
                            <th>신청 인원</th>
                            <td><%=r.getRegCount() %>명</td>
                        </tr>
                        
                        <tr>
                            <th>휴대폰 번호</th>
                            <td><%=r.getMemPhone() %></td>
                            <th>수강료</th>
                            <td><%=r.getClPrice() %>*<%=r.getRegCount() %>=<%=r.getRegPrice() %></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="4"><%=r.getMemEmail() %></td>
                        </tr>

                    </table>


                    <textarea name="memo" id="memo" cols="30" rows="10"><%=r.getMemo() %></textarea>

                    <div id="btn_area">
                        <button onclick="updateStatus();" type="button" class="btn btn-secondary" style="height: 30px; line-height: 10px;">저장</button>
                    </div>
                    

                
                
                <script>
	              
                
                	function updateStatus(){
                		$.ajax({
                			url:"<%=contextPath%>/resUpdate.tt",
                			data:{
                				memo:$("#memo").val(),
                				regSta:$("#status").val(),
                                no: $("#regNo").val()
                			},
                			type:"post",
                			success:function(result){
                				$("#status").val();
                				$("#memo").val();
                                alert("저장 성공");
                				
                			},error:function(){
                				console.log("댓글 작성용 ajax 통신 실패");
                			}
                		})
                	}
	                
	               
                
                </script>

          
            </div>
            
            
        </div>
    </div>
</body>
</html>