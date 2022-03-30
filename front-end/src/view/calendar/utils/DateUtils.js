

export const days = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

const getHoliday = (isHoliday) => {
    if (isHoliday === true) {
        return '예'
    }
    if (isHoliday === false) {
        return '아니오'
    }
}
export const formatDate = (param) => {
    let resultDatesObject = []
    for (let i = 0; i < param.length; i++) {
        const date = new Date(param[i]);
        let month = date.getMonth() + 1;
        let day = date.getDate();
        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        resultDatesObject.push({
            key:i,
            date: date.getFullYear() + '-' + month + '-' + day,
            dateNumber: day,
            day: days[date.getDay()],
            dayOfOrder: date.getDay(),
            isHoliday: getHoliday(false)
        })
    }
    return resultDatesObject
}

export const holidayCheck = (holidayList, resultDateArray) => {
    const resultHolidayArray = []
    for (let i = 0; i < holidayList.length; i++) {
        resultHolidayArray.push([holidayList[i].slice(0, 4), '-', holidayList[i].slice(4,6), '-' ,holidayList[i].slice(6)].join(''))
    }
    for (let i = 0; i < resultDateArray.length; i++) {
        for (let j = 0; j < resultDateArray.length; j++) {
            if (resultDateArray[i].date === resultHolidayArray[j]) {
                resultDateArray[i].isHoliday = getHoliday(true);
            }
        }
    }
    return resultDateArray
}

export const formatCalendarDate = (param) => {
    const result = []
    const dates = JSON.parse(JSON.stringify(param));
    const firstDayOfWeek = dates[0].dayOfOrder === 0 ? 7 : dates[0].dayOfOrder
    const firstDate = new Date(dates[0].date)
    const weekNo = Math.ceil((firstDayOfWeek - 1 + firstDate.getDate()) / 7);
    const dayOfOrder = dates[0].dayOfOrder
    let currentWeek = 1;

    for (let weekLoop = 0; weekLoop <= 5; weekLoop++) {
        let week = []
        for (let day = 0; day <= 6; day++) {
            if (currentWeek < weekNo) {
                week.push(null)
            } else if (0 < dates.length &&
                day === dates[0].dayOfOrder) {
                week.push(dates.shift())
            } else if (day !== dayOfOrder || 0 == dates.length) {
                week.push(null)
            }
        }
        currentWeek++;
        result.push(week);
    }
    return result
}

export const getStartDate = (date) => {
    return new Date(date.getFullYear(), date.getMonth(), 1)
}

export const getLastDate= (date) => {
    return new Date(date.getFullYear(), date.getMonth() +1, 0)
}

export const getFormatDate = (date) => {
    const formatMonth = date.getMonth() + 1 >= 10 ? date.getMonth() + 1 : '0' + (date.getMonth() + 1)
    const formatDate = date.getDate() >= 10 ? date.getDate() : '0' + (date.getDate())
    return `${date.getFullYear()}-${formatMonth}-${formatDate}`
}