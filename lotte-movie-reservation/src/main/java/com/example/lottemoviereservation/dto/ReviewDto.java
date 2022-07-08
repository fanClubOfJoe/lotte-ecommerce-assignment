package com.example.lottemoviereservation.dto;

public class ReviewDto {
    private int reviewNo;
    private int movieNo;
    private int userNo;
    private String reviewTitle;
    private String reviewContent;
    private double reviewRate;

    public int getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(int reviewNo) {
        this.reviewNo = reviewNo;
    }

    public int getMovieNo() {
        return movieNo;
    }

    public void setMovieNo(int movieNo) {
        this.movieNo = movieNo;
    }

    public int getUserNo() {
        return userNo;
    }

    public void setUserNo(int userNo) {
        this.userNo = userNo;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public double getReviewRate() {
        return reviewRate;
    }

    public void setReviewRate(double reviewRate) {
        this.reviewRate = reviewRate;
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "reviewNo=" + reviewNo +
                ", movieNo=" + movieNo +
                ", userNo=" + userNo +
                ", reviewTitle='" + reviewTitle + '\'' +
                ", reviewContent='" + reviewContent + '\'' +
                ", reviewRate=" + reviewRate +
                '}';
    }

    public ReviewDto(int movieNo, int userNo, String reviewTitle, String reviewContent, double reviewRate) {
        this.movieNo = movieNo;
        this.userNo = userNo;
        this.reviewTitle = reviewTitle;
        this.reviewContent = reviewContent;
        this.reviewRate = reviewRate;
    }
}
