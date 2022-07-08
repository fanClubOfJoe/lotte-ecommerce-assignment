<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MovieDao dao = MovieDao.getInstance();
    List<MovieDto> list = dao.getMovieList();
    pageContext.setAttribute("list", list);
%>
<html>
<head>
    <title>Movie List</title>
</head>
<body>

<c:forEach var="dto" items="${list}">
    <div>
        <c:out value="${dto.movieTitle}"/>
    </div>
    <div>
        <c:out value="${dto.movieRate}"/>
    </div>
    <div>
        <c:out value="${dto.movieCategory}"/>
    </div>
    <div>
        <c:out value="${dto.movieTime}"/>
    </div>
    <div>
        <c:out value="${dto.movieImg}"/>
    </div>
    <div>
        <c:out value="${dto.movieScreenDate}"/>
    </div>
    <div>
        <c:out value="${dto.movieContent}"/>
    </div>
    <div>
        <c:out value="${dto.reserveRate}"/>
    </div>
    <div>
        <c:out value="${dto.ageGrade}"/>
    </div>
</c:forEach>
</body>
</html>
