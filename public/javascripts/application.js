$(document).ready(function(){

  $('.post-container').hover(function(){
    content = $(this).find('.connections-preview-content')
    content.addClass('current');
  }, function(){
    content = $(this).find('.connections-preview-content')
    content.removeClass('current')
  })

  var scrollTimer = null

  $('#main').scroll(function(){
    if (!scrollTimer){
      scrollTimer = setTimeout(function(){
        $('.connections-preview-content.current').each(function(){
          var cont = $(this).closest('.post-container')
          if (cont.position().top > 0) {
            $(this).css({
              position: 'absolute'
            })
          } else {
            $(this).css({
              position: 'fixed'
            })
          }
        })
        scrollTimer = false;
      }, 20)
    }
  })

  // $('#main').scroll(function(){
  //   var topEl = document.elementFromPoint(300, 100)
  //   var post = $(topEl).closest('.post-container')

  //   if (post.length){
  //     var connections = post.find('.connections-preview-content')
  //     connections.show()

  //     if (post.position().top < 20){
  //       if ($(this).position().top)
  //       connections.css({
  //         position: 'absolute',
  //         top: $('#main').scrollTop() + 20,
  //         left: 20
  //       })
  //     } else {
  //       connections.css({
  //         position: 'absolute',
  //         top: $('#main').scrollTop() + post.position().top,
  //         left: 20
  //       })
  //     }
  //   }
  // })

})