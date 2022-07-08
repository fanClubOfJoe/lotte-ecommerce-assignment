package com.example.lottemoviereservation.dto;

public class MovieDto {
    private int movieNo;
    private String movieTitle;
    private double movieRate;
    private String movieContent;
    private String movieSummary;
    private String movieImg;
    private String movieScreenDate;
    private String movieTime;
    private String movieCategory;
    private double reserveRate;
    private String ageGrade;

    public MovieDto(int movieNo, String movieTitle, double movieRate, String movieContent, String movieSummary, String movieImg, String movieScreenDate, String movieTime, String movieCategory, double reserveRate, String ageGrade) {
        this.movieNo = movieNo;
        this.movieTitle = movieTitle;
        this.movieRate = movieRate;
        this.movieContent = movieContent;
        this.movieSummary = movieSummary;
        this.movieImg = movieImg;
        this.movieScreenDate = movieScreenDate;
        this.movieTime = movieTime;
        this.movieCategory = movieCategory;
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
                ", movieScreenDate='" + movieScreenDate + '\'' +
                ", movieTime='" + movieTime + '\'' +
                ", movieCategory='" + movieCategory + '\'' +
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

    public String getMovieScreenDate() {
        return movieScreenDate;
    }

    public void setMovieScreenDate(String movieScreenDate) {
        this.movieScreenDate = movieScreenDate;
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime;
    }

    public String getMovieCategory() {
        return movieCategory;
    }

    public void setMovieCategory(String movieCategory) {
        this.movieCategory = movieCategory;
    }
}
