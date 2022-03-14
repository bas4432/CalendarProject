import logo from './logo.svg';
import './App.css';
import CalendarTemplate from "./component/CalendarTemplate";
import SelectDate from "./component/SelectDate";
import ResultDateCalendar from "./component/ResultDateCalendar";
import ResultDate from "./component/ResultDate";
import ResultDateList from "./component/ResultDateList";

const App = () => {
    return (
        <>
            <CalendarTemplate/>
            <SelectDate/>
            <ResultDateCalendar/>
            <ResultDate/>
            <ResultDateList/>
        </>
    )
}
export default App;
