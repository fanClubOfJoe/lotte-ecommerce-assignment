<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

  <style type="text/css">
    .center{
      margin: auto;
      width: 60%;
      border: 3px solid #00ff00;
      padding: 10px;
    }
  </style>

</head>
<body>

<h2>login page</h2>

<div class="center">

  <form action="<%=request.getContextPath() %>/user?param=loginAf" method="post">

    <table border="1">
      <tr>
        <th>아이디</th>
        <td>
          <input type="text" id="id" name="id" size="20"><br>
          <div class="form-group form-check">
            <label class="form-check-label" for="rememberID"><input class="form-check-input" type="checkbox" name="rememberID" id="rememberID">id 저장</label>
          </div>
        </td>
      </tr>
      <tr>
        <th>패스워드</th>
        <td>
          <input type="password" name="pwd" size="20">
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <input type="submit" value="로그인">
          <a href="<%=request.getContextPath() %>/user?param=regi">회원가입</a>
          <a href="<%=request.getContextPath() %>/user?param=findId">아이디찾기</a>
          <a href="<%=request.getContextPath() %>/user?param=findPwd">비밀번호찾기</a>
        </td>
      </tr>

    </table>

  </form>
</div>

<script type="text/javascript" src="js/login.js"></script>

</body>
</html>



