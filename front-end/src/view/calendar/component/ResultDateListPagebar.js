import './css/ResultDateListpagebar.css'
import React from "react";
import { Pagination } from 'antd';

// ReactDOM.render(<Pagination defaultCurrent={1} total={50} />, mountNode);
const ResultDateListPagebar = () => {

    return (
        <>
            <div id="page_div">
                <div id="page_div_ch">
                    <span id="page_left_arrow"><a href="#">◀</a></span>
                    <span className="page_number"><a href="#">1</a></span>
                    <span className="page_number"><a href="#">2</a></span>
                    <span className="page_number"><a href="#">3</a></span>
                    <span id="page_right_arrow"><a href="#">▶</a></span>
                </div>
            </div>
        </>
    )
}
export default ResultDateListPagebar;