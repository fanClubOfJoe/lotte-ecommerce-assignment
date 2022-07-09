package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.ReserveDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReserveDao {
    private static ReserveDao dao = new ReserveDao();
    private ReserveDao() {
    }

    public static ReserveDao getInstance() {
        return dao;
    }

    // 예매할 수 있는 인원인지 체크해주기(true, false)
    public boolean getRemainSeats(ReserveDto reserve) {
        String sql = "SELECT IF(theater_detail_remain_seats >= ? , 1 , 0) FROM theater_details WHERE movie_no = ?";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        int canReserve = 0;

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, reserve.getReserveEnterCount());
            psmt.setInt(2, reserve.getMovieNo());

            rs = psmt.executeQuery();
            while(rs.next()) {
                canReserve = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return canReserve > 0;
    }

    // 예매하기
    public boolean setReserve(ReserveDto reserve) {
        if(!getRemainSeats(reserve))
            return false;
        String sql = "INSERT INTO reserves(user_no, movie_no, reserve_time, reserve_enter_count) VALUES(?, ?, STR_TO_DATE(?, '%H%i%s'), ?)";
        Connection conn = null;
        PreparedStatement psmt = null;

        int count = 0;

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, reserve.getUserNo());
            psmt.setInt(2, reserve.getMovieNo());
            psmt.setString(3, reserve.getReserveTime());
            psmt.setInt(4, reserve.getReserveEnterCount());

            count = psmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    // 예매할 수 있는 영화의 정보를 날짜 기반으로 가져옴 getTheaterDetailList(20220708) 방식으로 호출
    public List<TheaterDetailDto> getTheaterDetailList(String date) {
        String sql = "SELECT movie_no, theater_detail_standard_date , " +
                "theater_detail_time, theater_detail_remain_seats , theater_detail_seats " +
                "FROM theater_details " +
                "WHERE DATEDIFF(STR_TO_DATE('"+date+"', '%Y%m%d'), theater_detail_standard_date) > 0 ";
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
