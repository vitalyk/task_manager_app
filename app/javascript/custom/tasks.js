import Rails from 'rails-ujs'
Rails.start();

document.addEventListener("turbolinks:load", function() {

    $(".sortable").sortable({
        update: function(e, ui) {
            Rails.ajax({
                url: $(this).data("url"),
                type: "PATCH",
                data: $(this).sortable('serialize')
            });
        }
    });
});

document.addEventListener("DOMContentLoaded", function() {

    $(".datepicker").datepicker({
        minDate: +1,
        onSelect: function(dateText, inst) {
            Rails.ajax({
                url: $(this).data("url"),
                type: "PATCH",
                data: $(this).val()
            });
        }
    });
});
