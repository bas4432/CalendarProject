package com.example.backendtwo.controller;

import com.example.backendtwo.model.vo.Date;
import com.example.backendtwo.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilderFactory;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;

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

        List<LocalDate> resultList = service.selectedDateList(numOfDaysBetween, date.getStartDate());
        return resultList;

    }

    @GetMapping("/isHoliday")
    public List<String> isHoliday(@RequestParam Map<String, String> resultMap) {
        List<String> resultList = new ArrayList<>(resultMap.values());
        List<String> subStringToYearAndMonth = new ArrayList<>();
        LinkedHashSet<String> avoidDuplication = new LinkedHashSet<>();
        List<String> resultYear = new ArrayList<>();
        List<String> resultMonth = new ArrayList<>();
        for (int i = 0; i < resultList.size(); i++) {
            subStringToYearAndMonth.add(resultList.get(i).substring(0, 7));
            avoidDuplication.add(subStringToYearAndMonth.get(i));
        }
        List<String> resultData = new ArrayList<>(avoidDuplication);
        for (String item : resultData) {
            resultYear.add(item.substring(0, 4));
            resultMonth.add(item.substring(5));
        }
        List<String> holidayList = new ArrayList<>();
        for (int i = 0; i <= resultData.size(); i++) {
            HttpURLConnection connection = null;
            String errorMessage = null; // 에러 메시지

            try {
                URL url = new URL(
                        "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo"
                                + "?serviceKey=q1h9t4Isp0T7dr6HUQFjgqrlWaYMhU4nIKscD1bCs83nncFtzFfnPv1QNyDs8rQxpNcfzNt1CjEb%2FaC8Mp6Bsw%3D%3D" // 서비스키
                                + "&solYear=" + resultYear.get(i)  // 연도
                                + "&solMonth=" + resultMonth.get(i)  // 월
                );

                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestProperty("Accept-language", "ko");
                Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(connection.getInputStream());
                boolean isSuccess = false;
                Element element;
                NodeList nodeList = document.getElementsByTagName("header");
                if (nodeList.getLength() > 0) {
                    element = (Element) nodeList.item(0);
                    if (element.getElementsByTagName("resultCode").item(0).getTextContent().equals("00")) {
                        isSuccess = true;
                    } else {
                        errorMessage = element.getElementsByTagName("resultMsg").item(0).getTextContent();
                    }
                }
                if (isSuccess) {
                    nodeList = document.getElementsByTagName("item");
                    for (int x = 0; x < nodeList.getLength(); x++) {
                        element = (Element) nodeList.item(x);
                        holidayList.add(element.getElementsByTagName("locdate").item(0).getTextContent()); // 날짜
                    }
                }
            } catch (Exception e) {
                errorMessage = e.getMessage();
            }
            if (connection != null)
                connection.disconnect();
        }

        return holidayList;
    }

}
