package com.example.lottemoviereservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.ReviewDto;
//reviews rate int ....


public class ReviewDao {
    private static ReviewDao dao = new ReviewDao();

    private ReviewDao() {

    }

    public static ReviewDao getInstance() {
        return dao;
    }

    public List<ReviewDto> getReviewList() {
        //(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate
        String sql = " select review_no, movie_no, user_no, review_title, review_content, review_rate "
                + " from reviews "
                + " order by review_no ";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<ReviewDto> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ReviewDto dto = new ReviewDto(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                list.add(dto);
            }

        } catch (SQLException e) {
            System.out.println("Get reviewList fail");
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    public List<ReviewDto> getReviewListByMovieNo(int movieNo) {
        //(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate
        String sql = " select review_no, movie_no, user_no, review_title, review_content, review_rate "
                + " from reviews "
                + " where movie_no=? "
                + " order by review_no ";
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<ReviewDto> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, movieNo);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ReviewDto dto = new ReviewDto(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                list.add(dto);
            }

        } catch (SQLException e) {
            System.out.println("Get reviewList fail");
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    public List<ReviewDto> getReviewPageListByMovieNo(int movieNo, int page) {
        //(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate
        String sql = " select review_no, movie_no, user_no, review_title, review_content, review_rate "
                + " from ( "
                + " select row_number()over(order by review_no desc) as rnum, review_no, "
                + " movie_no, user_no, review_title, review_content, review_rate "
                + " from reviews "
                + " where movie_no=? "
                + " order by review_no desc ) a ";
        sql += " where rnum between ? and ? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<ReviewDto> list = new ArrayList<>();

        int startPage = 1;
        int endPage = page * 5;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, movieNo);
            psmt.setInt(2, startPage);
            psmt.setInt(3, endPage);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ReviewDto dto = new ReviewDto(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                list.add(dto);
            }

        } catch (SQLException e) {
            System.out.println("Get reviewList fail");
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    public List<ReviewDto> getReviewPageListByUserNo(int userNo, int page) {
        //(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate
        String sql = " select review_no, movie_no, user_no, review_title, review_content, review_rate "
                + " from ( "
                + " select row_number()over(order by review_no desc) as rnum, review_no, "
                + " movie_no, user_no, review_title, review_content, review_rate "
                + " from reviews "
                + " where user_no=? "
                + " order by review_no desc ) a ";
        sql += " where rnum between ? and ? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        List<ReviewDto> list = new ArrayList<>();

        int startPage = 1;
        int endPage = page * 5;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, userNo);
            psmt.setInt(2, startPage);
            psmt.setInt(3, endPage);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ReviewDto dto = new ReviewDto(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)
                );
                list.add(dto);
            }

        } catch (SQLException e) {
            System.out.println("Get reviewList fail");
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return list;
    }

    public boolean writeReview(ReviewDto dto) {
        //(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate
        String sql = " insert into reviews (movie_no, user_no, review_title, review_content, review_rate) "
                + " values(?, ?, ?, ?, ?) ";

        Connection conn = null;
        PreparedStatement psmt = null;

        int count = 0;
        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            psmt.setInt(1, dto.getMovieNo());
            psmt.setInt(2, dto.getUserNo());
            psmt.setString(3, dto.getReviewTitle());
            psmt.setString(4, dto.getReviewContent());
            psmt.setInt(5, dto.getReviewRate());

            count = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Write Review fail");
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    public ReviewDto getReview(int review_no) {
        String sql = " select review_no, movie_no, user_no, review_title, review_content, review_rate "
                + " from reviews "
                + " where review_no=? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        ReviewDto dto = null;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, review_no);

            rs = psmt.executeQuery();
            if (rs.next()) {
                int n = 1;
                dto = new ReviewDto(
                        rs.getInt(n++),
                        rs.getInt(n++),
                        rs.getInt(n++),
                        rs.getString(n++),
                        rs.getString(n++),
                        rs.getInt(n++)
                );
            }
        } catch (SQLException e) {
            System.out.println("GET REVIEW FAIL ! ! ! ");
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }
        return dto;
    }

    public boolean updateReview(int review_no, String content) {
        String sql = " update reviews "
                + " set review_title='.', review_content=? "
                + " where review_no=? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, content);
            psmt.setInt(2, review_no);

            count = psmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }
        return count > 0;
    }

    public boolean deleteReview(int review_no, int user_no) {
        String sql = " delete from reviews "
                + " where review_no=? and user_no=? ";

        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            count = psmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("FAIL DELETE REVIEW");
            e.printStackTrace();
        }

        return count > 0;
    }
    public int getReviewCount(){
        String sql = " select count(*) from reviews ";

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        int len = 0;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);

            rs = psmt.executeQuery();
            if (rs.next()) {
                len = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return len;
    }
}