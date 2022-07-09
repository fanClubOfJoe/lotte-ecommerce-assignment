package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.db.DBConnection;
import com.example.lottemoviereservation.db.DBClose;
import com.example.lottemoviereservation.dto.UserDto;

import java.sql.*;


public class UserDao {
    private static UserDao dao = new UserDao();

    private UserDao() {
        DBConnection.initConnection();
    }

    public static UserDao getInstance() {
        return dao;
    }

    public boolean addUser(UserDto dto) {
        String sql =    " insert into users(user_id, user_name, user_email, user_password) "
                    +   "      values(?, ?, ?, ?) ";


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
                + " WHERE user_id=? ";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        boolean findId = false;

        try {
            conn = DBConnection.getConnection();
            System.out.println("1/3 getId success");

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_id);
            System.out.println("2/3 getId success");

            rs = psmt.executeQuery();
            if(rs.next()) {
                findId = true;
            }
            System.out.println("3/3 getId success");

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
                + " WHERE user_name=? and user_email=?";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String id;

        try {
            conn = DBConnection.getConnection();
            System.out.println("1/3 findId success");

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_name);
            psmt.setString(2, user_email);
            System.out.println(psmt);
            System.out.println("2/3 findId success");

            rs = psmt.executeQuery();
            if(rs.next()) {
                id = rs.getString(1);
                return id;
            }
            System.out.println("3/3 findId success");

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
                + " WHERE user_id=? and user_email=?";

        Connection conn = null;         // DB 연결
        PreparedStatement psmt = null;   // Query문을 실행
        ResultSet rs = null;         // 결과 취득

        String pwd;

        try {
            conn = DBConnection.getConnection();
            System.out.println("1/3 findPwd success");

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, user_id);
            psmt.setString(2, user_email);
            System.out.println(psmt);
            System.out.println("2/3 findPwd success");

            rs = psmt.executeQuery();
            if(rs.next()) {
                pwd = rs.getString(1);
                return pwd;
            }
            System.out.println("3/3 findPwd success");

        } catch (SQLException e) {
            System.out.println("findPwd fail");
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return null;
    }
    public UserDto login(UserDto dto) {
        String sql = " select user_no, user_id, user_name, user_email, user_password "
                + " from users "
                + " where user_id=? and user_password=? ";
        Connection conn = null;
        PreparedStatement psmt;
        ResultSet rs = null;
        UserDto user = null;

        try {
            conn = DBConnection.getConnection();

            psmt = conn.prepareStatement(sql);
            System.out.println("1/3 login success");
            psmt.setString(1, dto.getUserId());
            psmt.setString(2, dto.getUserPassword());

            rs = psmt.executeQuery();
            System.out.println("2/3 login success");

            if(rs.next()) {
                int no = rs.getInt(1);
                String id = rs.getString(2);
                String name = rs.getString(3);

                user = new UserDto(no, id, name, null);
                return user;
            }
            System.out.println("3/3 login success");

        } catch(SQLException e) {
            System.out.println("login fail");
        }
        return null;

    }

}