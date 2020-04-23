$(document).ready(function(){

	$(window).scroll(function() {
		if ($(window).scrollTop() > 300) {
			$('#jump li:eq(0)').fadeIn(800);
		} else {
			$('#jump li:eq(0)').fadeOut(800);
		}
	});
	
	$("#top").click(function() {
		$('body,html').animate({
			scrollTop: 0
		},
		1000);
		return false;
	});
	
});

function showEWM(){
	document.getElementById("EWM").style.display = 'block';
}
function hideEWM(){
	document.getElementById("EWM").style.display = 'none';
}
