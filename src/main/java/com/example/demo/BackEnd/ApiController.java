package com.example.demo.BackEnd;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

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
        while (currentDate.compareTo(endDate) <=0) {

            dates.add(format.format(currentDate));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = calendar.getTime();
        }

        return dates;
    }
    
    @GetMapping(value = "/apitest")
    public List<String> get(@RequestParam ("startDate") String startDate){
    	
    	System.out.println("startdate::: "+ startDate);
    	
        System.out.println("api����");
    	
        List<String> holidaylist = new ArrayList<>();
    	 
    	 System.out.println("api����2");
    	 
    	HttpURLConnection con = null;
        String s = null; // ���� �޽���
        
        try
        {
            URL url = new URL(
                "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getHoliDeInfo"
                + "?ServiceKey=k7fhU%2F7mHfV3bwdzZEdzKuAZg%2FT0Ll1BJD16pPrMHi1vX4w9oSDWuVvu2A%2FxE3JBzfpA3ZBsxgHCR2YBboFfPg%3D%3D" // ����Ű
                + "&solYear=" + startDate // ����
			/*
			 * + "&solMonth=" + (m > 9 ? "" : "0") + m // ��
			 */  );
            
            System.out.println("Url::" + url.toString());
            
            con = (HttpURLConnection)url.openConnection();
            con.setRequestProperty("Accept-language", "ko");
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(con.getInputStream());

            boolean ok = false; // <resultCode>00</resultCode> ȹ�� ����
            
            Element e;
            NodeList ns = doc.getElementsByTagName("header");
          
            
            System.out.println("ns:::::"+ns.getLength());
            if (ns.getLength() > 0)
            {
                e = (Element)ns.item(0);
                if (e.getElementsByTagName("resultCode").item(0).getTextContent().equals("00"))
                    ok = true; // ���� ����
                else // ���� �޽���
                    s = e.getElementsByTagName("resultMsg").item(0).getTextContent();
            }
            
            Map<String, String> map = new HashMap<String, String>();
        
            
            if (ok)
            {
                ns = doc.getElementsByTagName("item");
                for (int i = 0; i < ns.getLength(); i++)
                {
                    e = (Element)ns.item(i);
                    holidaylist.add(e.getElementsByTagName("locdate").item(0).getTextContent()); // ��¥
                    holidaylist.add(e.getElementsByTagName("dateName").item(0).getTextContent()); // ��Ī
                }
                
            }
        }
        catch (Exception e)
        {
            s = e.getMessage();
        }
       
        if (con != null)
            con.disconnect();

        return holidaylist;
    }
}
