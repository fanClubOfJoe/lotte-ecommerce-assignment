package com.example.lottemoviereservation.util;

import java.util.List;

import com.example.lottemoviereservation.dto.ReviewDto;

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
