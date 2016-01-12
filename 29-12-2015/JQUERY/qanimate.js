$(function(){

	
	var x=0,l=0;
	$("#btn1").click(function(){
		$(".img").animate({
			right:'+=20px'
		});
	});

	$("#btn2").click(function(){
		$(".img").animate({
			right:'-=20px'
		});

		/*x=$(".img").position();
		l=x.left+320;*/
		$(".signal_on").attr("src","signal_off.gif");
		
	});

	$("#btn3").click(function(){
		$(".img").rotate(90);
	});

	$("#btn4").click(function(){
		$(".img").rotate(270);
	});

	$("#btn6").click(function(){
		$(".img").stop();
		$(".signal_on").attr("src","signal_on.gif");
	});

	$(".img").rotate({bind:{
		click:function(){
			$(this).rotate({
				angle:0,
				animateTo:270
			})
		}
	}})
});