<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Boot Application with JSP</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style TYPE="text/css">

#header_box{
	border-bottom: 1px solid lightgray;
	margin: 0;
	padding: 0;
}

​.select_date_btn{
	border: 1px solid rgb(117, 142, 173);
	height: 22px;
	width: 64px;
	text-align: right;
	font-size: 11px;
}

​.select_date_star{
	color: red;
}

.dat_div{
	padding: 10px;
	margin-top: 25px;
	display: flex;
	align-items: center;
}

​.start_date_box{
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

​.d_box {
	border-left: 1px solid rgb(117, 142, 173);
	display: inline-block;
	font-size: 12px;
	width: 20px;
	height: 21px;
	text-align: center;
	color: gray;
	float: right;
}

​#end_date_box {
	border: 1px solid rgb(117, 142, 173);
	display: inline-block;
	font-size: 7px;
	width: 85px;
	height: 20px;
	margin-left: 10px;
	margin-right: 10px;
}

​#search_btn{
	background-color: rgb(79, 129, 189);
	color: white;
	width: 80px;
	height: 25px;
}

.selected_year_month {
	font-weight: bold;
	margin-left: 20px;
}

​
#calendar_table{
	margin-left: 15px;
	margin-top: 10px;
}

​
table{
	border-collapse: collapse;
	border: 2px solid;
	font-size: 14px;
}

​th {
	border: 2px solid;
	margin: 0;
	padding: 0 auto;
	width: 50px;
	height: 27px;
	background-color: rgb(238, 236, 225);
}

​td {
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

<script>
$(function() {
    //input을 datepicker로 선언
    $("#datepicker1,#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonText: "''" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});




</script>
<body>

<input type='text' class="form-control linkedCalendars" placeholder="날짜 선택"/>
<span class="input-group-text calendar-icon">
<i data-feather="calendar" class="feather-sm"></i>
</span> 


    <p>조회기간을 선택해주세요~ 
        <input type="text" id="datepicker1">
        <input type="text" id="datepicker2">
    </p>



	<div id="header_box">
		<h1>Calendar 기본 과제</h1>
	</div>
	​
	<div class="dat_div">
		<button class="select_date_btn">
			<span class="select_date_star">*</span> 기간
		</button>
		<div id="start_date_box">
			<span class="d_box"></span>
		</div>
		<span id="from_til">~</span>
		<div id="end_date_box">
			<span class="d_box"></span>
		</div>
		<button id="search_btn">조회</button>
	</div>
	<div class="selected_year_month">2020년 5월</div>
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
			<tbody>
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
</html>