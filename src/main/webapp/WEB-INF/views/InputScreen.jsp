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
.room_type_box{
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
.radio_box {
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
.total_input_div {
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
    margin-bottom: 5px;

}
.workplace {
    width: 53%;
    height: 37px;
}
input {
    border: 1px solid rgb(150,167,197);
    margin-bottom: 5px;
}
.rm_view_title {
    border-right: 0;
    width: 20%;
}
.rm_view_content {	
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
.text_input_class {
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
			<button type="button" class="btn btn btn-outline-dark">Find</button>
			<button type="button" class="btn btn btn-outline-dark">clear</button>
			<button type="button" class="btn btn btn-outline-dark">New</button>
			<button type="button" class="btn btn btn-outline-dark">Save</button>
			<button type="button" class="btn btn btn-outline-dark">Delete</button>
			<button type="button" class="btn btn btn-outline-dark">Print</button>
			<button type="button" class="btn btn btn-outline-dark">Excel</button>
			<button type="button" class="btn btn btn-outline-dark">Close</button>
		</div>

		<div class="middle">
            <div class="middle_input">
                <div class="biz_box">
					<div class="biz">
						<span class="red_star">* </span>
						Biz
					</div>
					<select class="workplace">
						<option value="null">로그인 사업장</option>
						<option value="test1">test1</option>
						<option value="test2">test2</option>
						<option value="test3">test3</option>
					</select>
				</div>

				<div class="room_type_box">
					<div class="input_room_type">Rm Type Code / Name</div>
					<span> 
					<input type="text" class="input_box" />
					</span>
				</div>

				<div class="radio_box">
					<div class="is_used">사용 여부</div>
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
                
                
                <div class="total_input_div">
                    <div class="input_data">
                        <div class="input_title" class="biz"><span class="red_star">* </span>Biz</div>
                        <select name="workplace" class="workplace">
                            <option value="null">로그인 사업장</option>
                            <option value="test1">test1</option>
                            <option value="test2">test2</option>
                            <option value="test3">test3</option>
                        </select>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span class="red_star">* </span>Rm Type Code</div>
                        <input type="text" class="rm_type_code_input" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span class="red_star">* </span>Rm Type Name(Kor)</div>
                        <input type="text" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span class="red_star">* </span>Rm Type Name(Eng)</div>
                        <input type="text" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">Rm Type Name(Oth)</div>
                        <input type="text" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title">Rm View</div>
                        <input type="text" class="rm_view_title"/>
                        <div class="P">P</div>
                        <input type="text" class="rm_view_content"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span class="red_star">* </span>Rms</div>
                        <input type="text" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span id="red_star">* </span>Rack Rate</div>
                        <input type="text" class="text_input_class"/>
                    </div>
                    <div class="input_data">
                        <div class="input_title"><span id="red_star">* </span>Active</div>
                        <span class="t">
                               <input type="radio" name="isYesOrNo" value="Yes" Checked class="select_radio"/>
                               <label class="select_radio_label">Yes</label>
                        </span>
                        <span class="t">
                                 <input type="radio" name="isYesOrNo" value="No"/>
                                <label class="select_radio_label">No</label>
                        </span>
                    </div>
                </div>
           </div>
       </div>
</body>
</html>