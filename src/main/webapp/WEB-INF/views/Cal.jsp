<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Boot Application with JSP</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<style>
.header_box {
	border-bottom: 1px solid lightgray;
	margin: 0;
	padding: 0;
}

.body_box {
	height: 1310px;
	border-bottom: 1px solid rgb(79, 129, 189);
}

.select_date_btn {
	border: 1px solid rgb(117, 142, 173);
	height: 22px;
	width: 64px;
	text-align: right;
	font-size: 11px;
}

.select_date_star {
	color: red;
}

.date_div {
	padding: 10px;
	margin-top: 25px;
	margin-left: 20px;
	display: flex;
	align-items: center;
}

.start_date_box {
	border: 1px solid rgb(117, 142, 173);
	display: inline-block;
	font-size: 7px;
	width: 85px;
	height: 20px;
	margin-left: 2px;
	margin-right: 10px;
}

.from_til {
	font-weight: bold;
}

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

.end_date_box {
	border: 1px solid rgb(117, 142, 173);
	display: inline-block;
	font-size: 7px;
	width: 85px;
	height: 20px;
	margin-left: 10px;
	margin-right: 10px;
}

.search_btn {
	background-color: rgb(79, 129, 189);
	color: white;
	width: 80px;
	height: 25px;
}

.selected_year_month {
	font-weight: bold;
	margin-left: 45px;
	margin-top:10px;
}

.calendar_table {
	margin-left: 38px;
	margin-top: 10px;
}

.calender_table_result {
	border-collapse: collapse;
	border: 2px solid;
	font-size: 14px;
}

.calendar_table>table>thead>tr>th {
	border: 2px solid;
	margin: 0;
	padding: 0 auto;
	width: 45px;
	height: 25px;
	background-color: rgb(238, 236, 225);
}

.calendar_table>table>tbody>tr>td {
	border: 2px solid;
	margin: 0;
	padding: 0 auto;
	width: 45px;
	height: 36px;
	text-align: center;
}

.calendar_table>table>tbody>tr>.sun {
	color: red;
	border: 2px solid black;
}

.calendar_table>table>tbody>tr>.sat {
	color: blue;
	border: 2px solid black;
}

/* #test{
        display: flex;
    } */
.triangle_div {
	display: flex;
}

.triangle_left {
	width: 0;
	height: 0;
	position: relative;
	border-top: 25px solid transparent;
	border-right: 50px solid rgb(56, 93, 138);
	border-bottom: 25px solid transparent;
	border-radius: 2px;
	top: 20px;
	left: 110px;
}

.triangle_left:after {
	content: "";
	width: 0;
	height: 0;
	position: absolute;
	border-top: 19px solid transparent;
	border-right: 36px solid rgb(79, 129, 189);
	border-bottom: 19px solid transparent;
	border-radius: 2px;
	top: -20px;
	left: 10px;
}

.triangle_right {
	width: 0;
	height: 0;
	border-top: 25px solid transparent;
	border-left: 50px solid rgb(56, 93, 138);
	border-bottom: 25px solid transparent;
	position: relative;
	border-radius: 2px;
	top: 20px;
	left: 160px;
}

.triangle_right:after {
	content: "";
	width: 0;
	height: 0;
	position: absolute;
	border-top: 19px solid transparent;
	border-left: 36px solid rgb(79, 129, 189);
	border-bottom: 19px solid transparent;
	border-radius: 2px;
	top: -20px;
	left: -46px;
}

.test2 {
	display: flex;
}

.pre {
	margin-left: 100px;
	padding: 20px;
	font-size: 25px;
}

.next {
	margin-left: 15px;
	padding: 20px;
	font-size: 25px;
	padding: 20px;
}

.selected_date_table {
	margin-top: 15px;
	margin-left: 20px;
	text-align: center;
}

.selected_date_table>tr, th {
	text-align: center;
	width: 90px;
	font-size: 13px;
}

.right_area_border {
	position: absolute;
	top: 11%;
	left: 40%;
	border-right: 1px solid rgb(79, 129, 189);
}

.right_area {
	margin-top: 50px;
	margin-right: 10px;
	/* position: absolute;
        top: 15%;
        left: 40%; */
}

.selected_date_table>tr, .month_and_date {
	width: 50px;
}

.selected_date_list {
	text-align: center;
	width: 350px;
}

.selected_date_list>thead>tr>th {
	background-color: rgb(79, 129, 189);
	border-bottom: 2px solid;
	color: white;
	height: 20px;
}

.selected_date_list>tbody>tr {
	height: 22px;
}

.selected_date_list>tbody>tr:nth-child(odd) {
	background-color: rgb(208, 216, 232);
}

.selected_date_list>tbody>tr:nth-child(even) {
	background-color: rgb(233, 237, 244);
}

.page_div {
	margin-top: 7px;
	margin-bottom: 7px;
	display: flex;
	justify-content: right;
}

.page_div_ch {
	display: flex;
	margin: 0 1px;
}

.page_left_arrow {
	border: 1px solid black;
	width: 19px;
	height: 19px;
	text-align: center;
	line-height: 19px;
	display: inline-block;
	position: relative;
}

.page_left_arrow>a {
	text-decoration: none;
	color: black;
}

.page_right_arrow {
	border: 1px solid black;
	width: 19px;
	height: 19px;
	text-align: center;
	display: inline-block;
	line-height: 19px;
	position: relative;
	margin-left: 2px;
}

.page_right_arrow>a {
	text-decoration: none;
	color: black;
}

.page_number {
	margin: 0;
	padding: 0;
	border: 1px solid black;
	width: 19px;
	height: 19px;
	text-align: center;
	display: inline-block;
	line-height: 19px;
	position: relative;
	font-size: 12px;
}

.page_number>a {
	text-decoration: none;
	color: black;
}

.getday{
   text-align: center;
   border: 2px solid;

}
.dateSpan{
   display:none;
}

.week{
  text-align:center;
}

.week>td{
   border:2px soiid
}

</style>

<script type="text/javascript">
$(function(){
	var today = new Date();
    var date = new Date();           

    $(".pre").click(function() { // 이전달
        $(".calendar_table tbody td").remove();
        $(".calendar_table tbody tr").remove();
        today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
        firstscreen();
    })
    
    $(".next").click(function(){ //다음달
        $(".calendar_table tbody td").remove();
        $(".calendar_table tbody tr").remove();
        today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
        firstscreen();
    })


    function firstscreen() {
        
        nowYear = today.getFullYear();
        nowMonth = today.getMonth();
        firstDate = new Date(nowYear,nowMonth,1).getDate();
       
        
        firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st의 요일
        lastDate = new Date(nowYear,nowMonth+1,0).getDate();
          
        if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //윤년 적용
            lastDate[1]=29;
        }

        $(".selected_year_month").text(nowYear+"년 "+(nowMonth+1)+"월");

        for (i=0; i<firstDay; i++) { //첫번째 줄 빈칸
            $(".calendar_table tbody").append("<td></td>");
        }
        
        for (i=1; i <=lastDate; i++){ // 날짜 채우기
            plusDate = new Date(nowYear,nowMonth,i).getDay();
            if (plusDate==0) {
                $(".calendar_table tbody").append("<tr></tr>");
            }
            $(".calendar_table tbody").append("<td id='datetd' class='day" + i  + "' >"+ i +"</td>");
        }
        if($(".calendar_table > tbody > td").length%7!=0) { //마지막 줄 빈칸
            for(i=1; i<= $(".calendar_table > tbody > td").length%7; i++) {
                $(".calendar_table tbody").append("<td></td>");
            }
        }
       
   
    }
    firstscreen();
   
   
});






$(function() {
	
	
	
	 $("#datepicker1,#datepicker2").datepicker(
	      {
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			showOn : "both",
			buttonText : "''",
			yearSuffix : "년",
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월','8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일','토요일' ],
			minDate : "-5Y",
			maxDate : "+5y"
		  });
	$('#datepicker1').datepicker('setDate', 'today');
		
	$("#btndatefilter").click(function() {
			        
	     $(".calender_table_result tbody span").remove(".dateSpan")
			        
			    let startDay = $('#datepicker1').val();
			    let endDay = $('#datepicker2').val();
			    
			    $.ajax({
						type : 'GET',
						data : {
							"startDay" : $('#datepicker1').val(),
							"endDay" : $('#datepicker2').val()
						},
						url : "/api/index",
						success : function(data) {	 
						   
							
						   
				           let year = new Date(data[0]).getFullYear();//올해년도
						   let month = new Date(data[0]).getMonth()+1;//이번달 
                           let firstweek = new Date(year, month-1 ,1).getDay(); //이번달 첫째일의 요일
                           let lastDate = new Date(year,month,0).getDate(); // 지금달 마지막 날
                           
                         /*   $(".selected_year_month").text(year + "년" + month + "월");
                          
                               let dayRow = 0;
                               for(let x = 1; x <= lastDate; x ++ ) { 
							   
                        	   let dayofweek = new Date(year, month-1, x).getDay();//요일값 
							   $(".row" + dayRow + " .dayofweek" +dayofweek).append("<span class='dateSpan day" + x  + "' >" + x + "</span>")
							   if(dayofweek==6) {
								   dayRow++;
							     }
						       } 
                               //선택한 달의 모든 날짜 뿌려주고 숨김처리 */
                               
                               let ttoday = new Date(); 
                               
						 
                                for(let i = 0; i < data.length ; i ++){
                            	  
                            	 
                            	  
                            	  console.log("getMOntH::" + new Date(data[i]).getMonth())
                            	  
                            	  
                            	
                            	  let date = new Date(data[i]).getDate();
						          $(".day" + date).css('background-color', 'red'); 
						         
                            	  
					    	  }
                             
                            //일자 - 요일 - 국경일 
						    let inst = "";
                            let week = new Array('일요일', '월요일', '화요일', '수요일','목요일', '금요일', '토요일');
                            for (var i = 0; i < data.length; i++) {

								inst += "<tr>";
								inst += "<td>" + data[i] + "</td>";
								inst += "<td>"+ week[new Date(data[i]).getDay()] + "</td>"
								inst += "</tr>";
							 }
						    $("#data").html(inst);
						}, //succes: function
						error : function(jqXHR, textStatus, errorThrown) {
							alert("마지막 날짜를 선택 하세요");
						}
					});//ajax 
			})//btndatefilter function
});
</script>

<body>
	<div class="header_box">
		<h1>Calendar 기본 과제</h1>
	</div>
	<div class="body_box">
		<span class="calendar_left_area"></span>

		<button id="select_date_btn">
			<span class="select_date_star">*</span> 기간
		</button>
		<input type="date" id="datepicker1" name="startDay"> 
		<span id="from_til">~</span> 
		<input type="date" id="datepicker2" name="endDay"> 
		<input type="button" class="search_btn" id="btndatefilter" value="조회">

        <div class="selected_year_month"></div>
		<div class="calendar_table">
			<table class="calender_table_result">
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
				<tbody class="week" id="ple">
				
				</tbody>
			</table>
		   <div class="test">
				<div class="triangle_div">
					<div class="triangle_left"></div>
					<div class="triangle_right"></div>
				</div>
		   </div>
		   <div class="test2">
				<div class="pre">pre</div>
				<div class="next">next</div>
		   </div>
		</div>
		<table class="selected_date_table">
			<tr>
				<th>선택된 일자</th>
				<th>(요일)</th>
				<th>년</th>
				<th class="month_and_date">월</th>
				<th class="month_and_date">일</th>
			</tr>
			<tr class="day_click">
			    
				<!-- <td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td> -->
			</tr>
		</table>
		
		<div class="right_area_border">
			<div class="right_area">
				<table class="selected_date_list">
					<thead>
						<tr>
							<th>일자</th>
							<th>요일</th>
							<th>국경일</th>
						</tr>
					</thead>
					<tbody id="data">
                    </tbody>
				</table>
		        <div class="page_div">
					<div class="page_div_ch">
						<span class="page_left_arrow"><a href="#">◀</a></span> 
						<span class="page_number"><a href=#>1</a></span> 
						<span class="page_number"><a href=#>2</a></span> 
						<span class="page_number"><a href=#>3</a></span>
                        <span class="page_right_arrow"><a href="#">▶</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>