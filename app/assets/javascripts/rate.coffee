$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
      success: (data) ->
        box = $('.carousel-inner')
        $('#images-info').empty()
        box.empty()
        data.forEach (image) ->
          box.append "<div class='item' data-id='#{image.id}'><img width='400' src='/assets/pictures/#{image.file}'></div>"
        $($('.item')[0]).addClass('active')
      dataType: 'json'
  $('select').change change_trigger
  change_trigger $('select')

  show_info = (handler) ->
    $.get
      url: "/images/#{$($('.item.active')[0]).attr('data-id')}"
      success: (data) ->
        console.log(data)
        box = $('#images-info')
        box.empty()
        for own key,value of data
          box.append "<div class='info-item'>#{key}: #{value}</div>"
      dataType: 'json'
  $('#show-info button').click show_info
  show_info $('.active')

  clear = (handler) ->
    $('#images-info').empty()
  $('.carousel-control').click clear
  clear $('#images-info')
