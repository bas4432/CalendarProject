package com.example.backendtwo.controller;

import com.example.backendtwo.model.vo.Date;
import com.example.backendtwo.model.vo.HolidayItem;
import com.example.backendtwo.model.vo.HolidayItems;
import com.example.backendtwo.model.vo.HolidayResponse;
import com.example.backendtwo.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.io.IOException;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome() {
        return "Hello World!";
    }

    @Autowired
    private CalendarService service;

    @GetMapping("/date")
    public List<LocalDate> calendar(Date date) throws IOException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate startDate = LocalDate.parse(date.getStartDate(), formatter);
        LocalDate endDate = LocalDate.parse(date.getEndDate(), formatter);
        int numOfDaysBetween = (int) ChronoUnit.DAYS.between(startDate, endDate.plusDays(1L));

        return service.selectedDateList(numOfDaysBetween, date.getStartDate());

//        isHoliday();
//        return null;

    }

    private RestTemplate restTemplate = new RestTemplate();
    private final String serviceKey = "q1h9t4Isp0T7dr6HUQFjgqrlWaYMhU4nIKscD1bCs83nncFtzFfnPv1QNyDs8rQxpNcfzNt1CjEb%2FaC8Mp6Bsw%3D%3D";
    private final String holidayURL = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo";
    private String requestRUL = null;

    public void isHoliday() {

        URI uri = UriComponentsBuilder
                .fromUriString(holidayURL)
                .queryParam("serviceKey", serviceKey)
                .queryParam("solYear", 2018)
                .queryParam("solMonth", "01")
                .encode()
                .build()
                .toUri();

        RequestEntity requestEntity = RequestEntity
                .get(uri)
                .build();

        RestTemplate restTemplate = new RestTemplate();

//        ResponseEntity<HolidayResponse> result = restTemplate.exchange(requestEntity, HolidayResponse.class);
//        String result = restTemplate.getForObject(requestEntity, String.class);
//        result.getBody();

//        for (int i = 1; i < 13; i++) {
//            String solMonth = i < 10? "0" + i : String.valueOf(i);
//            try {
////                URI requestURI = new URI(holidayURL + "?ServiceKey=" + serviceKey + "&solYear=2018&" + "solMonth=" + solMonth);
//                URI uri = UriComponentsBuilder
//                        .fromUriString(holidayURL)
//                        .queryParam("serviceKey", serviceKey)
//                        .queryParam("solYear", 2018)
//                        .queryParam("solMonth", "01")
//                HolidayResponse response = restTemplate.getForObject(requestURI, HolidayResponse.class);
//                System.out.println("지금 들고 온 휴일 정보는.....");
//                List<HolidayItem> items = response.getBody().getItems();
////                List<HolidayItems> items = response.getBody().getItems();
//
////                for (HolidayItems item : items) {
////                    System.out.println(item.toString());
////                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }

//        List<String> testList = null;
//        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo?serviceKey=q1h9t4Isp0T7dr6HUQFjgqrlWaYMhU4nIKscD1bCs83nncFtzFfnPv1QNyDs8rQxpNcfzNt1CjEb%2FaC8Mp6Bsw%3D%3D&solYear=2022&solMonth=12"); /*URL*/
//        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=q1h9t4Isp0T7dr6HUQFjgqrlWaYMhU4nIKscD1bCs83nncFtzFfnPv1QNyDs8rQxpNcfzNt1CjEb%2FaC8Mp6Bsw%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("solYear","UTF-8") + "=" + URLEncoder.encode("2019", "UTF-8")); /*연*/
//        urlBuilder.append("&" + URLEncoder.encode("solMonth","UTF-8") + "=" + URLEncoder.encode("02", "UTF-8")); /*월*/
//        URL url = new URL(urlBuilder.toString());
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
//        BufferedReader rd;
//        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//        } else {
//            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//        }
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = rd.readLine()) != null) {
//            sb.append(line);
//        }
//        rd.close();
//        conn.disconnect();
//        System.out.println("test" + sb.toString());


    }
}
