<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>아이디 찾기</title>
    <%--    <link rel="stylesheet"--%>
    <%--          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">--%>
    <%--    <script--%>
    <%--            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>--%>
    <%--    <script--%>
    <%--            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>
    <%--    <script--%>
    <%--            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="findBox">
    <div class="titleBox">
        <h1>아이디 찾기</h1>
    </div>
    <div class="outerInputBox">
        <form action="FindIdController" method="post" id="findForm">
            <div class="innerInputBox">
                <label for="name">이름 :</label>
                <input class="inputs" type="text" id="name" placeholder="등록된 이름 입력" name="name" required="required">
            </div>
            <div class="innerInputBox">
                <label for="email">이메일 :</label>
                <input class="inputs" type="email" id="email" placeholder="등록된 이메일 입력" name="email" required="required">
            </div>
        </form>
    </div>
    <div class="buttonBox">
        <button type="button" class="btn submitBtn" onclick="findIdByNameAndEmail()">찾기</button>
        <button type="button" class="btn cancelBtn" onclick="gotoLogin()">취소</button>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>

<script type="text/javascript">
    function findIdByNameAndEmail() {
        document.getElementById("findForm").submit();
    }
    function gotoLogin() {
        location.href = "./login.jsp";
    }
</script>
</body>
</html>