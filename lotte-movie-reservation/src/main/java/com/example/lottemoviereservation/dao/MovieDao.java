package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class MovieDao {
    private static MovieDao dao = new MovieDao();

    private MovieDao() {
        DBConnection.initConnection();
    }

    public static MovieDao getInstance() {
        return dao;
    }

    public List<MovieDto> getMovieList() {
        String sql = " select movie_no, movie_title, movie_rate, movie_content, movie_summary, movie_img, movie_screen_date, "
                + "			movie_time, movie_category, reserve_rate, age_grade "
                + " from movies ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<MovieDto> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);

            rs = psmt.executeQuery();

            while (rs.next()) {

                int i = 1;
                MovieDto dto = new MovieDto(rs.getInt(i++), rs.getString(i++), rs.getDouble(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getDouble(i++), rs.getString(i++));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return list;
    }
}
