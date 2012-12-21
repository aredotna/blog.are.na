$(document).ready(function(){
  $('.post-container').hover(function(){
    content = $(this).find('.connections-preview-content')
    
    content.css({
      top: $(this).offset().top - 10
    })

    content.fadeIn(100)

  }, function(){
    content = $(this).find('.connections-preview-content')
    content.fadeOut(250);
  })

})