<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.TheaterDetailDto" %>
<%@ page import="com.example.lottemoviereservation.dao.ReserveDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: BTC-N10
  Date: 2022-07-08
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<h2>CGV강남</h2>
<hr>
<table>
    <tr>
        <th><a href="#" name="date">09</a></th>
    </tr>
</table>
<div id="container">
    동적으로 만든 테이블
</div>
<br/>
<script type="text/javascript">
$(document).ready(function() {
    let year = 2022;
    let month = 7;
    let day = 9;
    $.ajax({
        url: "<%=request.getContextPath()%>/reserve?param=reservedetail&year="+year+"&month="+month+"&day="+day,
        data: {},
        method: "GET",
        success:function(data) {
            var html = "<table>";
            html += "<tr><td>TEST</td></tr>";
            html += "</table>";
            $('#container').append(html);
            console.dir(data);
            JSONParser parser
            console.dir(data.parse());
        },
        error:function() {
            console.log("ERR");
        }
    })
})
</script>
</body>
</html>
