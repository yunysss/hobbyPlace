<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #refundNull{
		text-align: center;
		margin-top: 71px;
	}
	#refundNull img{
		width: 65px;
	}
    #classList{
		margin-top: 71px;
	}
	#classContent p {margin-top: 5px; margin-left:18px; margin-bottom: 0;}
	#classContent{
		width: 80%;
		height: 300px;
		margin: auto;
		border: 1px solid lightgray;
		border-radius: 5px;

	}
	
	#classContent img {
		width: 200px;
		height: 200px;
		padding: 10px;
	}

	#classThumbnail{
		text-align: center;
		width: 200px;
		float: left;
		margin:5px;
	}
	#classDetail{
		width: 400px;
		float: left;
		margin: 5px;;
		
	}
	#classStatusAp{
		margin: 10px;
		background-color: rgb(178, 41, 41);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}

	#classStatusX{
		margin: 10px;
		background-color: rgb(180, 186, 185);
		color: white;
		border-radius: 5px;
		font-size: 13px;
		width: 75px;
		height: 23px;
		text-align: center;
	}
	table{width: 90%; margin-top: 16px; }

	thead td{font-size: 12px; color: gray;}

	#classTitle{
		font-weight: bold;
		font-size: 20px;
		height: 43px;
	}
	tfoot button{
		width: 150px;
		height: 35px;
		margin: 12px;
		border-radius: 5px;
		border: 0;
	}

	#btn1{background: rgb(35, 104, 116); color:white;}

	.modalTB { width: 420px; margin: 0;}
	#payment1 {text-align: right; font-size: 10px;}
	#payment2 {text-align: right;}
	#detailLine{
		background: lightgray; 
		text-align: center; 
		font-weight: bold; 
		font-size: small;
	}
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
			
		<div class="content">

			<!-- 환불한 클래스가 없을때-->
			<!--
			<div id="refundNull">
				<img src="<%=contextPath%>/resources/images/refunPage_smile_icon.png" alt="">
                <br>
                <br>
				<p>환불한 클래스가 없습니다.</p>
			</div>
            -->
            <!--취소한 클래스가 있을 때-->
            <!--환불 접수 접수 -->
			<div id="classList">
				<div id="class-area">
										
					<div id="classContent">
						<p>2023-01-03 취소</p>
						<div id="classThumbnail">
							<img src="<%=contextPath%>/resources/classThumbnail_upfiles/sjLesson01.jpg" alt=""> <!--클래스썸네일대표사진-->
							<br>
							<p>강보람<br>튜터</p>
						</div>
						<div id="classDetail">
							<table  border="0" margin-right: 0;>
								<thead>
									<tr>
										<td >주문번호</td>
										<td colspan="3">B3425R23</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" id="classTitle">가장 쉽게 배우는 JAVA</td>
									</tr>
									<tr>
										<td colspan="4">사당 / 2023-01-07(토) 17:00</td>
									</tr>
									<tr>
										<td height="50px"><div id="classStatusAp">환불 접수</div></td>
										<td colspan="3"></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4"><button id="btn2" onclick="" data-toggle="modal" data-target="#myModal">환불 상세 내역</button></td>
									</tr>
								</tfoot>	
							</table>
						</div>

					</div>
				</div>
			</div>



</body>
</html>