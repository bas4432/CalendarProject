import React, { useState } from "react";
import './Main.css'
import axios from 'axios';

const Main = () => {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const isHoliday = ['아니오'];
    const test2 = [
        {date: '2022-03-01', day: '화요일', isHoliday: '아니오'}
        , {date: '2022-03-02', day: '수요일', isHoliday: '아니오'}
        , {date: '2022-03-03', day: '목요일', isHoliday: '아니오'}
        , {date: '2022-03-04', day: '금요일', isHoliday: '아니오'}
        , {date: '2022-03-05', day: '토요일', isHoliday: '아니오'}
    ]
    const emptyDate = {date: '', day:'', isHoliday:''};
    const initalizeSeleectedDates = () => {
        let result = []
        for(let i = 0; i <= 50; i ++) {
            result.push(JSON.parse(JSON.stringify(emptyDate)))
        }
        return result
    }
    const initSelectedDates = initalizeSeleectedDates()
    const [selectedDates, setSelectedDates] = useState(initSelectedDates);
    const onClickTest2 = () => {
        console.debug("onClickTest2")
        const newDates = selectedDates.map(
            (selectedDate, index) => {
                if(undefined !== test2[index]){
                    selectedDate.date = test2[index].date
                    selectedDate.day = test2[index].day
                } else {
                    selectedDate.date = emptyDate.date
                    selectedDate.day = emptyDate.day
                    selectedDate.publicHoliday = emptyDate.publicHoliday
                }
                return selectedDate
            }
        )
        setSelectedDates(newDates)
    }
    const axiosTest = () => {
        axios.get("/home")
            .then(response =>{
                console.debug('res', response)
            })
    }

    return (
        <>
            <div id="header_box">
                <h1>Calendar 기본 과제</h1>
            </div>
            <div id="body_box">
        <span id="calendar_left_area">
            <div id="date_div">
                <button id="select_date_btn"><span id="select_date_star">*</span> 기간</button>
                <div id="start_date_box"><span class="d_box">D</span></div> <span id="from_til">~</span>
                <div id="end_date_box"><span class="d_box">D</span></div><button id="search_btn">조회</button>
                <button id="search_btn" onClick={onClickTest2}>테스트</button>
                <button id="search_btn" onClick={axiosTest}>테스트2</button>
            </div>
            <div id="selected_year_month">2020년 5월</div>
            <div id="calendar_table">
                <table id="calender_table_result">
                    <thead>
                        <tr>
                            {days.map((day, index) => {
                                return <th key={index}>{day}</th>
                            })}
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="sun">s</td>
                            <td>1</td>
                            <td>1</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat"></td>
                        </tr>
                        <tr>
                            <td class="sun">s</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun">s</td>
                            <td></td>
                            <td>s</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat"></td>
                        </tr>
                    </tbody>
                </table>
                <div id="test">
                    <div id="triangle_div">
                        <div class="triangle_left"></div>
                        <div class="triangle_right"></div>
                    </div>
                </div>
                <div id="test2">
                    <div class="pre">pre</div>
                    <div class="next">next</div>
                </div>
            </div>
            <table id="selected_date_table">
                <tr>
                    <th>선택된 일자</th>
                    <th>(요일)</th>
                    <th>년</th>
                    <th class="month_and_date">월</th>
                    <th class="month_and_date">일</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                </tr>
            </table>
        </span>
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
                        <div id="page_div">
                            <div id="page_div_ch">
                                <span id="page_left_arrow"><a href="#">◀</a></span>
                                <span class="page_number"><a href="#">1</a></span>
                                <span class="page_number"><a href="#">2</a></span>
                                <span class="page_number"><a href="#">3</a></span>
                                <span id="page_right_arrow"><a href="#">▶</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}

export default Main;