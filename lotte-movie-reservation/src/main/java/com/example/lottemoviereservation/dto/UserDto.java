package com.example.lottemoviereservation.dto;

public class UserDto {
    private int userNo;
    private String userId;
    private String userEmail;
    private String userName;
    private String userEmail;
    private String userPassword;
    private boolean isActivated;
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public boolean isActivated() {
        return isActivated;
    }

    public void setActivated(boolean activated) {
        isActivated = activated;
    }

    public UserDto(String userId, String userName, String userEmail, String userPassword) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    public UserDto(int userNo, String userId, String userEmail, String userName) {
        this.userNo = userNo;
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
    }

    public UserDto(int userNo, String userId, String userName, String userEmail, String userPassword) {
        this.userNo = userNo;
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserEmail(String userEmail) {this.userEmail = userEmail;}

    public String getUserEmail() {return userEmail;}
}
