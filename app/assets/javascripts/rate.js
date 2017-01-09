$(document).ready(function() {
    $('.select-box')
        .change(function() {
            $.post(
                "/rate/" + ($('select').val()),
                function(data) {
                    var box = $('.carousel-inner');
                    $('#images-info').empty();
                    box.empty();
                    data.forEach(function(image){
                        box.append("<div class='item' data-id='" + image.id + "'><img width='400' src='/assets/pictures/" + image.file + "'></div>");
                        $($('.item')[0]).addClass('active')
                    });
                }
            )
        }).change();
});