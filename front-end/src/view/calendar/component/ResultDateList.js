import React from "react";
import './css/ResultDateList.css'
import {Table} from 'antd';
import "antd/dist/antd.css";
const ResultDateList = ({selectedDates}) => {

    const columns = [
        {
            title: '일자',
            dataIndex: 'date',
            key: 'date',
        },
        {
            title: '요일',
            dataIndex: 'day',
            key: 'day',
        },
        {
            title: '국경일',
            dataIndex: 'isHoliday',
            key: 'isHoliday',
        },]
    return (
        <div id="right_area_border">
            <div id="right_area">
                <Table rowClassName={(selectedDates,index) =>
                        selectedDates.day === '일요일' ? 'sun' :
                        selectedDates.day === '토요일' ? 'sat' : ''}
                       pagination={{ defaultPageSize: 50, showSizeChanger: true, pageSizeOptions: ['10', '20', '50']}}
                       columns={columns}
                       dataSource={selectedDates} />
            </div>
        </div>
    )
}
export default ResultDateList;