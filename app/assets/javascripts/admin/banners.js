$(document).ready(function(){
    var controller = $(".controller").text();
    $(".h_sortable").sortable({
        dropOnEmpty: false,
        cursor: 'crosshair',
        opacity: 0.4,
        scroll: true,
        revert: '200',
        placeholder: controller + '-placeholder',
        connectWith: ".h_sortable",
        start: function(e, ui){
            ui.placeholder.height(ui.item.height());
            ui.placeholder.width(ui.item.width());
        },
        update: function(){
            $.ajax({
                type: 'post',
                data: $(".h_sortable").sortable('serialize'),
                dataType: 'script',
                complete: function(request){
                    $(".h_sortable").effect('highlight');
                },
            url: '/admin/'+controller+'/h_sort'})
        }
    });
});

$(document).ready(function(){
    var controller = $(".controller").text();
    $(".v_sortable").sortable({
        dropOnEmpty: false,
        cursor: 'crosshair',
        opacity: 0.4,
        scroll: true,
        revert: '200',
        placeholder: controller + '-placeholder',
        connectWith: ".v_sortable",
        start: function(e, ui){
            ui.placeholder.height(ui.item.height());
            ui.placeholder.width(ui.item.width());
        },
        update: function(){
            $.ajax({
                type: 'post',
                data: $(".v_sortable").sortable('serialize'),
                dataType: 'script',
                complete: function(request){
                    $(".v_sortable").effect('highlight');
                },
            url: '/admin/'+controller+'/v_sort'})
        }
    });
});
