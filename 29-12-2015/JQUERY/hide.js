$(function(){
	$("#btn1").click(function(){
		$("p").hide();
	});

	$("#btn2").click(function(){
		$("p").toggle();
	});


	$("#btn3").mouseover(function(){
		$("p").toggle(1000);
	});

	$("#btn4").click(function(){
		$("p").show();
	});

	$("#btn5").dblclick(function(){
		$("p").show();
	});

	$(".txt").keypress(function(){
		alert("You have pressed key");
	});

	$("#btn6").mouseenter(function(){
		$("p").toggle("fast");
	});

	$("#btn7").hover(function(){
		alert("Hover effect");
	},
		function(){
			alert("you come out from mouse over effect");
	});

	$("input").focus(function(){
		$(this).css("background-color","#cccccc");
	});

	$(".p1").on({
		mouseenter:function(){
			$(this).css("color","red");
		},
		mouseleave:function(){
			$(this).css("color","blue");
		}
	});

	$("span").click(function(){
		$(this).hide();
	})
});
