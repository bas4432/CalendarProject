import React, {useEffect, useMemo, useState} from "react";
import CalendarTitle from "./component/CalendarTitle";
import SelectDate from "./component/SelectDate";
import ResultDateCalendar from "./component/ResultDateCalendar";
import ResultDate from "./component/ResultDate";
import ResultDateList from "./component/ResultDateList";
import emptyDate from "./constant/EmptyDate";
import emptyYearAndMonth from "./constant/EmptyYearAndMonth";
import axios from "axios";
import {
    formatCalendarDate,
    formatDate,
    getStartDate,
    getLastDate,
    getFormatDate,
} from "./utils/DateUtils";

const Calendar = () => {
    let resultYearAndMonth = {year: '', month: ''};
    let resultDateArray = [];
    const [weeks, setWeeks] = useState([]);
    const [currentDate, setCurrentDate] = useState(new Date())

    useEffect(() => {
        const param = {
            startDate: getFormatDate(getStartDate(currentDate)),
            endDate: getFormatDate(getLastDate(currentDate))
        }

        axios.get("/date", {params: param})
            .then(res => {
                searchDates(param)
            })
    }, [currentDate])

    const initalizeSelectedDates = () => {
        let resultDates = []
        for (let i = 0; i <= 50; i++) {
            resultDates.push(JSON.parse(JSON.stringify(emptyDate)))//Deep copy
        }
        return resultDates;
    }
    const initalizeSelectedYearAndMonth = () => {
        let resultYearAndMonth = []
        resultYearAndMonth.push(JSON.parse(JSON.stringify(emptyYearAndMonth)))
        return resultYearAndMonth;
    }
    const [selectedDates, setSelectedDates] = useState(initalizeSelectedDates());
    const [selectedYearAndMonth, setSelectedYearAndMonth] = useState(initalizeSelectedYearAndMonth());
    const printYearAndMonth = (resultDateArray, setSelectedYearAndMonth) => {
        resultYearAndMonth.year = (resultDateArray[0].date).substring(0, 4) + '년'
        resultYearAndMonth.month = (resultDateArray[0].date).substring(5, 7) + '월'
        setSelectedYearAndMonth(resultYearAndMonth)
    }
    const searchDates = (param) => {
        axios.get("/date", {params: param})
            .then(response => {
                resultDateArray = formatDate(response.data);
                setWeeks(formatCalendarDate(resultDateArray))

                printYearAndMonth(resultDateArray, setSelectedYearAndMonth);
            })
    }

    return (
        <>
            <CalendarTitle/>
            <SelectDate
                //Props를 이용하여 자식 component에 값을 전달
                setSelectedDates={setSelectedDates}
            />
            <ResultDateCalendar
                selectedYearAndMonth={selectedYearAndMonth}
                weeks={weeks}
                currentDate={currentDate}
                setCurrentDate={setCurrentDate}
                selectedDates={selectedDates}
            />
            <ResultDate/>
            <ResultDateList
                selectedDates={selectedDates}
            />
        </>
    )
}

export default Calendar