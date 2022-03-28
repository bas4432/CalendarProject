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
                        	 
                        	 

                             let year = new Date(data[0]).getFullYear();
                             let month = new Date(data[0]).getMonth()+1;
                                  
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
                        	 
                        	  
                           let totalData = data.length;
                           let page; //현재 목록 페이지 번호
                           let dataPerPage = 10; // //한 페이지에 나타낼 글 수
                           let pageCount = 10;//한화면에 출력될 페이지수  //블럭수
                           let CurrentPage =1; //현재 페이지
                           
                           if(totalData>10){
                        	  
                               displayData(dataPerPage, CurrentPage, data);
                        	   paging(totalData, dataPerPage, pageCount, 1, data);
                        	   
                           }else{
                        	   
                        	   let inst = "";
                               let week = new Array('일요일', '월요일', '화요일', '수요일','목요일', '금요일', '토요일');
                               for (var i = 0; i < data.length; i++) {
                                   inst += "<tr>";
                                   inst += "<td>" + data[i] + "</td>";
                                   inst += "<td>"+ week[new Date(data[i]).getDay()] + "</td>"
                                   
                                   if(data.length < 10){
                                   inst += "<td>"+ "예" + "</td>"
                                   }else{
                                   	inst += "<td>"+ "아니오" + "</td>"
                                   }
                                   inst += "</tr>";
                                }
                               $("#data").html(inst); 
                        	 }
                  
                 

                            //일자 - 요일 - 국경일
                       /*      let inst = "";
                               const WEEKDAY = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
                             for (var i = 0; i < 10; i++) {
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
                            $("#data").html(inst); */  
                        }, //succes: function
                        error : function(jqXHR, textStatus, errorThrown) {
                            alert("끝나는 날짜를 선택 하세요");
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

  function displayData(dataPerPage, currentPage) {
	  
	  console.log(data);
	
	  alert("displaycurrentPage:::" + currentPage)
	
	let chartHtml = "";
	
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	 
	
    const WEEKDAY = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
	
	for(let i = (currentPage - 1) * dataPerPage; i<(currentPage - 1) * dataPerPage + dataPerPage; i++) {
        
		chartHtml += "<tr>";
    	chartHtml += "<td>" + searchDate[i] + "</td>";
    	chartHtml += "<td>"+ WEEKDAY[new Date(searchDate[i]).getDay()] + "</td>"
    	chartHtml += "</tr>";
    }
	 $("#data").html(chartHtml);
	
}  
  
function paging(totalData, dataPerPage, pageCount, CurrentPage, data){
	  console.log("paginsakdljasda!!!!!!!!!!!!!!!!!!!" + data.length)
	  
	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수 ex ) 총데이터 갯수 / 한페이지에 나타낼 갯수  20 / 10 = 2
	  console.log("totalPage::::" + totalPage)
	  
	  if(totalPage<pageCount){
		    alert("totalpage<pagecount")
		    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(CurrentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  console.log("last::" + last)
	  
	  if (last > totalPage) {
		    last = totalPage;
      }
	  
	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  
	  console.log("first::" + first)
	  
	 
	  
	  let next = last + 1;
	  
	  console.log("next::" + next);
	  
	  let prev = first - 1;
	  
	  console.log("prev::" + prev);
	  
	  let pageHtml = "";
	  
	  for (var i = first; i <= last; i++) {
		    if (CurrentPage == i) {
		      pageHtml +="<li style='color:red'><a href='#' id='" + i + "'>" + i + "</a></li>";
		    } else {
		      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
		    }
	  }
	  $("#pagingul").html(pageHtml);
	  
	  $("#pagingul li a").click(function () {
		  
		    alert("asdasdad")
		    let id = $(this).attr("id");
		    console.log("id:::" + id)
		    selectedPage = $(this).text();
		    console.log("select::" + selectedPage)

		    if (id == "next") {
		    	console.log("nextid:::" +id);
		    	selectedPage = next;
		    }
		    if (id == "prev") {
		    	selectedPage = prev;
		    }
		    
		    
		    
		    console.log("globalCurrentPage" + CurrentPage)
		    
		     
		    //페이징 표시 재호출
		    paging(totalData, dataPerPage, pageCount, selectedPage, data);
		    
		    
		    displayData(dataPerPage, selectedPage, data)
		   
		    //글 목록 표시 재호출
		   
		  });
	  
	  
  }
 
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
                <ul id ="pagingul">
                
               
                </ul>                
            </div>
        </div>
    </div>
</body>
</html>