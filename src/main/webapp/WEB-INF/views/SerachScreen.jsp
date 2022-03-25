<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
.header{
 text-align:right;
 padding: 15px;
}
.header button{
   outline:0
}
.input_box{
    display: flex;
    border: 2px solid rgb(150,167,197);
    padding: 10px;
    margin-left:13px;
    margin-right:13px;
}
.toggle_div {
    display: flex;
    width:28%;
}
.star{
    color: red;
}
.biz {
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 100px;
    margin-right: 10px;
    width:30%;
}
.place {
    width: 60%;
}
.room_type_box {
    display: flex;
    align-items: center;
    margin-left:40px;
}
.input_room_type {
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 300px;
    margin-right: 10px;
    height: 100%;
}
.room_input {
    height: 35px;
    width:300px;
}
.radio_box {
    
    margin-left: 100px;
    display: flex;
    align-items: center;
}
.radio_label {
    margin-top: 5px;
    margin-left: 8px;
}
.select_use {
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 150px;
    margin-right: 16px;
}
.footer{
   margin-top: 12px;
   width:100%;
}
.table_box table{
   margin-left:auto;
   margin-right:auto;
   width:98.5%;
}
tr>th {
    border: 1px solid gray;
    background-color: lightgray;
    font-size: 14px;
    text-align: center;
    padding: 5px;
}
tr>td {
    border: 1px solid gray;
    height: 30px;
    padding: 5px;
}
</style>
</head>
<body>
	<div class="Ser_Screen">

		<div class="header">
		    <Container>
            <Row>
            <Button type="button" class="btn">Find</button>
			<Button type="button" class="btn">clear</button>
			<Button type="button" class="btn">Print</button>
			<Button type="button" class="btn">Excel</button>
			<Button type="button" class="btn">Close</button>
			</Row>
			</Container>
		</div>

		<div class="middle">
            <div class="input_box">
                <div class="toggle_div">
					<div class="biz">
						<span class="star">* </span>Biz
					</div>
					<select class="place">
						<option value="null">로그인 사업장</option>
					</select>
				</div>

				<div class="room_type_box">
					<div class="input_room_type">Rm Type Code / Name</div>
					<span><input type="text" class="room_input"/></span>
				</div>

				<div class="radio_box">
					<div class="select_use">사용 여부</div>
					<div>
						<span> <input type="radio" value="Yes" checked/> 
							<label>Yes</label>
						</span> 
						<span><input type="radio" value="No" /> 
						    <label >No</label>
						</span> 
						<span><input type="radio" value="All" /> 
						    <label >All</label>
						</span>
					</div>
				</div>
			</div>
         </div>
         
         
         
         <div class="footer">
            <div class="table_box">
                    <table>
                        <thead>
                        <tr>
                            <th>Rm Type Code</th>
                            <th>Rm Type Name(Kor)</th>
                            <th>Rm Type Name(Eng)</th>
                            <th>Rm Type Name(Oth)</th>
                            <th>Rm View</th>
                            <th>Rms</th>
                            <th>Rack Rate</th>
                            <th>Active</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td >SDB</td>
                            <td>슈페리어 더블</td>
                            <td>Superior Double</td>
                            <td>Superior Double</td>
                            <td>Ocean</td>
                            <td>105</td>
                            <td>235,000</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <td >DTW</td>
                            <td>디럭스 트윈</td>
                            <td>Deluxe Twin</td>
                            <td>Deluxe Twin</td>
                            <td>City</td>
                            <td>99</td>
                            <td>263,000</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <td>DDB</td>
                            <td>디럭스 더블</td>
                            <td>Deluxe Double</td>
                            <td>Deluxe Double</td>
                            <td>Ocean</td>
                            <td>20</td>
                            <td >263,000</td>
                            <td >No</td>
                        </tr>
                        <tr>
                            <td></td>
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
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                 </div>
             </div>
         </div>
</body>
</html>