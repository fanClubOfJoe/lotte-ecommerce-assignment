package com.example.lottemoviereservation.dto;

public class ReserveDto {
    public int reserveNo;
    public int userNo;
    public int movieNo;


    public ReserveDto(int userNo, int movieNo) {
        this.userNo = userNo;
        this.movieNo = movieNo;
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

    @Override
    public String toString() {
        return "ReserveDto{" +
                "reserveNo=" + reserveNo +
                ", userNo=" + userNo +
                ", movieNo=" + movieNo +
                '}';
    }
}
