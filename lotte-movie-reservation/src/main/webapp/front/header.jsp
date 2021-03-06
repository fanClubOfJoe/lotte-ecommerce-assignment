<%@ page import="org.json.JSONObject" %>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    Object objLoginCheck = session.getAttribute("login");
    boolean isLogin = true;
    if(objLoginCheck == null){
        isLogin = false;
    }else {
        UserDto user = (UserDto) objLoginCheck;
        pageContext.setAttribute("userNo", user.getUserNo());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Titan+One&display=swap');

        .headerBox > .containerBox {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 120px 30px 60px;
            margin: 20px auto;
        }

        .headerBox .searchBox {
            grid-row: 1/2;
            grid-column: 1/2;
        }

        .headerBox .logoBox {
            grid-row: 1/2;
            grid-column: 2/3;
            margin: 20px auto;
            height: 60px;
            align-items: center;
            display: flex;
            justify-content: center;
        }

        .headerBox .loginBox {
            grid-row: 1/2;
            grid-column: 3/4;
        }

        .headerBox .lineBox {
            grid-row: 2/3;
            grid-column: 1/4;
        }

        .headerBox .buttonBox {
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

        .headerBox a {
            float: right;
            margin-right: 20px;
            margin-top: 70px;
            color: black;
        }

        .headerBox #line {
            background-color: #E60012;
            height: 30px;
        }

        .headerBox .btnInnerBox {
            width: 280px;
            margin: 0px auto;
        }

        .headerBox .movePageBtn {
            background-color: white;
            border: none;
            width: 85px;
            height: 55px;
            margin: 0px 25px;
            padding: 10px;
        }

        .headerBox .movePageBtn:hover {
            background-color: white;
            border-bottom: solid 8px #E60012;
        }

        #movielist {
            cursor: pointer;
        }

        #reservelist {
            cursor: pointer;
        }

        .logoBox {
            cursor: pointer;
        }
    </style>
</head>
<body>


<div class="headerBox">
    <marquee scrolldelay="80" style="color: #E60012; margin-top: 15px;">
        <b style="size: 20px;">????????? ????????? ?????? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
        ????????? https://github.com/KangYena &nbsp;&nbsp;&nbsp;&nbsp;
        ????????? https://github.com/JiniEun &nbsp;&nbsp;&nbsp;&nbsp;
        ????????? https://github.com/chd830 &nbsp;&nbsp;&nbsp;&nbsp;
        ????????? https://github.com/jikimomo &nbsp;&nbsp;&nbsp;&nbsp;
        ????????? https://github.com/kjchoi1997 &nbsp;&nbsp;&nbsp;&nbsp;
        ????????? https://github.com/kanamycine &nbsp;&nbsp;&nbsp;&nbsp;
    </marquee>
    <div class="containerBox">
        <div class="searchBox">
        </div>
        <div class="logoBox">
            <img id="logoImg" src="/front/images/logoImg.png">
            <span>MOOBIT</span>
        </div>
        <div class="loginBox">
            <%
                if (!isLogin) {
            %>
            <a href="/user?param=login">????????? | ????????????</a>
            <%
            } else {
            %>
            <a href="/user/logout.jsp">????????????</a>
            <a href="/user?param=mypage&userno=${userNo}">?????? ?????????</a>
            <%
                }
            %>
        </div>

        <div class="lineBox">
            <div id="line"></div>
        </div>

        <div class="buttonBox">
            <div class="btnInnerBox">
                <button type="button" class="movePageBtn" id="reservelist">??????</button>
                <button type="button" class="movePageBtn" id="movielist">??????</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#reservelist').click(function () {
        location.href = "/reserve?param=reserve";
    })
    $('#movielist').click(function () {
        location.href = "/movie?param=list";
    })
    $('.logoBox').click(function () {
        location.href = "/movie?param=main";
    })
</script>
</body>
</html>
