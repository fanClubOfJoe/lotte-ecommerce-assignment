<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 찾기</title>
  <link rel="stylesheet" href="css/findResultPage.css">
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<% String id = (String) request.getAttribute("user_id"); %>
<div class="containerBox">
  <div class="resultBox">
    <div class="textBox">
      <p> 회원님의 아이디는 <strong><%=id %></strong> 입니다.</p>
    </div>
    <a class="btn moveBtn" href="findPwd.jsp">비밀번호찾기</a>
    <a class="btn cancelBtn" href="login.jsp">돌아가기</a>
  </div>
</div>

<jsp:include page="../front/footer.jsp"/>
</body>
</html>