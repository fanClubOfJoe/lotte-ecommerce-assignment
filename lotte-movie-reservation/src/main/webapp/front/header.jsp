<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style type="text/css">
        .container{
            width: 90%;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 120px 30px;
            margin: 20px auto;
        }
        .searchBox{
            grid-row: 1/2;
            grid-column: 1/2;
        }
        .logoBox{
            grid-row: 1/2;
            grid-column: 2/3;
            margin: auto;
        }
        .loginBox{
            grid-row: 1/2;
            grid-column: 3/4;
        }
        .lineBox{
            grid-row: 2/3;
            grid-column: 1/4;
        }

        .inputBox{
            border: solid 1px black;
            border-radius: 3px;
            width: 180px;
            height: 27px;
            margin-left: 20px;
            margin-top: 70px;
            padding-bottom: 5px;
        }
        #keyword{
            border: none;
            height: 23px;
        }
        #searchImg{
            width: 15px;
            margin-left: 5px;
            margin-top: 8px;
        }

        a{
            float: right;
            margin-right: 20px;
            margin-top: 70px;
        }

        #line{
            background-color: #E60012;
            height: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="searchBox">
        <div class="inputBox">
            <input type="text" id="keyword">
            <img src="images/search.png" id="searchImg">
        </div>
    </div>

    <div class="logoBox">
        logo
    </div>

    <div class="loginBox">
        <a>로그인 | 회원가입</a>
    </div>

    <div class="lineBox">
        <div id="line"></div>
    </div>
</div>

</body>
</html>
