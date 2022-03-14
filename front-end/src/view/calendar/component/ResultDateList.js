import React, {useState} from "react";
import './css/ResultDateList.css'
import ResultDateListPagebar from "./ResultDateListPagebar";
const ResultDateList = ({selectedDates}) => {

    return (
        <div id="right_area_border">
            <div id="right_area">
                <table id="selected_date_list">
                    <thead>
                    <tr>
                        <th>일자</th>
                        <th>요일</th>
                        <th>국경일</th>
                    </tr>
                    </thead>
                    <tbody>
                    {selectedDates
                        .map((selectedDate, index) =>
                            <tr key={index}>
                                <td>{selectedDate.date}</td>
                                <td>{selectedDate.day}</td>
                                <td>{selectedDate.publicHoliday}</td>
                            </tr>
                        )}
                    </tbody>
                </table>
                <ResultDateListPagebar/>
            </div>
        </div>
    )
}
export default ResultDateList;