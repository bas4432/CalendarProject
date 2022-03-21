import './css/ResultDate.css'
import React from "react";
import {getFormatDate, days} from "../utils/DateUtils"

const ResultDate = ({selectedDate}) => {
    const date = new Date(selectedDate.date)

    return (
        <table id="selected_date_table">
            <thead>
                <tr>
                    <th>선택된 일자</th>
                    <th>(요일)</th>
                    <th>년</th>
                    <th className="month_and_date">월</th>
                    <th className="month_and_date">일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{!isNaN(date) && getFormatDate(date)}</td>
                    <td>{days[date.getDay()]}</td>
                    <td>{!isNaN(date) && date.getFullYear()}</td>
                    <td>{!isNaN(date) && date.getMonth() + 1}</td>
                    <td>{!isNaN(date) && date.getDate()}</td>
                </tr>
            </tbody>
        </table>
    )
}

export default ResultDate;