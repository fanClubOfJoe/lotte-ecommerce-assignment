package com.example.lottemoviereservation.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        if (param.equals("detail")) {   // 영화 상세 정보 페이지

            int movieno = Integer.parseInt(req.getParameter("movieno"));

            resp.sendRedirect("movie/detail.jsp?movieno="+movieno);

        }else if (param.equals("main")) {   // 메인 페이지
            resp.sendRedirect("movie/main.jsp");
        }
        else if (param.equals("list")) {    // 영화 리스트 페이지
            resp.sendRedirect("movie/list.jsp");
        }
    }

}
