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
@WebServlet("/user/FindIdController")
public class FindIdController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String path = null;
        String id;
        System.out.println("servlet name = " + name);
        id = String.valueOf(UserDao.getInstance().findId(name, email));
        System.out.println(id);
        // 등록된 이메일과 이름이 존재한 경우 (회원)
        if(id != null) {
            request.setAttribute("user_id", id);
            path = "findId-ok.jsp";
        }
        // 존재하지 않는 회원인 경우
        else {
            path="findId-fail.jsp";
        }
        request.getRequestDispatcher(path).forward(request, response);
    }
}