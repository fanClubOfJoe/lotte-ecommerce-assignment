<%@ page import="java.util.Calendar" %>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-08
  Time: 오후 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ReserveView</title>
</head>
<body>

<%-- 일주일 일정 --%>
<%
    Calendar cal = Calendar.getInstance();
    cal.set(Calendar.DATE, 30);
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH) + 1;
    int day = cal.get(Calendar.DATE);
    int lastday = cal.getActualMaximum((Calendar.DAY_OF_MONTH));
    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

%>
<div class="showtimeform">
    <hr class="boldhr">
    <div class="calendarform" align="center">

        <%
            String dayOfWeekString = "";
            int count = 1;
            int i = day;
        %>
        <%
            while (count < 8) {
        %>
        <%
            switch (dayOfWeek) {
                case 1:
                    dayOfWeekString = "일";
                    break;
                case 2:
                    dayOfWeekString = "월";
                    break;
                case 3:
                    dayOfWeekString = "화";
                    break;
                case 4:
                    dayOfWeekString = "수";
                    break;
                case 5:
                    dayOfWeekString = "목";
                    break;
                case 6:
                    dayOfWeekString = "금";
                    break;
                case 7:
                    dayOfWeekString = "토";
                    break;
            }
        %>
        <a href="param=reservedetail&year=?&month=?&day=?">
            <button type="submit" class="calendarBtn">
                <div class="monthdayofweekform">
                    <%=String.format("%d월", month)%>
                    <br>
                    <%=String.format("%s", dayOfWeekString)%>
                </div>
                <font class="dayfont"><%=String.format("%d", i)%>
                </font>
            </button>
        </a>
        <%
            if (i == lastday) {
                month = month + 1;
                i = 1;
            } else {
                i++;
            }
            ;
            dayOfWeek++;
            dayOfWeek = dayOfWeek % 7;
            count++;
        %>
        <%
            }
        %>

    </div>
    <hr class="boldhr">
    <p class="infotext">* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
    <hr class="thinhr">

    <%--영화별 예매--%>
    <div class="timetableform">
        <br>
        <%-- 영화 데이터 들어올 곳 --%>
        <%
            String movie_title = "";
            movie_title = "토르 - 러브 앤 썬더";
        %>
        <div class="age_grade15"><p align="center">15</p></div>
        <div>
        <h3 class="movie_title"><%=String.format("%s", movie_title)%></h3>
        <font class="isscreenfont" style="color: royalblue;"> 상영중</font>
        </div>
        <%
            /* 수정할 부분 */
            String movie_category = "";
            String movie_time = "";
            String movie_screen_date = "";

            movie_category = "액션, 어드벤처, 환타지";
            movie_time = "119분";
            movie_screen_date = "2022.07.06 개봉";
        %>
        <p class="movieinfo">
           <%=String.format("%s&nbsp;/&nbsp;%s&nbsp;/&nbsp;%s", movie_category, movie_time, movie_screen_date)%>
        </p>

        <%-- 예매 시간 데이터 들어올 곳 --%>
        <%-- 모달 띄우는 a href 추가 필요함 --%>
        <%
            /* 수정할 부분 */
            String theater_detail_time = "";
            int theater_detail_remain_seats = 0;

            theater_detail_time = "17:00";
            theater_detail_remain_seats = 180;

        %>
        <button type="submit" class="goReserveBtn">
                <strong><%=String.format("%s", theater_detail_time)%></strong>
            <font class="seatsfont"  style="color: royalblue;"><%=String.format("%d석", theater_detail_remain_seats)%>
            </font>
        </button>
        <br><br>
        <hr class="thinhr">
    </div>

</div>
</body>
</html>
