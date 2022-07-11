package com.example.lottemoviereservation.dto;

public class MovieNameDto {
	private int movieNo;
	private String movieName;

	public MovieNameDto(int movieNo, String movieName) {
		this.movieNo = movieNo;
		this.movieName = movieName;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	@Override
	public String toString() {
		return "MovieNameDto{" +
				"movieNo=" + movieNo +
				", movieName='" + movieName + '\'' +
				'}';
	}
}
