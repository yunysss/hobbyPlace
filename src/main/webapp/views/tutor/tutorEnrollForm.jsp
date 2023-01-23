<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
     div{box-sizing:border-box;}

    .outer{width:1000px; margin:auto; padding:4%}
    .content{width:100%; margin-top:5px;}

    .ttInput p{margin: 4px; color: rgb(143, 141, 141); font-size: 12px;}
    .ttInput input { width: 400px; height: 10;}
    #nameCheckBtn, #phoneCheckBtn, #submitBtn , #modalSubmit{
        background: rgb(35, 104, 116);
        color: white;
        border: 0;
        padding:5px;
        border-radius: 5px;
    }

    #submitBtn , #modalSubmit{
        float: right;
        font-size: 16px;
        width: 100px;
        border-radius: 100px;
    }

    #tutorProfile {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        overflow: hidden;

    }
   
    

</style>
</head>
<body>
<%@ include file="../common/tuteeMenubar.jsp" %>

<div class="outer">
<h4 style="font-weight: bold;">튜터 등록</h4>
<hr>
<br>
<form class="ttInput">
    <h6 style="font-weight: bold">프로필 사진</h6>
    <label>프로필 사진을 등록하지 않을 경우, 기본이미지로 저장됩니다.</label><br>
    <br><br>
    <img src="<%=request.getContextPath()%>/resources/tutorProfile_upfiles/defaultimg.jpg" id="tutorProfile" >
    <br><br>
    <input type="file">
    <br>
    <br>
    <h6 style="font-weight: bold;">튜터명 <span style="color:rgb(194, 28, 28)">*</span></h6> 
    <input type="text" required placeholder="튜터명입력" id="tutorName" >
    <button type="button" id="nameCheckBtn" >중복확인</button>
    <br>
    <br>
    <h6 style="font-weight: bold;">휴대폰번호 <span style="color:rgb(194, 28, 28)">*</span></h6>    
    <input type="text" required placeholder="- 포함 입력" id="phone" >
    <button id="phoneCheckBtn" data-toggle="modal" data-target="#myModal">인증번호 전송</button>
    <p>클래스를 직접 운영하실 번호로 인증해 주세요.</p>
    <br>
    <br>
    
    <h6 style="font-weight: bold;">이메일 <span style="color:rgb(194, 28, 28)">*</span></h6>
    <input type="text" required placeholder="이메일 입력" id="emlil" >
    <p>실제 사용하시는 이메일 주소를 입력해 주세요.<br>
    해당 메일로 공지사항 및 상품 수정 요청 등 중요 알림이 발생 됩니다.</p>
    
    <br>
    <br>

    <h4 style="font-weight: bold;">추가정보(선택)</h4>
    <hr>
    <p>지금 작성하지 않으셔도 됩니다. 추후 클래스 등록하실때 작성해 주세요.</p>
    <br>
    <h6 style="font-weight: bold;">공개 연락처(선택)</h6>
    <input type="text" placeholder="공개연락처를 입력해 주세요." id="publicPhone">
    <p>튜티에게 안내되는 공개 연락처 입니다. 미입력시 인증한 휴대폰 번호가 안내됩니다.</p>
    <br><br>
    <h6 style="font-weight: bold;">소개(선택)</h6>
    <textarea id="introduce" cols="70" rows="5" placeholder="경력, 보유자격증, 수상이력, 언론활동, 강점 등 튜터님을 소개해 주세요!" style="resize: none;"></textarea>
    <p style="color: rgb(236, 27, 27); ">개인 연락처(전화번호,카카오톡ID, 개인 SNS주소, 홈페이지 등)은 입력할 수 없습니다.)</p>
    <br><br>
    <button id="submitBtn">신청</button>
</form>

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align: center; font-size: 15px; font-weight: bold;">인증번호를 입력하세요.</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="text-align: center;">
          <form action="" method="post"></form>
              <span id="timer"></span>
              <br>
              <input type="text" name="certification_num" id="certification_num">
              <br>
              <input type="submit" id="modalSubmit" value="인증하기">
	        </form>
        
        </div>
      </div>
    </div>
  </div>
  
</div>


  



</div>
<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>