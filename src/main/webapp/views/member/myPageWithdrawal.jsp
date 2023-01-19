<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hobby Place</title>
<style>
        /*div{border:1px solid black;}*/
        div{box-sizing:border-box;}
       
        .content{width:80%; float:left; margin-top:5px;}

        .contentMain>h2{margin-left:100px;}
        .explainForm{
            margin-left:100px;
            width:600px;
            background-color: lightgray;
            border:0;
            padding:30px 20px 30px 20px;
        }
        .explainForm>table td{padding-left:15px;}
        .checkAgreement{width:600px; margin-left:100px; margin-top:5px; padding-left:5px;}
        .checkAgreement>table th{width:100px; text-align:left;}
        .tr1{height:30px;}
        .tr1>td{font-size:15px;}

        .leaveButton{
            height:25px; width:120px; 
            color:white; background-color:gray; 
            border:0; border-radius:5px; 
            margin-top:30px;
            margin-left:200px;
        }
        .leaveButton:hover{cursor: pointer;}

    </style>
</head>
<body>
	<%@ include file = "../common/myPageMenubar.jsp" %>
	<div class="contentMain" align="center">

        <br><br><br>

        <h2>정말 떠나시겠어요?</h2>

        <div class="explainForm" align="center">
            <table>
                <tr>
                    <th>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                    </th>
                    <td>
                        지금 탈퇴하시면 수강 예정이거나 현재 수강 중인 수업을 더 이상 이용하실 수 없게 돼요!
                    </td>
                </tr>
                <tr>
                    <th></th><td>&nbsp; </td>
                </tr>
                <tr>
                    <th>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                    </th>
                    <td>
                        지금 탈퇴하시면 보유하신 쿠폰과 포인트도 함께 사라져요. <br>
                        추후에 동일 계정으로 재가입하셔도 쿠폰과 포인트 내역은 복구되지 않아요!
                    </td>
                </tr>
                <tr>
                    <th></th><td>&nbsp; </td>
                </tr>
                <tr>
                    <th>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                    </svg>
                    </th>
                    <td>
                        탈퇴 후에는 작성하신 리뷰를 수정 혹은 삭제하실 수 없어요. <br>
                        탈퇴 신청 전에 꼭 확인해 주세요! 
                    </td>
                </tr>
            </table>
        </div>
        <form action="">
            <div class="checkAgreement" align="left">
                <input type="checkbox" id="agreeAll" required> <label for="agreeAll">회원탈퇴 유의사항을 모두 확인하였으며 동의합니다.</label>
                
                <br>
                <br>
                <br>
            
                <table>
                    <tr class="tr1">
                    <th>
                            &nbsp;아이디
                    </th>
                    <td>
                            userId
                    </td> 
                    </tr>
                    <tr>
                        <th>
                            &nbsp;탈퇴사유
                        </th>
                        <td rowspan="10">
                            <textarea name="" id="" cols="50" rows="10" style=resize:none></textarea>
                        </td> 
                    </tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>
                    <tr><th></th></tr>          
                </table>

                <button type="submit" class="leaveButton">탈퇴 신청</button>
                <br><br><br><br>
            </div>
        </form>
            
        
    </div>

</body>
</html>