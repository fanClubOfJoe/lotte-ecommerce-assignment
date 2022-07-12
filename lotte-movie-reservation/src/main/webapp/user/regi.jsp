<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/styles.css">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>회원가입</h2>
        </div>
        <div class="card-body">
            <!-- onsubmit="return checkForm()" 삭제 -->
            <form action="<%=request.getContextPath() %>/user" method="post" id="form">
                <input type="hidden" id="flag" value="regiAf" name="param">
                <div class="form-group">
                    <label for="id">아이디:</label>
                    <input type="text" class="form-control" id="id" placeholder="아이디" name="id" required="required">
                    <p id="idcheck" style="font-size: 8px"></p>
                    <%-- style="width: 30%" --%>
                </div>
                <%--                <button type="button" class="btn btn-primary" onclick="checkId()">중복확인</button><br><br>--%>
                <input type="button" id="idBtn" value="중복확인">
                <div class="form-group">
                    <label for="pwd">비밀번호:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd"
                           size="15" maxlength="100" onkeyup="return passwordChanged()" required="required">
                    <span id="strength">Type Password</span>
                </div>

                <!-- <input name="password" id="password" type="text" size="15" maxlength="100" onkeyup="return passwordChanged();" /> -->

                <div class="form-group">
                    <label for="confirmPwd">비밀번호 확인:</label>
                    <input type="password" class="form-control" id="confirmPwd" placeholder="비밀번호확인" name="confirmPswd"
                           size="15" maxlength="100" onkeyup="return passwordMatch()"  required="required">
                    <span id="passMatch">Type Password</span>
                </div>
                <div class="form-group">
                    <%--@declare id="name"--%><label for="name">이름:</label>
                    <input type="text" class="form-control" placeholder="이름" name="name" required="required">
                </div>
                <div class="form-group">
                    <%--@declare id="email"--%><label for="email">이메일:</label>
                    <input type="text" class="form-control" placeholder="이메일주소" name="email" required="required">
                </div>
                <div class="form-group">
                </div>
            </form>
        </div><!— card body —>
        <%--        <%— footer div - form 밖으로 분리, js통해 submit —%>--%>
        <div class="card-footer">
            <button type="submit" class="btn btn-success" onclick="formSubmit()">가입하기</button><br><br>
        </div>
    </div><!— card class —>
</div><!—container class—>
<jsp:include page="../front/footer.jsp"/>

<script type="text/javascript">
    $(function () {
        $("#idBtn").click(function () {
            $.ajax({
                type:"post",
                url:"./idcheck.jsp",
                data:{ "id":$("#id").val() },
                success:function( data ){
                    if(data.trim() === "YES"){
                        $("#idcheck").css("color", "#0000ff");
                        $("#idcheck").html('사용할 수 있는 id입니다');
                    }
                    else if(data.trim() === ""){
                        $("#idcheck").css("color", "#ff0000");
                        $("#idcheck").html('아이디를 입력해주세요.');
                        $("#id").val("");
                    }
                    else{
                        $("#idcheck").css("color", "#ff0000");
                        $("#idcheck").html('사용 중인 id입니다');
                        $("#id").val("");
                    }
                },
                error:function(){
                    alert("error");
                }
            });

        });

    });
    function checkForm() {
        if(document.getElementById("pwd").value !== document.getElementById("confirmPwd").value) {
            alert("패스워드가 일치하지 않습니다!");
            return false;
        }
        // if(document.getElementById("flag").value != document.getElementById("id").value) {
        //     alert("인증받은 아이디가 아닙니다 \n아이디 중복확인하세요");
        //     return false;
        // }
    }
    function checkId() {
        let memberId = document.getElementById("id");
        if(memberId.value === "") {
            alert("아이디를 입력하세요!");
            memberId.focus();
        }else {
            window.open("IdCheckServlet?id=" + memberId.value, "idcheckpopup", "width=250, height=150, top=150, left=400");
        }
    }
    function formSubmit() {
        let result = checkForm();
        if(result === false) {
            return false;
        } else {
            alert("회원가입이 완료되었습니다. \n홈페이지로 돌아갑니다.");
            document.getElementById("form").submit();
        }
    }
    function passwordMatch() {
        var match = document.getElementById('passMatch');
        var pswd = document.getElementById("confirmPwd");
        var pwd = document.getElementById("pwd");
        if(pswd.value.length === 0) { //')' token error duplicate, syntax error 발생지점
            match.innerHTML = 'Type Password';
        } else if (pwd.value ===  pswd.value) {
            match.innerHTML = '<span style="color:green">비밀번호 확인완료!</span>';
        } else {
            match.innerHTML = '<span style="color:red">비밀번호가 일치하지 않습니다!</span>';
        }
    }
    function passwordChanged() {
        var strength = document.getElementById('strength');
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[a-zA-Z])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        var pwd = document.getElementById("pwd");
        if (pwd.value.length === 0) {
            strength.innerHTML = 'Type Password';
        } else if (false === enoughRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:red">길이가 짧습니다!</span>';
        } else if (strongRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:green">Strong!</span>';
        } else if (mediumRegex.test(pwd.value)) {
            strength.innerHTML = '<span style="color:orange">Medium!</span>';
        } else {
            strength.innerHTML = '<span style="color:rosybrown">Weak!</span>';
        }
    }
</script>

</body>
</html>





