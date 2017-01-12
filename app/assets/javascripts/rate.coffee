$ ->
  change_trigger = (handler) ->
    $.get
      url: "/rate/#{$('select').val()}"
      success: (data) ->
        $('#myCarousel').show()
        $('#show-info').show()
        box = $('.carousel-inner')
        $('#images-info table').empty()
        box.empty()
        data.forEach (image) ->
          box.append "<div class='item' data-id='#{image.id}' data-value='#{image.ave_value}'><img width='400' src='/assets/pictures/#{image.file}'></div>"
        $($('.item')[0]).addClass('active')
      dataType: 'json'
  $('select').change change_trigger
  change_trigger $('select')

  show_info = (handler) ->
    $.get
      url: "/images/#{$($('.item.active')[0]).attr('data-id')}"
      success: (data) ->
        $('#show-rate').show()
        $('#rate-info').show()
        aveVal = $($('.item.active')[0]).attr('data-value')
        if aveVal != 'null'
          $('#ave-rate').html("Average value: #{aveVal}")
        else
          $('#ave-rate').html('Nobody has submitted a rate yet')
        box = $('#images-info > table')
        box.empty()
        box.append "<tr><th>Characteristic</th><th>Value</th></tr>"
        for own key,value of data
          box.append "<tr><td class='info-item'>#{key[0].toUpperCase() + key[1..-1].toLowerCase()}</td><td>#{value}</td><tr>"

      dataType: 'json'
    $('#values_image_id').val($($('.item.active')[0]).attr('data-id'))
  $('#show-info button').click show_info
  show_info $('.active')

  clear = (handler) ->
    $('#images-info > table').empty()
    $('#rate-info').hide()
    $('#show-rate').hide()
    $('#ave-rate').empty()
  $('.carousel-control').click clear
  clear $('#images-info')

  $('input[type="radio"]').click (e) ->
    $('input[type="radio"]').removeClass('checked')
    $(this).addClass('checked')


