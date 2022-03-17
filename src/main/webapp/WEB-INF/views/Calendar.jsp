<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Boot Application with JSP</title>
</head>
<style>
    
    #header_box {
        border-bottom: 1px solid lightgray;
        margin: 0;
        padding: 0;
    }
​
    #select_date_btn {
        border: 1px solid rgb(117, 142, 173);
        height: 22px;
        width: 64px;
        text-align: right;
        font-size: 11px;
    }
​
    #select_date_star {
        color: red;
    }
​
    #date_div {
        padding: 10px;
        margin-top: 25px;
        display: flex;
        align-items: center;
    }
​
    #start_date_box {
        border: 1px solid rgb(117, 142, 173);
        display: inline-block;
        font-size: 7px;
        width: 85px;
        height: 20px;
        margin-left: 2px;
        margin-right: 10px;
    }
​
    #from_til {
        font-weight: bold;
    }
​
    .d_box {
        border-left: 1px solid rgb(117, 142, 173);
        display: inline-block;
        font-size: 12px;
        width: 20px;
        height: 21px;
        text-align: center;
        color: gray;
        float: right;
    }
​
    #end_date_box {
        border: 1px solid rgb(117, 142, 173);
        display: inline-block;
        font-size: 7px;
        width: 85px;
        height: 20px;
        margin-left: 10px;
        margin-right: 10px;
    }
​
    #search_btn {
        background-color: rgb(79, 129, 189);
        color: white;
        width: 80px;
        height: 25px;
    }
​
    #selected_year_month {
        font-weight: bold;
        margin-left: 20px;
    }
​
    #calendar_table {
        margin-left: 15px;
        margin-top: 10px;
    }
​
    table {
        border-collapse: collapse;
        border: 2px solid;
        font-size: 14px;
    }
​
    th {
        border: 2px solid;
        margin: 0;
        padding: 0 auto;
        width: 50px;
        height: 27px;
        background-color: rgb(238, 236, 225);
    }
​
    td {
        border: 2px solid;
        margin: 0;
        padding: 0 auto;
        width: 50px;
        height: 40px;
    }
​
    #arrow_div {
        margin-left: 20px;
    }
    #arrow_left {
        width: 0;
      height: 0;
      border-top: 50px solid transparent;
      border-right: 100px solid blue;
      border-bottom: 50px solid transparent;
    }
</style>
​
<body>
    <div id="header_box">
        <h1>Calendar 기본 과제</h1>
    </div>
​
    <div id="date_div">
        <button id="select_date_btn"><span id="select_date_star">*</span> 기간</button>
        <div id="start_date_box"><span class="d_box">D</span></div> <span id="from_til">~</span>
        <div id="end_date_box"><span class="d_box">D</span></div><button id="search_btn">조회</button>
    </div>
    <div id="selected_year_month">2020년 5월</div>
    <div id="calendar_table">
        <table>
            <thead>
                <tr>
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody >
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div id="arrow_div">
            <div id="arrow_left"></div>
        </div>
    </div>
    
</body>
​
</html>