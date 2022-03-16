import './css/ResultDateCalendar.css';
import MoveToOtherCalendarPage from "./MoveToOtherCalendarPage";

const ResultDateCalendar = () => {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return (
        <>
            <div id="selected_year_month">2020년 5월</div>
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
                    <tr>
                        <td className="sun">s</td>
                        <td>1</td>
                        <td>1</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="sat"></td>
                    </tr>
                    <tr>
                        <td className="sun">s</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="sat">s</td>
                    </tr>
                    <tr>
                        <td className="sun">s</td>
                        <td></td>
                        <td>s</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="sat">s</td>
                    </tr>
                    <tr>
                        <td className="sun"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="sat">s</td>
                    </tr>
                    <tr>
                        <td className="sun"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td className="sat"></td>
                    </tr>
                    </tbody>
                </table>
                <MoveToOtherCalendarPage/>
            </div>
        </>
    )
}
export default ResultDateCalendar;