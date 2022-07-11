<%@ page import="org.json.JSONObject" %>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Titan+One&display=swap');
        .headerBox>.container{
            width: 95%;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 120px 30px 60px;
            margin: 20px auto;
        }
        .headerBox .searchBox{
            grid-row: 1/2;
            grid-column: 1/2;
        }
        .headerBox .logoBox{
            grid-row: 1/2;
            grid-column: 2/3;
            margin: 20px auto;
            height: 60px;
            align-items:center;
            display: flex;
            justify-content:center;
        }
        .headerBox .loginBox{
            grid-row: 1/2;
            grid-column: 3/4;
        }
        .headerBox .lineBox{
            grid-row: 2/3;
            grid-column: 1/4;
        }
        .headerBox .buttonBox{
            grid-row: 3/4;
            grid-column: 1/4;
            border-bottom: solid 2px #E60012;
        }

        .headerBox #logoImg {
            width: 36px;
            height: 36px;
            margin: 0px 5px;
        }
        .headerBox .logoBox span {
            font-family: 'Titan One', cursive;
            font-size: 48px;
            color: #E60012;
        }
        .headerBox a{
            float: right;
            margin-right: 20px;
            margin-top: 70px;
            color: black;
        }

        .headerBox #line{
            background-color: #E60012;
            height: 30px;
        }

        .headerBox .btnInnerBox{
            width: 280px;
            margin: 0px auto;
        }
        .headerBox .movePageBtn{
            background-color: white;
            border: none;
            width: 85px;
            height: 55px;
            margin: 0px 25px;
            padding: 10px;
        }
        .headerBox .movePageBtn:hover{
            background-color: white;
            border-bottom: solid 8px #E60012;
        }
    </style>
</head>
<body>

<%
    UserDto user = (UserDto)session.getAttribute("login");
%>

<div class="headerBox">
    <div class="container">
        <div class="searchBox">
        </div>

        <div class="logoBox">
            <img id="logoImg" src="/front/images/logoImg.png">
            <span>MOOBIT</span>
        </div>

        <div class="loginBox">
            <%
                if(user == null){
            %>
            <a href="/user?param=login">로그인 | 회원가입</a>
            <%
            }
            else{
            %>
            <a href="/user/logout.jsp">로그아웃</a>
            <a>마이 페이지</a>
            <%
                }
            %>
        </div>

        <div class="lineBox">
            <div id="line"></div>
        </div>

        <div class="buttonBox">
            <div class="btnInnerBox">
                <button type="button" class="movePageBtn" >예매</button>
                <button type="button" class="movePageBtn" >영화</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
