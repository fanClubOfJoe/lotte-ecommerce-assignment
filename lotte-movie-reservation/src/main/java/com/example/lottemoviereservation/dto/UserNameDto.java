package com.example.lottemoviereservation.dto;

public class
UserNameDto {
    private int userNo;
    private String userName;

    public UserNameDto(int userNo, String userName) {
        this.userNo = userNo;
        this.userName = userName;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "UserNameDto{" +
                "userNo=" + userNo +
                ", userName='" + userName + '\'' +
                '}';
    }
}
