package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.TheaterDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ScreenDao {
    private static ScreenDao dao = new ScreenDao();

    private ScreenDao() {
    }

    public static ScreenDao getInstance() {
        return dao;
    }

    public List<TheaterDto> getTheaterDetailList() {
        String sql = "SELECT movie_title, theater_detail_standard_date , theater_detail_time, theater_detail_remain_seats , theater_detail_seats " +
                "FROM movies, theater_details " +
                "WHERE DATEDIFF(now(), theater_detail_standard_date) > 0 " +
                "AND theater_details.movie_no = movies.movie_no";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<TheaterDto> list = new ArrayList<>();

        try {

        } catch(Exception e) {

        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }
}
