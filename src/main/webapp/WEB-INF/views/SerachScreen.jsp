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

.input_div{
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
.red_star {
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
.workplace {
    width: 60%;
}
.input_room_type_div {
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
.input_box {
    height: 35px;
    width:300px;
}
.radio_div {
    
    margin-left: 100px;
    display: flex;
    align-items: center;
}
.radio_label {
    margin-top: 5px;
    margin-left: 8px;
}
.is_used {
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 150px;
    margin-right: 10px;
}
.t {
    padding: 10px;
}

.result_div {
    margin:0 auto;
    padding: 10px;
    width: 65%;
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
			<button type="button" class="btn btn btn-outline-dark">Find</button>
			<button type="button" class="btn btn btn-outline-dark">clear</button>
			<button type="button" class="btn btn btn-outline-dark">Print</button>
			<button type="button" class="btn btn btn-outline-dark">Excel</button>
			<button type="button" class="btn btn btn-outline-dark">Close</button>
		</div>

		<div class="middle">
            <div class="input_div">
                <div class="toggle_div">
					<div class="biz">
						<span class="red_star">* </span>Biz
					</div>
					<select name="workplace" class="workplace">
						<option value="null">로그인 사업장</option>
						<option value="test1">test1</option>
						<option value="test2">test2</option>
						<option value="test3">test3</option>
					</select>
				</div>

				<div class="input_room_type_div">
					<div class="input_room_type">Rm Type Code / Name</div>
					<span> <input type="text" class="input_box" />
					</span>
				</div>

				<div class="radio_div">
					<div class="is_used">사용 여부</div>
					<div>
						<span class="t"> <input type="radio" name="isYesOrNo" value="Yes" checked/> 
							<label>Yes</label>
						</span> 
						
						<span><input type="radio" name="isYesOrNo" value="No" /> 
						    <label >No</label>
						</span> 
						<span><input type="radio" name="isYesOrNo" value="All" /> 
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
                            <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                            <td ></td>
                            <td></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                             <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                          <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        <tr>
                              <td ></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                            <td ></td>
                        </tr>
                        </tbody>
                    </table>

                </div>
         
         
         
         
         </div>



	</div>
</body>
</html>