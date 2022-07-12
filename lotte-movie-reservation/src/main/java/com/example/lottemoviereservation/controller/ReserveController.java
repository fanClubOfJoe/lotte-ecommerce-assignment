package com.example.lottemoviereservation.controller;

import com.example.lottemoviereservation.dao.ReserveDao;
import com.example.lottemoviereservation.dto.MovieTheaterDetailDto;
import com.example.lottemoviereservation.dto.ReserveDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;
import com.example.lottemoviereservation.dto.UserDto;
import com.example.lottemoviereservation.util.CalendarUtil;
import com.mysql.cj.Session;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/reserve")
public class ReserveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String param = request.getParameter("param");

        if(param.equals("reserve")) {
            response.sendRedirect("reserve/reserve.jsp");
        }
        else if(param.equals("reservedetail")) {
            String movieTitle = request.getParameter("movieTitle");
            int movieNo = Integer.parseInt(request.getParameter("movieNo"));
            String time = request.getParameter("theaterTime").split(" ")[1];
            int adult = Integer.parseInt(request.getParameter("adult"));
            int child = Integer.parseInt(request.getParameter("child"));

            ReserveDao dao = ReserveDao.getInstance();
            HttpSession session = request.getSession(true);
            UserDto user = ((UserDto)session.getAttribute("login"));

            System.out.println(adult+"\t"+child);
            System.out.println(new ReserveDto(user.getUserNo(), movieNo, time, adult+child));
            System.out.println(dao.getRemainSeats(new ReserveDto(user.getUserNo(), movieNo, time, adult+child)));

            JSONObject obj = new JSONObject();
            if(dao.getRemainSeats(new ReserveDto(user.getUserNo(), movieNo, time, adult+child))) {
                System.out.println("TRUE");
                ReserveDto dto = new ReserveDto(user.getUserNo(), movieNo, time, adult + child);
                dao.setReserve(dto);
                dao.updateTheaterDetailRemainSeats(dto);
                obj.put("result", 1);
            }
            else {
                System.out.println("FALSE");
                obj.put("result", 0);
            }
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);
        }
        else if(param.equals("reservedata")) {
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            String day = request.getParameter("day");

            String date = year+CalendarUtil.two(month)+CalendarUtil.two(day);

            ReserveDao dao = ReserveDao.getInstance();
            List<MovieTheaterDetailDto> list = dao.getTheaterDetailList(date);
            Collections.sort(list, new Comparator<MovieTheaterDetailDto>() {
                @Override
                public int compare(MovieTheaterDetailDto o1, MovieTheaterDetailDto o2) {
                    if(o1.getMovieNo() == o2.getMovieNo()) {
                        try {
                            SimpleDateFormat format = new SimpleDateFormat("HH:mm");
                            Date d1 = format.parse(o1.getTheaterDetailTime());
                            Date d2 = format.parse(o2.getTheaterDetailTime());
                            return -d1.compareTo(d2);
                        } catch(Exception e) {
                            e.printStackTrace();
                        }
                        return Integer.compare(o1.getMovieNo(), o2.getMovieNo());
                    }
                    return Integer.compare(o1.getMovieNo(), o2.getMovieNo());
                }
            });

            JSONObject obj = new JSONObject();
            obj.put("list", list);
            System.out.println(obj);
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);
        }

        else if(param.equals("reserveticket")) {
            // !user정보 가져오기!
            int userNo = 1;
            int movieNo = Integer.parseInt(request.getParameter("movieNo"));
            String reserveTime = request.getParameter("reserveTime");
            int reserveEnterCount = Integer.parseInt(request.getParameter("reserveEnterCount"));

            ReserveDao dao = ReserveDao.getInstance();

            ReserveDto dto = new ReserveDto(userNo, movieNo, reserveTime, reserveEnterCount);

            JSONObject obj = new JSONObject();

            // 예약이 불가능한 인원 수 일 때 false JSONObject로 전달
            if(!dao.getRemainSeats(dto)) {
                obj.put("result", false);
            }
            else {
                dao.setReserve(dto);
                obj.put("result", true);
            }
            response.setContentType("application/x-json; charset=utf-8;");
            response.getWriter().println(obj);
        }
    }
}
