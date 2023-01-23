<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#classnull{
		text-align: center;
		margin-top: 71px;
	}
	#classnull img{
		width: 100px;
	}

</style>
</head>
<body>
	<%@ include file = "../common/myClassMenubar.jsp" %>
			
		<div class="content">

			<!-- 결제한 클래스가 없을때-->
			<div id="classnull">
				<img src="<%=contextPath%>/resources/images/myClassNull.jpg" alt="">
				<p>아직 신청 내역이 없어요!<br>
				지금 바로 합플을 시작해 보세요.</p>
				<button type="button" class="btn btn-light" id="findClass" onclick="">클래스 찾아보기</button>
			</div>



		</div>
      
    </div>	
	<script>
		$(function(){
			$("#findClass").click(function(){
				location.href="<%=contextPath%>/main.tee";
			})
		})
	</script>
	
		
		
	<%@ include file = "../common/footerbar.jsp" %>
</body>
</html>