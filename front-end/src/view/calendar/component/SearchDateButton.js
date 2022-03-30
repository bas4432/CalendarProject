import React from "react";
import axios from "axios";
import {formatDate, isHolidayCheck} from "../utils/DateUtils";
import {Button} from "reactstrap";

const SearchDateButton = ({fromToInputs, setSelectedDates}) => {

    const searchSelectedDates = (param) => {
        axios.get("/date", {params: param})
            .then(response => {
                const resultDateArray = formatDate(response.data)
                axios.get("/isHoliday", {params:response.data})
                    .then(response => {
                        const holidayDateArray = isHolidayCheck(response.data, resultDateArray)
                        setSelectedDates(holidayDateArray)
                    })
            })
    }
    const onClickHandler = () => {
        searchSelectedDates(fromToInputs)
    }

    return (
        <>
            <Button color="dark" id="search_btn" onClick={onClickHandler}>조회</Button>
        </>
    )
}
export default SearchDateButton;