import './css/SearchDateButton.css'
import axios from "axios";
import React, {useState} from "react";
import emptyDate from "../constant/Constant";

const SearchDateButton = ({fromToInputs, selectedDates, setSelectedDates}) => {
    let resultDateArray = [];
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
                console.log('res', response)
                resultDateArray = formatDate(response.data);
                printDatesList();
            })
    }
    return (
        <>
            <button id="search_btn" onClick={searchDates}>조회</button>
        </>
    )
}
export default SearchDateButton;