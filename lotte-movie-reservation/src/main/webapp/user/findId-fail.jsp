<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container">
    <div class="card-body">
        <div class="align-center">
            <h4>등록된 정보가 없습니다.</h4>
            <a class="btn btn-info" href="findId.jsp">다시찾기</a>
            <a href="login.jsp" class="btn btn-danger">취소</a>
        </div>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>