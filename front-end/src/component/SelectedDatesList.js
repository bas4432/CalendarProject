const SelectedDatesList = Array(1)
    .fill()
    .map(() => ({
        datesTwo : ['2022-03-01', '2022-03-02','2022-03-03','2022-03-04','2022-03-05'],
        listDaysTwo : ['화요일','수요일','목요일','금요일','토요일'],
    }));
const runCallback = (cb) => {
    return cb();
};
export default SelectedDatesList;