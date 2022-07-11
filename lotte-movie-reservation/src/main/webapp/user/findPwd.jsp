<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/styles.css">
  <script type="text/javascript">
    function findPasswordByIdAndEmail(){
      document.getElementById("findForm").submit();
    }
  </script>
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container">
  <div class="card-body">
    <h3 class="card-title">비밀번호 찾기</h3>
    <form class="was-validated" action="FindPwdController" method="post" id="findForm">
      <div class="form-group">
        <label for="userId">아이디:</label>
        <input type="text" class="form-control" id="userId" placeholder="등록된 아이디 입력" name="userId" required="required" >
      </div>
      <div class="form-group">
        <label for="email">이메일:</label>
        <input type="email" class="form-control" id="email" placeholder="등록된 이메일 입력"  name="email" required="required" >
      </div>
    </form>
  </div>
  <div class="align-center">
    <a class="btn btn-info" onclick="findPasswordByIdAndEmail()">찾기</a>
    <a href="login.jsp" class="btn btn-danger">취소</a>
  </div>
</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>