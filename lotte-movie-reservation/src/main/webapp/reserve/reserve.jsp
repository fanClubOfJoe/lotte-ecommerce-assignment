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
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- JavaScript Bundle with Popper -->
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

</div>
<br/>
<script type="text/javascript">
$(document).ready(function() {
    let year = 2022;
    let month = 7;
    let day = 9;
    let title;
    $.ajax({
        url: "<%=request.getContextPath()%>/reserve?param=reservedata",
        data: { 'year': year, 'month': month, 'day': day},
        method: "GET",
        success:function(data) {
            console.dir(data.list[0]);
            let html = "<table>";
            for(let i = 0; i < data.list.length; i++) {
                let date = data.list[i].theaterDetailStandardDate;
                date = date.split(" ")[0];
                date = date.split("-");
                html += "<tr class='reserve'>" +
                    "<td class='title'>" +
                    data.list[i].movieTitle +
                    "</td>" +
                    "<td class='theaterno'>" +
                    data.list[i].theaterDetailNo +
                    "</td>" +
                    "<td class='remainseats'>" +
                    data.list[i].theaterDetailRemainSeats + " / " +
                    data.list[i].theaterDetailSeats +
                    "</td>" +
                    "<td class='date'>" +
                    date[0] + "년 " + date[1] + "월 " + date[2] + "일 " +
                    "</td>" +
                    "<td class='detailtime'>" +
                    data.list[0].theaterDetailTime +
                    "</td>" +
                    "<td><button onclick=\"document.getElementById(\'id01\').style.display=\'block\'\" class='w3-button w3-black'>예매하기</button>" +
                        "<div id='id01' class='w3-modal'>"+
                            "<div class='w3-modal-content w3-animate-zoom' style='width:400px'>"+
                                "<div class='w3-container''>"+
                                    "<input type=\"hidden\" name=\"movieNo\" value=\"movieNo\">"+
                                        "<table>"+
                                        "<tr>"+
                                        "<th>영화제목</th>"+
                                        "<td>"+data.list[i].movieTitle+"</td>"+
                                    "</tr>"+
                                        "<tr>"+
                                            "<th>날짜</th>"+
                                            "<td>"+date[0] + "년 " + date[1] + "월 " + date[2] + "일 " +"</td>"+
                                        "</tr>"+
                                        "<tr>"+
                                            "<th>시간</th>"+
                                            "<td>"+data.list[0].theaterDetailTime+"</td>"+
                                        "</tr>"+
                                    "</table>" +
                                    "성인 <input style='width: 50px\' type='number' value='0'> 명 청소년 <input style='width: 50px\' type='number' value='0'> 명<br/>"+
                                    "현장에서 결제 <input type='radio' id='pay'><br/><button type='button' class='reserve'>TEST</button>" +
                                    "<span onclick=\"document.getElementById(\'id01\').style.display=\'none\'\" class='w3-button w3-display-topright'>&times;</span>"+
                                "</div>"+
                            "</div>"+
                        "</div>" +
                    "</td>"+

                    "</tr>";
                html += "</table>";
                $('#container').append(html);
            }
        },
        error:function() {
            console.log("ERR");
        }
    })
})
$(document).on("click", "button.reserve", function() {
    let parents = $(this).closest('tr');
    let children = parents.children();
    let data = {
        movieTitle: children[0].innerHTML,
        year: children[3].innerHTML.split(" ")[0],
        month: children[3].innerHTML.split(" ")[1],
        day: children[3].innerHTML.split(" ")[2],
        time: children[4].innerHTML
    }
    $.post("<%=request.getContextPath()%>/reserve?param=reservedetail", data)
    .done(function(data) {
        console.log(data);
    }).
    fail(function() {
        console.log("ERR");
    })
})
</script>
</body>
</html>