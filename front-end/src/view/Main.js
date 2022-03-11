import React, {useState} from "react";
import './Main.css'

const Main = () => {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    const dates = ['2022-03-01', '2022-03-02','2022-03-03','2022-03-04','2022-03-05'];
    const listDays = ['화요일','수요일','목요일','금요일','토요일'];
    const isHoliday = ['아니오'];
    const test = Array(1)
        .fill()
        .map(() => ({
            datesTwo : ['2022-03-01', '2022-03-02','2022-03-03','2022-03-04','2022-03-05'],
            listDaysTwo : ['화요일','수요일','목요일','금요일','토요일'],
        }));
    const runCallback = (cb) => {
        return cb();
    };
    const initSelectedDates = [
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''},
        {date: '', day:'', publicHoliday:''}
    ]
    const [selectedDates, setSelectedDates] = useState(initSelectedDates);

    const onClickTest = () => {
        const prevSelectedDates = selectedDates;
        let isUpdated = false
        const addedSelectedDates = prevSelectedDates.map(
            selectedDate => {
                runCallback(() => {
                    const row = [];
                    for (let i = 0; i < dates.length; i++) {
                        {test.map(({ datesTwo, listDaysTwo }) => (
                            row.push(<tr key={datesTwo[i] + listDaysTwo[i]}>
                                <td>{datesTwo[i]}</td>
                                <td>{listDaysTwo[i]}</td>
                                <td>{isHoliday}</td>
                            </tr>)
                        ))}
                    }
                    return row;
                })
                return selectedDate
            }
        )
        setSelectedDates(addedSelectedDates);
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
                <button id="search_btn" onClick={onClickTest}>테스트</button>
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