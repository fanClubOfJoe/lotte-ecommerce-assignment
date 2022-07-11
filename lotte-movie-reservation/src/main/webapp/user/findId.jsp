<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>아이디 찾기</title>
    <script type="text/javascript">
        function findIdByNameAndEmail() {
            document.getElementById("findForm").submit();
        }
    </script>
</head>
<body class="findIdBody">
<div class="findId_box member_findId_wrap contents_inner">
    <div id="div0">
        <h2 class="center">아이디 찾기</h2>
    </div>
    <div class="login-area login_input" id="div1">
        <form action="FindIdController" method="post" id="findForm">
            <label for="name">이름:</label>
            <input class="login_input" type="text" id="name" placeholder="등록된 이름 입력" name="name" required="required">
            <br>
            <label for="email">이메일:</label>
            <input class="email_input" type="email" id="email" placeholder="등록된 이메일 입력" name="email"
                   required="required">
        </form>
    </div>
    <div id="div2">
        <btn class="btn btn-info" onclick="findIdByNameAndEmail()">찾기</btn>
        <btn href="login.jsp" class="btn btn-danger">취소</btn>
    </div>
</div>
</body>
</html>