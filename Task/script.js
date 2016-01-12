
var msg="";
var isTrue=true;
$(function(){

	$("#regFrom").submit(function(event){
		var firstName=$("#fname").val();
		var lastName=$("#lname").val();
		var email=$("#email").val();
		var password=$("#password").val();
		var fn=validate_firstname(firstName);
		if(!fn){
			return false;
		}
		var ln=validate_lastname(lastName);
		if(!ln){
			return false;
		}
		var em=validate_email(email);
		if(!em){
			return false;
		}
		var ps=validate_password(password);
		if(!ps){
			return false;
		}
		$("#msgTxt").hide();
		return true;


	});

	$("#msgTxt").click(function(){
		$(this).hide();
	});
});

function validate_firstname(firstName){
	if(firstName==""){
			msg="Please enter your first name";
			$("#fname").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}/*else if(){
			msg="First name contains integer";
			$("#fname").css("border","1px solid red");
			call_printmsg(msg);
	}*/else{
			$("#fname").css("border","1px solid grey");
			return true;
	}
}

function validate_lastname(lastName){
	if(lastName==""){
			msg="Please enter your last name";
			$("#lname").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}else{
		
		return true;
	}
}

function validate_email(email){
	if(email==""){
			msg="Please enter your email";
			$("#email").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}else{
		
		return true;
	}
}

function validate_password(password){
		
		if(password==""){
			isTrue=false;
			msg="Please enter your Password";
			call_printmsg(msg);
		}else if(password.length<6){
			isTrue=false;
			msg="Password must conatin 6 or more characters";
			call_printmsg(msg);
		}
		if(isTrue){
			return true;
		}else{
			$("#password").css("border","1px solid red");
			return false;
		}
		
}

function call_printmsg(msg){
			$("#msgTxt").show(500).css("background-color","#ff0000").val(msg);
}
	