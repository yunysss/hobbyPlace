<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div, p, form, input, table{box-sizing:border-box;}
    .outer{width:1000px; margin:auto; padding:20px 50px;}
    .outer a{text-decoration: none !important; color:black!important}
    .outer>*{
    	font-size:small;
    }
    #statSearch, #statResult{
     border:1px solid rgb(180, 180, 180); 
     border-radius:5px;
     margin-top:20px;
    }
    #statResult td{
     text-align: center;
     vertical-align: middle;
     font-size:12px;
    }
    #statSearch td{
     padding:5px;
    }
    #statSearch-btn{
     width:60px;
     margin:0px 5px;
     background:rgb(22, 160, 133); 
     color:white;
    }
    thead td{
     background:rgb(245, 245, 245);
    }
    select{
     width: 150px;
     border: 1px solid rgb(202, 199, 199);
     height: 32px;
     border-radius: 5px;
    }
    input[type=text]{
           width: 150px;
           border: 1px solid rgb(202, 199, 199);
           height: 30px;
           border-radius: 5px;
   }
    #paging{
	    text-align: center;
	    display: inline-block;
		padding-left :0;
	}
	#paging li {
	    text-align: center;
	    float: left;
		list-style:none;
		border-radius:10px;
	}
	
	#paging li a {
	    display: block;
	    font-size: 12px;
		color: black;
	    padding: 5px 10px;
	    box-sizing: border-box;
		text-decoration-line:none;
	}
	
	#paging li.on {
	    background: gray;
	}
	
	#paging li.on a {
	    color: white;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
    <div class="outer">
    	<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-toggle="tab" href="#menu1" style="font-weight: 600; font-size: 15px;">리스트로 보기</a>
		  </li>
		  <li class="nav-item">	
		    <a class="nav-link" data-toggle="tab" href="#menu2" style="font-weight: 600; font-size: 15px;">차트로 보기</a>
		  </li>
		</ul>
		<div class="tab-content" id="statSearch">
		  <div class="tab-pane container active" id="menu1">
		  	<table width="800px" border="1">
                <tbody>
                	<tr>
                		<td><b>검색어</b></td>
                		<td>
                			<select name="category">
                				<option value="clName">클래스명</option>
                				<option value="ttName">튜터명</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" name="keyword" size="18">
                        </td>
                	</tr>
                	<tr>
                    	<td><b>카테고리</b></td>
                    	<td colspan="3">
                    		<select name="category">
                            </select>
                    	</td>
                    </tr>
                    <tr>
                        <td><b>지역</b></td>
                        <td>
                            <select name="location">
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td><b>기타 필터링</b></td>
                    	<td>
                    		<select>
                    			<option value="likeCount">찜</option>
                    			<option value="reviewCount">후기</option>
                    			<option value="memberCount">누적수강생</option>
                    		</select>
                    	</td>
                    	<td>
                    		<select>
                    			<option value="desc">많은순</option>
                    			<option value="asc">적은순</option>
                    		</select>
                    	</td>
                    </tr>
                    <tr>
                    	<td><b>가격</b></td>
                    	<td colspan="2">
                    		<input type="range" value="0" min="0" max="300000" step="50000">
                    	</td>
                    </tr>
                    <tr>
                        <td><b>조회 기간</b></td>
                        <td>
                            <div class="clearfix">
                                <!-- 시작일 -->
                                <span class="dset">
                                    <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
                                    <a href="#none" class="btncalendar dateclick"></a>
                                </span>
                                <span class="demi">-</span>
                                <!-- 종료일 -->
                                <span class="dset">
                                    <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
                                    <a href="#none" class="btncalendar dateclick"></a>
                                </span>
                            </div>
                        </td>
                        <td>
                            <div class="searchDate">
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">&nbsp;오늘&nbsp;</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                 </span>
                                 <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
                                    <label for="dateType7">6개월</label>
                                 </span>
                                </div>  
                        </td>
                    </tr>
                </tbody>
            </table>
		  </div>
		  <script>
		  	function SetValue(this){
				range_val.value = this.value;
			}
		  </script>
		  <div class="tab-pane container fade" id="menu2">
		  	
		  </div>
		</div>
    </div>
</body>
</html>