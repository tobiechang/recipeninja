var $ = function(id) {
	return document.getElementById(id);
}

var login = function() 
{	
	var username=$("user").value;
	var pass = $("pass").value;
	
	var error1="";
	var error2="";
	
	var flag=true;
	
	if(!username) {
	error1=" required";	
	flag=false;
	}
	if(!pass) {
	error2=" required";	
	flag=false;
	}
	
	if(flag==true) {
		window.location.href="login.php";
	}
	else {
		$("error1").firstChild.nodeValue=error1;
		$("error2").firstChild.nodeValue=error2;
	}
}




window.onload=function()
{
	$("login").onclick=login;
}