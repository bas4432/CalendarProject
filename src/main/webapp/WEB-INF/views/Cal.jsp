<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
    #header_box {
        border-bottom: 1px solid lightgray;
        margin: 0;
        padding: 0;
    }

    #body_box {
        height: 1310px;
        border-bottom: 1px solid rgb(79, 129, 189);
    }
    #select_date_btn {
        border: 1px solid rgb(117, 142, 173);
        height: 22px;
        width: 64px;
        text-align: right;
        font-size: 11px;
    }

    #select_date_star {
        color: red;
    }

    #date_div {
        padding: 10px;
        margin-top: 25px;
        margin-left: 20px;
        display: flex;
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

    #from_til {
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

    #end_date_box {
        border: 1px solid rgb(117, 142, 173);
        display: inline-block;
        font-size: 7px;
        width: 85px;
        height: 20px;
        margin-left: 10px;
        margin-right: 10px;
    }

    #search_btn {
        background-color: rgb(79, 129, 189);
        color: white;
        width: 80px;
        height: 25px;
    }

    #selected_year_month {
        font-weight: bold;
        margin-left: 45px;
    }

    #calendar_table {
        margin-left: 38px;
        margin-top: 10px;
    }

    #calender_table_result {
        border-collapse: collapse;
        border: 2px solid;
        font-size: 14px;
    }

    #calendar_table>table>thead>tr>th {
        border: 2px solid;
        margin: 0;
        padding: 0 auto;
        width: 45px;
        height: 25px;
        background-color: rgb(238, 236, 225);
    }

    #calendar_table>table>tbody>tr>td {
        border: 2px solid;
        margin: 0;
        padding: 0 auto;
        width: 45px;
        height: 36px;
        text-align: center;
    }

    #calendar_table>table>tbody>tr>.sun {
        color: red;
        border: 2px solid black;
    }

    #calendar_table>table>tbody>tr>.sat {
        color: blue;
        border: 2px solid black;
    }

    /* #test{
        display: flex;
    } */

    #triangle_div {
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

    #test2 {
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

    #selected_date_table {
        margin-top: 15px;
        margin-left: 20px;
        text-align: center;
    }

    #selected_date_table>tr,
    th {
        text-align: center;
        width: 90px;
        font-size: 13px;
    }

    #right_area_border {
        position: absolute;
        top: 11%;
        left: 40%;
        border-right: 1px solid rgb(79, 129, 189);
    }

    #right_area {
        margin-top: 50px;
        margin-right: 10px;
        /* position: absolute;
        top: 15%;
        left: 40%; */
    }

    #selected_date_table>tr,
    .month_and_date {
        width: 50px;
    }

    #selected_date_list {
        text-align: center;
        width: 350px;
    }

    #selected_date_list>thead>tr>th {
        background-color: rgb(79, 129, 189);
        border-bottom: 2px solid;
        color: white;
        height: 20px;
    }

    #selected_date_list>tbody>tr {
        height: 22px;
    }

    #selected_date_list>tbody>tr:nth-child(odd) {
        background-color: rgb(208, 216, 232);
    }

    #selected_date_list>tbody>tr:nth-child(even) {
        background-color: rgb(233, 237, 244);
    }

    #page_div {
        margin-top: 7px;
        margin-bottom: 7px;
        display: flex;
        justify-content: right;
    }

    #page_div_ch {
        display: flex;
        margin: 0 1px;
    }

    #page_left_arrow {
        border: 1px solid black;
        width: 19px;
        height: 19px;
        text-align: center;

        line-height: 19px;

        display: inline-block;
        position: relative;
    }

    #page_left_arrow>a {
        text-decoration: none;
        color: black;
    }

    #page_right_arrow {
        border: 1px solid black;
        width: 19px;
        height: 19px;
        text-align: center;
        display: inline-block;
        line-height: 19px;
        position: relative;
        margin-left: 2px;
    }

    #page_right_arrow>a {
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
		        dateFormat: 'yy-mm-dd' //�޷� ��¥ ����
		        ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
		        ,showMonthAfterYear:true // ��- �� �������ƴ� �⵵ - �� ����
		        ,changeYear: true //option�� �� ���� ����
		        ,changeMonth: true //option��  �� ���� ����                
		        ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
		        ,buttonText: "''" //��ư ȣ�� �ؽ�Ʈ              
		        ,yearSuffix: "��" //�޷��� �⵵ �κ� �� �ؽ�Ʈ
		        ,monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� �ؽ�Ʈ
		        ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip
		        ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �ؽ�Ʈ
		        ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� Tooltip
		        ,minDate: "-5Y" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
		        ,maxDate: "+5y" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)  
		    });                    
		    
		    //�ʱⰪ�� ���� ��¥�� ��������� �մϴ�.
		   /*  $('#datepicker1').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)    */
		    
		 
		 
		 
		 /* $("datepicker1, datepicker2").change(function(){
			#("#myform").submit();
		 	 
		 }) */
		 
		 
		 $("#btndatefilter").click(function(){
			#("myform").submit();
			 
		 })
		 
	 }
 
	
	

</script>

<body>
    <div id="header_box">
        <h1>Calendar �⺻ ����</h1>
    </div>
    <div id="body_box">
        <span id="calendar_left_area">
           
           <form id="myform" action="/index" method="get">
             <div id="date_div">
                <button id="select_date_btn"><span id="select_date_star">*</span> �Ⱓ</button>
                <input id="start_date_box" >
                
             </div> <span id="from_til">~</span>
                
                <div id="end_date_box"><span class="d_box">D</span></div>
                
                <button id="search_btn">��ȸ</button>
            
             </div>
            </form>
            <div id="selected_year_month">2020�� 5��</div>
            <div id="calendar_table">
                <table id="calender_table_result">
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
                            <td class="sun">s</td>
                            <td>1</td>
                            <td>1</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat"></td>
                        </tr>
                        <tr>
                            <td class="sun">s</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun">s</td>
                            <td></td>
                            <td>s</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat">s</td>
                        </tr>
                        <tr>
                            <td class="sun"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="sat"></td>
                        </tr>
                    </tbody>
                </table>
                <div id="test">
                    <div id="triangle_div">
                        <div class="triangle_left"></div>
                        <div class="triangle_right"></div>
                    </div>
                </div>
                <div id="test2">
                    <div class="pre">pre</div>
                    <div class="next">next</div>
                </div>
            </div>
            <table id="selected_date_table">
                <tr>
                    <th>���õ� ����</th>
                    <th>(����)</th>
                    <th>��</th>
                    <th class="month_and_date">��</th>
                    <th class="month_and_date">��</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                </tr>
            </table>
        </span>
        <div id="right_area_border">
            <div id="right_area">
                <table id="selected_date_list">
                    <thead>
                        <tr>
                            <th>����</th>
                            <th>����</th>
                            <th>������</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        
                    </tbody>
                </table>
                <div id="page_div">
                    <div id="page_div_ch">
                        <span id="page_left_arrow"><a href="#">��</a></span>
                        <span class="page_number"><a href=#>1</a></span>
                        <span class="page_number"><a href=#>2</a></span>
                        <span class="page_number"><a href=#>3</a></span>
                        <span id="page_right_arrow"><a href="#">��</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>