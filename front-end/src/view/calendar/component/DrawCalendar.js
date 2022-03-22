import React from "react";
import '../utils/DateUtils'

const DrawCalendar = ({
                          weeks,
                          selectedDates,
                          setSelectedDate
                          }) => {

    const printSelectedDate = (param) => {
        setSelectedDate(param)
    }
    const isCheckSelected = (param) => {
        let result = false
        if (undefined === param || null === param || '' === param) {
            return false
        }
        if (selectedDates.find(element => param.date === element.date)) {
            return true
        }
        return result
    }

    const drawDay = (day, index) => {
        const dateNumber = null === day ? null : day.dateNumber
        let style = {color: 'black'}

        if (isCheckSelected(day)) {
            if (index === 0) {
                style.color = 'red'
            }
            if (index === 6) {
                style.color = 'blue'
            }
        }

        if (!isCheckSelected(day)) {
            style = {color: 'lightgray'}
            if (index === 0) {
                style.color = '#FFDAB9'
            }
            if (index === 6) {
                style.color = '#B0E0E6'
            }
        }

        return <td key={index}>
                    <div style={style}
                         onClick={() => printSelectedDate(day)}>
                        {dateNumber}
                    </div>
               </td>
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