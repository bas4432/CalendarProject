import React, {useState} from "react";
import './ResultDateList.css'
import ResultDateListPagebar from "./ResultDateListPagebar";
const ResultDateList = () => {
    const emptyDate = {date: '', day: '', isHoliday: ''};
    const initalizeSelectedDates = () => {
        let result = []
        for (let i = 0; i <= 50; i++) {
            result.push(JSON.parse(JSON.stringify(emptyDate)))
        }
        return result
    }
    const initSelectedDates = initalizeSelectedDates()
    const [selectedDates, setSelectedDates] = useState(initSelectedDates);
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