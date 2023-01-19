<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
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
            height: 110%;
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
                <form action="">
                    <div id="status_area">
                        <select id="status" name="class_status">
                            <option value="">수강전</option>
                            <option value="">수강완료</option>
                            <option value="">수강취소</option>
                        </select>
                    </div>
                    <table>
                        <tr>
                            <th colspan="3" width="550px"><h4 style="font-weight: bold;">하루만에 뚝딱 귀도리</h4></th>
                            <th colspan="2" width="300px">23년 01월 03일 17:00~20:00</th>
                        </tr>

                        <tr>
                            <td height="30px" colspan="5"></td>
                        </tr>
                        
                        <tr>
                            <th>튜티명</th>
                            <td>김말똥</td>
                            <th>신청 인원</th>
                            <td>2명</td>
                        </tr>
                        
                        <tr>
                            <th>휴대폰 번호</th>
                            <td>010-2222-3333</td>
                            <th>수강료</th>
                            <td>45,000*2=90,000</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="4">kmd@naver.com</td>
                        </tr>

                    </table>

                    <textarea name="" id="memo" cols="30" rows="10"></textarea>

                    <div id="btn_area">
                        <button type="button" class="btn btn-secondary" style="height: 30px; line-height: 10px;">저장</button>
                    </div>
                    
                </form>
                
            </div>
            
            
        </div>
    </div>
</body>
</html>