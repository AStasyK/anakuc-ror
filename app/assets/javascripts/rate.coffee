$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
      success: (data) ->
        box = $ '.carousel-inner'
        box.empty()
        data.forEach (file) ->
          box.append "<div class='item'><img width='400' src='/assets/pictures/#{file}'></div>"
        $($('.item')[0]).addClass('active')
  $('select').change change_trigger
  change_trigger $('select')