import './SelectDate.css';
import SearchDateButton from "./SearchDateButton";

const SelectDate = () => {
    return (
        <div id="body_box">
            <span id="calendar_left_area">
                <div id="date_div">
            <button id="select_date_btn"><span id="select_date_star">*</span> 기간</button>
            <div id="start_date_box"><input className="input_date"/><span className="d_box">D</span></div>
            <span
                id="from_til">~</span>
            <div id="end_date_box"><input className="input_date"/><span className="d_box">D</span></div>
                    <SearchDateButton/>
        </div>
            </span>
        </div>
    )
}
export default SelectDate;