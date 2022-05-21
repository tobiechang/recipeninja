var $ = function(id) {
	return document.getElementById(id);
}

var create = function() 
{	

	var fname=$("fname").value;
	var lname = $("lname").value;
	var email=$("email").value;
	var user= $("user").value;
	var pass=$("pass").value;

	var error1="";
	var error2="";
	var error3="";
	var error4="";
	var error5="";
	
	var flag=true;
	
	if(!fname) {
	error1=" required";	
	flag=false;
	}
	if(!lname) {
	error2=" required";	
	flag=false;
	}
	if(!email) {
	error3=" required";	
	flag=false;
	}
	if(!user) {
	error4=" required";	
	flag=false;
	}
	if(!pass) {
	error5=" required";	
	flag=false;
	}

	
	if(flag==true) {
		window.location.href="create_account.php";
	}
	else {
		$("error1").firstChild.nodeValue=error1;
		$("error2").firstChild.nodeValue=error2;
		$("error3").firstChild.nodeValue=error3;
		$("error4").firstChild.nodeValue=error4;
		$("error5").firstChild.nodeValue=error5;
	}
}




window.onload=function()
{
	$("createacct").onclick=create;
}