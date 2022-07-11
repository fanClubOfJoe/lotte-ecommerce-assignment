<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-11
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyPage</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <style>
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

        body {
            font-family: "Noto Sans KR", sans-serif;
            margin: auto;
            padding: 0;
        }

        .userinfo {
            height: 150px;
            background-color: #F8F8F8;
            border-top: 2px solid #292929;
            border-bottom: 2px solid #292929;
        }

        .userimg {
            /*margin-top: 40px;*/
            margin-left: 50px;
            margin-right: 20px;
            width: 70px;
            height: 70px;
            float: left;
        }

        .user_name {
            margin-top: 40px;
            margin-bottom: 10px;
            padding: 0;
            font-weight: bold;
            color: #262626;
        }

        .useremail {
            margin: 0;
            padding: 0;
            /*margin-left: 20px;*/
            color: #595959;
            float: left;
        }

        /* 버튼 */
        .userbutton {
            margin-top: 40px;
            margin-right: 20px;
            padding: 20px;
        }

        .editinfoBtn {
            background-color: #595959;
            padding: 5px;
            color: white;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
        }

        .leaveBtn {
            background-color: #595959;
            padding: 5px;
            color: white;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
        }

        .editinfoBtn:hover {
            border: 1px solid #595959;
            background-color: white;
            color: #595959;
            border-radius: 0.25rem;
            cursor: pointer;
        }


        .leaveBtn:hover {
            border: 1px solid #595959;
            background-color: white;
            color: #595959;
            border-radius: 0.25rem;
            cursor: pointer;
        }

        /* 제목 박스 */
        .text_box {
            margin-top: 20px;
            background-color: #E60012;
            color: white;
            border: none;
            height: 50px;
            padding: 10px;
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

    </style>
</head>
<body>

<%-- 회원 정보 --%>
<%-- 데이터 들어갈 곳 --%>
<%
    String username = "";
    String useremail = "";
    username = "홍길동";
    useremail = "gildong_hong@lottecgv.com";
%>
<div class="container">
    <div class="userinfo">
        <div class="data">
            <table>
                <col width="700">
                <col width="300">
                <tr>
                    <td>
                        <div id="userimgwithinfo">
                        <img src="/main/images/user.png" class="userimg">
                        <div>
                            <div class="user_name"><%=String.format("%s님", username)%>
                            </div>
                            <div class="useremail"><%=String.format("%s", useremail)%>
                            </div>
                        </div>
                        </div>
                    </td>
                    <td>
                        <div class="userbutton">
                            <input type="button" class="editinfoBtn" value="정보 수정">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="leaveBtn" value="회원 탈퇴">
                        </div>
                    </td>
                </tr>
            </table>
        </div>

<%--        <img src="/main/images/user.png" class="userimg">--%>
<%--        <div class="username"><%=String.format("%s님", username)%>--%>
<%--        </div>--%>
<%--        <div class="useremail"><%=String.format("%s", useremail)%>--%>
<%--        </div>--%>

<%--        <div class="userbutton">--%>
<%--            <input type="button" class="editinfoBtn" value="정보 수정">--%>
<%--            <input type="button" class="leaveBtn" value="회원 탈퇴">--%>
<%--        </div>--%>
    </div>

    <div class="reserve_list">
        <div class="text_box">예매 목록</div>
        <br>
        <div>
            <table class="table table-hover">
                <%
                    /* 데이터 받아올 곳 */
                    String movie_date = "";
                    String movie_detail_time = "";
                    String movie_title = "";
                    String theater_name = ""; // 얘는 그냥 임의로 넣는 값
                    int seatsCount = 0;

                    movie_date = "2022-07-19";
                    movie_detail_time = "13:00";
                    movie_title = "토르 - 러브 앤 썬더";
                    theater_name = "CGV 강남";
                    seatsCount = 2;
                %>
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">관람일자</th>
                    <th scope="col">관람시간</th>
                    <th scope="col">영화 이름</th>
                    <th scope="col">상영영화관</th>
                    <th scope="col">예매 좌석 수</th>
                </tr>
                </thead>
                <tbody>

                <tr>
                    <th scope="row">1</th>
                    <td><%=String.format("%s", movie_date)%>
                    </td>
                    <td><%=String.format("%s", movie_detail_time)%>
                    </td>
                    <td><%=String.format("%s", movie_title)%>
                    </td>
                    <td><%=String.format("%s", theater_name)%>
                    </td>
                    <td><%=String.format("%d", seatsCount)%>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="text_box">내가 쓴 리뷰</div>
    </div>

</div>
</body>
</html>
