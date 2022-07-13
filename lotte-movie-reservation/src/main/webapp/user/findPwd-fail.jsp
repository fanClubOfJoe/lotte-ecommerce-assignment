<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="css/findResultPage.css">
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="containerBox">
    <div class="resultBox">
        <div class="textBox">
            <h4>등록된 정보가 없습니다.</h4>
        </div>
        <a class="btn moveBtn" href="findPwd.jsp">다시찾기</a>
        <a class="btn cancelBtn" href="login.jsp">돌아가기</a>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>