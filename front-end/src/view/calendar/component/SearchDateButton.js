import './css/SearchDateButton.css'
import axios from "axios";
import React, {useState} from "react";
import emptyDate from "../constant/EmptyDate";

const SearchDateButton = ({
                              fromToInputs,
                              selectedDates,
                              setSelectedDates,
                              setSelectedYearAndMonth,
                              setSelectedCalendarDates
                          }) => {
    const year = new Date().getFullYear();
    const month = new Date().getMonth();
    const testDate = new Date(year, month - 1, 1);
    const today = new Date();

    let resultDateArray = [];
    let resultCalendarDates = [];
    let resultYearAndMonth = {year: '', month: ''};
    const days = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
    const setEmptyDate = (index, selectedDate) => {
        if (undefined === resultDateArray[index]) {
            selectedDate.date = emptyDate.date
            selectedDate.day = emptyDate.day
            selectedDate.publicHoliday = emptyDate.publicHoliday
        }
    }

    const setDate = (index, selectedDate) => {
        if (undefined !== resultDateArray[index]) {
            selectedDate.date = resultDateArray[index].date
            selectedDate.day = resultDateArray[index].day
            selectedDate.publicHoliday = resultDateArray[index].isHoliday
        }
    }

    const printDatesList = () => {
        const newDates = selectedDates.map(
            (selectedDate, index) => {
                setDate(index, selectedDate);
                setEmptyDate(index, selectedDate);
                return selectedDate
            }
        )
        setSelectedDates(newDates)
    }

    const printYearAndMonth = (resultDateArray, setSelectedYearAndMonth) => {
        resultYearAndMonth.year = (resultDateArray[0].date).substring(0, 4) + '년'
        resultYearAndMonth.month = (resultDateArray[0].date).substring(5, 7) + '월'
        setSelectedYearAndMonth(resultYearAndMonth)
    }

    const printCalendar = () => {
        const firstDay = testDate.getDate();
        const firstDayName = testDate.getDay();
        const lastDay = new Date(
            today.getFullYear(),
            today.getMonth() + 1,
            0
        ).getDate();
        const prevLastDay = new Date(
            today.getFullYear(),
            today.getMonth(),
            0
        ).getDate();

        let startDayCount = 1;
        let lastDayCount = 1;

        let result = <td></td>;
        for (let i = 0; i < 6; i++) {
            //일요일~토요일을 위해 7번 반복합니다.
            for (let j = 0; j < 7; j++) {
                // i == 0: 1주차일 때
                // resultCalendarDates = <tr>;
                // j < firstDayName: 이번 달 시작 요일 이전 일 때
                if (i == 0 && j < firstDayName) {
                    //일요일일 때, 토요일일 때, 나머지 요일 일 때
                    if (j == 0) {
                        resultCalendarDates = (prevLastDay - (firstDayName - 1) + j)
                    } else if (j == 6) {
                        resultCalendarDates = (prevLastDay - (firstDayName - 1) + j)
                    } else {
                        resultCalendarDates = (prevLastDay - (firstDayName - 1) + j)
                    }
                }
            }
        }
        return resultCalendarDates;
    }

    const formatDate = (param) => {
        let resultDatesObject = []
        for (let i = 0; i < param.length; i++) {
            const date = new Date(param[i]);
            let month = date.getMonth() + 1;
            let day = date.getDate();
            month = month >= 10 ? month : '0' + month;
            day = day >= 10 ? day : '0' + day;

            resultDatesObject.push({
                date: date.getFullYear() + '-' + month + '-' + day,
                day: days[date.getDay()],
                isHoliday: '아니오'
            })
        }
        return resultDatesObject
    }
    const searchDates = () => {
        axios.get("/date", {params: fromToInputs})
            .then(response => {
                resultDateArray = formatDate(response.data);
                printDatesList();
                printYearAndMonth(resultDateArray, setSelectedYearAndMonth);
                printCalendar();
            })
    }
    return (
        <>
            <button id="search_btn" onClick={searchDates}>조회</button>
        </>
    )
}
export default SearchDateButton;