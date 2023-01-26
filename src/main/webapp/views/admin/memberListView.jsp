<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.cWrap{width:1000px; padding:10px;}
	.sGroup{width:33px;}
	.searchWrap{width:90%; border:1px solid lightgray; border-radius:10px; padding:15px;}
	.fCategory, .sCategory{width:120px; height:35px; margin-left:10px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.lineup{width:120px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	#searchKey{width:250px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.sButton{width:80px; height:35px; border:0; background-color: lightgray; border-radius: 3px; margin-left:10px;}
</style>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap">
		<div class="searchArea">

			<h4>전체 회원 관리</h4>
			<br>
			<div class="searchWrap">
				<input type="radio" name="sGroup" class="sGroup" id="entire" value="entire"><label for="entire">전체</label>
				<input type="radio" name="sGroup" class="sGroup" id="tutorMem" value="tutorMem"><label for="tutorMem">튜터 등록 회원</label>
				<input type="radio" name="sGroup" class="sGroup" id="generalMem" value="generalMem"><label for="generalMem">튜터 미등록 회원</label>

				<br>
				<p>기본검색</p>
				<select name="fCategory" class="fCategory">
					<option value="enrollDate">회원가입일</option>
					<option value="memName">이름</option>
					<option value="regCount">수강횟수</option>
					<option value="revCount">리뷰</option>
					<option value="likeCount">찜</option>
					<option value="payTotal">결제금액</option>
				</select>

				<select name="lineup" class="lineup">
					<option value="desc">내림차순</option>
					<option value="asc">오름차순</option>
				</select>

				<button type="button" class="sButton" id="basicSearch">검색</button>
				<br>

				<div>
					<div>
						<p>세부검색</p>
					</div>
					<div>
						<select name="sCategory" class="sCategory">
							<option value="enrollDate">회원가입일</option>
							<option value="memName">이름</option>
							<option value="gender">성별</option>
							<option value="regCount">수강횟수</option>
							<option value="revCount">리뷰</option>
							<option value="likeCount">찜</option>
							<option value="payTotal">결제금액</option>
							<option value="memDrop">탈퇴여부</option>
							<option value="gender">성별</option>
						</select>
					
						<input type="text" name="searchKey" id="searchKey">
					
						<button type="button" class="sButton" id="detailSearch">검색</button>
						<br>
						<p>
							&nbsp; 회원가입일 선택시 입력 형식 : YYYY-MM-DD <br>
							&nbsp; 성별 선택시 입력 가능한 검색어 : M 또는 F <br>
							&nbsp; 탈퇴여부 선택시 입력 가능한 검색어 : Y 또는 N <br>
						</p>
					</div>
				</div>
					
							
				
			
			

		</div>
		<div class="contentMain">
		</div>
		
		
	</div>

</body>
</html>