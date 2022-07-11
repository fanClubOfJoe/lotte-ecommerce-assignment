package com.example.lottemoviereservation.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.lottemoviereservation.dao.ReviewDao;
import com.example.lottemoviereservation.dao.UserDao;
import com.example.lottemoviereservation.dto.ReviewDto;
import com.example.lottemoviereservation.dto.UserDto;
import com.example.lottemoviereservation.dto.UserNameDto;
import org.json.JSONObject;

import java.util.List;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {

    private final String reviewTitle = ".";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession(true);
        Object objLoginCheck = session.getAttribute("login");
//        if (objLoginCheck == null) {
//            String msg = "NO";
//            response.sendRedirect("message.jsp?msg=" + msg);
//        }
        UserDto user = (UserDto) objLoginCheck;

        String param = request.getParameter("param");


//        int userNo = 1;
//        String reviewContent = request.getParameter("reviewContent");
//        int rating = Integer.parseInt(request.getParameter("rating"));

        ReviewDao reviewDao = ReviewDao.getInstance();
        UserDao userDao = UserDao.getInstance();

        if (param.equals("movielist")) {
            int movieNo = Integer.parseInt(request.getParameter("movieno"));
            int page = Integer.parseInt(request.getParameter("page"));

            JSONObject obj = new JSONObject();

            List<ReviewDto> reviewList = reviewDao.getReviewPageListByMovieNo(movieNo, page);
            List<UserNameDto> userNameList = userDao.getUserNameByReview(reviewList);

            int reviewCount = reviewDao.getReviewCount();

            if (!reviewList.isEmpty()) {
                obj.put("reviewList", reviewList);
                obj.put("list", reviewList);
                obj.put("userNameList", userNameList);
                obj.put("reviewCount", reviewCount);
            }
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);

        } else if (param.equals("insert")) {
            int movieNo = Integer.parseInt(request.getParameter("movieno"));

            int rating = Integer.parseInt(request.getParameter("rating"));
            String reviewContent = request.getParameter("reviewContent");

            ReviewDto reviewDto = new ReviewDto(movieNo, user.getUserNo(), reviewTitle, reviewContent, rating);
            reviewDao.writeReview(reviewDto);
        } else if (param.equals("update")) {

            int reviewNo = Integer.parseInt(request.getParameter("reviewno"));

            String updateContent = request.getParameter("updateContent");

            reviewDao.updateReview(reviewNo, updateContent);

        } else if (param.equals("delete")) {

            int reviewNo = Integer.parseInt(request.getParameter("reviewno"));

            reviewDao.deleteReview(reviewNo, user.getUserNo());
        }else if (param.equals("userlist")) {
            int userNo = Integer.parseInt(request.getParameter("userno"));
            int page = Integer.parseInt(request.getParameter("page"));

            JSONObject obj = new JSONObject();

            List<ReviewDto> reviewList = reviewDao.getReviewPageListByUserNo(userNo, page);
            List<UserNameDto> userNameList = userDao.getUserNameByReview(reviewList);

            int reviewCount = reviewDao.getReviewCount();

            if (!reviewList.isEmpty()) {
                obj.put("reviewList", reviewList);
                obj.put("list", reviewList);
                obj.put("userNameList", userNameList);
                obj.put("reviewCount", reviewCount);
            }
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);

        }

    }
}