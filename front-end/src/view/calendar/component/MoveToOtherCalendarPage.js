import './css/MoveToOtherCalendarPage.css'
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

        console.debug('moved to ', result.toISOString())
        setCurrentDate(result)
    }

    return (
        <>
            <div>
                <div id="triangle_div">
                    <a href="#" onClick={() => {
                        moveCurrentDate(-1)
                    }}><div className="triangle_left"></div></a>
                    <a href="#" onClick={() => {
                        moveCurrentDate(+1)
                    }}><div className="triangle_right"></div></a>
                </div>
            </div>
            <div id="pre_next_div">
                <div className="pre">pre</div>
                <div className="next">next</div>
            </div>
        </>
    )
}
export default MoveToOtherCalendarPage;