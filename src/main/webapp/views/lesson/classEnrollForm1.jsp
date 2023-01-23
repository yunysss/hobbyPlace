<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.util.ArrayList, com.hp.lesson.model.vo.*" %>

<%
	 ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("cList");
    ArrayList<Dcategory> dList = (ArrayList<Dcategory>)request.getAttribute("dList");
%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
   
<!--주소입력 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>

<style>
        div{ box-sizing: border-box;}
       
        /*클래스 등록*/

        .outer{
            padding: 25px 30px;

        }
        .outer>*{
            font-size: small;
        }
        #enroll-form input{
            margin: 5px 0px;
           
        } 
        #enroll-form input[type="radio"]{
            margin: 10px 5px;
           
        } 
        #enroll-form input[type="checkbox"]{
            margin: 10px 5px;
           
        } 
        .guide{
            float: right;
        }   
        
        .schedule{display: none; margin: 10pt;}
        .schedule+label{
            display: inline-block;
            cursor: pointer;
            padding: 3px 7px;
            text-align: center;
            font-size: 12px;
            border-radius: 5px;
            background-color: gray;
            color: white;
            
        }
        .schedule:checked+label{
            background-color: rgb(22, 160, 133);
        }
        

        /*운영시간*/
        .container * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }


    .container {
        margin: auto;
        padding: 10px;
    }

    ._table {
        border-collapse: collapse;
    }

    ._table :is(th, td) {/*:is 반복 줄임*/
        border: 1px solid rgba(210, 209, 209, 0.133);
        padding: 3px 5px;
    }

    .form_control {
        border: 1px solid rgba(15, 11, 11, 0.133);
        background-color: transparent;
        outline: none;
        padding: 8px 12px;
        font-family: 1.2rem;
        width: 100%;
        color:#333;
        transition: 0.3s ease-in-out;
    }

    .success {
        border-radius: 5px;
        background-color: rgb(22, 160, 133);
    }

    .danger {
        border-radius: 5px;
        background-color: rgb(99, 97, 97) !important;
    }

    .action_container {
        display: inline-flex;
    }

    .action_container>* {
        border: none;
        outline: none;
        color: rgb(247, 243, 243);
        text-decoration: none;
        display: inline-block;
        padding: 8px 10px;
        cursor: pointer;
        transition: 0.3s ease-in-out;
    }
    
        
    input[type="text"]{
        width: 300px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

    input[type="number"]{
        width: 100px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    input[type="date"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }

    input[type="time"]{
        width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
    }
    input[type=radio]:hover+label{
            background-color: rgb(22, 160, 133);
        }
   
    table{
        
        margin-left: 20px;
    }
    select{
    	 width: 150px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
  
    }
    
    }
    </style>

</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>
      <!-- 여기부터-->
          
                <div class="outer">
                    <form action="" id="enroll-form" method="post" class="classEnroll">
                    <h5 style="font-weight: 900;">클래스 등록</h5>
                    <br>
                    <span style="font-size: 14px; font-weight: 600;">기본정보</span>
                    <button type="button" class="btn btn-secondary btn-sm guide">작성가이드</button>
                    <hr>
                    <table id="basic">
                        <tr>
                            <th width=100>카테고리</th>
                            <td>
                                <select name="category" id="category" class="ct" >
                                    <%for(Category c : cList){ %>
		                            <option value="<%=c.getCtNo()%>"><%=c.getCtName() %></option>
		                        	<%} %>
                                </select>
                                
                                <select name="dCategory" id="Dcategory" class="ct">
                                   <%for(Dcategory d : dList){ %>
		                            <option value="<%=d.getCtDno()%>"><%=d.getCtDname() %></option>
		                            <%} %>

                                </select>
                            </td>
                        </tr>
                      
                        <tr>
                            <th>클래스명</th>
                            <td>
                                <br>
                                <input type="text" name="className" class="form-control">
                                
                            </td>
                        </tr>
                        <tr>
                            <th>진행장소</th>
                            <td>
                             
                                <input id="class_sido" type="hidden"  name="sido" placeholder="시/도" readonly>
                                <input id="class_sigungu" type="hidden" name="sigungu" placeholder="구" readonly> <br>
                                <input id="class_addr" type="text" name="address" placeholder="주소입력" readonly>
                                <button type="button" onclick="findAddr()"  class="btn btn-secondary btn-sm">주소검색 </button><br>
                                <input type="text" name="Daddress" placeholder="상세주소입력"><br>
                                <script>
                                    function findAddr(){
                                        new daum.Postcode({
                                            oncomplete: function(data) {
                                                
                                                console.log(data);
                                                
                                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                                                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                const roadAddr = data.roadAddress; // 도로명 주소 변수
                                                const jibunAddr = data.jibunAddress; // 지번 주소 변수
                                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                const sido = data.sido;
                                                const sigungu = data.sigungu;
                                                
                                                document.getElementById("class_sido").value = sido;
                                                document.getElementById("class_sigungu").value = sigungu;


                                                if(roadAddr !== ''){
                                                    document.getElementById("class_addr").value = roadAddr;
                                                } 
                                                else if(jibunAddr !== ''){
                                                    document.getElementById("class_addr").value = jibunAddr;
                                                }
                                            }
                                        }).open();
                                    }
                                </script>    
                                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

                            </td>
                            

                        </tr>
                        <tr>
                            <th>최대인원</th>
                            <td><input type="number" name="clMax" class="form-control-sm"> 명</td>
                        </tr>
                        <tr>
                            <th>난이도</th>
                            <td>
                                <input type="radio" name="level" value="0" id="level"><label for="level">없음</label>
                                <input type="radio" name="level" value="1" id="level"><label for="level">쉬움</label>
                                <input type="radio" name="level" value="2" id="level"><label for="level">보통</label>
                                <input type="radio" name="level" value="3" id="level"><label for="level">어려움</label>
                            </td>
                        </tr>

                    </table>
                    <br>
                    <h6 style="font-weight: 550;">판매기간</h6>
                    <hr>
                    <table id="period">
                        <tr>
                            <th width="100">판매시작일</th>
                            <td>
                                <input type="date" name="startDate">
                            </td>
                        </tr>
                        <tr>
                            <th>판매종료일</th>
                            <td>

                                <input type="date" name="endDate">

                            </td>
                        </tr>

                    </table>
                     <br>
                    <h6 style="font-weight: 550;">판매일정</h6>
                    <hr>
                    <table>
                        <tr>
                            <th width="100">일정</th>
                            <td>
                                <input type="radio" id="everyday" name="schedule"class="schedule">
                                <label for="everyday">매일</label>
                                <input type="radio" id="weekly" name="schedule" class="schedule">
                                <label for="weekly">매주</label>
                                <br>


                                <input type="checkbox" name="day" value="월" class="day" id="mon"><label for="mon">월</label>
                                <input type="checkbox" name="day" value="화" class="day" id="tue"><label for="tue">화</label>
                                <input type="checkbox" name="day" value="수" class="day" id="wed"><label for="wed">수</label>
                                <input type="checkbox" name="day" value="목" class="day" id="thur"><label for="thur">목</label>
                                <input type="checkbox" name="day" value="금" class="day" id="fri"><label for="fri">금</label>
                                <input type="checkbox" name="day" value="토" class="day" id="sat"><label for="sat">토</label>
                                <input type="checkbox" name="day" value="일" class="day" id="sun"><label for="sun">일</label>
                                
                            </td>

                            <script>
                                $("input:radio[name=schedule]").on('click',function(){
                                    if($(this).val() == 'everyday'){
                                        $("input:checkbox[name=day]").attr("checked",true);
                                    }else{
                                        $("input:checkbox[name=day]").attr("checked",false);
                                    }
                                })
                                    
                               
                            </script>
                        </tr>
                        <tr>
                            <th>일 운영횟수</th>
                            <td><input type="number" name="times">회</td>
                        </tr>
                        <tr>
                            <th>운영시간</th>
                            
                            <td>

                                <div class="container">
                                    <table class="_table">
                                      <thead>
                                        <tr>
                                          <th>클래스 회차</th>
                                          <th>시작시간</th>
                                          <th>종료시간</th>
                                          <th>
                                            <div class="action_container">
                                              <button type="button" class="success" onclick="add_tr('table_body')">+
                                              </button>
                                            </div>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody id="table_body">
                                            <tr>
                                            <td>
                                                <input type="number" name="session" class="form_control" >
                                            </td>
                                            <td>
                                                <input type="time" name="startTime"class="form_control" >
                                            </td>
                                            <td>
                                                <input type="time" name="endTime" class="form_control">
                                            </td>
                                            <td>
                                                <div class="action_container">
                                                <button type="button" class="danger" onclick="remove_tr(this)">-&nbsp;
                                                </button>
                                                </div>
                                            </td>
                                            </tr>
                        
                                        </tbody>
                                    
                                    </table>
   
                                  </div>
                          
                            </td>
                        </tr>

                    </table>
                   
                    <h6 style="font-weight: 550;">판매가격</h6>
                    <hr>
                    <table>
                        <tr>
                            <th width="100">판매가</th>
                            <td><input type="text" class="form-control-sm" name="price"> 원</td>
                        </tr>

                    </table>
                    
                    <hr>
                    <div align="center">
                    <button class="btn btn-secondary btn-sm" >다음페이지로</button>
                    
                    </div>

                    </form>
                </div>
            

           

            <script>
                function add_tr(table_id) {//행 추가
                    let table_body = document.getElementById(table_id);
                    let first_tr   = table_body.firstElementChild;
                    let tr_clone   = first_tr.cloneNode(true);//*1)복제된 node 반환
        
                    table_body.append(tr_clone);
                    clean_first_tr(table_body.firstElementChild);
                }
        
                function clean_first_tr(firstTr) {//값 초기화
                    let children = firstTr.children;//*2) 자식 요소가 포함된 HTMLCollection을 반환
                    
                    children = Array.isArray(children) ? children : Object.values(children);//*3)
                    children.forEach(x=>{
                        if(x !== firstTr.lastElementChild){//마지막child가 아닐때
                            x.firstElementChild.value = '';//td의 첫번째 child > input값 초기화
                        }
                    });
                }
        
                function remove_tr(This) {//행 삭제
                    //*4)closet:현재 엘리멘트에서 가장 가까운 조상을 반환
                    if(This.closest('tbody').childElementCount == 1)
                    {
                        alert("삭제할 수 없습니다.");
                    }else{
                        This.closest('tr').remove();//삭제
                    }
                }
              </script>
        

        <%@ include file="../common/footerbar.jsp" %>

        

</body>
</html>