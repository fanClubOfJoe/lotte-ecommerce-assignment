package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieTheaterDetailDto;
import com.example.lottemoviereservation.dto.ReserveDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String sql = "SELECT IF(theater_detail_remain_seats >= ? , 1 , 0) FROM theater_details WHERE movie_no = ? AND theater_detail_time = ?";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        int canReserve = 0;

        System.out.println(reserve);
        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, reserve.getReserveEnterCount());
            psmt.setInt(2, reserve.getMovieNo());
            psmt.setString(3, reserve.getReserveTime());

            rs = psmt.executeQuery();
            while (rs.next()) {
                canReserve = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return canReserve == 1;
    }

    public MovieTheaterDetailDto getMovieReserveDtoByMovieNo(int movieNo) {
        String sql = " select movie_title, movie_time, movie_category, age_grade, theater_detail_no, theater_no, movies.movie_no, theater_detail_standard_date, " +
                "theater_deatil_time, theater_detail_remain_seats, theater_detail_seats" +
                " from movies, theater_details WHERE movie_no=? AND movies.movie_no = theater_detail.movie_no";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        MovieTheaterDetailDto dto = null;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, movieNo);

            rs = psmt.executeQuery();


            while (rs.next()) {
                int i = 1;
                dto = new MovieTheaterDetailDto(rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return dto;
    }

    // 좌석 수 update
    public boolean updateTheaterDetailRemainSeats(ReserveDto reserve) {
        String sql = "UPDATE theater_details " +
                "SET theater_detail_remain_seats = theater_detail_remain_seats-" + reserve.getReserveEnterCount() +
                " WHERE movie_no = ? AND theater_detail_time = ?";
        Connection conn = null;
        PreparedStatement psmt = null;

        System.out.println(reserve);
        int count = 0;

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, reserve.getMovieNo());
            psmt.setString(2, reserve.getReserveTime());
            count = psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    // 예매하기
    public boolean setReserve(ReserveDto reserve) {
        String sql = "INSERT INTO reserves(user_no, movie_no, reserve_time, reserve_enter_count)" +
                " VALUES(?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement psmt = null;

        System.out.println(reserve);
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

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    // 예매할 수 있는 영화의 정보를 날짜 기반(20220708)으로 7일 안에 개봉한 영화 반환
    public List<MovieTheaterDetailDto> getTheaterDetailList(String date) {
        String sql = "SELECT movies.movie_title, movie_time, movie_category, age_grade, theater_detail_no, theater_no, theater_details.movie_no, theater_detail_standard_date, " +
                "theater_detail_time, theater_detail_remain_seats , theater_detail_seats " +
                "FROM theater_details, movies " +
                "WHERE timestampDIFF(DAY, theater_detail_standard_date, STR_TO_DATE('" + date + "', '%Y%m%d')) >= 0 AND timestampDIFF(DAY, theater_detail_standard_date, STR_TO_DATE('" + date + "', '%Y%m%d')) < 7 " +
                "AND movies.movie_no = theater_details.movie_no";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<MovieTheaterDetailDto> list = new ArrayList<>();

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                int i = 1;
                MovieTheaterDetailDto dto = new MovieTheaterDetailDto(rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),
                        rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
                System.out.println(dto);
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    // 예매 취소
    public boolean deleteReserveDtoByReserveNo(int reserveNo) {
        String sql = "DELETE FROM reserves WHERE reserve_no = ?";
        Connection conn = null;
        PreparedStatement psmt = null;

        int count = 0;

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, reserveNo);

            count = psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    // 예매 조회
    public List<ReserveDto> getReserveDtoByUserNo(int userNo) {
        String sql = "SELECT reserve_no, movie_no, reserve_time, reserve_enter_count FROM reserves WHERE user_no = ?";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<ReserveDto> list = new ArrayList<>();

        try {
            DBConnection.initConnection();
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, userNo);

            rs = psmt.executeQuery();

            while (rs.next()) {
                int i = 1;
                ReserveDto dto = new ReserveDto(rs.getInt(i++), userNo, rs.getInt(i++), rs.getString(i++), rs.getInt(i++));
                System.out.println(dto);
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    // 영화를 예매한 유저인지 조회
    public boolean getReserveByMovieNoAndUserNo(int movieNo, int userNo) {

        String sql = " select count(*) from reserves where movie_no=? and user_no=? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        int count = 0;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, movieNo);
            psmt.setInt(2, userNo);

            rs = psmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return count > 0;
    }
}
