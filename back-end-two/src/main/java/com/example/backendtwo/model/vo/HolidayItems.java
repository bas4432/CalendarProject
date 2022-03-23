package com.example.backendtwo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

//@XmlRootElement(name="body")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HolidayItems {

    private List<HolidayItem> items;
//    @XmlElementWrapper(name="items")
//    @XmlElement(name="item")
//    public List<HolidayItem> getItems() {
//        return items;
//    }
//
//    public void setItems(List<HolidayItem> items) {
//        this.items = items;
//    }
}
