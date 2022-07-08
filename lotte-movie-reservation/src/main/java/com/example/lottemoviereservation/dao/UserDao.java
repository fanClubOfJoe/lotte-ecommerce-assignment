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
        String sql =    " insert into users(user_id, user_name, user_password) "
                    +   "      values(?, ?, ?) ";

        String address = "74e480ad-a90d-423c-bd19-744df28e3775.external.kr1.mysql.rds.nhncloudservice.com";
        String id = "lotte";
        String pwd = "lotte";
        Connection conn = null;
        PreparedStatement psmt = null;
        int count = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(address, id, pwd);

            psmt = conn.prepareStatement(sql);
            psmt.setString(1, dto.getUserId());
            psmt.setString(2, dto.getUserName());
            psmt.setString(3, dto.getUserPassword());

            count = psmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
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
    public UserDto login(UserDto dto) {
        String sql = " select user_no, user_id, user_name, user_password "
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