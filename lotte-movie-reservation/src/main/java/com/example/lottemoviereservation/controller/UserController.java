package com.example.lottemoviereservation.controller;

import com.example.lottemoviereservation.dao.UserDao;
import com.example.lottemoviereservation.dto.UserDto;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user")
public class UserController extends HttpServlet {

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

        if(param.equals("login")) {
            resp.sendRedirect("user/login.jsp");
        }
        else if(param.equals("loginAf")) {

            String id = req.getParameter("id");
            String pwd = req.getParameter("pwd");
            UserDao dao = UserDao.getInstance();
            UserDto user = dao.login(new UserDto(-1, id, null, null, pwd));
            String msg = "loginFail";
            if(user != null && !user.getUserId().equals("")) {
                resp.setContentType("application/x-json; charset=utf-8");
                msg = "loginSuccess";
                req.getSession().setAttribute("login", user);
                System.out.println(req);
            }
            if(msg.equals("loginSuccess")) {
                resp.sendRedirect("user/hi.jsp");
            }
            else{
                resp.sendRedirect("user/loginError.jsp");
            }
        }
        else if(param.equals("regi")) {
            resp.sendRedirect("user/regi.jsp");
        }
        else if(param.equals("idcheck")) {
            String id = req.getParameter("id");
            System.out.println("id : " + id);

            UserDao dao = UserDao.getInstance();
            boolean b = dao.getId(id);

            String str = "NO";
            if(b == false) {
                str = "YES";
            }
            JSONObject obj = new JSONObject();
            obj.put("msg", str); // 짐싸라

            resp.setContentType("application/x-json; charset=utf-8");
            resp.getWriter().print(obj);


        }
        else if(param.equals("regiAf")) {

            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String pwd = req.getParameter("pwd");

            UserDao dao = UserDao.getInstance();
            boolean b = dao.addUser(new UserDto(id, name, email, pwd));
            String msg = "OK";

            if(b == false) {
                msg = "NO";
            }

            resp.sendRedirect("user/message.jsp?msg=" + msg);

        }
        else if(param.equals("findId")) {
            resp.sendRedirect("user/findId.jsp");
        }
        else if(param.equals("findPwd")) {
            resp.sendRedirect("user/findPwd" +
                    "" +
                    "" +
                    ".jsp");
        }
    }
}
