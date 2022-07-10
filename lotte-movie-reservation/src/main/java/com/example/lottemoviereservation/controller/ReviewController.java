package com.example.lottemoviereservation.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.lottemoviereservation.dao.ReviewDao;
import com.example.lottemoviereservation.dao.UserDao;
import com.example.lottemoviereservation.dto.ReviewDto;
import com.example.lottemoviereservation.dto.UserNameDto;
import org.json.JSONObject;

import java.util.List;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {

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

        String param = request.getParameter("param");


//        int userNo = 1;
//        String reviewContent = request.getParameter("reviewContent");
//        int rating = Integer.parseInt(request.getParameter("rating"));

        ReviewDao reviewDao = ReviewDao.getInstance();
        UserDao userDao = UserDao.getInstance();

        if(param.equals("list")){
            System.out.println("list servlet");
            int movieNo = Integer.parseInt(request.getParameter("movieno"));
            int page = Integer.parseInt(request.getParameter("page"));

            JSONObject obj = new JSONObject();

            List<ReviewDto> reviewList = reviewDao.getReviewPageListByMovieNo(movieNo, page);
            List<UserNameDto> userNameList = userDao.getUserNameByReview(reviewList);

            if(!reviewList.isEmpty()) {
                obj.put("reviewList", reviewList);
                obj.put("list", reviewList);
                obj.put("userNameList", userNameList);
            }
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);
        }

//        String userEmail = req.getSession(true);
//        Object objLoginCheck = session.getAttribute("login");



    }
}