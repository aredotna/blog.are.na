$(document).ready(function(){

  $('.post-container').hover(function(){
    content = $(this).find('.connections-preview-content')
    
    content.css({
      // top: $(this).position().top + $('#main').scrollTop() - 10
    })

    content.show()

  }, function(){
    content = $(this).find('.connections-preview-content')
    content.hide()
  })

})