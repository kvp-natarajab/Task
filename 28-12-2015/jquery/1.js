/*$(document).ready(function(){
	document.write("Hello World...");
})*/

$(document).ready(function(){
	$("p").click(function(){
		$(".span2").show();
	})
})

$(document).ready(function(){
	$("#span1").click(function(){
		$(".span2").toggle();
	})
})


$(document).ready(function(){
	$(".span2").click(function(){
		
	})
})
$(document).ready(function(){
	$("#p2").dblclick(function(){
		alert("double clicked over me....");
	})
})

$(document).ready(function(){
	$("#p3").mouseover(function(){
		alert("mouse over");
	})
})

$(document).ready(function(){
	$(".btn").click(function(){
		$("p").toggle(1000);
	})
})
