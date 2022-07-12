<%@ page import="com.example.lottemoviereservation.dto.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-11
  Time: 오후 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDto dto = (UserDto) session.getAttribute("login");
    String id = dto.getUserId();
    String email = dto.getUserEmail();
%>
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
            justify-items: flex-end;
            justify-content: flex-end;
        }

        .blank {
            width: 100px;
            height: 40px;
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
                <input name="id" type="text" class="infoinput" id="id" value="<%= id%>" readonly>
                <span class="blank"></span>
            </div>
            <div class="user">
                <div class="text">이메일</div>
                <input name="email" type="text" class="infoinput" id="email" value="<%= email%>">
                <span class="blank"></span>
            </div>
            <div class="user">
                <div class="text">비밀번호</div>
                <input name="pwd" type="password" class="infoinput" id="pwd" required="required" onkeyup="return passwordChanged()">
                <span id="strength" class="blank">Type Password</span>
            </div>
            <div class="user">
                <div class="text">비밀번호 확인</div>
                <input name="pwdCheck" type="password" class="infoinput" id="pwdCheck" required="required" onkeyup="return passwordMatch()">
                <span id="passMatch" class="blank">Type Password</span>
            </div>
            <div class="updateBtn" align="center">
                <input type="button" class="cancelBtn" value="취소">
                <input type="submit" class="confirmBtn" value="확인" onclick="formSubmit()">
            </div>
        </form>
    </div>
</div>
<script>

    function checkForm() {
        if(document.getElementById("pwd").value !== document.getElementById("confirmPwd").value) {
            alert("패스워드가 일치하지 않습니다!");
            return false;
        }
        // if(document.getElementById("flag").value != document.getElementById("id").value) {
        //     alert("인증받은 아이디가 아닙니다 \n아이디 중복확인하세요");
        //     return false;
        // }
    }

    function checkId() {
        let memberId = document.getElementById("id");
        if(memberId.value === "") {
            alert("아이디를 입력하세요!");
            memberId.focus();
        }else {
            window.open("IdCheckServlet?id=" + memberId.value, "idcheckpopup", "width=250, height=150, top=150, left=400");
        }
    }

    function formSubmit() {
        let result = checkForm();
        if(result === false) {
            return false;
        } else {
            alert("회원가입이 완료되었습니다. \n홈페이지로 돌아갑니다.");
            document.getElementById("form").submit();
        }
    }

    function passwordMatch() {
        var match = document.getElementById('passMatch');
        var pswd = document.getElementById("pwdCheck");
        var pwd = document.getElementById("pwd");
        if(pswd.value.length === 0) { //')' token error duplicate, syntax error 발생지점
            match.innerHTML = 'Type Password';
        } else if (pwd.value ===  pswd.value) {
            match.innerHTML = '<span style="color:green">비밀번호 확인완료!</span>';
        } else {
            match.innerHTML = '<span style="color:red">비밀번호가 일치하지 않습니다!</span>';
        }
    }
    function passwordChanged() {
        var strength = document.getElementById('strength');
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        var pwd = document.getElementById("pwd");
        if (pwd.value.length === 0) {
            strength.innerHTML = 'Type Password';
        } else if (false === enoughRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:red">길이가 짧습니다!</span>';
        } else if (strongRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:green">Strong!</span>';
        } else if (mediumRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:orange">Medium!</span>';
        } else {
            strength.innerHTML = '<span style="color:rosybrown">Weak!</span>';
        }
    }
</script>
</body>
</html>