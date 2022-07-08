package com.example.lottemoviereservation.dto;

public class TheaterDetailDto {
    public int theaterDetailNo;
    public int movieNo;
    public String theaterDetailTime;
    public int theaterDetailRemainSeats;
    public int theaterDetailSeats;

    public TheaterDetailDto(int movieNo, String theaterDetailTime, int theaterDetailRemainSeats, int theaterDetailSeats) {
        this.movieNo = movieNo;
        this.theaterDetailTime = theaterDetailTime;
        this.theaterDetailRemainSeats = theaterDetailRemainSeats;
        this.theaterDetailSeats = theaterDetailSeats;
    }

    @Override
    public String toString() {
        return "TheaterDetailDto{" +
                "theaterDetailNo=" + theaterDetailNo +
                ", movieNo=" + movieNo +
                ", theaterDetailTime='" + theaterDetailTime + '\'' +
                ", theaterDetailRemainSeats=" + theaterDetailRemainSeats +
                ", theaterDetailSeats=" + theaterDetailSeats +
                '}';
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
}
