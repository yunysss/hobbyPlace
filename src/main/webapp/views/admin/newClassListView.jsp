<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.common.model.vo.PageInfo, com.hp.lesson.model.vo.*"  %>    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        padding: 30px;
        font-size: smaller;
    }
    h5{font-weight: 800;}
   

    #newClass{
        text-align: center;
        font-size: 12px;
    }


    #btn-area {
        width: 900px;
        display: inline-block;
    }
    
     .paging-area{
        text-align: center;
    }
    .paging-area>*{
        border: none;
        border-radius: 3px;

    }
  
</style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
<%if(alertMsg != null) {%>
		<script>
			alert("<%=alertMsg%>"); // alert("") 따옴표안에 작성해야됨
		</script>
			<%session.removeAttribute("alertMsg");%>
		<%} %>
        
        
 
<div class="outer">
    <br>
    <h5 style="font-weight: 900;">신규클래스 신청내역</h5>
    <br><br>

    <span style="font-weight: 600;">신규클래스 목록</span>
    <form action="<%=contextPath%>/ckapprove.cl">
    <div id="btn-area"  align="right">
    <button type="submit" class="btn btn-secondary btn-sm" onclick="approve();">승인</button>
    <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#classReject" onclick="reject();">반려</button>
    </div>
    

    <hr>
    <table class="table table-hover" id="newClass" >
        <thead class="thead-light">
            <tr>
            	<th><input type="checkbox" id="chkAll"></th>
                <th width="100">클래스번호</th>
                <th width="100">카테고리</th>
                <th width="400">클래스명</th>
                <th width="100">등록일</th>
                <th width="100">튜터명</th>
                <th width="80">상태</th>
            </tr>
        </thead>
        
        <tbody>
           	<% if(list.isEmpty()){ %>
                <tr>
                    <td colspan="5">신규클래스 신청내역이 없습니다.</td>
                    
                </tr>
           <%} else{%>
           		<%for(Lesson l : list){ %>
                <tr>
              		<th id="th"><input type="checkbox" name="check" value="<%=l.getClNo()%>"></th>
                    <td><%=l.getClNo() %></td>
                    <td><%=l.getCtNo() %></td>
                    <td><%=l.getClName() %></td>
                    <td><%=l.getEnrollDate() %></td>
                    <td><%=l.getMemNo() %></td>
                    <td>
						 <%String status = l.getClStatus();
                            switch(String.valueOf(status)){
                              case "0" : status ="검수요청"; break;
                              case "1" : status ="검수반려"; break;
                              case "2" : status ="판매중"; break;
                              case "3" : status ="판매중지"; break;
                                }

                                %>
                          <%=status %>

					</td>
					<input type="hidden" name="approvecl" value="">
                </tr>
                <%} %>
          <%} %>
         </tbody>

    </table>
    
    </form>
			<script>
                    $(function(){
                        $("#chkAll").click(function(){
                            if($(this).is(":checked")){
                                $("input[name=check]").attr("checked",true);
                            }else{
                                $("input[name=check]").attr("checked",false);
                            }
                        })
                    })
                </script>

    
     	<script>
     	
			$(function(){
				$("#newClass>tbody td").click(function() {
					location.href = "<%=contextPath%>/newde.ad?no="+$(this).siblings('td').eq(0).text();
					
					
        		})
        	})
        	
        	const th = document.getElementById("th");
			
			th.addEventListner("click",function(e){
				e.stopPropagation();
			
			
			})
        
        
        </script>
    

    <div class="paging-area">
      	
      
        	<%if(pi.getCurrentPage() != 1){ %>    
        		
            		<button onclick="location.href='<%=contextPath%>/newcl.ad?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
			
			<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           		 <button onclick="location.href='<%=contextPath%>/newcl.ad?cpage=<%=p%>';"><%= p %></button>
           		 
            <%} %>
          
            <%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
            <button onclick="location.href='<%=contextPath%>/newcl.ad?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
     </div>


</div>

	
			<script type="text/javascript">
   
                
                function reject(){
                	let classNo = "";
                	// 현재 input type checkbox 인 요소들 중 checked 상태인 요소들에
                	// 순차적으로 접근하면서 해당 value값을 매번 classNo에 ,찍어서 연이어지게끔
                	// "21,23"
                	
                	$("input[name=check]:checked").each(function(){
                		 let arr = $(this).val(); 
                		
                		//console.log($(this).val());
                		classNo += arr + ","
                		
                		//console.log(classNo);
                	
                	})
  
                   $("#classReject input[name=classNo]").val(classNo);
                }
                
                
                function approve(){
                	let classNo = "";
                	
                	$("input[name=check]:checked").each(function(){
               		 let arr = $(this).val(); 
               		 classNo += arr + ","
      
               	})
 
                  $("input[name=approvecl]").val(classNo);
                }
                   
            </script>
                
            
	
        
            <!-- The Modal -->
            <div class="modal" id="classReject">
              <div class="modal-dialog">
                <div class="modal-content">
                    
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h6 class="modal-title">클래스반려</h6>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>
                  
                  <!-- Modal body -->
                  <div class="modal-body" align="center">
                    <b>반려 후 변경이 불가합니다.<br>
                    정말로 반려하시겠습니까? <br><br>
                    </b>
                  </div>
                  
                  <div align="center">
                  <form action="<%=contextPath %>/ckreject.cl" method="post">
                    
		        	<input type="hidden" name="classNo" value="">
		        	반려사유 일괄등록 : <input type="text" name="causeOfReturn" list="list">
		        	<datalist id="list">
                        <option>주제/내용 부적절</option>
                        <option>내용 부족</option>
                        <option>별로임..</option>
                    </datalist>
		        	<button type="submit" class="btn btn-danger btn-sm ">반려하기</button>
		        <br><br>
		        </form>
                    </div>
                </div>
              </div>
            </div>
            
            
            
         
    

</body>
</html>