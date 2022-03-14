import React, {useState} from "react";
import CalendarTitle from "./component/CalendarTitle";
import SelectDate from "./component/SelectDate";
import ResultDateCalendar from "./component/ResultDateCalendar";
import ResultDate from "./component/ResultDate";
import ResultDateList from "./component/ResultDateList";
import emptyDate from "./constant/Constant";

const Calendar = () => {

    const initalizeSelectedDates = () => {
        let result = []
        for (let i = 0; i <= 50; i++) {
            result.push(JSON.parse(JSON.stringify(emptyDate)))//Deep copy
        }
        return result;
    }
    const [selectedDates, setSelectedDates] = useState(initalizeSelectedDates());
    //useState를 이용하여 SelectedDates 의 초기값을 설정함
    return (
        <>
            <CalendarTitle/>
            <SelectDate
                //Props를 이용하여 자식 component에 값을 전달
                selectedDates={selectedDates}
                setSelectedDates={setSelectedDates}
            />
            <ResultDateCalendar/>
            <ResultDate/>
            <ResultDateList
                selectedDates={selectedDates}
            />
        </>
    )
}

export default Calendar