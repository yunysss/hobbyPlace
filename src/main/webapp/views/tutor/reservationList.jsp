<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <style>
        

        div{margin: auto;}
        
        .outer{
            width: 1000px; 
            height: 100vh;
            margin: auto;
            padding:25px;
        }

        .btn_area{
            text-align: right;
            width: 85%;
        }

        .btn_area button{
            width: 70px; 
            height: 30px;
            border:0;
            background:rgb(218, 217, 217);
            border-radius:3px;
        }
        
        #click_btn{
            background: rgb(22, 160, 133); 
            color: white;
        }
        .tb_box{
            height: 40%;
            width: 100%;
        }
        table{
            margin: auto;
            border: 1px solid rgb(99, 99, 99);
            border-collapse: collapse;
        }
		th{background:rgb(243, 240, 240);}
        #select-area{
            margin: auto;
            width: 50px;
            background: rgb(22, 160, 133);

        }

        #select-area a{color: white; text-decoration: none;}

        .paging-area{text-align: center;}
        .paging-area button {width: 25px; height: 23px;}
        
        #bfBtn{
		    background: rgb(22, 160, 133); 
            color: white;
		}
		#af-classList{display:none;}


    </style>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">   
        <h5><b>예약 관리</b></h5>
        <br>
        
        
        
        <div class="btn_area">
            <button type="button" id="bfBtn" onclick="bfBtn()" >수강전</button>
            <button type="button" id="afBtn" onclick="atBtn()"> 수강완료</button>
        </div>

        <!-- 수강전 버튼을 눌렀을때-->
        <div class="tb_box classList" id="bf-classList"> 
        	<table class="table-bordered" style="text-align: center;">
		        <br>
		        <tr>
		            <th width="70px" height="25px">상태</th>
		            <th width="60px">튜티명</th>
		            <th width="125px">전화번호</th>
		            <th width="350px">예약 클래스</th>
		            <th width="100px">예약 날짜</th>
		            <th width="45px">인원</th>
		            <th width="100px">상세조회</th>
		        </tr>
		
		         <!-- 수강 전 클래스가 없을 경우 -->
		        <tr>
		                <td colspan="7" height="30px">
		                    수강 전 클래스가 없습니다.
		                </td>
		        </tr>
		        <!-- 수강 전 클래스가 있을 경우 -->
		        <tr>
		            <td height="25px">수강전</td>
		            <td>김말똥</td>
		            <td>010-2222-3333</td>
		            <td>하루만에 뚝딱 귀도리</td>
		            <td>23.01.03 17:00</td>
		            <td>2명</td>
		            <td>
		                <div id="select-area"><a href=""> 조회</a></div>
		            </td>
		        </tr>
		        
		    </table>
            <br><br>
            <!--페이징 부분-->
            <div class="paging-area">
                <button>&lt;</button>

                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
            </div>
        </div>
        
        <script>
        function bfList(){
        	const bfClassList = document.getElementById("bf-classList")
        }
        
        </script> 
                
        <!--수강완료 버튼을 눌렀을때-->
        <div class="tb_box classList" id="af-classList">
            <table class="table-bordered" style="text-align: center;">
                <br>
                <tr>
                    <th width="70px" height="25px">상태</th>
                    <th width="60px">튜티명</th>
                    <th width="125px">전화번호</th>
                    <th width="350px">수강 클래스</th>
                    <th width="100px">수강 날짜</th>
                    <th width="45px">인원</th>
                    <th width="100px">상세조회</th>
                </tr>

                 <!--수강완료 클래스가 없을 경우-->
                <tr>
                        <td colspan="7" height="30px">
                            수강 완료 클래스가 없습니다.
                        </td>
                </tr>

                <!--수강 완료 클래스가 있을 경우-->
                <tr>
                    <td height="25px">수강완료</td>
                    <td>김말똥</td>
                    <td>010-2222-3333</td>
                    <td>하루만에 뚝딱 귀도리</td>
                    <td>23.01.03 17:00</td>
                    <td>2명</td>
                    <td>
                        <div id="select-area"><a href="<%=contextPath %>/reservationDetail.tt"> 조회</a></div>
                    </td>
                </tr>
               
            </table>
            
            <br><br>
            
            <!--페이징 부분-->
            <div class="paging-area">
                <button>&lt;</button>

                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
            </div>

        </div> 
		
		<script>
			$(function(){
				$("#afBtn").click(function(){ // 수강완료버튼클릭시
                    //버튼 스타일 변화
					$(this).css("background-color", "rgb(22, 160, 133)").css("color", "white");
	            	$("#bfBtn").css("background-color", "rgb(218, 217, 217)").css("color", "black");

                    // div display 변화
                    $("#bf-classList").hide();
                    $("#af-classList").show();
				});

                $("#bfBtn").click(function(){ // 수강전버튼 클릭시
                    //버튼 스타일 변화
                    $(this).css("background-color", "rgb(22, 160, 133)").css("color", "white");
	            	$("#afBtn").css("background-color", "rgb(218, 217, 217)").css("color", "black");

                    // div display 변화
                    $("#af-classList").hide();
                    $("#bf-classList").show();
                })

			})
		</script>
		
		<script>
			function bfBtn(){
				$.ajax({
					url:"<%=contextPath%>/resList.tt",
					data:{ttNo:<%=loginUser%>},
					susccess:function(list){
						console.log(list);
					}, 
					error:function(){
						console.log("ajax 통신 실패")	
					}
				})
			}
			
		
		</script>



        </div>
    </div>
</body>
</html>