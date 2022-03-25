package com.example.demo.BackEnd;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.DataVO;

@RestController
@RequestMapping(value = "/api")
public class ApiController {

    @GetMapping(value = "/index")
    public List<String> calendar(HttpServletRequest reqeust, DataVO datavo) throws Exception {

        final String DATE_PATTERN = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN);

        Date startDate = format.parse(datavo.getStartDay());
        Date endDate = format.parse(datavo.getEndDay());

        Calendar calenar = Calendar.getInstance();
        calenar.setTime(startDate);
        
        ArrayList<String> dates = new ArrayList<String>();
        Date currentDate = startDate;
        while (currentDate.compareTo(endDate) <=0) { // 종료날짜가 시작날짜보다 커야한다.

            dates.add(format.format(currentDate));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = calendar.getTime();
        }

        return dates;
    }
    
    @GetMapping("/apitest")
    public String callApiWithXml() {
        StringBuffer result = new StringBuffer();
        try {
            String apiUrl = "http://apis.data.go.kr/B552584/EvCharger/getChargerInfo?" +
                    "serviceKey=[Service Key]" +
                    "&numOfRows=10" +
                    "&pageNo=4";
            URL url = new URL(apiUrl);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

            String returnLine;
            result.append("<xmp>");
            while((returnLine = bufferedReader.readLine()) != null) {
                result.append(returnLine + "\n");
            }
            urlConnection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result + "</xmp>";
    }
    
}
