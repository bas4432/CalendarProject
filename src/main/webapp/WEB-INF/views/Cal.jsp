<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Boot Application with JSP</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<script type="text/javascript">
const searchDate = []; 

const YearName = "년"
const MonthName = "월"
const dayName ="일"

$(function(){
    let today = new Date();
    let date = new Date();

    $(".pre").click(function() { 
    	DateRemove();
        today = new Date (today.getFullYear(), today.getMonth()-1, today.getDate());
        firstscreen();
    })

    $(".next").click(function(){ 
    	DateRemove();
        today = new Date (today.getFullYear(), today.getMonth()+1, today.getDate());
        firstscreen();
    })


    function firstscreen() {
    	
    	DateRemove();
    	
        nowYear = today.getFullYear();
        nowMonth = today.getMonth();
        firstDate = new Date(nowYear,nowMonth,1).getDate();
        firstDay = new Date(nowYear,nowMonth,1).getDay(); 
        lastDate = new Date(nowYear,nowMonth+1,0).getDate();

        if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { 
            lastDate[1]=29;
        }

       $(".selected_year_month").text(nowYear+ YearName +(nowMonth+1)+ MonthName); 

        for (i=0; i<firstDay; i++) { //첫번째 줄 빈칸
            $(".calendar_table tbody").append("<td></td>");
        }
        
        for (i=1; i<=lastDate; i++){ // 날짜 채우기
            plusDate = new Date(nowYear,nowMonth,i).getDay();
            if (plusDate==0) {
                $(".calendar_table tbody").append("<tr></tr>");
            }
          
            let month = (today.getMonth() + 1).toString().padStart(2, "0");
            let day = i.toString().padStart(2, "0");
            calDate = nowYear + "-" + month + "-" +  day;

            if(searchDate == null || searchDate == ""){
            	     nonselect();
            }else{
                     let val = false;
                     searchDate.filter(searchDate => { 
                     if(searchDate === calDate){
                    	val = true;
                    	selected();
                       }
                     });
                     if(!val){ 
                    	nonselect();
                 } 
            }
         }
     }
    firstscreen();
});

function selected(){
    if(true){
        $(".calendar_table tbody").append("<td class='dated day" + i  + "' onclick='saveDate(" + i  + ", nowYear, (nowMonth+1))'  style='background-color: red' >"+ i +"</td>");
    }
};

function nonselect(){
	$(".calendar_table tbody").append("<td class='dated day" + i  + "' onclick='saveDate(" + i  + ", nowYear, (nowMonth+1))'  >"+ i +"</td>");
}

function DateRemove(){
	$(".calendar_table tbody td").remove();
    $(".calendar_table tbody tr").remove();
}

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
                            for (let i = 0; i < data.length; i++) {
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
	
	$(".dated").css('background-color', '');
	
	let day = new Date(nowYear, nowMonth-1, date);
    let WEEKDAY = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
    let week = WEEKDAY[day.getDay()];
    $(".day" + date).css('background-color', 'red');
    $("#selectDate").html(nowYear + YearName + nowMonth+ MonthName + date + dayName);
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
                
                </div>
            </div>
        </div>
    </div>
</body>
</html>