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
            url: '/admin/'+controller+'/sort'})
        }
    });
});