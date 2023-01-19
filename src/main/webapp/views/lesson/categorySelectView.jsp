<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Insert title here</title>
 <style>
        .outer{
            width: 1000px;
            margin: auto;


        }
        h4>a{
          color: rgb(65, 64, 64);
          margin-right: 5px;
          text-decoration: none;
          font-size: 20px;
          font-weight: 550;
        
        }
        h4>a:hover{
          text-decoration: none;
          cursor: pointer;
          color:  rgb(35, 104, 116);
        
        }
        .thumbnail{
        width: 190px;
        display: inline-block;
        margin: 10px;
        text-align: left;
      }
      #detail-category a{
          color: rgb(65, 64, 64);
          font-size: 12px;
          margin-right: 5px;
      }
      #detail-category a:hover{
        cursor: pointer;
        color: black;
        font-size: 12.5px;
      }
      #button-area{
        margin-top: 10px;
      }
      #btn-area{
        display: inline-block;
        width: 770px;
        text-align: right;
      }
      #btn-area>button{
        width: 60px;
        height: 30px;
        line-height: 10px;
        background-color: rgb(35, 104, 116);
        border: none;
        font-size: 13px;
        color: whitesmoke;
        border-radius: 5px;
      }
      #btn-area>button:hover{
        background-color:  rgba(35, 104, 116, 0.685);
      }
     

    </style>
</head>
<body>
<%@include file="../common/tuteeMenubar.jsp" %>
  <div class="outer">
        <h4> <a href="">카테고리명</a><span class="material-symbols-outlined symbol">expand_more</span></h4>
        <div id="detail-category">
        <a>전체</a> <a>가죽/라탄</a> <a>비누/향/꽃</a> <a>뜨개/자수</a> <a>기타</a>
        </div>
        <div id="button-area">
            <button class="btn btn-secondary btn-sm"> 지역 </button>
            <button class="btn btn-secondary btn-sm"> 날짜 </button>
        </div>

        <br><br>
        <span style="font-size: 12px; font-weight: 550; color: rgb(75, 72, 72);">검색결과 10 건</span>
        <div id="btn-area" style="border: 1px sold black;">
         <button class="btn btn-secondary btn-sm"> 인기순 </button>
          <button class="btn btn-secondary btn-sm"> 평점순 </button>
        </div>
        <div class="container">
          
          
          
               <div class="list-area">
                
                <table class="thumbnail"  >
                  <tr>
                    <td>
                    <div id="thumbnail">
                    <img src="resources/KakaoTalk_20230111_135534500.jpg" alt="" width="180" height="180">
                    
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="font-size: 11px;">
                     지역명/서울/구로구
                    </td>
                  </tr>
                  <tr>
                    <th>클래스명~~~~~만들기</th>  
                  </tr>
                  <tr>
                    <td>
                   ⭐⭐⭐⭐⭐
                    </td>
                    
                  </tr>
                  <tr>
                    <th>50,000원</th>
                  </tr>

                </table>
                <table class="thumbnail">
                  <tr>
                    <td>
                    <div id="thumbnail">
                    <img src="resources/KakaoTalk_20230111_135534500.jpg" alt="" width="180" height="180">
                    
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="font-size: 11px;">
                     지역명/서울/구로구
                    </td>
                  </tr>
                  <tr>
                    <th>클래스명~~~~~만들기</th>  
                  </tr>
                  <tr>
                    <td>
                   ⭐⭐⭐⭐⭐
                    </td>
                    
                  </tr>
                  <tr>
                    <th>50,000원</th>
                  </tr>

                </table>
                <table class="thumbnail">
                  <tr>
                    <td>
                    <div id="thumbnail">
                    <img src="resources/KakaoTalk_20230111_135534500.jpg" alt="" width="180" height="180">
                    
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="font-size: 11px;">
                     지역명/서울/구로구
                    </td>
                  </tr>
                  <tr>
                    <th>클래스명~~~~~만들기</th>  
                  </tr>
                  <tr>
                    <td>
                   ⭐⭐⭐⭐⭐
                    </td>
                    
                  </tr>
                  <tr>
                    <th>50,000원</th>
                  </tr>

                </table>
                <table class="thumbnail">
                  <tr>
                    <td>
                    <div id="thumbnail">
                    <img src="resources/KakaoTalk_20230111_135534500.jpg" alt=""width="180" height="180"">
                    
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td style="font-size: 11px;">
                     지역명/서울/구로구
                    </td>
                  </tr>
                  <tr>
                    <th>클래스명~~~~~만들기</th>  
                  </tr>
                  <tr>
                    <td>
                   ⭐⭐⭐⭐⭐
                    </td>
                    
                  </tr>
                  <tr>
                    <th>50,000원</th>
                  </tr>

                </table>






             

              </div>   




    </div>
    <%@ include file="../common/footerbar.jsp" %>
    
</body>
</html>