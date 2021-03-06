<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

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
.middle_input{
    display: flex;
    border: 2px solid rgb(150,167,197);
    padding: 10px;
    margin-left:13px;
    margin-right:13px;
}
.biz_box {
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
.room_box{
    display: flex;
    align-items: center;
    margin-left:40px;
}
.room_type {
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
.radio_box {
    margin-left: 100px;
    display: flex;
    align-items: center;
}
.radio_label {
    margin-top: 5px;
    margin-left: 8px;
}
.select_use{
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 150px;
    margin-right: 10px;
}
.select_active{
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
   display: flex;
}
.table_box{
   padding-left: 12px;
   width:85%;
   
}
.table_box table{
   width:100%;
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
.align_center {
    text-align: center;
}
.align_right {
    text-align: right;
}
.footer_input {
    margin-left: 1%;
  
}
.input_data {
    display: flex;
}
.input_title {
    border: 1px solid rgb(150,167,197);
    background-color: rgb(242,242,242);
    text-align: right;
    font-size: 14px;
    padding: 7px;
    width: 230px;
    margin-right: 10px;
    margin-bottom: 5px;
}
.biz {
    height: 37px;
    width: 33%;
}
.rm_type_code_input {
    background-color: rgb(242,242,242);
    border: 1px solid rgb(150,167,197);
    width:53%;
}
select {
    background-color: rgb(242,242,242);
    border: 1px solid rgb(150,167,197);
    margin-bottom: 3px;
}
.workplace {
    width: 53%;
    height: 37px;
}
input {
    border: 1px solid rgb(150,167,197);
    margin-bottom: 5px;
}
.rm_view{
    border-right: 0;
    width: 20%;
}
.rm_view_second{	
    margin-left: 2px;
    width: 27%;
}
.P{
    display: flex;
    justify-content: center;
    text-align: center;
    border: 1px solid rgb(150,167,197);
    padding: 6px;
    height: 37px;
    width: 30px;
}
.text_input {
    width: 53%;
}
.select_radio_label {
    margin-left: 8px;
}
</style>
</head>
<body>
<div class="Inp_Screen">
        <div class="header">
            <Container>
            <Row>
            <button type="button" class="btn btn-default">Find</button>
			<button type="button" class="btn btn-default">clear</button>
			<button type="button" class="btn btn-default">New</button>
			<button type="button" class="btn btn-default">Save</button>
			<button type="button" class="btn btn-default">Delete</button>
			<button type="button" class="btn btn-default">Print</button>
			<button type="button" class="btn btn-default">Excel</button>
			<button type="button" class="btn btn-default">Close</button>
			</Row>
			</Container>
		</div>

		<div class="middle">
            <div class="middle_input">
                <div class="biz_box">
					<div class="biz">
						<span class="star">* </span>
						Biz
					</div> 
					<select class="place">
						<option value="null">????????? ?????????</option>
					</select>
				</div>

				<div class="room_box">
					<div class="room_type">Rm Type Code / Name</div>
					<span> 
					<input type="text" class="input_box" />
					</span>
				</div>

				<div class="radio_box">
					<div class="select_use">?????? ??????</div>
					<div>
						<span class="t"> 
						    <input type="radio" value="Yes" checked/> 
							<label>Yes</label>
						</span> 
						<span>
						    <input type="radio" value="No"/> 
						    <label >No</label>
						</span> 
						<span>
						    <input type="radio" value="All" /> 
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
                            <td>???????????? ??????</td>
                            <td>Superior Double</td>
                            <td>Superior Double</td>
                            <td>Ocean</td>
                            <td>105</td>
                            <td>235,000</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <td >DTW</td>
                            <td>????????? ??????</td>
                            <td>Deluxe Twin</td>
                            <td>Deluxe Twin</td>
                            <td>City</td>
                            <td>99</td>
                            <td>263,000</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <td>DDB</td>
                            <td>????????? ??????</td>
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
                <div class="footer_input">
                    <div class="input_data">
                        <div class="input_title" class="biz"><span class="red_star">* </span>Biz</div>
                        <select name="workplace" class="workplace">
                            <option value="null">????????? ?????????</option>
                            <option value="test1">test1</option>
                            <option value="test2">test2</option>
                            <option value="test3">test3</option>
                        </select>
                    </div>
                    <div class="input_data">
                        <div class="input_title">
                        <span class="red_star">* </span>Rm Type Code
                        </div>
                        <input type="text" class="rm_type_code_input" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">
                        <span class="star">* </span>Rm Type Name(Kor)
                        </div>
                        <input type="text" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">
                        <span class="red_star">* </span>Rm Type Name(Eng
                        </div>
                        <input type="text" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">Rm Type Name(Oth)</div>
                        <input type="text" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">Rm View</div>
                        <input type="text" class="rm_view"/>
                        <div class="P">P</div>
                        <input type="text" class="rm_view_second"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span class="red_star">* </span>Rms</div>
                        <input type="text" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span id="red_star">* </span>Rack Rate</div>
                        <input type="text" class="text_input"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span id="red_star">* </span>Active</div>
                        <span class="select_active">
                               <input type="radio" value="Yes" Checked class="select_radio"/>
                               <label class="select_radio_label">Yes</label>
                        </span>
                        <span class="select_active">
                                 <input type="radio" value="No"/>
                                <label class="select_radio_label">No</label>
                        </span>
                    </div>  
                </div>
           </div>
       </div>
</body>
</html>