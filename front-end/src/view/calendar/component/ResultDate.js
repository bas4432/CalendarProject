import './css/ResultDate.css'
import React from "react";

const ResultDate = () => {
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
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
    )
}

export default ResultDate;