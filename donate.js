var $ = function(id) {
	return document.getElementById(id);
}

var donate = function() 
{	
	var email=$("email").value;
	var name = $("name").value;
	var card = $("cardnumber").value;
	var expDate = $("date").value;
	
	var error1="";
	var error2="";
	var error3="";
	var error4="";
	
	var date = new Date(expDate);
	var currDate = new Date();
	var flag=true;
	if(!email) {
	error1=" This is a required field";	
	flag=false;
	}
	if(!name) {
	error2=" This is a required field";	
	flag=false;

	}
	if(!card) {
	error3=" This is a required field";	
	flag=false;

	}
	else if (!validatePhoneNumber(card)){
		error3=" not a valid credit card number";
		flag=false;
	}
	if(!expDate) {
	error4=" This is a required field";	
	flag=false;

	}
	else if (date<currDate) 
	{
		error4=" this card is expired";
		flag=false;
	}
	if(flag==true) {
		alert("Thank you for your generous donation, " + name);
		error1=" *";
		error2=" *";
		error3=" *";
		error4=" *";
		$("error1").firstChild.nodeValue=error1;
		$("error2").firstChild.nodeValue=error2;
		$("error3").firstChild.nodeValue=error3;
		$("error4").firstChild.nodeValue=error4;
		$("email").value="";
		$("name").value="";
		$("cardnumber").value="";
		$("date").value="";

		
	}
	else {
		$("error1").firstChild.nodeValue=error1;
		$("error2").firstChild.nodeValue=error2;
		$("error3").firstChild.nodeValue=error3;
		$("error4").firstChild.nodeValue=error4;

	}
}
var clear = function() 
{
	error1=" *";
	error2=" *";
	error3=" *";
	error4=" *";
	$("error1").firstChild.nodeValue=error1;
	$("error2").firstChild.nodeValue=error2;
	$("error3").firstChild.nodeValue=error3;
	$("error4").firstChild.nodeValue=error4;
	$("email").value="";
	$("name").value="";
	$("cardnumber").value="";
	$("date").value="";
	
}
function validatePhoneNumber(input_str) 
{
    var re = /^[0-9]{4}[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4}[-\s\.]?[0-9]{4}$/im;

    return re.test(input_str);
}



window.onload=function()
{
	$("submitdonate").onclick=donate;
	$("clear").onclick=clear;
}