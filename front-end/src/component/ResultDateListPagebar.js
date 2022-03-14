import './ResultDateListpagebar.css'
import React from "react";
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