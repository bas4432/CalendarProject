import './SearchDateButton.css'
import axios from "axios";
import React, { useState } from "react";

const SearchDateButton = () => {
    const test2 = [
        {date: '2022-03-01', day: '화요일', isHoliday: '아니오'}
        , {date: '2022-03-02', day: '수요일', isHoliday: '아니오'}
        , {date: '2022-03-03', day: '목요일', isHoliday: '아니오'}
        , {date: '2022-03-04', day: '금요일', isHoliday: '아니오'}
        , {date: '2022-03-05', day: '토요일', isHoliday: '아니오'}
    ]
    const emptyDate = {date: '', day: '', isHoliday: ''};
    const initalizeSelectedDates = () => {
        let result = []
        for (let i = 0; i <= 50; i++) {
            result.push(JSON.parse(JSON.stringify(emptyDate)))
        }
        return result;
    }
    const initSelectedDates = initalizeSelectedDates();
    const [selectedDates, setSelectedDates] = useState(initSelectedDates);
    const onClickTest2 = () => {
        // console.debug("onClickTest2")
        const newDates = selectedDates.map(
            (selectedDate, index) => {
                if (undefined !== test2[index]) {
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
        axios.post("/home")
            .then(response => {
                console.debug('res', response)
            })
    }
    return (
        <>
            <button id="search_btn">조회</button>
            <button id="search_btn" onClick={onClickTest2}>테스트</button>
            <button id="search_btn" onClick={axiosTest}>테스트2</button>
        </>
    )
}
export default SearchDateButton;