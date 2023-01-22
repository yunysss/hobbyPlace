<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
     div{box-sizing:border-box;}
    .outer{width:1000px; margin:auto;}
    .content{width:100%; margin-top:5px;}

    .ttInput p{margin: 4px; color: rgb(143, 141, 141);}
    .ttInput input { width: 400px; height: 10;}
    #nameCheckBtn, #phoneCheckBtn, #submitBtn{
        background: rgb(35, 104, 116);
        color: white;
        border: 0;
        padding:5px;
        border-radius: 5px;
    }

    #submitBtn{
        float: right;
        font-size: 16px;
        width: 100px;
        border-radius: 100px;
    }

    

</style>
</head>
<body>
<%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">
<h2>튜터 등록</h2>
<hr>
<br>
<form class="ttInput">
    <h3 style="margin:0">프로필 사진</h3>
    <label>프로필 사진을 등록하지 않을 경우, 기본이미지로 저장됩니다.</label><br>
    <br><br>
    <img src="" id="tutorProfile" width="150" height="120" ><br>
    <input type="file">

    
    <h3>튜터명 <span style="color:rgb(194, 28, 28)">*</span></h3> 
    <input type="text" required placeholder="튜터명입력" id="tutorName" >


    <button type="button" id="nameCheckBtn">중복확인</button>
    <h3>휴대폰번호 <span style="color:rgb(194, 28, 28)">*</span></h3>    
    <input type="text" required placeholder="- 포함 입력" id="phone" >
    <button id="phoneCheckBtn">인증번호 전송</button>
    <p>클래스를 직접 운영하실 번호로 인증해 주세요.</p>
    
    
    <h3>이메일 <span style="color:rgb(194, 28, 28)">*</span></h3>
    <input type="text" required placeholder="이메일 입력" id="emlil" >
    <p>실제 사용하시는 이메일 주소를 입력해 주세요.<br>
    해당 메일로 공지사항 및 상품 수정 요청 등 중요 알림이 발생 됩니다.</p>
    
    <br>

    <h2>추가정보(선택)</h2>
    <hr>
    <p>지금 작성하지 않으셔도 됩니다. 추후 클래스 등록하실때 작성해 주세요.</p>
    
    <h3>공개 연락처(선택)</h3>
    <input type="text" placeholder="공개연락처를 입력해 주세요." id="publicPhone">
    <p>튜티에게 안내되는 공개 연락처 입니다. 미입력시 인증한 휴대폰 번호가 안내됩니다.</p>

    <h3>소개(선택)</h3>
    <textarea id="introduce" cols="70" rows="5" placeholder="경력, 보유자격증, 수상이력, 언론활동, 강점 등 튜터님을 소개해 주세요!" style="resize: none;"></textarea>
    <p style="color: rgb(236, 27, 27); ">개인 연락처(전화번호,카카오톡ID, 개인 SNS주소, 홈페이지 등)은 입력할 수 없습니다.)</p>
    
    <button id="submitBtn">신청</button>
</form>



</div>
<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>