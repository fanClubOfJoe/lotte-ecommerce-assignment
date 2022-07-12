package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.dto.ReviewDto;
import com.example.lottemoviereservation.dto.UserDto;
import com.example.lottemoviereservation.dto.UserNameDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
    private static UserDao dao = new UserDao();

    private UserDao() {
        DBConnection.initConnection();
    }

    public static UserDao getInstance() {
        return dao;
    }

    public boolean addUser(UserDto dto) {
        String sql = " insert into users(user_id, user_name, user_email, user_password) "
                + "      values(?, ?, ?, ?) ";


        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        try {
            conn = DBConnection.getConnection();
            System.out.println(conn);

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, dto.getUserId());
            psmt.setString(2, dto.getUserName());
            psmt.setString(3, dto.getUserEmail());
            psmt.setString(4, dto.getUserPassword());

            count = psmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return count > 0;
    }

    public boolean getId(String user_id) {

        String sql = " SELECT user_id "
                + " FROM users "
                + " WHERE user_id=? and is_activated=true ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        boolean findId = false;

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_id);

            rs = psmt.executeQuery();
            if (rs.next()) {
                findId = true;
            }

        } catch (SQLException e) {
            System.out.println("getId fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return findId;
    }

    public String findId(String user_name, String user_email) {

        String sql = " SELECT user_id "
                + " FROM users "
                + " WHERE user_name=? and user_email=? and is_activated=true ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String id;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_name);
            psmt.setString(2, user_email);

            rs = psmt.executeQuery();
            if (rs.next()) {
                id = rs.getString(1);
                return id;
            }

        } catch (SQLException e) {
            System.out.println("findId fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return null;
    }

    public String findPwd(String user_id, String user_email) {

        String sql = " SELECT user_password "
                + " FROM users "
                + " WHERE user_id=? and user_email=? and is_activated=true ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String pwd;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_id);
            psmt.setString(2, user_email);

            rs = psmt.executeQuery();
            if (rs.next()) {
                pwd = rs.getString(1);
                return pwd;
            }

        } catch (SQLException e) {
            System.out.println("findPwd fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return null;
    }

    public String checkEmail(String user_email) {

        String sql = " SELECT user_email "
                + " FROM users "
                + " WHERE user_email= (select user_email from users where user_email=?)"
                + " and is_activated=true ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String pwd;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_email);

            rs = psmt.executeQuery();

            if (rs.next()) {
                return "false";
            } else {
                return "true";
            }

        } catch (SQLException e) {
            System.out.println("checkEmail fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return null;
    }

    public UserDto login(UserDto dto) {
        String sql = " select user_no, user_id, user_email, user_name, user_password, is_activated "
                + " from users "
                + " where user_id=? and user_password=? and is_activated=true ";
        Connection conn = null;
        PreparedStatement psmt;
        ResultSet rs = null;
        UserDto user = null;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);

            psmt.setString(1, dto.getUserId());
            psmt.setString(2, dto.getUserPassword());

            rs = psmt.executeQuery();

            if (rs.next()) {
                int no = rs.getInt(1);
                String id = rs.getString(2);
                String email = rs.getString(3);
                String name = rs.getString(4);

                user = new UserDto(no, id, email, name, null);

                return user;
            }

        } catch (SQLException e) {
            System.out.println("login fail");
        }
        return null;

    }

    private String getUserNameByUserNo(int userNo) {

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

    public List<UserNameDto> getUserNameByReview(List<ReviewDto> reviewList) {
        List<UserNameDto> userNameList = new ArrayList<>();

        for (ReviewDto reviewDto : reviewList) {
            int userNo = reviewDto.getUserNo();
            String userName = getUserNameByUserNo(userNo);

            userNameList.add(new UserNameDto(userNo, userName));

        }
        return userNameList;
    }

    public boolean deleteId(String user_id) {

        String sql = " UPDATE users "
                + " SET is_activated=false "
                + " WHERE user_id=? ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행

        int count = 0;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_id);

            count = psmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("delete fail");
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return count > 0;
    }

    public boolean updateUser(String user_email, String user_password, String user_id) {

        String sql = " UPDATE users "
                + " SET user_email=?, user_password=? "
                + " WHERE user_id=? ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행

        int count = 0;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_email);
            psmt.setString(2, user_password);
            psmt.setString(3, user_id);

            count = psmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("update fail");
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return count > 0;
    }

    public UserDto getUserByUserNo(int userNo) {
        String sql = " select user_no, user_id, user_email, user_name "
                + " from users "
                + " where user_no=? and is_activated=true ";
        Connection conn = null;
        PreparedStatement psmt;
        ResultSet rs = null;
        UserDto user = null;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, userNo);
            rs = psmt.executeQuery();

            if (rs.next()) {
                int no = rs.getInt(1);
                String id = rs.getString(2);
                String email = rs.getString(3);
                String name = rs.getString(4);

                user = new UserDto(no, id, email, name);

                return user;
            }

        } catch (SQLException e) {
            System.out.println("getUser fail");
        }
        return null;

    }
}