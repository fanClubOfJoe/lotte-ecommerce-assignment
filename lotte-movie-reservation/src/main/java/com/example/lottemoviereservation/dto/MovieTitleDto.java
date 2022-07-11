package com.example.lottemoviereservation.dto;

public class MovieTitleDto {
    private int movieNo;
    private String movieTitle;

    public MovieTitleDto(int movieNo, String movieTitle) {
        this.movieNo = movieNo;
        this.movieTitle = movieTitle;
    }

    public int getMovieNo() {
        return movieNo;
    }

    public void setMovieNo(int movieNo) {
        this.movieNo = movieNo;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    @Override
    public String toString() {
        return "MovieTitleDto{" +
                "movieNo=" + movieNo +
                ", movieTitle='" + movieTitle + '\'' +
                '}';
    }
}
