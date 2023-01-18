<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{box-sizing:border-box;}

        .outer{width:1000px; margin:auto; padding:20px 50px;}
        #rsvApproval{width:800px; margin:auto;}
        #rsvApproval>div, #rsvListAll>div{padding:20px;}
        #rsvApproval button{
            border:none;
            border-radius:3px;
            margin-left:20px;
            height:40px;
            width:120px;
        }
        #rsvListAll{
            overflow: auto;
            height:500px;
        }

        .rsvList{
            border:1px solid rgb(180, 180, 180); 
            border-radius:5px;
            height:150px;
            cursor: pointer;
        }
        .rsvList>div{float:left; height:100%; width:50%}
        .rsvList span{
            color:white;
            border-radius:15px;
            display: inline-block;
            height:30px;
            width:80px;
            text-align:center;
            font-size: 12px;
            line-height: 28px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/tutorMenubar.jsp" %>
    <div class="outer">
        <h5><b>예약 승인</b></h5><br>
        <div id="rsvApproval">
            신규 <b>1건</b>
            <div align="center">
                <button>전체</button>
                <button>NEW</button>
                <button>승인완료</button>
                <button>신청반려</button>
            </div>
            <div id="rsvListAll">
                <div class="rsvList">
                    <div>
                        2023-01-20 16:40:45 <br>
                        김개똥 수강생 <br>
                        <h5>제빵왕 원데이클래스</h5> <br>
                        진행일시 : 2023-01-25 14:00 - 16:00
                    </div>
                    <div align="right">
                        <span style="background:rgb(241, 196, 15);"><b>NEW</b></span>
                    </div>
                </div>
                <br>

                <div class="rsvList">
                    <div>
                        2023-01-20 16:40:45 <br>
                        김개똥 수강생 <br>
                        <h5>제빵왕 원데이클래스</h5> <br>
                        진행일시 : 2023-01-25 14:00 - 16:00
                    </div>
                    <div align="right">
                        <span style="background:rgb(22, 160, 133);"><b>승인완료</b></span>
                    </div>
                </div>
                <br>

                <div class="rsvList">
                    <div>
                        2023-01-20 16:40:45 <br>
                        김개똥 수강생 <br>
                        <h5>제빵왕 원데이클래스</h5> <br>
                        진행일시 : 2023-01-25 14:00 - 16:00
                    </div>
                    <div align="right">
                        <span style="background:rgb(180, 180, 180)"><b>신청반려</b></span>
                    </div>
                </div>
                <br>
            </div>
            
        </div>
    </div>
    <!-- The Modal1 -->
    <div class="modal" id="myModal1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body">
                    <h5 class="modal-title"><b>예약 승인 상세</b></h5><br>
                    2023-01-20 16:40:45 <br>
                    <h5>제빵왕 원데이클래스</h5> <br>
                    수강생 : 김개똥 <br>
                    휴대폰 : 010-2345-6789 <br>
                    이메일 : gaeddong@naver.com <br><br>
                    2023-01-25 14:00 - 16:00 <br>
                    신청인원 : 1명 <br>
                    수강료 : 33,000원 <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-secondary btn-sm" id="reject-btn">신청반려</button>
                        <button type="button" class="btn btn-sm" id="approval-btn" style="background:rgb(22, 160, 133); color:white;">예약승인</button>
                    </div>
            	</div>  
        	</div>
    	</div>
   	</div>

    <!-- The Modal2 (신청반려) -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    <b>수강 신청 반려하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
            </div>  
        </div>
    </div>

    <!-- The Modal3 (신청승인) -->
    <div class="modal" id="myModal3">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
  
                <div class="modal-body" align="center">
                    수강 신청 내역 승인하시겠습니까?</b> <br><br>
                    <button type="button" class="btn btn-sm" style="background:rgb(22, 160, 133); color:white;" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                    
                </div>
            </div>  
        </div>
    </div>

    <script>
        $(function(){
            $(".rsvList").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal1");
            })

            $("#reject-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal2");
            })

            $("#approval-btn").click(function(){
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-target", "#myModal3");
            })

        })
        
    </script>
</body>
</html>