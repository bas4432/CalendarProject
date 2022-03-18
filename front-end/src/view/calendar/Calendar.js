import React, {useState} from "react";
import CalendarTitle from "./component/CalendarTitle";
import SelectDate from "./component/SelectDate";
import ResultDateCalendar from "./component/ResultDateCalendar";
import ResultDate from "./component/ResultDate";
import ResultDateList from "./component/ResultDateList";
import emptyDate from "./constant/EmptyDate";
import emptyYearAndMonth from "./constant/EmptyYearAndMonth";
import emptyCalendar from "./constant/EmptyCalendar";

const Calendar = () => {
    const [weeks, setWeeks] = useState(
        [
            [null, null, '1', '2', '3', '4', '5', ]
            , ['6', '7', '8', '9', '10', '11', '12', ]
            , ['13', '14', '15', '16', '17', '18', '19', ]
            , ['20', '21', '22', '23', '24', '25', '26', ]
            , ['27', '28', '29', '30', '31', null, null, ]
            , [null, null, null, null, null, null, null, ]
        ]);


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
    const initalizeSelectedCalendarDates = () => {
        let resultCalendarDates = []
        for (let i = 0; i < 6; i++) {
            resultCalendarDates.push(emptyCalendar)
        }
        return resultCalendarDates;
    }
    const [selectedDates, setSelectedDates] = useState(initalizeSelectedDates());
    //useState를 이용하여 SelectedDates 의 초기값을 설정함

    const [selectedYearAndMonth, setSelectedYearAndMonth] = useState(initalizeSelectedYearAndMonth());
    const [selectedCalendarDates, setSelectedCalendarDates] = useState(initalizeSelectedCalendarDates());

    return (
        <>
            <CalendarTitle/>
            <SelectDate
                //Props를 이용하여 자식 component에 값을 전달
                selectedDates={selectedDates}
                setSelectedDates={setSelectedDates}
                selectedYearAndMonth={selectedYearAndMonth}
                setSelectedYearAndMonth={setSelectedYearAndMonth}
                selectedCalendarDates={selectedCalendarDates}
                setSelectedCalendarDates={setSelectedCalendarDates}
                setWeeks={setWeeks}
            />
            <ResultDateCalendar
                selectedYearAndMonth={selectedYearAndMonth}
                weeks={weeks}
            />
            <ResultDate/>
            <ResultDateList
                selectedDates={selectedDates}
            />
        </>
    )
}

export default Calendar