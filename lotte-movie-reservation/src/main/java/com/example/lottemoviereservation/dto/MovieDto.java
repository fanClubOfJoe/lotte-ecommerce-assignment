package com.example.lottemoviereservation.dto;

public class MovieDto {
    public int movieNo;
    public String movieTitle;
    public double movieRate;
    public String movieContent;
    public String movieSummary;
    public String movieImg;
    public double reserveRate;
    public String ageGrade;

    public MovieDto(String movieTitle, double movieRate, String movieContent, String movieSummary, String movieImg, double reserveRate, String ageGrade) {
        this.movieTitle = movieTitle;
        this.movieRate = movieRate;
        this.movieContent = movieContent;
        this.movieSummary = movieSummary;
        this.movieImg = movieImg;
        this.reserveRate = reserveRate;
        this.ageGrade = ageGrade;
    }

    @Override
    public String toString() {
        return "MovieDto{" +
                "movieNo=" + movieNo +
                ", movieTitle='" + movieTitle + '\'' +
                ", movieRate=" + movieRate +
                ", movieContent='" + movieContent + '\'' +
                ", movieSummary='" + movieSummary + '\'' +
                ", movieImg='" + movieImg + '\'' +
                ", reserveRate=" + reserveRate +
                ", ageGrade='" + ageGrade + '\'' +
                '}';
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

    public double getMovieRate() {
        return movieRate;
    }

    public void setMovieRate(double movieRate) {
        this.movieRate = movieRate;
    }

    public String getMovieContent() {
        return movieContent;
    }

    public void setMovieContent(String movieContent) {
        this.movieContent = movieContent;
    }

    public String getMovieSummary() {
        return movieSummary;
    }

    public void setMovieSummary(String movieSummary) {
        this.movieSummary = movieSummary;
    }

    public String getMovieImg() {
        return movieImg;
    }

    public void setMovieImg(String movieImg) {
        this.movieImg = movieImg;
    }

    public double getReserveRate() {
        return reserveRate;
    }

    public void setReserveRate(double reserveRate) {
        this.reserveRate = reserveRate;
    }

    public String getAgeGrade() {
        return ageGrade;
    }

    public void setAgeGrade(String ageGrade) {
        this.ageGrade = ageGrade;
    }
}
