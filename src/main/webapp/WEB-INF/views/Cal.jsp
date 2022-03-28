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
    width: 120px;
    font-size: 10px;
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

.week td{
  text-align:center;
  border: 2px solid black;
}
</style>

<script type="text/javascript">

let searchDate = []; //선택 데이터 

    
$(function(){
    var today = new Date();
    var date = new Date();

    $(".pre").click(function() { // 이전달
        $(".calendar_table tbody td").remove();
        $(".calendar_table tbody tr").remove();
        today = new Date (today.getFullYear(), today.getMonth()-1, today.getDate());
        firstscreen();
    })

    $(".next").click(function(){ //다음달
        $(".calendar_table tbody td").remove();
        $(".calendar_table tbody tr").remove();
        today = new Date (today.getFullYear(), today.getMonth()+1, today.getDate());
        firstscreen();
    })


    function firstscreen() {
    	
        $(".calendar_table tbody td").remove();
        $(".calendar_table tbody tr").remove();
    	
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
          
            let month = (today.getMonth() + 1).toString().padStart(2, "0");
            let day = i.toString().padStart(2, "0");
            calDate = nowYear + "-" + month + "-" +  day;

            if(searchDate == null || searchDate == ""){
                $(".calendar_table tbody").append("<td class='dated day" + i  + "' onclick='saveDate(" + i  + ", nowYear, (nowMonth+1))'  >"+ i +"</td>");
            }else{
                     let val = false;
                     searchDate.filter(searchDate => { 
                     if(searchDate === calDate){
                    	val = true;
                        selectRed();
                       }
                     });
                     if(!val){ 
                	   $(".calendar_table tbody").append("<td class='dated day" + i  + "' onclick='saveDate(" + i  + ", nowYear, (nowMonth+1))'  >"+ i +"</td>");
                 } 
            }
         }
     }
    firstscreen();
});

function selectRed(){
    if(true){
        $(".calendar_table tbody").append("<td class='dated day" + i  + "' onclick='saveDate(" + i  + ", nowYear, (nowMonth+1))'  style='background-color: red' >"+ i +"</td>");
    }
};



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
                                
                                //조회 누르시 첫달 화면 배경 change
                                let count =0;
                                for(let i=0; i<data.length ; i++){
                                   searchDate[i] = data[i];
                                   if((new Date(data[0])).getMonth() == (new Date(data[i])).getMonth()){
                                       count ++;
                                   }
                                }

                                for(let i = 0; i < count ; i ++){
                                    let date = new Date(data[i]).getDate();
                                    $(".day" + date).css('background-color', 'red');
                                }

                            //일자 - 요일 - 국경일
                            let inst = "";
                            let WEEKDAY = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
                            for (var i = 0; i < data.length; i++) {
                                inst += "<tr>";
                                inst += "<td>" + data[i] + "</td>";
                                inst += "<td>"+ WEEKDAY[new Date(data[i]).getDay()] + "</td>"
                                
                                if(data.length < 10){
                                inst += "<td>"+ "예" + "</td>"
                                }else{
                                	inst += "<td>"+ "아니오" + "</td>"
                                }
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

function saveDate(date, nowYear, nowMonth){
    let day = new Date(nowYear, nowMonth-1, date);
    const WEEKDAY = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
    let week = WEEKDAY[day.getDay()];
    $("#selectDate").html(nowYear + "년" + nowMonth+ "월" + date + "일");
    $("#selectYear").html(nowYear);
    $("#selectMonth").html(nowMonth);
    $("#selectDay").html(date);
    $("#dayWeek").html(week);
};
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
                <tbody class="week">
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
                <td id="selectDate"></td>
                <td id="dayWeek"></td>
                <td id="selectYear"></td>
                <td id="selectMonth"></td>
                <td id="selectDay"></td>
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
                   <!--  <div class="page_div_ch">
                        <span class="page_left_arrow"><a href="#">◀</a></span>
                        <span class="page_number"><a href=#>1</a></span>
                        <span class="page_number"><a href=#>2</a></span>
                        <span class="page_number"><a href=#>3</a></span>
                        <span class="page_right_arrow"><a href="#">▶</a></span>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>