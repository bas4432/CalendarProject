<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
   table {
            clear: both;
        }
        th {
            height: 50px;
            width: 70px;
            background-color:  orange;
        }
        td {
            text-align: center;
            height: 50px;
            width: 70px;
            background-color: #FFFDC5;  
        }
        input {
            height: 50px;
            width: 70px;
            border: none;
            background-color:  orange;
            font-size: 30px;
        }
        .year_mon{
            font-size: 25px;
        }
        .colToday{
            background-color: #FFA07A;
        }

</style>
</head>
<script>

$(function(){
    var today = new Date();
    var date = new Date();           

    $("input[name=preMon]").click(function() { // ������
        $("#calendar > tbody > td").remove();
        $("#calendar > tbody > tr").remove();
        today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
        buildCalendar();
    })
    
    $("input[name=nextMon]").click(function(){ //������
        $("#calendar > tbody > td").remove();
        $("#calendar > tbody > tr").remove();
        today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
        buildCalendar();
    })


    function buildCalendar() {
        
        nowYear = today.getFullYear();
        nowMonth = today.getMonth();
        firstDate = new Date(nowYear,nowMonth,0).getDate(); //������ ��������
       
        console.log("firstDate::" + firstDate)
        
        firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st�� ����
        
        console.log("firstDay::" + firstDay)
        
        lastDate = new Date(nowYear,nowMonth+1,0).getDate();
        
        console.log("lastDate::" + lastDate)

        if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //���� ����
            lastDate[1]=29;
            
        }

        $(".year_mon").text(nowYear+"�� "+(nowMonth+1)+"��");

        for (i=0; i<firstDay; i++) { //ù��° �� ��ĭ
            $("#calendar tbody:last").append("<td></td>");
        }
        for (i=1; i <=lastDate; i++){ // ��¥ ä���
            plusDate = new Date(nowYear,nowMonth,i).getDay(); //����
        
            console.log("plusDate::" + plusDate)
            
            if (plusDate==0) {
                $("#calendar tbody:last").append("<tr></tr>");
            }
            $("#calendar tbody:last").append("<td class='date'>"+ i +"</td>");
        }
        if($("#calendar > tbody > td").length%7!=0) { //������ �� ��ĭ
            for(i=1; i<= $("#calendar > tbody > td").length%7; i++) {
                $("#calendar tbody:last").append("<td></td>");
            }
        }
        $(".date").each(function(index){ // ���� ��¥ ǥ��
            if(nowYear==date.getFullYear() && nowMonth==date.getMonth() && $(".date").eq(index).text()==date.getDate()) {
                $(".date").eq(index).addClass('colToday');
            }
        }) 
    }
    buildCalendar();


})




</script>
<body>
<table id="calendar">
        <thead>
            <tr>
                <th><input name="preMon" type="button" value="<"></th>
                <th colspan="5" class="year_mon"></th>
                <th><input name="nextMon" type="button" value=">"></th>
            </tr>
            <tr>
                <th>��</th>
                <th>��</th>
                <th>ȭ</th>
                <th>��</th>
                <th>��</th>
                <th>��</th>
                <th>��</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

</body>
</html>