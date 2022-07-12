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
<% String password = (String) request.getAttribute("password"); %>
<div class="containerBox">
    <div class="resultBox">
        <div class="textBox">
            <p> 회원님의 비밀번호 &nbsp;<strong><%=password %></strong> 입니다.</p>
        </div>
        <a class="btn cancelBtn" href="login.jsp">돌아가기</a>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>