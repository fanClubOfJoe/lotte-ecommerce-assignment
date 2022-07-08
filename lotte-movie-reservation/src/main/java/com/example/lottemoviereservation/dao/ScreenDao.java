package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;
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

    public List<TheaterDetailDto> getTheaterDetailList() {
        String sql = "SELECT movie_no, theater_detail_standard_date , " +
                "theater_detail_time, theater_detail_remain_seats , theater_detail_seats " +
                "FROM theater_details " +
                "WHERE DATEDIFF(now(), theater_detail_standard_date) > 0 ";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<TheaterDetailDto> list = new ArrayList<>();

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();

            while(rs.next()) {
                int i = 1;
                TheaterDetailDto dto = new TheaterDetailDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
                System.out.println(dto);
                list.add(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }
}
