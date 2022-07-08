<%@ page import="com.example.lottemoviereservation.dao.UserDao"%>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String loginmsg = request.getParameter("loginmsg");
    int no = Integer.parseInt(request.getParameter("user_no"));
    String id = request.getParameter("user_id");
    String name = request.getParameter("user_name");
%>
<body>

<%

    UserDto user = new UserDto(no, id, name);

%>
<%
    if(loginmsg.equals("loginSuccess")){
        session.setAttribute("login", user);
        session.setMaxInactiveInterval(60 * 60 * 2);


%>
<script type="text/javascript">
    alert("안녕하세요. <%=user.getUserName() %>님");
    location.href = "user?param=bbslist";
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