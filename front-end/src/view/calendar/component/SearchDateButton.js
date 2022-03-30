import React from "react";
import axios from "axios";
import {formatDate, holidayCheck} from "../utils/DateUtils";
import {Button} from "reactstrap";

const SearchDateButton = ({fromToInputs, setSelectedDates}) => {

    const isValidated = (response) => {
        if (undefined === response
            || null === response
            || undefined === response.data
            || null === response.data
            || "" === response.data
        ) {
            return false
        }

        return true
    }

    const getDate = (param, successHandler) => {
        axios.get("/date", {params: param})
            .then(response => {
                if (isValidated(response)) {
                    successHandler(response.data)
                }
            })
    }

    const getHoliday = (resultDateArray) => {
        if (null !== resultDateArray) {
            axios.get("/isHoliday", {params: resultDateArray})
                .then(response => {
                    const holidayDateArray = holidayCheck(response.data, formatDate(resultDateArray))
                    setSelectedDates(holidayDateArray)
                })
        }
    }

    const searchSelectedDates = (param) => {
        getDate(param, getHoliday)
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