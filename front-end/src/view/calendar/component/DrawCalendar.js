import React, {useState} from "react";

const DrawCalendar = () => {
    const header = ['일', '월', '화', '수', '목', '금', '토']
    const [weeks, setWeeks] = useState(
        [
            [null, null, '1', '2', '3', '4', '5', ]
            , ['6', '7', '8', '9', '10', '11', '12', ]
            , ['13', '14', '15', '16', '17', '18', '19', ]
            , ['20', '21', '22', '23', '24', '25', '26', ]
            , ['27', '28', '29', '30', '31', null, null, ]
            , [null, null, null, null, null, null, null, ]
        ]);

    const drawDay = (day, index) => {
        let result = <td>{day}</td>
        if(index === 0) {
            result = <td style={{color: 'red'}}>{day}</td>
        }
        if (index === 6)
            result = <td style={{color: 'blue'}}>{day}</td>
        return result
    }

    return (
        <tbody>
            {weeks.map(week =>
                <tr>
                    {week.map((day, index) =>

                        drawDay(day, index)

                    )}
                </tr>
            )
            }
        </tbody>
    )
}
export default DrawCalendar;