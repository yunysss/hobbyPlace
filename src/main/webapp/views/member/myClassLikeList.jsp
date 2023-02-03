<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Like" %>
 <%
 	ArrayList<Like> list = (ArrayList<Like>)request.getAttribute("list");
 	int likeStatus = 0;
 	if((Member)session.getAttribute("loginUser") != null){
		likeStatus = (int)request.getAttribute("likeStatus");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    


    .classnull{
        width: 100%;
        height:300px;
        margin-top: 70px;
    }
    .classnull img{width: 100px}

    .list-area{ margin: 20px 10px;}

    .clName p{
        width: 200px;
        white-space : nowrap;
        overflow : hidden;
        text-overflow : ellipsis;
    }
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content" style="padding: 80px 40px;" >
            <!-- 찜한 클래스가 없을 때-->
            <%if(loginUser != null && list.isEmpty()) {%>
            <div class="classnull">
                <img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png" >
                <br><br>
					<p>찜한 클래스스가 없어요!</p>
            </div>
            
            <%}else{ %>
            
                <%for(int i=0; i<list.size();i++) { %>

                    <div class="list-area" width="210px" height="300px" style="display:inline-block">
                        <div class="thumbnail" >
                            <div><img src="<%=contextPath%>/<%=list.get(i).getClThumb() %>" width="200px" height="150px"></div>
                            
                            <table class="class-area">
                                <tr>
                                    <td style="font-size: small;"><%=list.get(i).getDistrName() %></td>
                                    <td align="right"><a class="disLike-Btn">❤️</a></td>
                                </tr>
                                <tr>
                                    <td class="clName"  colspan="2">
                                        <p style="font-weight: bold; width: 200px;"><%=list.get(i).getClName() %></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><%=list.get(i).getClPrice()%> </td>
                                    <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;⭐<%=list.get(i).getStarAvg() %>.0</td>
                                </tr>

                            </table>
                        </div>

                    </div><!--클래스 한개한개 닫히는 div-->
                    <script>
                    $(function(){
                    	$(".disLike-Btn").click(function(){
                    		if($(this).text().includes("❤️")){
                    			$.ajax({
                    				url:"<%=contextPath%>/classDislike.tee",
                    				data:{
                    					clNo:<%=list.get(i).getClNo()%>,
                    					memNo:<%=loginUser.getMemNo()%>
                    				},
                    				success:function(list){
                    					$(".list-area").delete();
                    				}
                    					
                    				}
                    			})
                    		}
                    	})
                    })
                    
                    
                    
                    
                    </script>

                <%} %>
            <%} %>
           


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>