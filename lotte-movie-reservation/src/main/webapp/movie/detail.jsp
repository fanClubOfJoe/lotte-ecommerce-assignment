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
    boolean isLogin = true;
    if (objLoginCheck == null) {
        isLogin = false;
    } else {
        UserDto user = (UserDto)objLoginCheck;
        pageContext.setAttribute("userNo", user.getUserNo());
    }
    pageContext.setAttribute("isLogin", isLogin);
    MovieDao movieDao = MovieDao.getInstance();
    MovieDto movieDto = movieDao.getMovieByMovieNo(movieno);

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
    <link rel="stylesheet" type="text/css" href="css/detail.css">
</head>
<body>
<jsp:include page="../front/header.jsp"/>
<div class="container mt-3">
    <input type="hidden" id="movieNo" name="movieNo" value="${movieDto.movieNo}">
    <div>
        <div class="row mb-3">
            <div class="col-3">
                <img class="moviePoster" src="${movieDto.movieImg}" alt="No image"/>
            </div>
            <div class="col alignLeft p-3">
                <div class="titleContainer">
                    <div class="middleBox">
                        <div class="movieTitle" id="movieTitle">
                            ${movieDto.movieTitle}</div>
                    </div>
                    <div>
                        <button type="button" class="btn btnRed" id="reserve">예매하기</button>
                    </div>
                </div>
                <hr/>
                <div class="middleBox">
                    <strong class="middleTitle"> 관람객 평점 </strong>
                    <div class="star">&#9733;</div>
                    ${movieDto.movieRate}</div>
                <div class="middleBox">
                    <strong class="middleTitle"> 예매율</strong>${movieDto.reserveRate} %
                </div>

                <div class="middleBox">
                    <strong class="middleTitle">장르</strong>
                    <div>${movieDto.movieCategory}</div>
                </div>
                <div class="middleBox">
                    <strong class="middleTitle">상영시간</strong>
                    <div>${movieDto.movieTime} 분</div>
                </div>
            </div>
        </div>
    </div>
    <div class="redTitle">
        <div>영화 정보</div>
    </div>
    <div class="movieContentContainer">
        <div class="movieSummary">
            ${movieDto.movieSummary}</div>
        <div class="movieContent">
            ${movieDto.movieContent}</div>
    </div>
    <div>

        <div class="redTitle">
            <div>리뷰/평점</div>
        </div>
        <div class="reviewInputContainer">
            <div class="reviewInputTitle">평점 · 관람평 작성</div>
            <form name="insertReviewForm">
                <div class="starContainer">
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
                </div>
                <div class="inputReviewFormContainer">
                    <div>
                <textarea class="reviewTextArea"
                          placeholder="평점 및 영화 관람평을 작성해주세요.&#13;&#10;주제와 무관한 리뷰 또는 스포일러는 표시제한 또는 삭제될 수 있습니다."
                          id="reviewContent" name="reviewContent"></textarea>
                    </div>
                    <div>
                        <input type="button" class="insertReviewBtn btnDark" name="insertReviewBtn"
                               id="insertReviewBtn" value="관람평 작성">
                    </div>
                </div>
            </form>
        </div>


        <div class="reviewContainer">
            <div class="listReview"></div>
        </div>
        <%@ include file="review.jsp" %>
    </div>
</div>
<jsp:include page="../front/footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {

        let age = '${movieDto.ageGrade}';
        let str = '';
        let a = '<div class="age_grade';
        if (age.includes('전체')) {
            str = 'All';
        } else if (age.includes('미정')) {
            str = 'None';
        } else if (age.includes('청소년')) {
            str = '19';
        } else if (age.includes('세')) {
            str = age.substring(0, 2);
        }
        a = a + str + '\" style=\"margin-right: 10px;\"><p align="center" style="margin:0;padding: 0;">' + str + '</p></div>';

        $('#movieTitle').before(a);

        $('#reserve').click(function () {
            location.href = "/reserve?param=reserve"
        })
    });
</script>
</body>
</html>