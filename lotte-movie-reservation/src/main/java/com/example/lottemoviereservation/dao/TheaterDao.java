package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.TheaterDetailDto;
import com.example.lottemoviereservation.dto.TheaterDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TheaterDao {

    private static TheaterDao dao = new TheaterDao();

    private TheaterDao(){
        DBConnection.initConnection();
    }

    public static TheaterDao getInstance(){
        return dao;
    }

    public boolean insertTimeData(TheaterDetailDto dto){

        String sql = "insert into theater_details(theater_no, movie_no, theater_detail_time, theater_detail_remain_seats, theater_detail_seats)"
                + " values(1, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        boolean result = false;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, dto.getMovieNo());
            psmt.setString(2, dto.getTheaterDetailTime());
            psmt.setInt(3, dto.getTheaterDetailRemainSeats());
            psmt.setInt(4, dto.getTheaterDetailSeats());

            count = psmt.executeUpdate();

            if(count > 0){
                result = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return result;

    }
}