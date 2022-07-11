<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/styles.css">
    <title>아이디 찾기</title>
    <script type="text/javascript">
        function findIdByNameAndEmail(){
            document.getElementById("findForm").submit();
        }
    </script>
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container">
    <div class="card-body">
        <h3 class="card-title">아이디 찾기</h3>
        <form class="was-validated" action="FindIdController" method="post" id="findForm">
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" class="form-control" id="name" placeholder="등록된 이름 입력" name="name" required="required" >
            </div>
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" class="form-control" id="email" placeholder="등록된 이메일 입력"  name="email" required="required" >
            </div>
        </form>
    </div>
    <div class="align-center">
        <a class="btn btn-info" onclick="findIdByNameAndEmail()">찾기</a>
        <a href="login.jsp" class="btn btn-danger">취소</a>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>