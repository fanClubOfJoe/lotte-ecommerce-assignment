<%@ page import="com.example.lottemoviereservation.dao.UserDao"%>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String loginmsg = request.getParameter("loginmsg");
%>
<body>

<%

    UserDao dao = UserDao.getInstance();

    UserDto user = dao.login(new UserDto(0, id, pwd, null, null));

%>
<%
    if(loginmsg.equals("loginSuccess")){
        session.setAttribute("login", user);
        session.setMaxInactiveInterval(60 * 60 * 2);


%>
<script type="text/javascript">
    alert("안녕하세요. <%=user.getUserName() %>님");
    // location.href = "user?param=bbslist";
</script>
<%
}
else{
%>
<script type="text/javascript">
    alert("아이디나 패스워드를 찾을 수 없습니다.");
    location.href = "member?param=login";
</script>


<%
    }
%>


</body>
</html>