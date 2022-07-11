<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-11
  Time: 오후 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        function updateUser() {
            alert("sdf");
            document.getElementById("platform").submit();
        }
    </script>
    <title>updateUser</title>
    <style>
        .redbox {
            margin: auto;
            background-color: #e60012;
            color: white;
            width: 70%;
            height: 30px;
            padding: 10px;
            text-align: center;
        }

        .userinfo {
            width: 35%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
        }

        .user {
            display: flex;
            justify-content: space-between;
        }

        .infoinput {
            width: 300px;
            height: 40px;
            margin: 10px;
        }

        .text {
            margin-top: 25px;
            padding: 0;
        }

        .updateBtn {
            margin-top: 30px;
        }

        .cancelBtn {
            background-color: #595959;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cancelBtn:hover {
            background-color: #ffffff;
            color: #595959;
            border: 1px solid #595959;
            border-radius: 5px;
        }

        .confirmBtn:hover {
            background-color: #ffffff;
            color: #e60012;
            border: 1px solid #e60012;
            border-radius: 5px;
        }

        .confirmBtn {
            background-color: #e60012;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="redbox">회원정보 수정</div>
    <div class="userinfo">

        <form action="updateUserController" method="post" id="platform">
            <input type="hidden" id="flag" value="updateUser" name="param">
            <div class="user">
                <div class="text">아이디</div>
                <input name="id" type="text" class="infoinput" id="id">
            </div>
            <div class="user">
                <div class="text">이메일</div>
                <input name="email" type="text" class="infoinput" id="email">
            </div>
            <div class="user">
                <div class="text">비밀번호</div>
                <input name="pwd" type="password" class="infoinput" id="pwd">
            </div>
            <div class="user">
                <div class="text">비밀번호 확인</div>
                <input name="pwdCheck" type="password" class="infoinput" id="pwdCheck">
            </div>
            <div class="updateBtn" align="center">
                <input type="button" class="cancelBtn" value="취소">
                <input type="submit" class="confirmBtn" value="확인">
            </div>
        </form>
    </div>
</div>

</body>
</html>