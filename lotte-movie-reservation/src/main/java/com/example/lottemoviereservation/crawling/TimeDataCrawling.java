package com.example.lottemoviereservation.crawling;

import com.example.lottemoviereservation.dto.TheaterDetailDto;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class TimeDataCrawling {

    public static List<TheaterDetailDto> getTimeData() throws Exception {

        //url은 "영화이름 날짜 상영시간표"를 검색한 url을 복사해서 넣어야 함
        Document doc = Jsoup.connect("https://www.google.com/search?q=%ED%83%91%EA%B1%B4+9%EC%9D%BC+%EC%83%81%EC%98%81+%EC%8B%9C%EA%B0%84%ED%91%9C&sxsrf=ALiCzsbgIA4tRBvUQiQ_fKCjx2HYk0--pA%3A1657355006993&ei=_jrJYp2SPJiKhwP_nY4Y&ved=0ahUKEwididXDsOv4AhUYxWEKHf-OAwMQ4dUDCA4&uact=5&oq=%ED%83%91%EA%B1%B4+9%EC%9D%BC+%EC%83%81%EC%98%81+%EC%8B%9C%EA%B0%84%ED%91%9C&gs_lcp=Cgdnd3Mtd2l6EANKBAhBGABKBAhGGABQAFjjH2DRIGgIcAF4AIAB4AGIAZAPkgEGMS4xMy4xmAEAoAEBuAEDwAEB&sclient=gws-wiz").get();

        //탑건 Url
        //https://www.google.com/search?q=%ED%83%91%EA%B1%B4+9%EC%9D%BC+%EC%83%81%EC%98%81+%EC%8B%9C%EA%B0%84%ED%91%9C&sxsrf=ALiCzsbgIA4tRBvUQiQ_fKCjx2HYk0--pA%3A1657355006993&ei=_jrJYp2SPJiKhwP_nY4Y&ved=0ahUKEwididXDsOv4AhUYxWEKHf-OAwMQ4dUDCA4&uact=5&oq=%ED%83%91%EA%B1%B4+9%EC%9D%BC+%EC%83%81%EC%98%81+%EC%8B%9C%EA%B0%84%ED%91%9C&gs_lcp=Cgdnd3Mtd2l6EANKBAhBGABKBAhGGABQAFjjH2DRIGgIcAF4AIAB4AGIAZAPkgEGMS4xMy4xmAEAoAEBuAEDwAEB&sclient=gws-wiz

        Elements titleDivs = doc.select("div.WIDPrb");
        Element titleDiv = titleDivs.get(0);
        String title = titleDiv.attr("data-movie-name");

        Elements timeDivs = doc.select("div.lr_c_s");
        Element timeDiv = timeDivs.get(0);
        Elements times = timeDiv.getElementsByClass("std-ts");

        List<TheaterDetailDto> list = new ArrayList<>();

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

            TheaterDetailDto dto = new TheaterDetailDto(21, time, 200, 200);
            list.add(dto);
        }
        return list;
    }
}