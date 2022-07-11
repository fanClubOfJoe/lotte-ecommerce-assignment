<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    MovieDao movieDao = MovieDao.getInstance();
    List<MovieDto> movieList = movieDao.getMovieListTop5();
    pageContext.setAttribute("movieList", movieList);
%>
<html>
<head>
    <title>MainView</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        .movieListBox{
            width: 920px;
            margin: 10px auto;
            align-items:center;
            display: flex;
            justify-content:center;
        }
        .movieBox{
            display: inline-block;
            width: 180px;
            height: 365px;
            padding: 5px;
            position: relative;
        }
        .moviePoster{
            width: 170px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        #movieTitle {
            color: black;
            font-size: 16px;
            font-weight: 900;
        }


        /* 연령 */
        /* 전체 이용가 */
        .age_gradeAll{
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #03953F;
            color: white;
            display: inline-block;
        }

        /* 12세 이용가 */
        .age_grade12 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #1468B3;
            color: white;
            display: inline-block;
        }

        /* 15세 이용가 */
        .age_grade15 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #FDB934;
            color: white;
            display: inline-block;
        }

        /* 19세 이용가 */
        .age_grade19 {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #B0063A;
            color: white;
            display: inline-block;
        }

        /* 미정 */
        .age_gradeNone {
            width: 25px;
            height: 25px;
            font-size: 16px;
            border-radius: 50%;
            background-color: #cccccc;
            color: white;
            display: inline-block;
        }

    </style>
</head>
<body>

<jsp:include page="../front/header.jsp"/>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/front/images/Thor.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/front/images/Che.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/front/images/Elv.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="movieListBox">
    <c:forEach var="movieDto" items="${movieList}">
        <div class="movieBox">
            <div>
                <img class="moviePoster" src="${movieDto.movieImg}" alt="No image"/>
            </div>
            <div>
                <c:choose>
                    <c:when test="${movieDto.ageGrade eq '전체'}">
                        <div class="age_gradeAll"><p align="center" style="margin-bottom: 0;">All</p></div>
                    </c:when>
                    <c:when test="${movieDto.ageGrade eq '12세 이상'}">
                        <div class="age_grade12"><p align="center" style="margin-bottom: 0;">12</p></div>
                    </c:when>
                    <c:when test="${movieDto.ageGrade eq '15세 이상'}">
                        <div class="age_grade15"><p align="center" style="margin-bottom: 0;">15</p></div>
                    </c:when>
                    <c:when test="${movieDto.ageGrade eq '청소년 관람불가'}">
                        <div class="age_grade19"><p align="center" style="margin-bottom: 0;">19</p></div>
                    </c:when>
                    <c:otherwise>
                        <div class="age_gradeNone"><p align="center" style="margin-bottom: 0;">-</p></div>
                    </c:otherwise>
                </c:choose>

                <a id="movieTitle" href="<%=request.getContextPath() %>/movie?param=detail&movieno=${movieDto.movieNo}">${movieDto.movieTitle}</a>
            </div>
            <div>
                <strong> 예매율 | </strong><c:out value="${movieDto.reserveRate}"/> %
            </div>
            <div>
                <strong> 평점 | </strong><c:out value="${movieDto.movieRate}"/>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../front/footer.jsp"/>

</body>
</html>