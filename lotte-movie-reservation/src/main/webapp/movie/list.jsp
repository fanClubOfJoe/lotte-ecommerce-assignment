<%@ page import="com.example.lottemoviereservation.dao.MovieDao" %>
<%@ page import="com.example.lottemoviereservation.dto.MovieDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    MovieDao dao = MovieDao.getInstance();
    List<MovieDto> list = dao.getMovieSearchList(choice, search);

    pageContext.setAttribute("choice", choice);
    pageContext.setAttribute("search", search);
    pageContext.setAttribute("list", list);
%>
<html>
<head>
    <title>Movie List</title>
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

        .list-block {
            width: 1000px;
        }

        .dto-block {
            width: 300px;
        }
        .select {
            width: auto;
            height: 38px;
        }
        .result {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div>
    <div class="row px-5 mx-5 mb-4 mt-5 pt-5">
        <div class="col-sm-3">
            <select id="choice" class="select">
                <option>검색</option>
                <option value="movieTitle">영화 제목</option>
                <option value="movieCategory">영화 장르</option>
                <option value="movieContent">줄거리</option>
            </select>
        </div>
        <div class="col-sm-6">
            <input type="text" id="search" class="form-control" value="">
        </div>

        <div class="col-sm-3">
            <button type="button" class="btn btn-outline-dark"
                    onclick="searchBtn()">검색
            </button>
        </div>
    </div>
</div>
<div class="container">
    <div class="center-block list-block">
        <c:choose>
            <c:when test="${not empty list}">
                <div class="result">
                    영화검색 결과 <strong> ${list.size()} 건 </strong>
                </div>

                <c:set var="i" value="0"/>
                <c:set var="j" value="3"/>
                <table>
                    <c:forEach var="dto" items="${list}">
                        <c:if test="${i%j == 0 }">
                            <tr>
                        </c:if>
                        <td class="dto-block">
                            <div>
                                <img class="moviePoster" src="${dto.movieImg}" alt="No image"/>
                            </div>
                            <div>
                                <a href="<%=request.getContextPath() %>/movie?param=detail&movieno=${dto.movieNo}">${dto.movieTitle}</a>
                            </div>
                            <div>
                                <c:out value="${dto.ageGrade}"/>
                            </div>
                            <div>
                                <c:out value="${dto.movieCategory}"/>
                            </div>
                            <div>
                                <c:out value="${dto.movieScreenDate}"/> 개봉
                            </div>
                            <div>
                                <strong> 예매율 | </strong><c:out value="${dto.reserveRate}"/>
                            </div>
                            <div>
                                <strong> 평점 | </strong><c:out value="${dto.movieRate}"/>
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
