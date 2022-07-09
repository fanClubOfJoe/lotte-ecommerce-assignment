<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int movieno = Integer.parseInt(request.getParameter("movieno"));

    MovieDao dao = MovieDao.getInstance();
    MovieDto dto = dao.getMovieByMovieNo(movieno);
    pageContext.setAttribute("dto", dto);
%>
<html>
<head>
    <title>Movie Detail</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .moviePoster {
            width: 200px;
            height: auto;
        }

        .movieTitle {
            font-size: 25px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <input type="hidden" id="movieNo" name="movieNo" value="${dto.movieNo}">
    <div>
        <img class="moviePoster" src="${dto.movieImg}" alt="No image"/>
    </div>
    <div class="movieTitle">
        ${dto.movieTitle}</div>
    <div>
        ${dto.ageGrade}</div>
    <div>
        <strong> 평점 | </strong> ${dto.movieRate}</div>
    <div>
        <strong> 장르 | </strong> ${dto.movieCategory}</div>
    <div>
        <strong>${dto.movieSummary}</strong></div>
    <div>
    <div>
        ${dto.movieContent}</div>
    <div>
        <strong> 상영 시간 | </strong>${dto.movieTime}</div>
    <div>
        <strong> 예매율 | </strong>${dto.reserveRate}</div>

</div>
</body>
</html>
