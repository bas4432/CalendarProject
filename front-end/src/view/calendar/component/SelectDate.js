import './css/SelectDate.css';
import SearchDateButton from "./SearchDateButton";
import {useState} from "react";

const SelectDate = ({setSelectedDates}
                    ) => {
    const [inputs, setInputs] = useState({
        startDate: '',
        endDate: ''
    });
    const onChangeStartDate = (e) => {
        setInputs({...inputs, ...{startDate: e.target.value}})
    }
    const onChangeEndDate = (e) => {
        setInputs({...inputs, ...{endDate: e.target.value}})
    }

    return (
        <div id="body_box">
            <span id="calendar_left_area">
                <div id="date_div">
                    <button id="select_date_btn">
                        <span id="select_date_star">*</span> 기간
                    </button>
                    <div id="start_date_box">
                        <input type="date"
                               className="input_date"
                               onChange={onChangeStartDate}/>
                    </div>
                    <span id="from_til">~</span>
                    <div id="end_date_box">
                        <input type="date"
                               className="input_date"
                               onChange={onChangeEndDate}/>
                    </div>
                    <SearchDateButton
                        fromToInputs = {inputs}
                        setSelectedDates={setSelectedDates}
                    />
                </div>
            </span>
        </div>
    )
}
export default SelectDate;