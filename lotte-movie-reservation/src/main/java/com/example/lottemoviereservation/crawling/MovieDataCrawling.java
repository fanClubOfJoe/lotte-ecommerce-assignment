package com.example.lottemoviereservation.crawling;

import com.example.lottemoviereservation.dao.MovieDao;
import com.example.lottemoviereservation.dto.MovieDto;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class MovieDataCrawling {

    public static List<MovieDto> getMovieData() throws Exception{

        String[] pageID = {"85999", "82120", "85852", "85997", "86008", "85813", "85871", "85857", "85238", "86000",
                "83127", "82616", "85920", "85991", "85950", "86005", "86017", "85951", "86019"};

        List<MovieDto> list = new ArrayList<>();

        for(int index=0; index<pageID.length; index++) {
            Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/detail-view/?midx="+pageID[index]).get();

            Elements titles = doc.select("div.box-contents div.title strong");
            Elements movieRates = doc.select("div.box-contents div.score div.egg-gage span.percent");
            Elements summarys = doc.select("div.cols-content div.col-detail div.sect-story-movie strong");
            Elements contents = doc.select("div.cols-content div.col-detail div.sect-story-movie");
            Elements imgs = doc.select("div.box-image img"); //나중에 attr()으로 속성얻어야함
            Elements specForCategorys = doc.select("div.spec dl dt"); //장르 뽑아내기 위해서
            Elements specForAgeAndTimes = doc.select("div.spec dl dd.on"); //12세 이상,&nbsp;119분,&nbsp;미국
            Elements reserveRates = doc.select("div.box-contents div.score strong.percent span");

            //movieTitle
            Element t = titles.get(0);
            String title = t.text();

            //movieRate
            Element m = movieRates.get(0);
            String movieRateStr = m.text().replace("%", "");
            if(movieRateStr.equals("?")){
                movieRateStr = "0";
            }
            double movieRate = Double.parseDouble(movieRateStr);

            //movieContent
            Element c = contents.get(0);
            String content = c.text();

            //movieSummary
            Element s = null;
            String summary = "";
            if(summarys.size() > 0) {
                s = summarys.get(0);
                summary = s.text();
            }
            else {
                summary = content.substring(0, 30);
                summary += "...";
            }


            //movieImg
            Element i = imgs.get(0);
            String img = i.attr("src");

            //movieCategory
            String categoryStr = "";
            for(int j=0; j<specForCategorys.size(); j++){
                Element sC = specForCategorys.get(j);
                if(sC.text().contains("장르")){
                    categoryStr = sC.text();
                    break;
                }
            }
            String[] categoryArr = categoryStr.split(" ");
            String category = "";
            for(int j=2; j<categoryArr.length; j++){
                category += categoryArr[j];
            }

            //movieTime & ageGrade
            Element sAT = specForAgeAndTimes.get(1);
            String[] ageAndTime = sAT.text().split(", ");
            String ageGrade = ageAndTime[0];
            String movieTime = ageAndTime[1].replace("분", "").replace(",","");

            //reserveRate
            Element r = reserveRates.get(0);
            double reserveRate =  Double.parseDouble(r.text().replace("%", ""));

            MovieDto dto = new MovieDto(title, movieRate, content, summary, img, movieTime, category, reserveRate, ageGrade);

            list.add(dto);

            System.out.println("\n"+pageID[index]);
            System.out.println(title);
            System.out.println(movieRate);
            System.out.println(summary);
            System.out.println(content);
            System.out.println(img);
            System.out.println(category);
            System.out.println(ageGrade);
            System.out.println(movieTime);
            System.out.println(reserveRate);
        }

        return list;
    }
}
