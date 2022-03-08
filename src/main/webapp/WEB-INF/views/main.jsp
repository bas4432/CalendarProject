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
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

.whole{
   height:100%;

}

#header_box{
   width:100%;
   font-size:20px;
   border-bottom:1px solid rgb(60 178 227);
   padding-bottom:0.3em;
}

.table{
 border: 1.5px solid black;
 border-collapse: collapse;

}

td {
	 border: 2px solid;
     margin: 0;
     padding: 0 auto;
     width: 50px;
     height: 40px;
}

th {
	 border: 2px solid;
     margin: 0;
     padding: 0 auto;
     width: 50px;
     height: 27px;
     background-color: rgb(238, 236, 225);
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 60px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}
.day1{


}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 100%;
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.dat_div {
       display: flex;
       padding: 20px;
       margin-top: 25px;
       align-items: center;
}

#start_date_box {
        border: 1px solid rgb(117, 142, 173);
        display: inline-block;
        font-size: 7px;
        width: 85px;
        height: 20px;
        margin-left: 2px;
        margin-right: 10px;
   }
   
#selected_year_month {
        font-weight: bold;
        margin-left: 20px;
    }
​
    #calendar_table {
        margin-left: 15px;
        margin-top: 10px;
    }   
  
#end_date_box{
	border: 1px solid rgb(117, 142, 173);
	display: inline-block;
	font-size: 7px;
	width: 85px;
	height: 20px;
	margin-left: 10px;
	margin-right: 10px;
}   

 #selected_year_month {
        font-weight: bold;
        margin-left: 20px;
}

  #arrow_div {
        margin-left: 70px;
        margin-top:40px;
  }
  
  #arrow_left {
      width: 0;
      height: 0;
      border-top: 40px solid transparent;
      border-right: 100px solid blue;
      border-bottom: 40px solid transparent;
      float:left;
      margin-right:120px;
      
   }
   
   #arrow_right {
      width: 0;
      height: 0;
      border-top: 40px solid transparent;
      border-left: 100px solid blue;
      border-bottom: 40px solid transparent;
      float:left;
      
   }
   
     #search_btn {
        background-color: rgb(79, 129, 189);
        color: white;
        width: 80px;
        height: 25px;
    }
   
</style>
<script>
/* $( function() {
	
	
    $("#datepicker1").datepicker({ 
                                
        onSelect: function() { 
           var date = $.datepicker.formatDate("yymmdd",$("#datepicker1").datepicker("getDate")); 
                                    
           date = $("#datepicker1").val();
                                    
           alert(date);
       }
   });   
});

 */
 
/*  $(function() {
	    
	   $("#datepicker1").datepicker();
	   $("#datepicker2").datepicker();
	  
	   

	    $("#btndatefilter").click(function() {
	        var startdate = $('#datepicker1').datepicker('getDate');
	        var enddate = $('#datepicker2').datepicker('getDate');
	        
	       
	        var dateFilter = 
	        { StartDate: startdate.toISOString(), EndDate: enddate.toISOString() };

	        $.ajax({
	            url: "index("FilterByDate", "AuditActivities")", 
	            type: "GET",
	            data: dateFilter
	        })
	        .done(function(auditActivity) {
	            $("#res").html(auditActivity);
	        });
	    });
	}); */
 
   
	 $(function() {
		 
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
		   /*  $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)    */
		    
		 
		 
		 
		 /* $("datepicker1, datepicker2").change(function(){
			#("#myform").submit();
		 	 
		 }) */
		 
		 $("#btndatefilter").click(function(){
			#("myform").submit();
			 
		 })
		 
	 }
 
	
	

</script>



<body>

<div class= Whole>

    <div id="header_box">
        <h1>Calendar 기본 과제</h1>
    </div>


<div class="dat_div">
      
      
      <form id="myform" action="/index" method="get">
		
		<button id="select_date_btn">
			<span id="select_date_star">*</span> 기간
		</button>
		
		<input type="date" id="datepicker1" name="startDay">
		
		<span id="from_til">~</span>
		
		<input type="date" id="datepicker2" name="endDay">
		
		<input type="submit" id="search_btn" id="btndatefilter" value="조회">
	  
	  </form>	
	  
</div>

<div id="selected_year_month">2020년 5월</div>

<form style="margin:20px;" name="calendarFrm" id="calendarFrm" action="" method="GET">

<div class="calendar">

<%-- <!--날짜 네비게이션  -->
	<div class="navigation">
		<a class="before_after_year" href="/index?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
			&lt;&lt;
		<!-- 이전해 -->
		</a> 
		<a class="before_after_month" href="/index?year=${today_info.before_year}&month=${today_info.before_month}">
			&lt;
		<!-- 이전달 -->
		</a> 
		<span class="this_month">
			&nbsp;${today_info.search_year}. 
			<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
		</span>
		<a class="before_after_month" href="/index?year=${today_info.after_year}&month=${today_info.after_month}">
		<!-- 다음달 -->
			&gt;
		</a> 
		<a class="before_after_year" href="/index?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
			<!-- 다음해 -->
			&gt;&gt;
		</a>
	</div>  --%>

	
	<div class="main">
		<table class="table">


			<thead>
				<tr>
					<td class="day sun">sun</td>
					<td class="day">Mon</td>
					<td class="day">Tue</td>
					<td class="day">Wed</td>
					<td class="day">Thu</td>
					<td class="day">Fri</td>
					<td class="day sat">Sat</td>
				</tr>
			</thead>

			<tbody style="backgroundcolor:black; border:1px solid black">
				<tr>
					<c:forEach var="dateList" items="${dateList}" varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today">
									<div class="date">${dateList.date}</div>
									<div></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">${dateList.date}</div>
									<div></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun">${dateList.date}</div>
						<div></div>
					</td>
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date">${dateList.date}</a></div>
							<div></div>
						</td>
					    </c:otherwise>
					  </c:choose>
				   </c:forEach>
			</tbody>



		</table>
		
		
		<div id="arrow_div">
            <div id="arrow_left"></div>
            <div id="arrow_right"></div>
        </div>

</div>

</form>
</div>
</body>
<script>


/* 
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
    $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   
    
    
    alert(stardate);
});
  */


</script>
</html>
