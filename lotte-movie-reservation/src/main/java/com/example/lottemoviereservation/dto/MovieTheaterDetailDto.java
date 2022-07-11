package com.example.lottemoviereservation.dto;

public class MovieTheaterDetailDto {
    private String movieTitle;
    private int movieTime;
    private String movieCategory;
    private String ageGrade;
    private int theaterDetailNo;
    private int theaterNo;
    private int movieNo;
    private String theaterDetailStandardDate;
    private String theaterDetailTime;
    private int theaterDetailRemainSeats;
    private int theaterDetailSeats;

    @Override
    public String toString() {
        return "MovieTheaterDetailDto{" +
                "movieTitle='" + movieTitle + '\'' +
                ", movieTime=" + movieTime +
                ", movieCategory='" + movieCategory + '\'' +
                ", ageGrade='" + ageGrade + '\'' +
                ", theaterDetailNo=" + theaterDetailNo +
                ", theaterNo=" + theaterNo +
                ", movieNo=" + movieNo +
                ", theaterDetailStandardDate='" + theaterDetailStandardDate + '\'' +
                ", theaterDetailTime='" + theaterDetailTime + '\'' +
                ", theaterDetailRemainSeats=" + theaterDetailRemainSeats +
                ", theaterDetailSeats=" + theaterDetailSeats +
                '}';
    }

    public MovieTheaterDetailDto(String movieTitle, int movieTime, String movieCategory, String ageGrade, int theaterDetailNo, int theaterNo, int movieNo, String theaterDetailStandardDate, String theaterDetailTime, int theaterDetailRemainSeats, int theaterDetailSeats) {
        this.movieTitle = movieTitle;
        this.movieTime = movieTime;
        this.movieCategory = movieCategory;
        this.ageGrade = ageGrade;
        this.theaterDetailNo = theaterDetailNo;
        this.theaterNo = theaterNo;
        this.movieNo = movieNo;
        this.theaterDetailStandardDate = theaterDetailStandardDate;
        this.theaterDetailTime = theaterDetailTime;
        this.theaterDetailRemainSeats = theaterDetailRemainSeats;
        this.theaterDetailSeats = theaterDetailSeats;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public int getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(int movieTime) {
        this.movieTime = movieTime;
    }

    public String getMovieCategory() {
        return movieCategory;
    }

    public void setMovieCategory(String movieCategory) {
        this.movieCategory = movieCategory;
    }

    public String getAgeGrade() {
        return ageGrade;
    }

    public void setAgeGrade(String ageGrade) {
        this.ageGrade = ageGrade;
    }

    public int getTheaterDetailNo() {
        return theaterDetailNo;
    }

    public void setTheaterDetailNo(int theaterDetailNo) {
        this.theaterDetailNo = theaterDetailNo;
    }

    public int getTheaterNo() {
        return theaterNo;
    }

    public void setTheaterNo(int theaterNo) {
        this.theaterNo = theaterNo;
    }

    public int getMovieNo() {
        return movieNo;
    }

    public void setMovieNo(int movieNo) {
        this.movieNo = movieNo;
    }

    public String getTheaterDetailStandardDate() {
        return theaterDetailStandardDate;
    }

    public void setTheaterDetailStandardDate(String theaterDetailStandardDate) {
        this.theaterDetailStandardDate = theaterDetailStandardDate;
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