<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	div{box-sizing:border-box;}
	/*div{border:solid 1px black;}*/
	.cWrap{width:100%; padding:10px; padding-right:0;}
	.searchWrap{width:90%; border:1px solid lightgray; border-radius:10px; padding:15px; padding-left:40px;}

	.dtPicker{height:35px; width:140px; border-radius:3px; border-color:rgb(186, 185, 185);}
	.fCategory{width:165px; height:35px; margin-left:10px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.lineup{width:100px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.sButton{width:80px; height:35px; border:0; background-color: lightgray; border-radius: 3px; margin-left:10px;}
	#basicSearch{margin-left:20px;}

	#option1{width:100px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	#searchKey{width:250px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.optionWrap1, .optionWrap2{padding:0px 15px 15px 15px; border-radius:5px;}
	.option1Detail, .option2Detail{margin-left:85px; display:none;}

	#option2{width:120px; height:35px; border-radius: 3px; border-color:rgb(186, 185, 185);}
	.detailNum{width:80px; height:35px; border-radius:3px; margin-left:10px; border-color:rgb(186, 185, 185);}
	#detailSearch2{margin-left:140px;}

	#option1Show:hover, #option2Show:hover{cursor:pointer;}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="cWrap">
		<div class="searchArea">
			
			<h4 align="left">튜터 관리</h4>
			<br>
			<div class="searchWrap" align="left">
				<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				튜터등록일 &nbsp;&nbsp;
				<input type="text" class="dtPicker" id="datepicker1" name="enroll-start">
				- 
				<input type="text" class="dtPicker" id="datepicker2" name="enroll-end">

			    <br><br>

			   기본검색 &nbsp;&nbsp;&nbsp;
			   <select name="fCategory" class="fCategory">
					<option value="">운영중인 클래스수</option>
					<option value="">누적클래스수</option>
					<option value="">누적튜티수</option>
					<option value="">누적수업횟수</option>
					<option value="">총수입</option>
			   </select>
			   <select name="lineup" class="lineup">
					<option name="desc">내림차순</option>
					<option name="asc">오름차순</option>
			   </select>
			   <button type="button" class="sButton" id="basicSearch">검색</button>
			   
			   <br><br>

			   <div class="optionWrap1">
					<p id="option1Show">검색옵션1 >></p>
					<br>
					<div class="option1Detail">
						<select name="option1" id="option1">
							<option value="tutorName">튜터명</option>
							<option value="tutorId">아이디</option>
						</select>
						<input type="text" name="searchKey" id="searchKey">
						<button type="button" class="sButton" id="detailSearch1">검색</button>
					</div>
				</div>
				
				<div class="optionWrap2">
					<p id="option2Show">검색옵션2 >></p>
					<br>
					<div class="option2Detail">
						<select name="option2" id="option2">
							<option value="countIncome">총수익</option>
							<option value="countLesson">누적수업횟수</option>
							<option value="countTutee">튜티수</option>
						</select>
						<input type="text" name="startNum" class="detailNum" id="startNum"> 이상 
						
						<input type="text" name="endNum" class="detailNum" id="endNum"> 이하 (숫자만 입력)
						<br><br>
						기간&nbsp; : &nbsp; &nbsp;
						<input type="text" class="dtPicker" id="datepicker3" name="enroll-start"> 부터&nbsp;&nbsp;
						 
						<input type="text" class="dtPicker" id="datepicker4" name="enroll-end"> 까지
						<br><br>
						<button type="button" class="sButton" id="detailSearch2">검색</button>
					</div>
				</div>
				

				

			</div>

		</div>
	
		<script>
			$(function(){
				$("#option1Show").click(function(){
					if($(".option1Detail").css("display")=="none"){
						$(this).css("font-weight", "600");
						$(".option1Detail").show();
						$(".option2Detail").hide();
						$("#basicSearch").hide();
						$(".optionWrap1").css("background-color", "rgb(235, 240, 240)").css("width", "80%").css("padding-bottom", "20px");
						$(".optionWrap2").css("background-color", "white").css("padding-bottom", "15px");
						$("#option2Show").css("font-weight", "400");
					}else{
						$("#option1Show").css("font-weight", "400");
						$(".option1Detail").css("display", "none");
						$("#basicSearch").show();
						$(".optionWrap1").css("background-color", "white").css("padding-bottom", "15px");
					}	
				});

				$("#option2Show").click(function(){
					if($(".option2Detail").css("display")=="none"){
						$(this).css("font-weight", "600");
						$(".option2Detail").show();
						$(".option1Detail").hide();
						$("#basicSearch").hide();
						$(".optionWrap2").css("background-color", "rgb(235, 240, 240)").css("width", "80%").css("padding-bottom", "20px");
						$(".optionWrap1").css("background-color", "white").css("padding-bottom", "15px");
						$("#option1Show").css("font-weight", "400");
					}else{
						$("#option2Show").css("font-weight", "400");
						$(".option2Detail").css("display", "none");
						$("#basicSearch").show();
						$(".optionWrap2").css("background-color", "white").css("padding-bottom", "15px");
					}	
				})

			})
		</script>	
		<script>
			$(function() {
				//모든 datepicker에 대한 공통 옵션 설정
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd' //Input Display Format 변경
					,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
					,changeYear: true //콤보박스에서 년 선택 가능
					,changeMonth: true //콤보박스에서 월 선택 가능                
					//,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					//,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					//,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
					,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
					,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
					,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
					,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,maxDate: "TODAY" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				});
	
				//input을 datepicker로 선언
				$("#datepicker1").datepicker();                    
				$("#datepicker2").datepicker();
				$("#datepicker3").datepicker();                    
				$("#datepicker4").datepicker();
				
				//From의 초기값을 오늘 날짜로 설정
				$('#datepicker1').datepicker('setDate', '-1Y'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				$('#datepicker3').datepicker('setDate', '-1Y'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				//To의 초기값을 내일로 설정
				$('#datepicker2').datepicker('setDate', 'TODAY'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				$('#datepicker4').datepicker('setDate', 'TODAY');
			});
		</script>
		
		<div class="contentMain">

			<div class="container mt-3 table-responsive-xxl" style="overflow-x: auto;">
				<table class="table table-hover table-responsive-xxl listTable" style="table-layout:fixed;">
				<colgroup>
					<col style="width:100px;">
					<col style="width:100px;">
					<col style="width:120px;">
					<col style="width:120px;">
					<col style="width:100px;">
					<col style="width:80px;">
					<col style="width:80px;">
					<col style="width:130px;">
					<col style="width:170px;">
					<col style="width:150px;">
					<col style="width:230px;">
					<col style="width:80px;">
				</colgroup>
				<thead>
					<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>튜터명</th>
					<th>현재 클래스수</th>
					<th>누적 클래스수</th>
					<th>누적 수업 횟수</th>
					<th>누적 튜티수</th>
					<th>찜</th>
					<th>후기</th>
					<th>총수익</th>
					<th>주소</th>
					</tr>
				</thead>
				<tbody  class="table-group-divider">
					<tr>
					<td>01</td>
					<td>홍길동</td>
					<td>N</td>
					<td>2022-12-15</td>
					<td>10</td>
					<td>5</td>
					<td>15</td>
					<td>218600</td>
					<td>john@example.com</td>
					<td>010-1111-9999</td>
					<td>서울시 양천구 목1동 XXXX-XXXX</td>
					<td>남</td>
					<td>X</td>
					</tr>
					
				</tbody>
				</table>
			</div>


		</div>


	</div>
</body>
</html>