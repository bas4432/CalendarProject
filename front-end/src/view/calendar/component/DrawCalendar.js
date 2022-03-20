import React from "react";

const DrawCalendar = ({weeks, selectedDates}) => {
    const isCheckSelected = (param) => {
        let result = false
        if(undefined === param || null === param || '' === param){
            return false
        }
        if(selectedDates.find(element => param.date === element.date)){
            return true
        }
        return result
    }

    const drawDay = (day, index) => {
        const dateNumber = null === day ? null : day.dateNumber
        let style = {color: 'black'}

        if(isCheckSelected(day)){
            if(index === 0) {
                style.color = 'red'
            }
            if (index === 6){
                style.color = 'blue'
            }
        }

        if(!isCheckSelected(day)){
            style = {color: 'gray'}
            if(index === 0) {
                style.color = 'orange'
            }
            if (index === 6){
                style.color = '#87CEEB'
            }
        }
        return <td key={index}><div style={style}>{dateNumber}</div></td>
    }

    return (
        <tbody>
            {weeks.map((week, index) =>
                <tr key={index}>
                    {week.map((day, index) =>
                        drawDay(day, index)
                    )}
                </tr>
            )}
        </tbody>
    )
}
export default DrawCalendar;