<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        
       
        h2{padding: 5px;}
        .firstDiv{
            width: 47%;
            height: 230px;
            float: left;
            margin:14px;
            text-align:center;
        }

        #viewMore {
            text-decoration: none;
            color: gray;
            font-size: 12px;
        }
        .secondDiv{width: 100%; height: 34%; float: left; padding: 20px;}

        #newClassTable td, #newQNA td {text-align: center; font-size: 13px;}
        #noticeTb td{font-size: 13px;}

        #ht{font-size: 14px;}

        table {border-collapse: collapse;}

        #newClassTable th ,#newQNA th {
            border-bottom: 1px solid #444444;
            padding: 10px;
        }

        #noticeAll{
            margin: 5px;
            border: 1px solid;
            width: 35px;
            height: 22px;
            text-align:center;
            border-radius: 20%;
            background-color: rgb(42, 96, 117);
            color: white;
        }
        
        #noticeTutor{
            margin: 5px;
            width: 35px;
            height: 22px;
            text-align:center;
            border-radius: 20%;
            background-color: #42a3b5;
            color: white;
        }
        #answerC{
            margin: 0 auto;
            width: 60px;
            height: 20px;
            text-align:center;
            background-color: #2ca770;
            color: white;
        }
        
        #answer_null{
            margin: 0 auto;
            width: 60px;
            height: 20px;
            text-align:center;
            background-color: rgb(165, 165, 165);
            color: white;
        }
        

        
    </style>
</head>
<body>
<%@ include file="../common/adminMenubar.jsp"%>
   
        <h2 style="font-weight:bold;">관리자 메인페이지</h2>
        <hr>
        <div class="firstDiv">
            <table>
                <tr>
                    <td width="140px" style="font-weight: bolder;">신규 클래스 신청</td>
                    <td width="240px"></td>
                    <td><a id="viewMore" href="">더보기></a></td>
                </tr>
            </table>
            <hr>
            <table id="newClassTable">
                <tr id="ht">
                    <th width="25px">no.</th>
                    <th width="65px">이름</th>
                    <th width="155px">카테고리</th>
                    <th width="355px">클래스명</th>
                </tr>
                <tr>
                    <td height="30px">1</td>
                    <td>봄의손메</td>
                    <td>공예>뜨개/자수</td>
                    <td>마크라메 파인애플 화분 만들기</td>
                </tr>
                <tr>
                    <td height="30px">2</td>
                    <td>오늘도</td>
                    <td>공예>뜨개/자수</td>
                    <td> &lt;명지국제신도시&gt; 자이언트얀만두백</td>
                </tr>
                <tr>
                    <td height="30px">3</td>
                    <td>너의 일상</td>
                    <td>공예>가죽/라탄</td>
                    <td>라탄 가랜드 전등갓 만들기 알전구 조명 행잉 벽걸이 캠핑 너의일상</td>
                </tr>

                <tr>
                    <td height="30px">3</td>
                    <td>지아네 요리공작소</td>
                    <td>쿠킹>베이킹</td>
                    <td>[지아네 공작소]스콘2종 (플레인/커피초코칩) 16~20개 만들기</td>
                </tr>
            </table>
        </div>

        <div class="firstDiv">
            <table >
                <tr>
                    <td width="130px" style="font-weight: bolder;">최근 문의 사항</td>
                    <td width="250px"></td>
                    <td><a id="viewMore" href="">더보기></a></td>
                </tr>
            </table>
            <hr>
            <table id="newQNA" >
                <tr id="ht">
                    <th width="25px">no.</th>
                    <th width="65px">이름</th>
                    <th width="300px">내용</th>
                    <th width="100px">답변상태</th>
                </tr>
                <tr>
                    <td height="30px">1</td>
                    <td>강보람</td>
                    <td>어제 강사님한테 연락드렸는데 연락이 안돼  </td>
                    <td><div id="answer_null">미답변</div></td>
                </tr>
                <tr>
                    <td height="30px">2</td>
                    <td>김말똥</td>
                    <td>수강 취소 시 사용한 쿠폰은 사라지나요?</td>
                    <td><div id="answer_null">미답변</div></td>
                </tr>
                <tr>
                    <td height="30px">3</td>
                    <td>강말숙</td>
                    <td>단체클래스 수업 가능한가요?</td>
                    <td><div id="answerC">답변완료</div></td>
                </tr>
                <tr>
                    <td height="30px">3</td>
                    <td>춘식이</td>
                    <td>외국인도 가입이 가능한가요?</td>
                    <td><div id="answerC">답변완료</div></td>
                </tr>
                
            </table>
        </div>

        <div class="secondDiv">
            <table >
                <tr>
                    <td width="130px" style="font-weight: bolder;">공지사항</td>
                    <td style="width: 730px;"></td>
                    <td><a id="viewMore" href="">더보기></a></td>
                </tr>
            </table>
            <hr>
            <table align="center" id="noticeTb">
                <tr>
                    <td width="50px" height="30px">
                        <div id="noticeAll" style="margin-right:10px">전체</div>
                    </td>
                    <td width="650px">베스트 튜터 제도 일시 중지 및 개편 관련 안내</td>
                    <td width="100px">2022-12-28</td>
                </tr>
                <tr>
                    <td height="30px">
                        <div id="noticeTutor">튜티</div>
                    </td>
                    <td><합플 운영 유의사항>정산/지급 요청 관련 안내</td>
                    <td>2022-12-28</td>
                </tr>
                <tr>
                    <td height="30px">
                        <div id="noticeTutor">튜티</div>
                    </td>
                    <td>공휴일(12/25, 1/1) 튜터 지원센터 단축 운영 안내</td>
                    <td>2022-12-28</td>
                </tr>
                <tr>
                    <td height="30px">
                        <div id="noticeAll">전체</div>
                    </td>
                    <td>[1월] 기획전 호스트 모집 공고(~1/1까지)</td>
                    <td>2022-12-28</td>
                </tr>
                <tr>
                    <td height="30px">
                        <div id="noticeAll">전체</div>
                    </td>
                    <td>[1월] 기획전 호스트 모집 공고(~1/1까지)</td>
                    <td>2022-12-28</td>
                </tr>
            </table>
        </div>

    </div>
    </div>
    
</body>
</html>