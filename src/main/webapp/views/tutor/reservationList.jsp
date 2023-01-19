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

        #select-area{
            margin: auto;
            width: 50px;
            background: rgb(22, 160, 133);

        }

        #select-area a{color: white; text-decoration: none;}

        .paging-area{text-align: center;}
        .paging-area button {width: 25px; height: 23px;}
        


    </style>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">    
        <h5><b>예약 관리</b></h5>
        <br>
        
        <!-- 수강전 버튼을 눌렀을때
        <div class="btn_area">
            <button type="button" id="click_btn" >수강전</button>
            <button type="button"> 수강완료</button>
        </div>


        <div class="tb_box">
            <table border="1px" style="text-align: center;">
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

                 수강 전 클래스가 없을 경우
                <tr>
                        <td colspan="7" height="30px">
                            수강 전 클래스가 없습니다.
                        </td>
                </tr>
                수강 전 클래스가 있을 경우
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
        </div> -->

        <!--수강후기 버튼을 눌렀을때-->
        <div class="btn_area">
            <button type="button" >수강전</button>
            <button type="button" id="click_btn" >수강완료</button>
        </div>


        <div class="tb_box">
            <table border="1px" style="text-align: center;">
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
                        <div id="select-area"><a href=""> 조회</a></div>
                    </td>
                </tr>
                <tr>
                    <td height="25px">수강완료</td>
                    <td>김말똥</td>
                    <td>010-2222-3333</td>
                    <td>하루만에 뚝딱 귀도리</td>
                    <td>23.01.03 17:00</td>
                    <td>2명</td>
                    <td>
                        <div id="select-area"><a href=""> 조회</a></div>
                    </td>
                </tr>
                <tr>
                    <td height="25px">수강완료</td>
                    <td>김말똥</td>
                    <td>010-2222-3333</td>
                    <td>하루만에 뚝딱 귀도리</td>
                    <td>23.01.03 17:00</td>
                    <td>2명</td>
                    <td>
                        <div id="select-area"><a href=""> 조회</a></div>
                    </td>
                </tr>
                <tr>
                    <td height="25px">수강완료</td>
                    <td>김말똥</td>
                    <td>010-2222-3333</td>
                    <td>하루만에 뚝딱 귀도리</td>
                    <td>23.01.03 17:00</td>
                    <td>2명</td>
                    <td>
                        <div id="select-area"><a href=""> 조회</a></div>
                    </td>
                </tr>
                <tr>
                    <td height="25px">수강완료</td>
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
        </div> 


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
    </div>
</body>
</html>