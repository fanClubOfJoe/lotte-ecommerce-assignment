package com.example.lottemoviereservation.controller;

import com.example.lottemoviereservation.dao.UserDao;
import com.example.lottemoviereservation.dto.UserDto;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

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
                resp.sendRedirect("user/updateUser.jsp");
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
        else if(param.equals("deleteId")){
            HttpSession session = req.getSession();
            UserDto dto = (UserDto) session.getAttribute("login");
            String id = dto.getUserId();
            System.out.println(id);
            UserDao dao = UserDao.getInstance();
            boolean deleteId = dao.deleteId(id);
            if(deleteId){
                System.out.println("아이디가 지워짐");
            }
        }
        else if(param.equals("updateUser")){
            HttpSession session = req.getSession();
            UserDto dto = (UserDto) session.getAttribute("login");
            String id = dto.getUserId();
            System.out.println("id : " + id);
            String email = req.getParameter("email");
            String pwd = req.getParameter("pwd");
            System.out.println(email + pwd);
            UserDao dao = UserDao.getInstance();
            boolean deleteId = dao.updateUser(id, email, pwd);
            if(deleteId){
                System.out.println("유저정보 바뀜");
            }
        }
    }

    /**
     * Servlet implementation class FindIdServlet
     */
    @WebServlet("/user/FindIdController")
    public static class FindIdController extends HttpServlet {
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

    /**
     * Servlet implementation class FindPasswordServlet
     */
    @WebServlet("/user/FindPwdController")
    public static class FindPwdController extends HttpServlet {
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
    @WebServlet("/user/updateUserController")
    public static class updateUserController extends HttpServlet {
        private static final long serialVersionUID = -6972658214051531827L;

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");


            UserDto dto = (UserDto) request.getSession().getAttribute("login");
            String id = dto.getUserId();
            System.out.println(id);

            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            System.out.println("id + email : " + email + pwd);
            String path = null;
            UserDao dao = UserDao.getInstance();
            boolean deleteId = dao.updateUser(email, pwd, id);
            System.out.println("password : " + pwd);
            if(deleteId){
            System.out.println("유저정보 바뀜");
}
//            else path = "hi.jsp";
//            request.getRequestDispatcher(path).forward(request, response);
        }
    }
}
