package com.example.lottemoviereservation.crawling;

import com.example.lottemoviereservation.dao.MovieDao;
import com.example.lottemoviereservation.dao.TheaterDao;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;

import java.util.List;

public class MainCrawlingClass {

    public static void main(String[] args) throws Exception {

        //Movie Data Crawling
//        MovieDataCrawling m = new MovieDataCrawling();
//        List<MovieDto> dtos = m.getMovieData();
//
//        MovieDao dao = MovieDao.getInstance();
//
//        for(int i=0; i<dtos.size(); i++){
//            dao.insertMovieDate(dtos.get(i));
//        }

        //Time Data Crawling
        TimeDataCrawling timeDataCrawling = new TimeDataCrawling();
        List<TheaterDetailDto> timeList = timeDataCrawling.getTimeData();

        TheaterDao theaterDao = TheaterDao.getInstance();

        for(int i=0; i< timeList.size(); i++){
            theaterDao.insertTimeData(timeList.get(i));
        }
    }
}