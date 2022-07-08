package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovieDao {
    private static MovieDao dao = new MovieDao();

    public MovieDao() {
    }

    public static MovieDao getInstance() {
        return dao;
    }

    public MovieDto getMovieByMovieNo(int movieNo) {
        String sql = "SELECT movie_title, movie_rate, movie_content, movie_summary,movie_img, movie_screen_date, movie_time, movie_category, reserve_rate, age_grade " +
                "FROM movies WHERE movie_no = ?";

        System.out.println(movieNo);

        MovieDto dto = null;
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, movieNo);

            rs = psmt.executeQuery();

            while(rs.next()) {
                int i = 1;
                dto = new MovieDto(movieNo, rs.getString(i++), rs.getDouble(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getDouble(i++), rs.getString(i++));
                System.out.println(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return dto;
    }
}
