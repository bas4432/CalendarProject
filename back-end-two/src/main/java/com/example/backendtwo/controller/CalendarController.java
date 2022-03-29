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
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilderFactory;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.util.Map;

@RestController
public class CalendarController {

    @GetMapping("/home")
    public String getHome() {
        return "Hello World!";
    }

    @Autowired
    private CalendarService service;

    @GetMapping("/date")
    public List<LocalDate> calendar(Date date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
        LocalDate startDate = LocalDate.parse(date.getStartDate(), formatter);
        LocalDate endDate = LocalDate.parse(date.getEndDate(), formatter);
        int numOfDaysBetween = (int) ChronoUnit.DAYS.between(startDate, endDate.plusDays(1L));

        return service.selectedDateList(numOfDaysBetween, date.getStartDate());
    }

    @GetMapping("/isHoliday")
    public List<String> isHoliday(@RequestParam Map<String, String> resultMap) {
        List<String> holidayList = new ArrayList<>();
        System.out.println(resultMap);
        HttpURLConnection httpURLConnection = null;
        String errorMessage = null; // 에러 메시지
        try {
            URL url = new URL(
                    "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo"
                            + "?ServiceKey=q1h9t4Isp0T7dr6HUQFjgqrlWaYMhU4nIKscD1bCs83nncFtzFfnPv1QNyDs8rQxpNcfzNt1CjEb%2FaC8Mp6Bsw%3D%3D" // 서비스키
                            + "&solYear=" + 2022  // 연도
//                            + "&solMonth=" + (m > 9 ? "" : "0") + m  // 월
            );
            httpURLConnection = (HttpURLConnection)url.openConnection();
            httpURLConnection.setRequestProperty("Accept-language", "ko");

            Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(httpURLConnection.getInputStream());

            boolean isSuccess = false; // <resultCode>00</resultCode> 획득 여부

            Element element;
            NodeList nodeList = document.getElementsByTagName("header");
            if (nodeList.getLength() > 0) {
                element = (Element)nodeList.item(0);
                if (element.getElementsByTagName("resultCode").item(0).getTextContent().equals("00")) {
                    isSuccess = true; // 성공 여부
                }
                if (!element.getElementsByTagName("resultCode").item(0).getTextContent().equals("00")) {
                    errorMessage = element.getElementsByTagName("resultMsg").item(0).getTextContent();
                }
            }
            if (isSuccess) {
                nodeList = document.getElementsByTagName("item");
                for (int i = 0; i < nodeList.getLength(); i++) {
                    element = (Element)nodeList.item(i);
                    holidayList.add(element.getElementsByTagName("locdate").item(0).getTextContent()); // 날짜
                    holidayList.add(element.getElementsByTagName("dateName").item(0).getTextContent()); // 명칭
                }
            }
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
        if (httpURLConnection != null)
            httpURLConnection.disconnect();

        return holidayList;
    }
}
