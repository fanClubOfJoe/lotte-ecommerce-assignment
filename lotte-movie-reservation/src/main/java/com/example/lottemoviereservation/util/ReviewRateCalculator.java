package com.example.lottemoviereservation.util;

import com.example.lottemoviereservation.dto.ReviewDto;

import java.util.List;

public class ReviewRateCalculator {
    public int getAvgReviewRate(List<ReviewDto> list) {
        int avg = 0;
        for (ReviewDto reviewDto : list) {
            avg += reviewDto.getReviewRate();
        }
        avg = avg / list.size();
        return avg;
    }
}
