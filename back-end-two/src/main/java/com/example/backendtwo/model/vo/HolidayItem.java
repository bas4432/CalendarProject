package com.example.backendtwo.model.vo;

import lombok.Data;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@Data
@XmlRootElement(name="item")
public class HolidayItem {

    private String locdate;
    private String dateKind;
    private String isHoliday;
    private String dateName;
    private int seq;

    public String getLocdate() {
        return locdate;
    }

    public void setLocdate(String locate) {
        this.locdate = locate;
    }

    public String getDateKind() {
        return dateKind;
    }

    public void setDateKind(String dateKind) {
        this.dateKind = dateKind;
    }

    public String getIsHoliday() {
        return isHoliday;
    }

    public void setIsHoliday(String isHoliday) {
        this.isHoliday = isHoliday;
    }

    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }
}
