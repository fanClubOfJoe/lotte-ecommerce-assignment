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
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/user/FindPwdController")
public class FindPwdController extends HttpServlet {
    private static final long serialVersionUID = -6972658214051531827L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("userId");
        String email = request.getParameter("email");
        String path = null;
        String password = UserDao.getInstance().findPwd(id, email);
        System.out.println("password : " + password);
        if(password != null) {
            request.setAttribute("password", password);
            path = "findPwd-ok.jsp";
        }
        else path = "findPwd-fail.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }
}
