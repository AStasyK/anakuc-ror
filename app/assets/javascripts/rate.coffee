$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
      success: (data) ->
        box = $ '#images'
        box.empty()
        data.forEach (file) ->
          box.append "<img src=/assets/pictures/#{file}>"
  $('select').change change_trigger
change_trigger $('select')