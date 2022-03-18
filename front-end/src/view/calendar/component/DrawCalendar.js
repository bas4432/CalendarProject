import React from "react";

const DrawCalendar = ({weeks}) => {
    const drawDay = (day, index) => {
        const dateNumber = null === day ? null : day.dateNumber
        let style = {color: 'black'}
        if(index === 0) {
            style.color = 'red'
        }
        if (index === 6){
            style.color = 'blue'
        }
        return <td><div style={style}>{dateNumber}</div></td>
    }

    return (
        <tbody>
        {weeks.map(week =>
            <tr>
                {week.map((day, index) =>
                    drawDay(day, index)
                )}
            </tr>
        )}
        </tbody>
    )
}
export default DrawCalendar;