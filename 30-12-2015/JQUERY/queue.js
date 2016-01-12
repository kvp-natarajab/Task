$(function(){
	$("#btn1").click(function(){
		var div=$("#div2");
		div.animate({right:'0px'},2000);
		div.animate({bottom:'0px',backgroundColor:"green"},2000);
		div.animate({left:'0px',backgroundColor:"blue"},2000);
		div.animate({top:'0px',backgroundColor:"orange"},2000);
	});
});