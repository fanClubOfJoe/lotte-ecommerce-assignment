<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page import="com.example.lottemoviereservation.dao.ReviewDao" %>
<%@ page import="com.example.lottemoviereservation.dao.UserDao" %>
<%@ page import="com.example.lottemoviereservation.dto.ReviewDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lottemoviereservation.dto.UserNameDto" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.example.lottemoviereservation.dto.UserDto" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int movieno = Integer.parseInt(request.getParameter("movieno"));

    Object objLoginCheck = session.getAttribute("login");
    UserDto user = (UserDto) objLoginCheck;

    MovieDao movieDao = MovieDao.getInstance();
    MovieDto movieDto = movieDao.getMovieByMovieNo(movieno);

    pageContext.setAttribute("userNo", user.getUserNo());
    pageContext.setAttribute("movieDto", movieDto);
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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Titan+One&display=swap');
        html{
            font-family: 'Titan One', cursive;
        }
        .moviePoster {
            width: 200px;
            height: auto;
        }

        .movieTitle {
            font-size: 25px;
            font-weight: bold;
        }

        /* component */

        .star-rating {
            /*border:solid 1px #ccc;*/
            display: flex;
            flex-direction: row-reverse;
            font-size: 1.5em;
            justify-content: space-around;
            padding: 0 .2em;
            text-align: center;
            width: 5em;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ccc;
            cursor: pointer;
        }

        .star-rating :checked ~ label {
            color: #f90;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #fc0;
        }

        /* explanation */

        article {
            background-color: #ffe;
            box-shadow: 0 0 1em 1px rgba(0, 0, 0, .25);
            color: #006;
            font-family: cursive;
            font-style: italic;
            margin: 4em;
            max-width: 30em;
            padding: 2em;
        }

        .insertReviewBtn {
            background-color: #e60012;
        }

        .redTitle {
            background-color: #e60012;
            height: 60px;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container">
    <input type="hidden" id="movieNo" name="movieNo" value="${movieDto.movieNo}">
    <div>
        <div class="row">
            <div class="col">
                <img class="moviePoster" src="${movieDto.movieImg}" alt="No image"/>
            </div>
            <div class="col">
                <div class="movieTitle">
                    ${movieDto.movieTitle}</div>
                <div>
                    ${movieDto.ageGrade}</div>
                <div>
                    <strong> 장르 | </strong> ${movieDto.movieCategory}</div>
                <div>
                    <strong> 평점 | </strong> ${movieDto.movieRate}</div>

            </div>
        </div>
    </div>
    <div class="redTitle">
        <div>영화 정보</div>
    </div>
    <div>
        <div>
            <strong>${movieDto.movieSummary}</strong></div>
        <div>
            ${movieDto.movieContent}</div>
        <div>
            <strong> 상영 시간 | </strong>${movieDto.movieTime}</div>
        <div>
            <strong> 예매율 | </strong>${movieDto.reserveRate}</div>
    </div>
    <div>
        <div>
            <div class="redTitle">
                <div>리뷰/평점</div>
            </div>
            <div>

                <div class="review_contents">
                    <form name="insertReviewForm">
                        <div class="star-rating">
                            <input type="radio" id="5-stars" name="rating" value="5"/>
                            <label for="5-stars" class="star">&#9733;</label>
                            <input type="radio" id="4-stars" name="rating" value="4"/>
                            <label for="4-stars" class="star">&#9733;</label>
                            <input type="radio" id="3-stars" name="rating" value="3"/>
                            <label for="3-stars" class="star">&#9733;</label>
                            <input type="radio" id="2-stars" name="rating" value="2"/>
                            <label for="2-stars" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="rating" value="1"/>
                            <label for="1-star" class="star">&#9733;</label>
                        </div>
                        <textarea rows="10" cols="20" class="review_textarea"
                                  placeholder="평점 및 영화 관람평을 작성해주세요. 주제와 무관한 리뷰 또는 스포일러는 표시제한 또는 삭제될 수 있습니다."
                                  id="reviewContent" name="reviewContent"></textarea>
                        <div class="">
                            <input type="button" class="insertReviewBtn" name="insertReviewBtn" id="insertReviewBtn"
                                   value="등록">
                        </div>
                    </form>
                </div>

            </div>
        </div>


        <div class="review-container">
            <div class="listReview"></div>
        </div>
        <%@ include file="review.jsp" %>


    </div>
</div>
</body>
</html>
