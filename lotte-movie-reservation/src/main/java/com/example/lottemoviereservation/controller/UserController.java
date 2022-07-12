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

        if (param.equals("login")) {
            resp.sendRedirect("user/login.jsp");
        } else if (param.equals("loginAf")) {

            String id = req.getParameter("id");
            String pwd = req.getParameter("pwd");
            UserDao dao = UserDao.getInstance();
            UserDto user = dao.login(new UserDto(-1, id, null, null, pwd));
            String msg = "loginFail";
            if (user != null && !user.getUserId().equals("")) {
                resp.setContentType("application/x-json; charset=utf-8");
                msg = "loginSuccess";
                req.getSession().setAttribute("login", user);
            }
            if (msg.equals("loginSuccess")) {
                resp.sendRedirect("movie/main.jsp");
            } else {
                resp.sendRedirect("user/loginError.jsp");
            }
        } else if (param.equals("regi")) {
            resp.sendRedirect("user/regi.jsp");
        } else if (param.equals("idcheck")) {
            String id = req.getParameter("id");

            UserDao dao = UserDao.getInstance();
            boolean b = dao.getId(id);

            String str = "NO";
            if (b == false) {
                str = "YES";
            }
            JSONObject obj = new JSONObject();
            obj.put("msg", str);

            resp.setContentType("application/x-json; charset=utf-8");
            resp.getWriter().print(obj);


        } else if (param.equals("regiAf")) {

            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String pwd = req.getParameter("pwd");

            UserDao dao = UserDao.getInstance();
            boolean b = dao.addUser(new UserDto(id, name, email, pwd));
            String msg = "OK";

            if (b == false) {
                msg = "NO";
            }

            resp.sendRedirect("user/message.jsp?msg=" + msg);

        } else if (param.equals("findId")) {
            resp.sendRedirect("user/findId.jsp");
        } else if (param.equals("findPwd")) {
            resp.sendRedirect("user/findPwd.jsp");
        } else if (param.equals("deleteId")) {
            HttpSession session = req.getSession();
            UserDto dto = (UserDto) session.getAttribute("login");
            String id = dto.getUserId();

            UserDao dao = UserDao.getInstance();
            boolean deleteId = dao.deleteId(id);
            if (deleteId) {
                session.invalidate();
                resp.sendRedirect("movie/main.jsp");
            }
        } else if (param.equals("updateUser")) {
            resp.sendRedirect("user/updateUser.jsp");
        } else if (param.equals("mypage")) {

            HttpSession session = req.getSession();
            UserDto dto = (UserDto) session.getAttribute("login");
            int userNo = dto.getUserNo();

            resp.sendRedirect("user/mypage.jsp?userno=" + userNo);

        } else if (param.equals("logout")) {
            req.getSession().invalidate();
            resp.sendRedirect("movie/main.jsp");
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
            String path = "";

            String id = UserDao.getInstance().findId(name, email);

            // 등록된 이메일과 이름이 존재한 경우 (회원)
            if (id != null) {
                request.setAttribute("user_id", id);
                path = "findId-ok.jsp";
            }
            // 존재하지 않는 회원인 경우
            else {
                path = "findId-fail.jsp";
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

            if (password != null) {
                request.setAttribute("password", password);
                path = "findPwd-ok.jsp";
            } else path = "findPwd-fail.jsp";
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
            int userNo = dto.getUserNo();

            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");

            String path = null;
            UserDao dao = UserDao.getInstance();
            String flag = dao.checkEmail(email);

            if (flag.equals("true")) {
                boolean deleteId = dao.updateUser(email, pwd, id);

                if (deleteId) {
                    path = "mypage.jsp?userno=" + userNo;
                    request.getRequestDispatcher(path).forward(request, response);
                }

            } else {
                path = "updateUser-Fail.jsp";
                request.getRequestDispatcher(path).forward(request, response);
            }
        }
    }
}