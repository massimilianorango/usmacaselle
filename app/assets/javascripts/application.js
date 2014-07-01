// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.ui.sortable
//= require jquery.turbolinks
//= require ckeditor/init
//= require_tree .
/*
$(function () {
    $(".sortable").sortable({
        tolerance: 'pointer',
        revert: '200',
        placeholder: $(".controller").text() + '-placeholder',
        forceHelperSize: true
    });
    $(".sortable").disableSelection();
});

$(document).ready(function(){
    $("#btn-order").click(
      function(event, ui){
        var confirmation = confirm("Sei sicuro di voler salvare l'ordinamento?");
        if(confirmation) {
            var itm_arr = $(".sortable").sortable('toArray');
            var pobj = {objects: itm_arr};
            var controller = $(".controller").text();
            $.post("/admin/"+controller+"/reorder", pobj);
        }
      }
    );
})*/

$(document).ready(function(){
    var controller = $(".controller").text();
    $(".sortable").sortable({
        dropOnEmpty: false,
        cursor: 'crosshair',
        opacity: 0.4,
        scroll: true,
        revert: '200',
        placeholder: controller + '-placeholder',
        update: function(){
            $.ajax({
                type: 'post',
                data: $(".sortable").sortable('serialize'),
                dataType: 'script',
                complete: function(request){
                    $(".sortable").effect('highlight');
                },
            url: '/admin/items/sort'})
        }
    });
});