package com.example.backendtwo.model.vo;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Map;

@XmlRootElement(name="response")
public class HolidayResponse {

    private Map<String, String> header;
    private HolidayItem body;

    public Map<String, String> getHeader() {
        return header;
    }

    public void setHeader(Map<String, String> header) {
        this.header = header;
    }
    public HolidayItem getBody() {
        return body;
    }
    public void setBody(HolidayItem body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return "HolidayResponseVO [header=" + header + ", body=" + body + "]";
    }

}
