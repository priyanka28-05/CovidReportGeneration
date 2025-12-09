<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
  background-image: url("images/background.jpeg");
 background-repeat:no-repeat;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>

<script>

function onTimeChange() {
	
	var inputEle = document.getElementById('collectionTime1');
	var collectionTime = document.getElementById('collectionTime');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function onAcceptanceTimeChange() {
	
	var inputEle = document.getElementById('acceptenceTime1');
	var collectionTime = document.getElementById('acceptenceTime');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function onReportedOnTimeChange() {
	
	var inputEle = document.getElementById('reportedOn1');
	var collectionTime = document.getElementById('reportedOn');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function validateAadharPassport()
{
	if(document.forms[0].passportNo.value != "" && document.forms[0].aadharNo.value != "" )	
		{
			alert("Please enter either Passport No. and Aadhar No. !!");
			return false;
		}
	else
		return true;
}

</script>
</head>
<body>

<div class="row">
  <div class="col-75">
    <div class="container">
		<form action="<%=request.getContextPath()%>/exportPdf" method="post" onsubmit="return validateAadharPassport()">
		  
		    <h1>Report Details</h1>
		    
		    <hr>
			
		<div class="row">
          <div class="col-50">
		    <label for="name"><b>Name</b></label>
		    <input type="text" placeholder="Enter Name" name="name" id="name" required/>
		
			<label for="age"><b>Age</b></label>
		    <input type="number" placeholder="Age" name="age" id="age" required/>
		    
		    <label for="contactNo"><b>Mobile Number</b></label>
		    <input type="number" placeholder="Mobile Number" name="contactNo" id="contactNo" required/>
		    
		    &nbsp
		    <input type="radio" name="gender" value="M">Male<br>
		  	<input type="radio" name="gender" value="F">Female<br>
		  	<input type="radio" name="gender" value="Other">Other<br>
		    
		    <label for="doctor"><b>Doctor Name</b></label>
		    <input type="text" placeholder="Enter Doctor Name" name="doctorName" id="doctorName" required/>
		    
		    <label for="patientLoc"><b>Patient Location</b></label>
		    <input type="text" placeholder="Patient Location" name="patientLoc" id="patientLoc" required/>
		   
		   	<label for="passportNo"><b>Passport Number</b></label>
		    <input type="text" placeholder="Passport Number" name="passportNo" id="passportNo" >
		    
		    <label for="aadharNo"><b>Aadhar Number</b></label>
		    <input type="number" placeholder="Aadhar Number" name="aadharNo" id="aadharNo" >
		   </div>
		   </div>
		   
		<div class="row">
          <div class="col-50">
		   <label for="address"><b>Address</b></label>
		   <textarea id="Address" style="display:none" name="Address" placeholder="Address.." style="height:200px"></textarea>
		    
		   
		   <label for="collectionDate"><b>Collection Date</b></label>
		    <input type="datetime-local" placeholder="Collection Date" name="collectionTime1" id="collectionTime1" onchange="onTimeChange()" required/>
		   
		    <input type="text" style="display:none" placeholder="Collection Date" name="collectionTime" id="collectionTime" />
		   
		   
		    <label for="recieveDate"><b>Sample Recieve Date</b></label>
		   <input type="datetime-local" placeholder="Sample Recieve Date" name="acceptenceTime1" id="acceptenceTime1" onchange="onAcceptanceTimeChange()" required/>
		    
		   <input type="text" style="display:none"  placeholder="Sample Recieve Date" name="acceptenceTime" id="acceptenceTime" />
		   
		   <label for="reportDate"><b>Report Date</b></label>
		   <input type="datetime-local" placeholder="Report Date" name="reportedOn1" id="reportedOn1" onchange="onReportedOnTimeChange()" required/>
		   
		    <input type="text" style="display:none"  placeholder="Report Date" name="reportedOn" id="reportedOn" />
		  
		  	<label for="testResult"><b>SARS-CoV-2 RNA</b></label>
		    <input type="text" placeholder="Enter result" name="testResult" id="testResult" required/>
		    
		    <label for="centre"><b>Centre</b></label>
		    <input type="text" placeholder="Enter centre" name="centre" id="centre" required/>
		    
		    <label for="org"><b>Organization</b></label>
		    <input type="text" placeholder="Enter organization" name="org" id="org" required/>
		    
		    <label for="sampleUID"><b>Sample UID</b></label>
		    <input type="text" placeholder="Enter Sample UID" name="sampleUID" id="sampleUID" required/>
		   </div>
		   </div> 
		    
		    <hr>
		    
		
		    <button type="submit" class="registerbtn">Generate Pdf</button>
		  </div>
		  
		  
		</form>
		</div>
	</div>
</div>
	
</body>
</html>
 --%>
 
 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] , input[type=number] , input[type=datetime-local]{
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

input[type=radio]{
  width: 2%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>

<script>

function onTimeChange() {
	
	var inputEle = document.getElementById('collectionTime1');
	var collectionTime = document.getElementById('collectionTime');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function onAcceptanceTimeChange() {
	
	var inputEle = document.getElementById('acceptenceTime1');
	var collectionTime = document.getElementById('acceptenceTime');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function onReportedOnTimeChange() {
	
	var inputEle = document.getElementById('reportedOn1');
	var collectionTime = document.getElementById('reportedOn');
	var dateSplit = inputEle.value.split('T')[0];	
	var timeSplit = inputEle.value.split('T')[1];	
  	timeSplit = timeSplit.split(':');
  	
  	var years = dateSplit.split('-')[0];
  	var month = dateSplit.split('-')[1];
  	var day = dateSplit.split('-')[2];
  	
    var  hours,
    minutes,
    meridian;
  hours = timeSplit[0];
  minutes = timeSplit[1];
  if (hours > 12) {
    meridian = 'PM';
    hours -= 12;
  } else if (hours < 12) {
    meridian = 'AM';
    if (hours == 0) {
      hours = 12;
    }
  } else {
    meridian = 'PM';
  }
 
  collectionTime.value = day+'.'+month+'.'+years+ ' ' + hours + ':' + minutes + ' ' + meridian;
}

function validateAadharPassport()
{
	if(document.forms[0].passportNo.value != "" && document.forms[0].aadharNo.value != "" )	
		{
			alert("Please enter either Passport No. and Aadhar No. !!");
			return false;
		}
	else
		return true;
}

</script>

</head>
<body>

<h1>Report Details</h1>
<hr>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="<%=request.getContextPath()%>/exportPdf" method="post" onsubmit="return validateAadharPassport()">
		
		 <div class="row">
          <div class="col-50">
            
           <label for="name"><b>Name</b></label>
		    <input type="text" placeholder="Enter Name" name="name" id="name" required/>
		
			<label for="age"><b>Age</b></label>
		    <input type="number" placeholder="Age" name="age" id="age" required/>
		    
		    <label for="contactNo"><b>Mobile Number</b></label>
		    <input type="number" placeholder="Mobile Number" name="contactNo" id="contactNo" required/>
		    
		    &nbsp
		    <input type="radio" name="gender" value="M">Male<br>
		  	<input type="radio" name="gender" value="F">Female<br>
		  	<input type="radio" name="gender" value="Other">Other<br>
		    
		    <label for="doctor"><b>Doctor Name</b></label>
		    <input type="text" placeholder="Enter Doctor Name" name="doctorName" id="doctorName" required/>
		    
		    <label for="patientLoc"><b>Patient Location</b></label>
		    <input type="text" placeholder="Patient Location" name="patientLoc" id="patientLoc" required/>
		   
		   	<label for="passportNo"><b>Passport Number</b></label>
		    <input type="text" placeholder="Passport Number" name="passportNo" id="passportNo" >
		    
		    <label for="aadharNo"><b>Aadhar Number</b></label>
		    <input type="number" placeholder="Aadhar Number" name="aadharNo" id="aadharNo" >

          </div>

          <div class="col-50">
             <label for="address" style="display:none" ><b>Address</b></label>
		   <textarea id="Address" style="display:none" name="Address" placeholder="Address.." style="height:200px"></textarea>
		    
		   
		   <label for="collectionDate"><b>Collection Date</b></label>
		    <input type="datetime-local" placeholder="Collection Date" name="collectionTime1" id="collectionTime1" onchange="onTimeChange()" required/>
		   
		    <input type="text" style="display:none" placeholder="Collection Date" name="collectionTime" id="collectionTime" />
		   
		   
		    <label for="recieveDate"><b>Sample Recieve Date</b></label>
		   <input type="datetime-local" placeholder="Sample Recieve Date" name="acceptenceTime1" id="acceptenceTime1" onchange="onAcceptanceTimeChange()" required/>
		    
		   <input type="text" style="display:none"  placeholder="Sample Recieve Date" name="acceptenceTime" id="acceptenceTime" />
		   
		   <label for="reportDate"><b>Report Date</b></label>
		   <input type="datetime-local" placeholder="Report Date" name="reportedOn1" id="reportedOn1" onchange="onReportedOnTimeChange()" required/>
		   
		    <input type="text" style="display:none"  placeholder="Report Date" name="reportedOn" id="reportedOn" />
		  
		  	<label for="testResult"><b>SARS-CoV-2 RNA</b></label>
		    <input type="text" placeholder="Enter result" name="testResult" id="testResult" required/>
		    
		    <label for="centre"><b>Centre</b></label>
		    <input type="text" placeholder="Enter centre" name="centre" id="centre" required/>
		    
		    <label for="org"><b>Organization</b></label>
		    <input type="text" placeholder="Enter organization" name="org" id="org" required/>
		    
		    <label for="sampleUID"><b>Sample UID</b></label>
		    <input type="text" placeholder="Enter Sample UID" name="sampleUID" id="sampleUID" required/>
		 
          </div>
          
        </div>
       
        <button type="submit"  class="btn">Generate Pdf</button>
      </form>
    </div>
  </div>
  
</div>

</body>
</html>