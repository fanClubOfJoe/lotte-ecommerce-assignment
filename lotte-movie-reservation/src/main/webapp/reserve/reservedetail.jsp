<%--
  Created by IntelliJ IDEA.
  User: BTC-N10
  Date: 2022-07-11
  Time: 오전 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reserve Detail</title>
</head>
<body>
<%--영화 디테일 정보--%>
<%
    String movieTitle = request.getParameter("movieTitle");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String time = request.getParameter("time");

%>
<div>
    <input type="hidden" name="movieNo" value="movieNo">
    <table>
        <tr>
            <th>영화제목</th>
            <td><%=movieTitle%></td>
        </tr>
        <tr>
            <th>날짜</th>
            <td><%=year%>년 <%=month%>월 <%=day%>일</td>
        </tr>
        <tr>
            <th>시간</th>
            <td><%=time%></td>
        </tr>
    </table>
</div>
</body>
</html>