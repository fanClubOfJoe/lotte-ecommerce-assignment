package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.MovieTitleDto;
import com.example.lottemoviereservation.dto.ReserveDto;
import com.example.lottemoviereservation.dto.ReviewDto;

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

    public MovieDto getMovieByMovieNo(int movieNo) {
        String sql = "SELECT movie_title, movie_rate, movie_content, movie_summary,movie_img, movie_screen_date, movie_time, movie_category, reserve_rate, age_grade " +
                "FROM movies WHERE movie_no = ?";


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

            while (rs.next()) {
                int i = 1;
                dto = new MovieDto(movieNo, rs.getString(i++), rs.getDouble(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getDouble(i++), rs.getString(i++));
                System.out.println(dto);
            }
        } catch (Exception e) {

        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return dto;
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

    public List<MovieDto> getMovieListTop5() {
        String sql = " select movie_no, movie_title, movie_rate, movie_content, movie_summary, movie_img, movie_screen_date, "
                + "			movie_time, movie_category, reserve_rate, age_grade "
                + " from movies "
                + " order by reserve_rate desc"
                + " limit 5";

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

    public List<MovieDto> getMovieSearchList(String choice, String search) {

        String sql = " select movie_no, movie_title, movie_rate, movie_content, movie_summary, movie_img, movie_screen_date, "
                + "			movie_time, movie_category, reserve_rate, age_grade "
                + " from movies ";

        String sWord = "";
        if (choice.equals("movieTitle")) {
            sWord = " where movie_title like '%" + search + "%' ";
        } else if (choice.equals("movieCategory")) {
            sWord = " where movie_category like '%" + search + "%' ";
        } else if (choice.equals("movieContent")) {
            sWord = " where movie_content like '%" + search + "%' ";
        }
        sql = sql + sWord;

        sql = sql + " order by reserve_rate desc, movie_title asc ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<MovieDto> list = new ArrayList<MovieDto>();

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

    public boolean insertMovieDate(MovieDto dto) {

        boolean result = false;

        String sql = "insert into movies(movie_title, movie_rate, movie_content, movie_summary, movie_img, "
                + "	movie_time, movie_category, reserve_rate, age_grade)"
                + " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, dto.getMovieTitle());
            psmt.setString(2, dto.getMovieRate() + "");
            psmt.setString(3, dto.getMovieContent());
            psmt.setString(4, dto.getMovieSummary());
            psmt.setString(5, dto.getMovieImg());
            psmt.setString(6, dto.getMovieTime());
            psmt.setString(7, dto.getMovieCategory());
            psmt.setString(8, dto.getReserveRate() + "");
            psmt.setString(9, dto.getAgeGrade());

            count = psmt.executeUpdate();

            if (count > 0) {
                result = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return result;
    }

    public String getUserNameByUserNo(int userNo) {

        String sql = " SELECT user_name "
                + " FROM users "
                + " WHERE user_no=? ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String findName = "";

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, userNo);

            rs = psmt.executeQuery();
            if (rs.next()) {
                findName = rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println("getUserName fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return findName;
    }

    public List<MovieTitleDto> getMovieTitleByReview(List<ReviewDto> reviewList) {
        List<MovieTitleDto> movieTitleList = new ArrayList<>();

        for (ReviewDto reviewDto : reviewList) {
            int movieNo = reviewDto.getMovieNo();
            String movieTitle = getMovieTitleByMovieNo(movieNo);

            movieTitleList.add(new MovieTitleDto(movieNo, movieTitle));

        }

        return movieTitleList;
    }

    public List<MovieTitleDto> getMovieTitleByReserve(List<ReserveDto> reserveList) {
        List<MovieTitleDto> movieTitleList = new ArrayList<>();

        for (ReserveDto reserveDto : reserveList) {
            int movieNo = reserveDto.getMovieNo();
            String movieTitle = getMovieTitleByMovieNo(movieNo);

            movieTitleList.add(new MovieTitleDto(movieNo, movieTitle));

        }

        return movieTitleList;
    }

    private String getMovieTitleByMovieNo(int movieNo) {

        String sql = " SELECT movie_title "
                + " FROM movies "
                + " WHERE movie_no=? ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String findTitle = "";

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, movieNo);

            rs = psmt.executeQuery();
            if (rs.next()) {
                findTitle = rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println("getMovieTitle fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return findTitle;
    }
}

