<%@ page import="com.example.lottemoviereservation.dao.UserDao" %>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>
<%@ page import="com.example.lottemoviereservation.dao.ReserveDao" %>
<%@ page import="com.example.lottemoviereservation.dto.ReserveDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieTitleDto" %>
<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int userNo = Integer.parseInt(request.getParameter("userno"));
    UserDao userDao = UserDao.getInstance();
    UserDto userDto = userDao.getUserByUserNo(userNo);

    pageContext.setAttribute("userDto", userDto);

    ReserveDao reserveDao = ReserveDao.getInstance();
    MovieDao movieDao = MovieDao.getInstance();

    List<ReserveDto> reserveList = reserveDao.getReserveDtoByUserNo(userNo);
    List<MovieTitleDto> movieTitleList = movieDao.getMovieTitleByReserve(reserveList);

    pageContext.setAttribute("reserveList", reserveList);
    pageContext.setAttribute("movieTitleList", movieTitleList);
%>
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

        .userName {
            margin-top: 40px;
            margin-bottom: 10px;
            padding: 0;
            font-weight: bold;
            color: #262626;
        }

        .userEmail {
            margin: 0;
            padding: 0;
            /*margin-left: 20px;*/
            color: #595959;
            float: left;
        }

        /* ?????? */
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

        /* ?????? ?????? */
        .text_box {
            margin-top: 20px;
            background-color: #E60012;
            color: white;
            border: none;
            height: 50px;
            padding: 10px;
        }


        /* ????????? */
        .boldhr {
            width: auto;
            border: 2px solid #262626;
        }

        .thinhr {
            width: auto;
            border: 1px solid #262626;
        }

        .starContainer {
            display: flex;
            justify-content: center;
            font-size: 50px;
        }

        .nonStar {
            color: #cbcbcb;
        }

        .reviewStarContainer {
            display: flex;
        }

        .reviewContentContainer {
            display: flex;
            justify-content: space-between;
        }

        .btnDefault {
            border: none;
            color: #595959;
            background-color: #f8f8f8;
        }

        .btnMore {
            border: none;
            color: #595959;
            background-color: #ffffff;
            width: 100%;
        }

        .btnMore:hover {
            border: none;
            background-color: #595959;
            color: #ffffff;
        }

        .star {
            color: #fc0;
        }
    </style>
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container">
    <div class="userinfo">
        <div class="data">
            <table>
                <col width="700">
                <col width="300">
                <tr>
                    <td>
                        <div id="userimgwithinfo">
                            <img src="/image/profile.png" class="userimg">
                            <div>
                                <input type="hidden" name="userNo" value="${userDto.userNo}"/>
                                <div class="userName">${userDto.userName}
                                </div>
                                <div class="userEmail">${userDto.userEmail}
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="userbutton">
                            <input type="button" class="editinfoBtn" onclick="location.href='<%=request.getContextPath()%>/user?param=updateUser'" value="?????? ??????">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="leaveBtn" onclick="location.href='<%=request.getContextPath()%>/user?param=deleteId'" value="?????? ??????">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="reserve_list">
        <div class="text_box">?????? ??????</div>
        <br>
        <div>
            <table class="table table-hover">
                <%
                    /* ????????? ????????? ??? */
                    String movie_date = "";
                    String movie_detail_time = "";
                    String movie_title = "";
                    String theater_name = ""; // ?????? ?????? ????????? ?????? ???
                    int seatsCount = 0;

                    movie_date = "2022-07-19";
                    movie_detail_time = "13:00";
                    movie_title = "?????? - ?????? ??? ??????";
                    theater_name = "CGV ??????";
                    seatsCount = 2;
                %>
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <%--    <th scope="col">????????????</th>--%>
                    <th scope="col">????????????</th>
                    <th scope="col">?????? ??????</th>
                    <th scope="col">???????????????</th>
                    <th scope="col">?????? ?????? ???</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="reserveDto" items="${reserveList}" varStatus="status">
                    <tr>
                        <th scope="row">${status.index+1}</th>
                        <td>${reserveDto.reserveTime}</td>
                        <td>${movieTitleList[status.index].movieTitle}</td>
                        <td><%=String.format("%s", theater_name)%>
                        </td>
                        <td>${reserveDto.reserveEnterCount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="text_box">?????? ??? ??????</div>
        <div class="reviewContainer">
            <div class="listReview"></div>
        </div>
        <%@ include file="review.jsp" %>
    </div>

</div>
<jsp:include page="../front/footer.jsp"/>
</body>
</html>
