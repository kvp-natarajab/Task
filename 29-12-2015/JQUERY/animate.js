$(function(){
	$("img").mouseover(function(){
		$("img").animate({
			width:'+=50px',
			height:'+=50px'
		});
	});

	$("img").mouseleave(function(){
		$("img").animate({
			width:'-=50px',
			height:'-=50px'
		});
	});
});