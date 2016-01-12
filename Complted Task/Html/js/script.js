var msg="";
var isTrue=false;
$(function(){


	$("#signin-form").submit(function(event){
		var firstName=$("#fname").val();
		var lastName=$("#lname").val();
		var email=$("#email").val();
		var password=$("#password").val();
		var fn=validate_firstname(firstName);
		var ln=validate_lastname(lastName);
		var em=validate_email(email);
		var ps=validate_password(password);

		if(fn&&ln&&em&&ps){

			return true;
		}else{
			isTrue=false;
			return false;
		}

	});

	$("#error-close").click(function(){
		$(".error-info").hide(500);
	});

	$("#login-Password").keypress(function(){
		 $("#login-submit").prop("disabled",false);
	});
	remove_error();

});
	

function remove_error(){
	$("#fname").keypress(function(){
		$(this).css("border","1px solid #BFBFBF");
	});
	$("#lname").keypress(function(){
		$(this).css("border","1px solid #BFBFBF");
	});
	$("#email").keypress(function(){
		$(this).css("border","1px solid #BFBFBF");
	});
	$("#password").keypress(function(){
		$(this).css("border","1px solid #BFBFBF");
	});
	
}

function validate_firstname(firstName){
	
	if(firstName==""){
			if(!isTrue){
				msg="Please enter your first name";
				isTrue=true;
			}
			$("#fname").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}else{
			$("#fname").css("border","1px solid grey");
			return true;
	}
}

function validate_lastname(lastName){
	if(lastName==""){
		if(!isTrue){
			msg="Please enter your last name";
			isTrue=true;
		}
		$("#lname").css("border","1px solid red");
		call_printmsg(msg);
		return false;
	}else{
		$("#lname").css("border","1px solid grey");
		return true;
	}
}

function validate_email(email){
	var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	if(email==""){
			if(!isTrue){
				msg="Please enter your email";
				isTrue=true;
			}
			$("#email").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}else if(!pattern.test(email)){
			if(!isTrue){
				msg="Please enter valid email";
				isTrue=true;
			}
			$("#email").css("border","1px solid red");
			call_printmsg(msg);
			return false;
	}else{
		
		return true;
	}
}

function validate_password(password){
		var err=true;
		if(password==""){
			if(!isTrue){
				
				msg="Please enter your Password";
			}
			err=false;
		}else if(password.length<6){
			if(!isTrue){
				
				msg="Password must conatin 6 or more characters";
			}
			err=false;
		}
		if(err){
			return true;
		}else{
			$("#password").css("border","1px solid red");
			call_printmsg(msg);
			return false;
		}
		
}
function call_printmsg(msg){
			$(".error-info").show(500);
			$("#error-msg").text(msg);
}
