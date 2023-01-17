<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #content2{
            width: 1000px;
        }

        .outer{
            padding: 30px 50px;

        }
        .outer>*{
            font-size: small;
        }
        #class-select input{
            margin: 5px 5px;
           
        } 
        #class-select input[type="checkbox"]{
            margin: 10px 5px;
           
        } 
        #class-select>tr{
           margin: 10px;
        }

        input[type=radio]{display: none; margin: 10pt;}
        input[type=radio]+label{
            display: inline-block;
            cursor: pointer;
            padding: 5px 8px;
            text-align: center;
            font-size: 12px;
            border-radius: 5px;
            background-color: rgb(101, 99, 99);
            color: white;
            line-height: 16px;
            
        }
        input[type=radio]:checked+label{
            background-color: rgb(35, 104, 116)
        }

        /*테이블*/
        #table-area{
            text-align:center;
            cursor: pointer;
        }
        input[type="date"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
        
    }
        input[type="search"]{
        width: 300px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

 

</style>
</head>
<body>
<%@ include file="../common/tutorMenubar.jsp" %>
	  <div class="outer">
                    
                    <form action="" id="class_list" >
                    <h5 style="font-weight: 900;">내 클래스 목록</h5>
                    <br>
                    <h6 style="font-weight:600">클래스 조회</h6>
                    <hr><br>
                    <table id="class-select">
                        <tr>
                            <th width="100">검색어</th>
                            <td><input type="search">
                                <input type="submit" class="btn btn-secondary btn-sm" value="검색">
                            </td>

                        </tr>

                        <tr>
                            <th>조회기간</th>
                            <td><input type="date" name="start" value=""> - <input type="date" name="end" value="">
                                <input type="radio" id="today" name="period"value="today">
                                <label for="today">&nbsp;오늘&nbsp;</label>
                                <input type="radio" id="month" name="period"value="month">
                                <label for="month">1개월</label>
                                <input type="radio" id="6month" name="period"value="6month">
                                <label for="6month">6개월</label>
                                <input type="radio" id="year" name="period"value="year">
                                <label for="year">&nbsp;1년&nbsp;&nbsp;</label>
                            
                            
                            
                            </td>
                            
                        </tr>
                        <tr>
                            <th>등록상태</th>
                            <td>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">검수요청</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">검수반려</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중</label>
                                <input type="checkbox" name="status" id="" value="">
                                <label for="">판매중지</label>
                            </td>
                        </tr>
                    </table>    
                    <br>
                    <hr>
                    <div align="center">
                    <button type="submit" class="btn btn-secondary btn-sm">조회하기</button>
                    
                    
                    </div>

                    </form>
                    <br><br>

                    <div id="list">
                        <h6 style="font-weight:600">조회 결과</h6>
                        <hr>
                        <div id="table-area" align="center">
                        <table class="table table-hover ">
                            <thead class="thead-light">
                            <tr>
                                <th>클래스번호</th>
                                <th width="450">클래스명</th>
                                <th width="100">등록일</th>
                                <th width="100">상태</th>
                                <th width="100">반려사유</th>
                            </tr>
                            </thead>
                            <tbody>
                          
                            <tr>
                                <td colspan="5">등록된 클래스가 없습니다.</td>
                                
                            </tr>
                            
                            <!-- 등록된 클래스 있을 경우 -->
                            
                                <tr>
                                    <td>1</td>
                                    <td>클래명쓰시오</td>
                                    <td>2023-01-24</td>
                                    <td>검수요청</td>
                                    <td>못생겻음</td>
                                </tr>
                             
                            </tbody>
                        </table>
                        </div>

                    </div>

                </div>

                 <div class="paging-area">
        
        	
               
                </div>
	
</body>
</html>