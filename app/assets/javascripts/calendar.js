$( document ).ready(function() {
    console.log( "ready!" );
		$('.event-title').hover(function(){
			$('.event-description').show();
		});
});