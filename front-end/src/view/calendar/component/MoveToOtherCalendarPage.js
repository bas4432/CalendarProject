import './css/MoveToOtherCalendarPage.css'
import {Button} from "reactstrap";
const MoveToOtherCalendarPage = ({currentDate, setCurrentDate}) => {

    const moveCurrentDate =(increment) => {
        let result = null
        if(increment > 0 && 11 === currentDate.getMonth()){
            result = new Date(currentDate.getFullYear() + 1,
                1,
                1)
        } else if(increment < 0 && 0 === currentDate.getMonth()){
            result = new Date(currentDate.getFullYear() - 1,
                11,
                1)
        } else {
            result = new Date(currentDate.getFullYear(),
                currentDate.getMonth() + increment,
                1)
        }
        setCurrentDate(result)
    }

    return (
        <>
            <div className="move_to">
                <div className="pre">
                    <Button color="dark" onClick={() => {
                        moveCurrentDate(-1)
                    }}>pre</Button>
                </div>
                <div className="next">
                    <Button color="dark" onClick={() => {
                        moveCurrentDate(+1)
                    }}>next</Button>
                </div>
            </div>
        </>
    )
}
export default MoveToOtherCalendarPage;