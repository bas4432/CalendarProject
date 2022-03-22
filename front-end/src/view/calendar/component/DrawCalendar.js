import React from "react";
import '../utils/DateUtils'

const DrawCalendar = ({
                          weeks,
                          selectedDates,
                          selectedDate,
                          setSelectedDate
                      }) => {

    const printSelectedDate = (param) => {
        setSelectedDate(param)
    }
    const isCheckSelected = (param) => {
        let result = false
        if (undefined === param || null === param || '' === param) { return false }
        if (selectedDates.find(element => param.date === element.date)) { return true }
        return result
    }

    const isSelected = (day, selectedDate) => {
        const isDayIsNotNull = undefined !== day && null !== day && null !== day.date && undefined !== day.date
        const isSelectedDateIsNotNull = undefined !== selectedDate && null !== selectedDate && undefined !== selectedDate.date && null !== selectedDate.date
        return isDayIsNotNull && isSelectedDateIsNotNull && day.date === selectedDate.date
    }

    const getBackGroundStyle = (isSelected) => isSelected ? {backgroundColor:'red'} : {backgroundColor:'(0, 0, 0, 0.5)'}

    const getRangeSelected = (isCheckSelected, index) => {
        let result = {color: 'black'}

        if (isCheckSelected) {
            if (index === 0) { result.color = 'red'}
            if (index === 6) { result.color = 'blue'}
        }

        if (!isCheckSelected) {
            result = {color: 'lightgray'}
            if (index === 0) { result.color = '#FFDAB9'}
            if (index === 6) { result.color = '#B0E0E6'}
        }

        return result
    }

    return (
        <tbody>
        {weeks.map((week, index) =>
            <tr key={index}>
                {week.map((day, index) =>
                    <td key={`${index}_selected_${isSelected(day, selectedDate)}`}
                        style={getBackGroundStyle(isSelected(day, selectedDate))}>
                        <div style={getRangeSelected(isCheckSelected(day), index)}
                             onClick={() => printSelectedDate(day)}>
                            {null === day ? null : day.dateNumber}
                        </div>
                    </td>
                )}
            </tr>
        )}
        </tbody>
    )
}
export default DrawCalendar;