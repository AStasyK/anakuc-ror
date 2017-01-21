$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
  $('select').change change_trigger
  change_trigger $('select')


  $('input[type="radio"]').click (e) ->
    $('input[type="radio"]').removeClass('checked')
    $(this).addClass('checked')

  carousel = $('#carousel')
  #// http://viralpatel.net/blogs/jquery-trigger-custom-event-show-hide-element/
  getInfo = ->
    $.get
      url: "/info/#{$($('.slick-current')[0]).attr('data-id')}"
      success: $('#values_image_id').val($($('.slick-active')[0]).attr('data-id'))

  (($) ->
    $.each [
      'show'
      'hide'
    ], (i, ev) ->
      el = $.fn[ev]

      $.fn[ev] = ->
        @trigger ev
        el.apply this, arguments
  ) jQuery

  carousel.on 'show', getInfo
  carousel.on 'afterChange', (event, slick, currentSlide) ->
    do getInfo

