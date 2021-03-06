package com.example.lottemoviereservation.dto;

public class ReviewDto {
    private int reviewNo;
    private int movieNo;
    private int userNo;
    private String reviewTitle;
    private String reviewContent;
    private int reviewRate;

    public int getReviewRate() {
        return reviewRate;
    }

    public void setReviewRate(int reviewRate) {
        this.reviewRate = reviewRate;
    }

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

    public ReviewDto(int reviewNo, int movieNo, int userNo, String reviewTitle, String reviewContent, int reviewRate) {
        this.reviewNo = reviewNo;
        this.movieNo = movieNo;
        this.userNo = userNo;
        this.reviewTitle = reviewTitle;
        this.reviewContent = reviewContent;
        this.reviewRate = reviewRate;
    }

    public ReviewDto(int movieNo, int userNo, String reviewTitle, String reviewContent, int reviewRate) {
        this.movieNo = movieNo;
        this.userNo = userNo;
        this.reviewTitle = reviewTitle;
        this.reviewContent = reviewContent;
        this.reviewRate = reviewRate;
    }

    public ReviewDto(int reviewNo, int userNo, String reviewContent) {
        this.reviewNo = reviewNo;
        this.userNo = userNo;
        this.reviewContent = reviewContent;
    }
}
