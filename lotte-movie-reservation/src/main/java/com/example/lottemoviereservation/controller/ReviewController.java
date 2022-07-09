package com.example.lottemoviereservation.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.lottemoviereservation.dao.UserDao;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("utf-8");
        String movieNo = request.getParameter("movieno");
        int userNo = 1;
        String reviewContent = request.getParameter("reviewContent");
        int rating = Integer.parseInt(request.getParameter("rating"));

//        String userEmail = req.getSession(true);
//        Object objLoginCheck = session.getAttribute("login");



    }
}