<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <style type="text/css">
        .center {
            margin: auto;
            width: 60%;
            padding: 10px;
        }
    </style>

</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="everything">
    <div class="member_login_wrap">
        <div class="contents_inner">
            <div class="login_box">
                <div class="titleBox">
                    <h1>로그인</h1>
                </div>

                <form action="<%=request.getContextPath() %>/user?param=loginAf" method="post">
                    <div class="login_area">
                        <div class="login_input">
                            <input type="text" id="id" name="id" maxlength="50" placeholder="아이디를 입력해 주세요"><br>

                            <input type="password" name="pwd" maxlength="15" placeholder="비밀번호를 입력해 주세요">
                        </div>
                        <input type="hidden" name="hidLoginType" id="hidLoginType" value="">

                        <%--      <input type="submit" value="로그인">--%>
                        <button type="submit" class="btn_login">로그인</button>


                    </div>
                </form>

                <div class="login_bot_wrap">
                    <label class="form-check-label" for="rememberID"><input class="check_box" type="checkbox"
                                                                            name="rememberID" id="rememberID">아이디
                        저장</label>
                    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    <a href="<%=request.getContextPath() %>/user?param=regi" style="text-decoration-line: none">회원가입</a> &nbsp |  &nbsp
                    <a href="<%=request.getContextPath() %>/user?param=findId" style="text-decoration-line: none">아이디찾기</a> &nbsp |  &nbsp
                    <a href="<%=request.getContextPath() %>/user?param=findPwd" style="text-decoration-line: none">비밀번호찾기</a>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
<script type="text/javascript" src="js/login.js"></script>

</body>
</html>


