import './css/SearchDateButton.css'
import axios from "axios";
import React, {useState} from "react";
import emptyDate from "../constant/EmptyDate";

const SearchDateButton = ({
                              fromToInputs,
                              selectedDates,
                              setSelectedDates,
                              setSelectedYearAndMonth,
                              setWeeks
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
                dateNumber: day,
                day: days[date.getDay()],
                dayOfOrder: date.getDay(),
                isHoliday: '아니오'
            })
        }
        return resultDatesObject
    }

    function formatCalendarDate(param) {
        const result = []
        const dates = JSON.parse(JSON.stringify(param));
        const firstDayOfWeek = dates[0].dayOfOrder === 0 ? 7 : dates[0].dayOfOrder
        const firstDate = new Date(dates[0].date)
        const weekNo = Math.ceil((firstDayOfWeek - 1 + firstDate.getDate()) / 7);
        const dayOfOrder = dates[0].dayOfOrder
        let currentWeek = 1;

        for (let weekLoop = 0; weekLoop <= 5; weekLoop++) {
            let week = []
            for (let day = 0; day <= 6; day++) {
                if (currentWeek < weekNo) {
                    week.push(null)
                } else if (0 < dates.length &&
                    day === dates[0].dayOfOrder) {
                    week.push(dates.shift())
                } else if (day !== dayOfOrder || 0 == dates.length) {
                    week.push(null)
                }
            }
            currentWeek++;
            result.push(week);
        }
        return result
    }

    const searchDates = () => {
        axios.get("/date", {params: fromToInputs})
            .then(response => {
                resultDateArray = formatDate(response.data);
                setWeeks(formatCalendarDate(resultDateArray))

                printDatesList();
                printYearAndMonth(resultDateArray, setSelectedYearAndMonth);
            })
    }
    return (
        <>
            <button id="search_btn" onClick={searchDates}>조회</button>
        </>
    )
}
export default SearchDateButton;