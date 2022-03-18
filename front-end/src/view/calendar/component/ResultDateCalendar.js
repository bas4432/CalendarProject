import './css/ResultDateCalendar.css';
import MoveToOtherCalendarPage from "./MoveToOtherCalendarPage";
import DrawCalendar from "./DrawCalendar";

const ResultDateCalendar = ({selectedYearAndMonth, selectedCalendarDates}) => {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return (
        <>
            <div id="selected_year_month">
                {selectedYearAndMonth.year} {selectedYearAndMonth.month}
            </div>

            <div id="calendar_table">
                <table id="calender_table_result">
                    <thead>
                    <tr>
                        {days.map((day, index) => {
                            return <th key={index}>{day}</th>
                        })}
                    </tr>
                    </thead>
                    <tbody>
                        <DrawCalendar/>
                    </tbody>
                </table>
                <MoveToOtherCalendarPage/>
            </div>
        </>
    )
}
export default ResultDateCalendar;