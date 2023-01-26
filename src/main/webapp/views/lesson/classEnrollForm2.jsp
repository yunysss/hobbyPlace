<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



<style>

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
        .guide{
            float: right;
        }       
        input[type="text"]{
        width: 300px;
        border: 1px solid rgb(202, 199, 199);
        height: 32px;
        border-radius: 5px;
         }
         
        textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 700px;
        resize: none;
       
         }
         #refundPolicy{
            background-color: rgb(223, 222, 222);
         }
        table{
            margin-left: 20px;
        }

</style>
</head>
<body>

<%@ include file="../common/tutorMenubar.jsp" %>

 <div id="content2">
                <div class="outer">
                    <form action="" id="enroll-form" class="classEnroll" method="post">
                    <h5 style="font-weight: 900; font-size: 18px;">클래스 등록</h5>
                    <br>
                    <span style="font-size: 14px; font-weight: 600;">클래스 설명</span>
                    <button type="button" class="btn btn-secondary btn-sm guide">작성가이드</button>
                    <hr>
                    <table>
                        <tr>
                            <th width="100">대표이미지</th>
                            <td>    
                                <img src="" alt="" id="titleImg" width="170" height="100" onclick="clickFile(1);">
                                <img src="" alt="" id="contentImg1" width="170" height="100" onclick="clickFile(2);">
                                <img src="" alt="" id="contentImg2" width="170" height="100" onclick="clickFile(3);">
                                <img src="" alt="" id="contentImg3" width="170" height="100" onclick="clickFile(4);">
                                <div style="font-size:12px;">🔺첫번째 선택한 사진이 썸네일 이미지로 사용됩니다.</div>

                                <div id="file-area" style="display: none;">
                                    <input type="file" name="file1" onchange="loadImg(this,1);" required> 
                                    <input type="file" name="file2" onchange="loadImg(this,2);">
                                    <input type="file" name="file3" onchange="loadImg(this,3);"> 
                                    <input type="file" name="file4" onchange="loadImg(this,4);">
                                </div>
                                
                            </td>
                        </tr>
                        <script>
                            function clickFile(num){
                                $("input[name=file"+num+"]").click();
                            }
            
            
                            function loadImg(inputFile, num){
                              
                                if(inputFile.files.length == 1){// 배열의 길이가 1일때 
                                     
                                    const reader = new FileReader();
                                  
                                    reader.readAsDataURL(inputFile.files[0]);
                                    reader.onload = function(e){
                                        //e.target.result => 읽어들인 파일의 고유한 url 
                                        switch(num){
                                            case 1: $("#titleImg").attr("src",e.target.result); break;
                                            case 2: $("#contentImg1").attr("src",e.target.result); break;
                                            case 3: $("#contentImg2").attr("src",e.target.result);break;
                                            case 4: $("#contentImg3").attr("src",e.target.result);break;
            
                                        }
                                    }
            
            
                                }else{ 
                                    // 기존에 선택된 파일이 취소된 경우 => 미리보기 됐던거 사라지게 하기 
                                    switch(num){
                                            case 1: $("#titleImg").attr("src",null); break;
                                            case 2: $("#contentImg1").attr("src",null); break;
                                            case 3: $("#contentImg2").attr("src",null);break;
                                            case 4: $("#contentImg3").attr("src",null);break;
            
                                        }
            
                                }
                            
                            }
                        </script>
            

                        <tr>
                            <th>상세설명</th>
                            <td style="width: 100;">
                                <br>
                                <form method="post">
                                    <textarea id="summernote" name="editordata" ></textarea>
                                  </form>
                                  
                                  <script>
                                    $(document).ready(function() {
                                    //여기 아래 부분
                                    $('#summernote').summernote({
                                    
                                          height: 200,                 // 에디터 높이
                                          minHeight: 300,             // 최소 높이
                                          maxHeight: 300,             // 최대 높이
                                              // 에디터 로딩후 포커스를 맞출지 여부
                                          lang: "ko-KR",					// 한글 설정
                                          placeholder: '클래스에 대한 설명을 적어주세요.  최대 2048자까지 쓸 수 있습니다.'	//placeholder 설정
                                          
                                    });
                                });
                                  </script>

                                  

                            </td>

                        </tr>
                        <tr>
                            <th>커리큘럼</th>
                            <td>
                                <textarea name="" id=""  rows="4" style="resize:none"></textarea>
                            </td>
                        </tr>

                    
                    </table>
                    <hr>
                    <table>
                        <tr>
                            <th width="100">환불규정</th>
                            <td>
                                <textarea name="refundPolicy" id="refundPolicy"  rows="5" readonly style="font-size:11px"   >
1. 결제 후 14일 이내 취소 시 : 전액 환불
2. 결제 후 14일 이후 취소 시 : 환불 불가
[환불 신청 방법]
1. 해당 클래스 결제한 계정으로 로그인
2. 마이 - 신청내역 or 결제내역"

                                </textarea>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <h5 style="font-weight: 550; font-size: 14px;">부가정보 (선택사항) </h5>
                    <hr>
                    <table>
                        <tr>
                            <th width="100">준비물</th>
                            <td><input type="text" name="" value="" class="form-control"></td>
                            
                        </tr>
                        <tr>
                            <th>검색키워드</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>

                    </table>
                    <hr>
                    <div align="center">
                        <button type="button" class="btn btn-secondary btn-sm"  onclick="history.back();">이전</button>
                        <button type="submit" class="btn btn-secondary btn-sm">검수요청</button>
                        
                        </div>

                    </form>
                </div>
            

            </div>
            <%@ include file="../common/footerbar.jsp" %>
      
</body>
</html>


