<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String choice = request.getParameter("choice");
    String search = request.getParameter("search");
    if (choice == null) {
        choice = "검색";
    }
    if (search == null) {
        search = "";
    }

    MovieDao movieDao = MovieDao.getInstance();

    List<MovieDto> movieList = movieDao.getMovieSearchList(choice, search);

    pageContext.setAttribute("choice", choice);
    pageContext.setAttribute("search", search);
    pageContext.setAttribute("movieList", movieList);
%>
<html>
<head>
    <title>Movie List</title>
    <link rel="stylesheet" type="text/css" href="css/list.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<jsp:include page="../front/header.jsp"/>

<div class="wrapper">
    <div>
        <div class="row px-5 mx-5 mb-4 mt-5">
            <div class="col-sm-3">
                <select id="choice" class="select">
                    <option>검색</option>
                    <option value="movieTitle">영화 제목</option>
                    <option value="movieCategory">영화 장르</option>
                    <option value="movieContent">줄거리</option>
                </select>
            </div>

            <div class="searchBox">
                <div class="inputBox">
                    <input type="text" id="search" value="">
                    <button type="button" id="searchBtn" onclick="searchBtn()">
                        <img src="/front/images/search.png" id="searchImg">
                    </button>

                </div>
            </div>

        </div>
    </div>
    <div class="container">
        <div class="center-block list-block">
            <c:choose>
                <c:when test="${not empty movieList}">
                    <div class="result">
                        영화검색 결과 <strong> ${movieList.size()} 건 </strong>
                    </div>

                    <c:set var="i" value="0"/>
                    <c:set var="j" value="3"/>
                    <table>
                        <c:forEach var="movieDto" items="${movieList}">
                            <c:if test="${i%j == 0 }">
                                <tr>
                            </c:if>
                            <td class="dto-block">
                                <div class="movieBox">
                                    <div>
                                        <img class="moviePoster" src="${movieDto.movieImg}" alt="No image"/>
                                    </div>
                                    <div>
                                        <c:choose>
                                            <c:when test="${movieDto.ageGrade eq '전체'}">
                                                <div class="age_gradeAll"><p align="center" style="margin-bottom: 0;">
                                                    All</p></div>
                                            </c:when>
                                            <c:when test="${movieDto.ageGrade eq '12세 이상'}">
                                                <div class="age_grade12"><p align="center" style="margin-bottom: 0;">
                                                    12</p></div>
                                            </c:when>
                                            <c:when test="${movieDto.ageGrade eq '15세 이상'}">
                                                <div class="age_grade15"><p align="center" style="margin-bottom: 0;">
                                                    15</p></div>
                                            </c:when>
                                            <c:when test="${movieDto.ageGrade eq '청소년 관람불가'}">
                                                <div class="age_grade19"><p align="center" style="margin-bottom: 0;">
                                                    19</p></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="age_gradeNone"><p align="center" style="margin-bottom: 0;">
                                                    -</p></div>
                                            </c:otherwise>
                                        </c:choose>

                                        <a id="movieTitle"
                                           href="<%=request.getContextPath() %>/movie?param=detail&movieno=${movieDto.movieNo}">${movieDto.movieTitle}</a>
                                    </div>
                                    <div>
                                        <c:out value="${movieDto.movieCategory}"/>
                                    </div>
                                    <div>
                                        <strong> 예매율 | </strong><c:out value="${movieDto.reserveRate}"/> %
                                    </div>
                                    <div>
                                        <strong> 평점 | </strong><c:out value="${movieDto.movieRate}"/>
                                    </div>
                                </div>
                            </td>
                            <c:if test="${i%j == j-1 }">
                                </tr>
                            </c:if>
                            <c:set var="i" value="${i+1 }"/>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <div>해당하는 영화가 존재하지 않습니다</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<jsp:include page="../front/footer.jsp"/>

<script type="text/javascript">
    document.getElementById('search').value = "${search}";
    document.getElementById('choice').value = "${choice}";
    selectedControl();

    function selectedControl() {
        const el = document.getElementById('choice');  //select box
        const len = el.options.length; //select box의 option 갯수
        const str = "${choice}"; //입력 받은 value 값

        //select box의 option 갯수만큼 for문 돌림
        for (let i = 0; i < len; i++) {
            //select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
            if (el.options[i].value == str) {
                el.options[i].selected = true;
            }
        }
    }

    function searchBtn() {
        let choice = document.getElementById('choice').value;
        let search = document.getElementById('search').value;

        /*
        if(search.trim() == ''){
            alert('검색어를 입력해 주십시오');
            return;
        }
         */

        location.href = "?param=list&choice=" + choice + "&search="
            + search;
        //./movie?param=list
    }
</script>
</body>
</html>
