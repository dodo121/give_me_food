$( document ).ready(function() {
		$('.event').hover(function(){
      var index = $('.event').index(this);
			$('.event-description').eq(index).show();
		});
    
    $('.event').mouseleave(function(){
      $('.event-description').hide();
    });
    
    $('.remove-event').click(function(){
      var index = $('.remove-event').index(this);
      $('.event').eq(index).addClass("removed");
      $('.event').eq(index).fadeOut("2500");
    });
    console.log('Ready!');
});
