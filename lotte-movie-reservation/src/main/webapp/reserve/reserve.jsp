<%@ page import="java.util.Calendar" %>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%--
  Created by IntelliJ IDEA.
  User: BTC-N10
  Date: 2022-07-08
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ReserveView</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        /* Noto Sans KR 폰트 */
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

        body {
            font-family: "Noto Sans KR", sans-serif;
        }

        #container {
            width: 100%;
        }

        /* 일주일 일정 CSS */
        .showtimeform {
            margin: auto;
            width: 700px;
        }

        .calendarBtn {
            width: 90px;
            height: 70px;
            padding: 10px;
            border: 2px solid #262626;
            border-radius: 10px;
            background: white;
            color: #595959;
            /*font-family: "Noto Sans KR", sans-serif;*/
            cursor: pointer;
        }

        .calendarBtn:focus {
            border: 2px solid #262626;
            background-color: #262626;
            color: white;
        }

        .monthdayofweekform {
            float: left;
        }

        a {
            text-decoration: none;
            /*color : #595959;*/
        }

        .dayfont {
            padding: 0;
            margin-left: 5px;
            font-size: 30px;
            font-weight: bold;
            /*color : #595959;*/
        }

        /* 구분선 */
        .boldhr {
            width: auto;
            border: 2px solid #262626;
        }

        .thinhr {
            width: auto;
            border: 1px solid #262626;
        }

        /* 설명글 */
        .infotext {
            color: #FF243E;
        }

        /* 영화 내용 */
        .timetableform {
            margin-left: 20px;
        }

        /* 전체 이용가 */
        .age_gradeAll {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #03953F;
            color: white;
        }

        /* 12세 이용가 */
        .age_grade12 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #1468B3;
            color: white;
        }

        /* 15세 이용가 */
        .age_grade15 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #FDB934;
            color: white;
        }

        /* 19세 이용가 */
        .age_grade19 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #B0063A;
            color: white;
        }

        /* 영화 상영 시간표 */
        .goReserveBtn {
            width: 80px;
            height: 60px;
            padding: 10px;
            border: 1px solid #595959;
            border-radius: 10px;
            background: white;
            color: #262626;
            font-weight: bold;
            /*font-family: "Noto Sans KR", sans-serif;*/
            cursor: pointer;
        }

        /* 영화 제목 */
        .movie_title {
            margin: 0;
            margin-right: 5px;
            padding: 0;
            float: left;
        }

        /* 상영중 */
        .isscreenfont {
            margin: 0;
            padding: 0;
            border: 1px solid royalblue;
        }

        /* 잔여 좌석 */
        .seatsfont {
            padding: 0;
            margin-left: 5px;
        }

        .redbox {
            margin-top: 20px;
            background-color: #e60012;
            color: white;
            text-align: center;
        }

        .reservebox {
            margin-top: 10px;
            margin-left: 20px;
            margin-right:20px;
            padding: 10px;
        }

        .reserve {
            margin-left: 400px;
            margin-bottom: 10px;
            padding: 5px;
            border: none;
            border-radius: 5px;
            background-color: #e60012;
            color: #ffffff;
        }

        .reserve:hover {
            color: #e60012;
            background-color: #ffffff;
            border: #E60012 1px solid;
        }

    </style>
</head>
<%-- 일주일 일정 --%>
<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH) + 1;
    int day = cal.get(Calendar.DATE);
    int lastday = cal.getActualMaximum((Calendar.DAY_OF_MONTH));
    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
%>
<body>
<jsp:include page="../front/header.jsp"/>
<div id="container">
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
            <a href="#" id="geTheaterDetail(<%=year%>, <%=month%>, <%=day%>)">
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
        </div>
        <br/>
    </div>
    <jsp:include page="../front/footer.jsp"/>
    <script type="text/javascript">
        $(document).ready(function () {
            getMovieData(<%=year%>, <%=month%>, <%=day%>);
        })

        function getMovieData(year, month, day) {
            $.ajax({
                url: "<%=request.getContextPath()%>/reserve?param=reservedata",
                data: {'year': year, 'month': month, 'day': day},
                method: "GET",
                success: function (data) {
                    let idx = 1;
                    let html = "";
                    let prev = '';
                    for (let i = 0; i < data.list.length; i++) {
                        let date = data.list[i].theaterDetailStandardDate;
                        date = date.split(" ")[0];
                        date = date.split("-");
                        if (prev != data.list[i].movieTitle) {
                            if (prev != '') {
                                html += "<hr class='thinhr'>"
                            }
                            let age = data.list[i].ageGrade.split("세");
                            if (age.length < 2) {
                                html += "<div class='age_gradeAll'>" + data.list[i].ageGroup + "</div>"
                            } else if (data.list[i].ageGrade == "청소년관람불가") {
                                html += "<div class='age_grade19'>" + data.list[i].ageGroup + "</div>"
                            } else if (data.list[i].ageGrade == "미정") {
                                html += "<div class='age_gradeNone'>//</div>"
                            } else
                                html += "<div class='age_grade" + age[0] + "'" + age[0] + "><span align='center'>" + age[0] + "</span></div><div><span style='color: black'>" + data.list[i].ageGrade + "</span></div>"

                            html += "<div><h3 class='movie_title'>" + data.list[i].movieTitle + "</h3><font class='isscreenfont' style='color: royalblue;'>상영중</font></div>"

                            html += "<p class='movieinfo'>" + data.list[i].movieCategory.replaceAll("/", ", ") + "&nbsp;/&nbsp;" + data.list[i].movieTime + "분&nbsp;/&nbsp;" + data.list[i].theaterDetailStandardDate.replaceAll("-", ".").split(" ")[0] + "&nbsp;개봉</p>";
                        }
                        prev = data.list[i].movieTitle;
                        let modalId = idx;
                        if (modalId.length < 2)
                            modalId = "0" + idx;
                        idx++;
                        html += "<button type='submit' class='goReserveBtn' onclick=\"document.getElementById(\'id" + modalId + "\').style.display=\'block\'\" class='w3-button w3-black'><strong>" + data.list[i].theaterDetailTime + "</strong><br/>" +
                            "<font class='seatsfont' style='color: royalblue;'>" + data.list[i].theaterDetailRemainSeats + "석</font></button>&nbsp;&nbsp;&nbsp;"
                        html += "<div id='id" + modalId + "' class='w3-modal'>" +
                            "<div class='w3-modal-content w3-animate-zoom'>" +
                            "<div class='w3-container reservebox''>" +
                            "<div class='redbox'>예약 정보</div>" +
                            "<input type=\"hidden\" name=\"movieNo\" value=\"movieNo\">" +
                            "<table id='" + data.list[i].movieNo + "'>" +
                            "<tr>" +
                            "<th align='left'>영화제목</th>" +
                            "<td>| " + data.list[i].movieTitle + "</td>" +
                            "</tr>" +
                            "<tr>" +
                            "<th align='left'>날짜</th>" +
                            "<td>| " + date[0] + "년 " + month + "월 " + day + "일 " + "</td>" +
                            "</tr>" +
                            "<tr>" +
                            "<th align='left'>시간</th>" +
                            "<td>| " + data.list[i].theaterDetailTime + "</td>" +
                            "</tr>" +
                            "<tr><th align='left'>인원수</th><td>| 성인 <input style='width: 50px\' type='number' value='0'> 명 청소년 <input style='width: 50px\' type='number' value='0'> 명<br/></td></tr>" +
                            "<tr><th align='left'>결제 방식&nbsp;&nbsp;&nbsp;</th><td>| <input type='radio' name='radio' id='pay" + modalId + "'>&nbsp;현장에서 결제</td><br/>" +
                            "<tr><td colspan='2'><button type='button' class='reserve'>예약</button></td></tr>" +
                            "</table>" +
                            "<span onclick=\"document.getElementById(\'id" + modalId + "\').style.display=\'none\'\" class='w3-button w3-display-topright'>&times;</span>" +
                            "</div>" +
                            "</div>" +
                            "</div>";

                    }
                    html += "<br/><br/><hr class='thinhr'>"
                    $('.timetableform').append(html);
                },
                error: function () {
                    console.log("ERR");
                }
            })
        }

        $(document).on('click', 'button.calendarBtn', function () {
            $(".timetableform").empty();
            let child = $(this).children();
            let year = 2022;
            let month = child[0].innerText.split("월")[0];
            let day = child[1].innerText;
            getMovieData(year, month, day);
        })
        $(document).on("click", "button.reserve", function () {

            let parent = $(this).closest('table');

            let thisButton = parent.children().children()[4].lastChild.childNodes[0].checked;
            if (thisButton == false) {
                alert('결제방식을 선택해주세요');
                return;
            }
            let adult = parent.children().children()[3].lastChild.childNodes[1].value;
            let child = parent.children().children()[3].lastChild.childNodes[3].value;
            if (adult == 0 && child == 0 || adult < 0 || child < 0) {
                alert("인원수가 잘못되었습니다.");
                return;
            }
            <%
                Object obj = session.getAttribute("login");
                UserDto mem = null;
                if (obj == null) {
            %>
            alert('로그인 해 주십시오');
            location.href = "/user?param=login";
            return;
            <%
                }
            %>

            var date = parent.children().children()[1].lastChild.innerHTML;
            console.dir(date.split(" "));
            let data = {
                movieNo: parent.attr('id'),
                movieTitle: parent.children().children()[0].lastChild.innerHTML.split("| ")[1],
                year: date.split(" ")[1].substring(0, 4),
                month: date.split(" ")[2].substring(0, 2),
                day: date.split(" ")[3].substring(0, 2),
                theaterTime: parent.children().children()[2].lastChild.innerHTML.split("| ")[1],
                adult: parent.children().children()[3].lastChild.childNodes[1].value,
                child: parent.children().children()[3].lastChild.childNodes[3].value
            }
            console.dir(data);
            $.post("<%=request.getContextPath()%>/reserve?param=reservedetail", data)
                .done(function (data) {
                    console.log(data);
                    if(data.result == 0) {
                        alert("예매할 수 없습니다.");
                        parent.children().children()[3].lastChild.childNodes[1].value = 0;
                        parent.children().children()[3].lastChild.childNodes[3].value = 0
                        return;
                    }
                    else {
                        alert("예매 완료되었습니다.");
                        location.href = "/movie?param=list"
                    }
                }).fail(function () {
                    alert("예매에 실패했습니다.");
            })
        })
    </script>
</body>
</html>