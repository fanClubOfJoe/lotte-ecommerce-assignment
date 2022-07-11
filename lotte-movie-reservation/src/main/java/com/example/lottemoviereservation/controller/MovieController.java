package com.example.lottemoviereservation.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/movie")
public class MovieController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");

        HttpSession session = req.getSession(true);
        Object objLoginCheck = session.getAttribute("login");
//        if (objLoginCheck == null) {
//            String msg = "NO";
//            resp.sendRedirect("message.jsp?msg=" + msg);
//        }

        if (param.equals("detail")) {

            int movieno = Integer.parseInt(req.getParameter("movieno"));

            resp.sendRedirect("movie/detail.jsp?movieno="+movieno);

        }else if (param.equals("main")) {
            resp.sendRedirect("movie/main.jsp");
        }
        else if (param.equals("list")) {
            resp.sendRedirect("movie/list.jsp");
        }
    }

}
