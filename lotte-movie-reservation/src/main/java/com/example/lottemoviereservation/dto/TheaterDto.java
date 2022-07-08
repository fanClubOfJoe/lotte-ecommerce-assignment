package com.example.lottemoviereservation.dto;

public class TheaterDto {
    public int theaterNo;
    public String theaterName;
    public String theaterLocation;

    @Override
    public String toString() {
        return "TheaterDto{" +
                "theaterNo=" + theaterNo +
                ", theaterName='" + theaterName + '\'' +
                ", theaterLocation='" + theaterLocation + '\'' +
                '}';
    }

    public int getTheaterNo() {
        return theaterNo;
    }

    public void setTheaterNo(int theaterNo) {
        this.theaterNo = theaterNo;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public String getTheaterLocation() {
        return theaterLocation;
    }

    public void setTheaterLocation(String theaterLocation) {
        this.theaterLocation = theaterLocation;
    }

    public TheaterDto(String theaterName, String theaterLocation) {
        this.theaterName = theaterName;
        this.theaterLocation = theaterLocation;
    }
}
