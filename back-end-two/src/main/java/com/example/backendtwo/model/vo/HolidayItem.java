package com.example.backendtwo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@Data
//@XmlRootElement(name="item")
@NoArgsConstructor
@AllArgsConstructor
public class HolidayItem {

    private int seq;
    private String dateKind;
    private String dateName;
    private String isHoliday;
    private String locdate;
}
