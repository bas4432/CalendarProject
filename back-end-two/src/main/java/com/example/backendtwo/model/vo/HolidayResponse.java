package com.example.backendtwo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Map;

@Data
@ToString
//@XmlRootElement(name="response")
@NoArgsConstructor
@AllArgsConstructor
public class HolidayResponse {

    private Map<String, String> header;
    private HolidayItems body;
}
