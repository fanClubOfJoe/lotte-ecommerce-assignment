<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // int movieno = Integer.parseInt(request.getParameter("movieno"));
    MovieDao dao = MovieDao.getInstance();
    MovieDto dto = dao.getMovieByMovieNo(1);
    pageContext.setAttribute("dto", dto);
%>
<html>
<head>
    <title>Movie Detail</title>
</head>
<body>
<div>
    <input type="hidden" id="movieNo" name="movieNo" value="${dto.movieNo}">
    <div>
        ${dto.movieTitle}</div>
    <div>
        ${dto.movieRate}</div>
    <div>
        ${dto.movieCategory}</div>
    <div>
        ${dto.movieContent}</div>
    <div>
        ${dto.movieTime}</div>
    <div>
        ${dto.movieImg}</div>
    <div>
        ${dto.movieScreenDate}</div>
    <div>
        ${dto.reserveRate}</div>
    <div>
        ${dto.ageGrade}</div>
</div>
</body>
</html>
