<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.hp.lesson.model.vo.Lesson"%>
<%
	ArrayList<Lesson> list = (ArrayList<Lesson>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	div{box-sizing:border-box;}
	.cWrap{width:1000px; margin:auto;}
	.content{width:80%; float:left; margin-top:5px; padding-top:100px; margin-left:200px;}
	.mpMenubar{
	   	width:200px; padding-top:15px;float:left;
	   	position:fixed; top:130px; background: white;
	}
	   
	.categoryMain {
        width:90%;
        height:50px;
        font-size:13px;
        margin:auto;
        margin-bottom:5px;
        line-height:50px;
        border:1px solid; border-color: rgb(35, 104, 116);  
        color:rgb(64, 64, 64);
        background-color: white;
        border-radius:5px;
        font-size: 14px;
    }
    .categoryMain:hover{
        cursor: pointer;
    }
    #viewMyQna{color:white; background-color:rgb(35, 104, 116); font-weight:bolder;}
    #insertMyQna{color:black; font-weight: bolder;}
    .mpMenubar ul{
        color:rgb(64, 64, 64);
        list-style-type:none;
        line-height:2;
        text-align:left;
        //display:none;
        padding-bottom:3px;
    }
    .mpMenubar li:hover{
        cursor: pointer;
        color:black;
        font-weight: bolder;
    }
    .pageRoute{  
    position:fixed;
    top:120px;
    width:800px;
    background:white;
    padding-top:20px;
    }
    #home {width:20px; height:20px; vertical-align: text-bottom;}
    #home:hover{cursor:pointer;}
    .outer{
            width: 800px;
            margin: auto;
           
        }
</style>
</head>
<body>
	<%@ include file="../common/tuteeMenubar.jsp" %>
	<div class="cWrap">
        <div class="mpMenubar">
            <h3 align="center">마이페이지</h3>
			<br><br>
			
			<div class="categoryWrap">
				<div class="categoryMain" align="center" id="viewMyInfo">회원정보 조회 및 수정</div>

			</div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyQna">나의 문의 조회</div>
	            <ul class="categoryDetail qna">
	                <li id="selectMyQna" onclick="">나의 문의 내역</li>
	                <li id="insertMyQna" onclick="">문의하기</li>
	            </ul>
            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="viewMyClass">마이클래스</div>

            </div>
            <div class="categoryWrap">
	            <div class="categoryMain" align="center" id="withdrawal">회원탈퇴</div>

            </div>
            
        </div>
        <script>
            $(function(){
                $("#viewMyInfo").click(function(){
                    //회원정보 조회 및 수정 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/memberInfo.me";
                })
                $("#selectMyQna").click(function(){
                    // 나의 문의 조회시 이동할 페이지링크(나의문의내역으로)
                    location.href = "<%=contextPath%>/qnaList.tee";
                })
                $("#insertMyQna").click(function(){
                    // 나의 문의 조회>> 문의하기 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/qnaEnroll.tee";
                })
                $("#viewMyClass").click(function(){
                    //마이클래스 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/myClass.tt";
                })
                $("#withdrawal").click(function(){
                    // 회원탈퇴 클릭시 이동할 페이지링크
                    location.href = "<%=contextPath%>/withdrawal.me";
                })

            })
        </script>
		<script>
	       $(function(){
	    	   $(".categoryWrap").mouseover(function(){
                    $(this).siblings().children("div").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal"); 
	                $(this).children("div").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $(this).siblings().children("ul").children("li").css("font-weight", "normal");
	            })          
	            $(".categoryWrap").mouseleave(function(){
	            	$(".categoryMain").css("color", "rgb(64, 64, 64)").css("background-color", "white").css("font-weight", "normal");
	                $("#viewMyQna").css("color", "white").css("background-color", "rgb(35, 104, 116)").css("font-weight", "bolder");
                    $("#insertMyQna").css("font-weight", "bolder");
	            })
	            $("li").mouseover(function(){
                    $(this).css("font-weight", "bolder");
                    $(this).siblings().css("font-weight", "normal");

                })

	       })
 		</script>

        <div class="content">
            <div class="pageRoute">
                &nbsp;  <svg xmlns="http://www.w3.org/2000/svg" id="home"  width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                  </svg>
                > <a class="contentA" href="<%=contextPath%>/myPageMain.me">마이페이지</a>
                > 나의 문의 조회 > 문의하기
                <hr>
            </div>
            <script>
	        	$(function(){
	        		$("#home").click(function(){
	        			location.href="<%=contextPath%>/main.tee"
	        		})
	        	})
	        </script>
            <div class="contentMain" >
                
         <div class="outer">

        <div>
            <a href="" style="color: black; font-size: large; font-weight: 800;" >
                문의하기</a>
        </div>

        <br>

        <form action="<%=contextPath %>/insertQna.tee" method="post">
            <input type="hidden" name="no" value="<%=loginUser.getMemNo()%>">
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; text-align: center;">
                        제목
                    </th>
                    <td >
                        <input type="text" name="title" style="width: 600px; height: 50px;resize: none; border-color: lightgray;" required placeholder="제목을 입력하세요.">
                    </td>
                </tr>
        
            </table>
            <br>
            <table>
                <tr>
                    <th style="background-color: lightgray; width: 100px; height: 50px; text-align: center;">분류</th>
                    <td>
                    <select name="questType" id="select1" onChange="chnQnaType(this.value)" style="border-color: lightgray; width: 300px; height: 50px;" >
					    <option value="0">관리자</option>
					    <option value="2">튜터</option>
					    
					</select>    
					<select id="schQnaType" name="schQnaType"   style="border-color: lightgray; width: 300px; height: 50px; display:none;" >
					</select>
                     
                    </td>
                    
                </tr>
            </table>

            <script>
           
	            $(function(){
	                
	                // 질문유형을 선택한다.
	                chnQnaType('1' , '11');
	            });
	
	            function chnQnaType(type , select) {
	                
	                $('#schQnaType').empty();
	                
	                if(type == '0') { // 관리자
	                    $('#schQnaType').append("<option value='10' >튜터</option>'");
	                    $('#schQnaType').append("<option value='20' >결제/환불</option>'");
	                    $('#schQnaType').append("<option value='40' >기타</option>'");
	                } else if (type == '2') {  // 튜터
	                	<%for(Lesson l : list){%>
	                    $('#schQnaType').append("<option value='<%=l.getClNo()%>' ><%=l.getClName()%></option>'");
	                    <%}%>
	                } 
	                document.getElementById("schQnaType").style.display = "";
	                
	                if ($.trim(select) != "") {
	                    $('#select1').val(type);
	                    $('#schQnaType').val(select);
	                }
	            }
            </script>

            <br>
            <table>
                <tr>
                    <td><textarea name="content" rows="10" required style="resize:none; width:800px; height: 500px; border-color: lightgray;"  ></textarea></td>
                </tr>

            </table>
            <br>

            <button type="reset" style="background-color:lightgray; border:none; width: 120px; height: 50px; ">취소</button>
            <button type="submit" style="background-color:rgb(35, 104, 116); color:white; border:none; width: 120px; height: 50px; float:right">등록하기</button>

        </form>

        





    </div>
                
                
            </div>
        </div>
    </div>
    <br clear="both">
    <%@ include file = "../common/footerbar.jsp" %>
</body>
</html>