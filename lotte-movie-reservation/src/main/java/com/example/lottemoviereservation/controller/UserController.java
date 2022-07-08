package com.example.lottemoviereservation.controller;

import com.example.lottemoviereservation.dao.UserDao;
import com.example.lottemoviereservation.dto.UserDto;
import net.sf.json.JSONObject;

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
            int no = Integer.parseInt(req.getParameter("user_no"));
            String id = req.getParameter("user_id");
            String pwd = req.getParameter("user_password");

            UserDao dao = UserDao.getInstance();
            UserDto user = dao.login(new UserDto(no, id, null, pwd));

            String msg = "loginFail";
            String send = "";
            if(user != null && !user.getUserId().equals("")) {
                resp.setContentType("application/x-json; charset=utf-8");
                send = "id=" + user.getUserId() + "&name=" + user.getUserName();
                msg = "loginSuccess";
            }
            resp.sendRedirect("loginAf.jsp?"+ send +"&loginmsg=" + msg);
        }
        else if(param.equals("regi")) {
            resp.sendRedirect("member/regi.jsp");
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
            String pwd = req.getParameter("pwd");

            UserDao dao = UserDao.getInstance();
            boolean b = dao.addUser(new UserDto(id, name, pwd));
            String msg = "OK";

            if(b == false) {
                msg = "NO";
            }

            resp.sendRedirect("message.jsp?msg=" + msg);

        }
    }
}
