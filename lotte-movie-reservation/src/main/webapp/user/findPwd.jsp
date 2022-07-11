<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    <meta charset="UTF-8">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="findBox">
    <div class="titleBoxForPw">
        <h3>비밀번호 찾기</h3>
    </div>
    <div class="outerInputBox">
        <form class="was-validated" action="FindPwdController" method="post" id="findForm">
            <div class="innerInputBox">
                <label for="userId">아이디:</label>
                <input type="text" class="inputs" id="userId" placeholder="등록된 아이디 입력" name="userId" required="required">
            </div>
            <div class="innerInputBox">
                <label for="email">이메일:</label>
                <input type="email" class="inputs" id="email" placeholder="등록된 이메일 입력" name="email" required="required">
            </div>
        </form>
    </div>
    <div class="buttonBox">
        <button type="button" class="btn submitBtn" onclick="findPasswordByIdAndEmail()">찾기</button>
        <button type="button" class="btn cancelBtn" onclick="gotoLogin()">취소</button>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
<script type="text/javascript">
    function findPasswordByIdAndEmail() {
        document.getElementById("findForm").submit();
    }
    function gotoLogin() {
        location.href = "./login.jsp";
    }
</script>
</body>
</html>