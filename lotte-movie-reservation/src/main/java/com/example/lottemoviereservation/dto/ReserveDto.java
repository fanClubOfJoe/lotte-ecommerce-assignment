package com.example.lottemoviereservation.dto;

public class ReserveDto {
    private int reserveNo;
    private int theaterNo;
    private int userNo;
    private int movieNo;
    private String reserveTime;
    private int reserveEnterCount;

    public ReserveDto(int reserveNo, int userNo, int movieNo, String reserveTime, int reserveEnterCount) {
        this.reserveNo = reserveNo;
        this.userNo = userNo;
        this.movieNo = movieNo;
        this.reserveTime = reserveTime;
        this.reserveEnterCount = reserveEnterCount;
    }

    public ReserveDto(int userNo, int movieNo, String reserveTime, int reserveEnterCount) {
        this.userNo = userNo;
        this.movieNo = movieNo;
        this.reserveTime = reserveTime;
        this.reserveEnterCount = reserveEnterCount;
    }

    public int getReserveNo() {
        return reserveNo;
    }

    public void setReserveNo(int reserveNo) {
        this.reserveNo = reserveNo;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public int getMovieNo() {
        return movieNo;
    }

    public void setMovieNo(int movieNo) {
        this.movieNo = movieNo;
    }

    public String getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String reserveTime) {
        this.reserveTime = reserveTime;
    }

    public int getReserveEnterCount() {
        return reserveEnterCount;
    }

    public void setReserveEnterCount(int reserveEnterCount) {
        this.reserveEnterCount = reserveEnterCount;
    }

    public int getTheaterNo() {
        return theaterNo;
    }

    public void setTheaterNo(int theaterNo) {
        this.theaterNo = theaterNo;
    }

    @Override
    public String toString() {
        return "ReserveDto{" +
                "reserveNo=" + reserveNo +
                ", theaterNo=" + theaterNo +
                ", userNo=" + userNo +
                ", movieNo=" + movieNo +
                ", reserveTime='" + reserveTime + '\'' +
                ", reserveEnterCount=" + reserveEnterCount +
                '}';
    }
}
