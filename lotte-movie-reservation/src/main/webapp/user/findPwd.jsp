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

    <script type="text/javascript">
        function findPasswordByIdAndEmail() {
            document.getElementById("findForm").submit();
        }
    </script>

</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="findIdBody">
    <div class="findId_box member_findId_wrap contents_inner">
        <div id="div0">
            <h2 class="center">비밀번호 찾기</h2>
        </div>
        <div class="login_area login_input" id="div1">
            <form class="was-validated" action="FindPwdController" method="post" id="findForm">

                    <label for="userId">아이디:</label>
                    <input type="text" class="login_input" id="userId" placeholder="등록된 아이디 입력" name="userId"
                           required="required">
                    <br>
                    <label for="email">이메일:</label>
                    <input type="email" class="email_input" id="email" placeholder="등록된 이메일 입력" name="email"
                           required="required">

            </form>
        </div>
        <div class="align-center" id="div2">
            <btn class="btnRed btn" onclick="findPasswordByIdAndEmail()">찾기</btn>
            <btn href="login.js" class="btn btnCancel">취소</btn>
        </div>
    </div>
</div>
</body>
</html>