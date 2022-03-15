import './css/SearchDateButton.css'
import axios from "axios";
import React, { useState } from "react";
import emptyDate from "../constant/Constant";

const SearchDateButton = ({fromToInputs, selectedDates, setSelectedDates}) => {
    const test2 = [
        {date: '2022-03-01', day: '화요일', isHoliday: '아니오'}
        , {date: '2022-03-02', day: '수요일', isHoliday: '아니오'}
        , {date: '2022-03-03', day: '목요일', isHoliday: '아니오'}
        , {date: '2022-03-04', day: '금요일', isHoliday: '아니오'}
        , {date: '2022-03-05', day: '토요일', isHoliday: '아니오'}
    ]
    let resultDate = [];
    let resultDay = [];
    const days = new Array ('일요일','월요일','화요일','수요일','목요일','금요일','토요일');
    const setEmptyDate = (index, selectedDate) => {
        if (undefined === resultDate[index]) {
            selectedDate.date = emptyDate.date
            selectedDate.day = emptyDate.day
            selectedDate.publicHoliday = emptyDate.publicHoliday
        }
    }

    const setDate = (index, selectedDate) => {
        if (undefined !== resultDate[index]) {
            selectedDate.date = resultDate[index]
            selectedDate.day = days[resultDay[index].getDay()]
        }
    }

    const onClickTest2 = () => {
        console.debug("onClickTest2")
        const newDates = selectedDates.map(
            (selectedDate, index) => {
                setDate(index, selectedDate);
                setEmptyDate(index, selectedDate);
                return selectedDate
            }
        )
        setSelectedDates(newDates)
    }

    const changedDate = () => {
        for (let i = 0; i < resultDate.length; i++) {
            resultDate[i] = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
            resultDay[i] = new Date();
        }
    }
    // const axiosTest = () => {
    //     axios.get("/home",fromToInputs)
    //         .then(response => {
    //             console.debug('res', response)
    //         })
    // }
    const inputTest = (selectedDate) => {
        axios.get("/date", {params: fromToInputs})
            .then(response => {
                resultDate = response.data;
                console.log(resultDate);
                changedDate();
            })
        // const axios = require('axios');
        // const res = axios.get("/date", new URLSearchParams(fromToInputs));
        // console.log(res.args.data);
    }
        return (
            <>
                <button id="search_btn" onClick={inputTest}>조회</button>
                <button id="search_btn" onClick={onClickTest2}>테스트</button>
                {/*<button id="search_btn" onClick={axiosTest}>테스트2</button>*/}
            </>
        )
}
export default SearchDateButton;