package com.example.lottemoviereservation.crawling;

import com.example.lottemoviereservation.dao.MovieDao;
import com.example.lottemoviereservation.dao.TheaterDao;
import com.example.lottemoviereservation.dto.MovieDto;
import com.example.lottemoviereservation.dto.TheaterDetailDto;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.List;

public class TimeDataCrawling {

    public static List<MovieDto> getTimeData() throws Exception {

        //url은 "영화이름 날짜 상영시간표"를 검색한 url을 복사해서 넣어야 함
        Document doc = Jsoup.connect("https://www.google.com/search?q=%ED%86%A0%EB%A5%B4+%EB%9F%AC%EB%B8%8C+%EC%95%A4+%EC%8D%AC%EB%8D%94+9%EC%9D%BC+%EC%83%81%EC%98%81+%EC%8B%9C%EA%B0%84%ED%91%9C&oq=&aqs=chrome.2.35i39i362l8.112557922j0j15&sourceid=chrome&ie=UTF-8").get();

        Elements titleDivs = doc.select("div.WIDPrb");
        Element titleDiv = titleDivs.get(0);
        String title = titleDiv.attr("data-movie-name");

        Elements timeDivs = doc.select("div.lr_c_s");
        Element timeDiv = timeDivs.get(0);
        Elements times = timeDiv.getElementsByClass("std-ts");

        MovieDao movieDao = MovieDao.getInstance();
        TheaterDao theaterDao = TheaterDao.getInstance();

        for(int i=0; i< times.size(); i++) {
            String time = times.get(i).text();
            if(time.contains("오후")){
                time = time.replace("오후", "");

                String hourFor12 = time.substring(0, time.indexOf(":"));
                String minute = time.substring(time.indexOf(":")+1);
                int hourFor24 = Integer.parseInt(hourFor12)+12;
                time = hourFor24+":"+minute;
            }
            else if(time.contains("오전")) {
                time = time.replace("오전", "");
            }

            System.out.println(time);

            TheaterDetailDto dto = new TheaterDetailDto(20, time, 200, 200);
            theaterDao.insertTimeData(dto);
        }
        return null;
    }
}