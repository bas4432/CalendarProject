import './css/SearchDateButton.css'
import React from "react";
import axios from "axios";
import {formatDate} from "../utils/DateUtils";

const SearchDateButton = ({fromToInputs, setSelectedDates}) => {

    const searchSelectedDates = (param) => {
        axios.get("/date", {params: param})
            .then(response => {
                const resultDateArray = formatDate(response.data);
                setSelectedDates(resultDateArray)
            })
    }
    const onClickHandler = () => {
        searchSelectedDates(fromToInputs)
    }

    return (
        <>
            <button id="search_btn" onClick={onClickHandler}>조회</button>
        </>
    )
}
export default SearchDateButton;