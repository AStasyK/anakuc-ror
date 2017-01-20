$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
  $('select').change change_trigger
  change_trigger $('select')


  $('input[type="radio"]').click (e) ->
    $('input[type="radio"]').removeClass('checked')
    $(this).addClass('checked')


  $('#carousel').on 'afterChange', (event, slick, currentSlide) ->
    $.get
      url: "/info/#{$($('.slick-current')[0]).attr('data-id')}"