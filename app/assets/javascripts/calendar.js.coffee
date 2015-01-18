$ -> 
  $('.event').hover ->
    $(@).find('.event-description').show()  
  
  $('.event').mouseleave ->
    $('.event-description').hide()
    
  $('.remove-event').click ->
    $(@).closest('.event').addClass "removed"
    $(@).closest('.event').fadeOut "2500"
