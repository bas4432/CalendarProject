import React, {useState} from "react";import './css/ResultDateList.css'
import ResultDateListPagebar from "./ResultDateListPagebar";
import {Table} from 'reactstrap';
// import {Table} from 'antd';
const ResultDateList = ({selectedDates}) => {

    return (
        <div id="right_area_border">
            <div id="right_area">
                <Table striped id="selected_date_list">
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
                                <td style=
                                        {{color: selectedDate.day === '일요일' ? 'blue' :
                                                selectedDate.day === '토요일' ? 'red' : 'black'}}>
                                    {selectedDate.date}</td>
                                <td style=
                                        {{color: selectedDate.day === '일요일' ? 'blue' :
                                                selectedDate.day === '토요일' ? 'red' : 'black'}}>
                                    {selectedDate.day}</td>
                                <td style={{color: selectedDate.day === '일요일' ? 'blue' :
                                                selectedDate.day === '토요일' ? 'red' : 'black'}}>
                                    {selectedDate.isHoliday}</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
                <ResultDateListPagebar/>
            </div>
        </div>
    )
}
export default ResultDateList;