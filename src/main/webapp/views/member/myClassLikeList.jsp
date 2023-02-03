<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.hp.member.model.vo.Like" %>
 <%
 	ArrayList<Like> list = (ArrayList<Like>)request.getAttribute("list");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing:border-box;  }
    .cwrap{width:1000px; height:1300px; margin:auto; padding:2px;}
    
    .menubar{width:200px; height:1299px; float:left; padding-top:30px; background: white; }
    .content {width:793px; height:1300px;  float: right; padding-top:65px; }

    .list-area{ margin: 20px 10px;}

    .clName p{
        width: 200px;
        white-space : nowrap;
        overflow : hidden;
        text-overflow : ellipsis;
    }
</style>
</head>
<body>
    <%@ include file = "../common/myClassMenubar.jsp" %>
        <div class="content" style="padding: 80px 40px;">

            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->

            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
            <div class="list-area" width="210px" height="300px" style="display:inline-block">
                <div class="thumbnail" >
                    <img src="" width="200px" height="150px">
                    <table class="class-area">
                        <tr>
                            <td colspan="2" style="font-size: small;">동작/관악</td>
                        </tr>
                        <tr>
                            <td class="clName"  colspan="2">
                                <p style="font-weight: bold; width: 200px;">zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</p>
                            </td>
                        </tr>
                        <tr>
                            <td >가격</td>
                            <td >별점</td>
                        </tr>

                    </table>
                </div>

            </div><!--클래스 한개한개 닫히는 div-->
           


        </div> <!--제일 위 cotent닫는 div-->
    </div> <!--메뉴바쪽 제일 상위 div닫는괄호-->
    <%@ include file = "../common/footerbar.jsp" %>	
</body>
</html>