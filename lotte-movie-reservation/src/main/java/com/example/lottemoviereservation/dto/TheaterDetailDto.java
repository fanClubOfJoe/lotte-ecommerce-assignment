package com.example.lottemoviereservation.dto;

public class TheaterDetailDto {
    private int theaterDetailNo;
    private int theaterNo;
    private int movieNo;
    private String theaterDetailStandardDate;
    private String theaterDetailTime;
    private int theaterDetailRemainSeats;
    private int theaterDetailSeats;

    public TheaterDetailDto(int theaterDetailNo, int theaterNo, int movieNo, String theaterDetailStandardDate, String theaterDetailTime, int theaterDetailRemainSeats, int theaterDetailSeats) {
        this.theaterDetailNo = theaterDetailNo;
        this.theaterNo = theaterNo;
        this.movieNo = movieNo;
        this.theaterDetailStandardDate = theaterDetailStandardDate;
        this.theaterDetailTime = theaterDetailTime;
        this.theaterDetailRemainSeats = theaterDetailRemainSeats;
        this.theaterDetailSeats = theaterDetailSeats;
    }

    public int getTheaterNo() {
        return theaterNo;
    }

    public void setTheaterNo(int theaterNo) {
        this.theaterNo = theaterNo;
    }

    public String getTheaterDetailStandardDate() {
        return theaterDetailStandardDate;
    }

    public void setTheaterDetailStandardDate(String theaterDetailStandardDate) {
        this.theaterDetailStandardDate = theaterDetailStandardDate;
    }

    public int getTheaterDetailNo() {
        return theaterDetailNo;
    }

    public void setTheaterDetailNo(int theaterDetailNo) {
        this.theaterDetailNo = theaterDetailNo;
    }

    public int getMovieNo() {
        return movieNo;
    }

    public void setMovieNo(int movieNo) {
        this.movieNo = movieNo;
    }

    public String getTheaterDetailTime() {
        return theaterDetailTime;
    }

    public void setTheaterDetailTime(String theaterDetailTime) {
        this.theaterDetailTime = theaterDetailTime;
    }

    public int getTheaterDetailRemainSeats() {
        return theaterDetailRemainSeats;
    }

    public void setTheaterDetailRemainSeats(int theaterDetailRemainSeats) {
        this.theaterDetailRemainSeats = theaterDetailRemainSeats;
    }

    public int getTheaterDetailSeats() {
        return theaterDetailSeats;
    }

    public void setTheaterDetailSeats(int theaterDetailSeats) {
        this.theaterDetailSeats = theaterDetailSeats;
    }

    @Override
    public String toString() {
        return "TheaterDetailDto{" +
                "theaterDetailNo=" + theaterDetailNo +
                ", theaterNo=" + theaterNo +
                ", movieNo=" + movieNo +
                ", theaterDetailStandardDate='" + theaterDetailStandardDate + '\'' +
                ", theaterDetailTime='" + theaterDetailTime + '\'' +
                ", theaterDetailRemainSeats=" + theaterDetailRemainSeats +
                ", theaterDetailSeats=" + theaterDetailSeats +
                '}';
    }
}
