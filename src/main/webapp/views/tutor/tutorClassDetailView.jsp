<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
            .outer{
                padding: 30px 50px;
                font-size: smaller;
    
            }
    
            #detail-area * {box-sizing: border-box;}
            #img-area{
                width: 410px;
                margin: auto;
                margin-top: 10px;
                text-align: center;
            }
    
           #btn-area{
              
                width: 900px;
                text-align: right;
           }
    
            #thumbnail, #classInfo{float: left;}    
            #thumbnail{
                width: 500px;
                height: 400px;
                position: relative;
            }
    
           
            #classInfo{
                padding: 20px 0px;
                width: 350px;
                height: 100%;
            }
            #classDetail{
                clear: both;
            }
            #className{
                height: 120px;
            }
            #classPrice{height: 50px;}
            #tutorInfo{
                height: 200px;
    
            }
    
            th{width: 100px;
                height: 30px;
            }

            .container{
                font-size: small;
            }

    </style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>


 <div class="outer">
                    
                    <form action="" id="class_list" >
                    <h5 style="font-weight: 900;">내 클래스 목록</h5>
                    <br>
                    <h6 style="font-weight:600">클래스 조회</h6>
                    <hr><br>
                    <table id="class-select">
                        <tr>
                            <th width="100">검색어</th>
                            <td><input type="search">
                               
                            </td>

                        </tr>

                        <tr>
                            <th>조회기간</th>
                            <td>
                                <div class="clearfix">
                                    <!-- 시작일 -->
                                    <span class="dset">
                                        <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
                                        <a href="#none" class="btncalendar dateclick"></a>
                                    </span>
                                    <span class="demi">-</span>
                                    <!-- 종료일 -->
                                    <span class="dset">
                                        <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
                                        <a href="#none" class="btncalendar dateclick"></a>
                                    </span>
                                </div>    

                                <div class="searchDate">
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">&nbsp;오늘&nbsp;</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                 </span>
                                </div>
                            
                            </td>
                            
                           
                        </tr>
                        <tr>
                            <th>등록상태</th>
                            <td>
                                <input type="checkbox" name="status" id="chkAll" value="">
                                <label for="">전체</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">검수요청</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">신청반려</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중지</label>
                            </td>
                        </tr>
                    </table>    
                    <script>
                        $(function(){
                            $("#chkAll").click(function(){
                                if($(this).is(":checked")){
                                    $("input[name=status]").attr("checked",true);
                                }else{
                                    $("input[name=status]").attr("checked",false);
                                }
                            })
                        })
                    </script>

                    <br>
                    <hr>
                    <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">조회하기</button>
                    
                    
                    </div>

                    </form>
                    <br><br>

                    <div id="list">
                        <h6 style="font-weight:600">조회 결과</h6>
                        <hr>
                        <div id="table-area" align="center">
                        <table class="table table-hover" id="clTable">
                            <thead class="thead-light">
                            <tr>
                                <th>클래스번호</th>
                                <th width="120">카테고리</th>
                                <th width="400">클래스명</th>
                                <th width="100">등록일</th>
                                <th width="80">상태</th>
                                <th width="100">반려사유</th>
                            </tr>
                            </thead>
                            <tbody>
                          	<%if (list.isEmpty()){ %>
                            <tr>
                                <td colspan="5">등록된 클래스가 없습니다.</td>
                                
                            </tr>
                            <%} else{%>
                            <!-- 등록된 클래스 있을 경우 -->
                            	<%for (Lesson l : list) {%>
                                <tr>
                                    <td><%=l.getClNo() %></td>
                                    <td><%=l.getCtDno() %></td>
                                    <td><%=l.getClName() %></td>
                                    <td><%=l.getEnrollDate() %></td>
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
                                    <td><%= l.getClRefuse()==null ? "" : l.getClRefuse() %></td>
                                </tr>
                                <%} %>
                             <%} %>
                            </tbody>
                        </table>
                        </div>

                    </div>

                </div>

         <div class="paging-area">
        	<%if(pi.getCurrentPage() != 1){ %>    
        		
            		<button onclick="location.href='<%=contextPath%>/myclass.tt?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
            <%} %>
			
			<%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           		 <button onclick="location.href='<%=contextPath%>/myclass.tt?cpage=<%=p%>';"><%= p %></button>
           		 
            <%} %>
          
            <%if(pi.getCurrentPage() != pi.getMaxPage()){  %>
            <button onclick="location.href='<%=contextPath%>/myclass.tt?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
            <%} %>
        	
               
        </div>
                  <%@ include file="../common/footerbar.jsp" %>
	
</body>
</html>










