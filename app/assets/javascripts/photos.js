$(document).ready(function() {
  $(".fancybox").fancybox({
        prevEffect  : 'none',
        nextEffect  : 'none',
        helpers : {
            title   : {
                type: 'outside'
            },
            /*thumbs  : {
                width   : 50,
                height  : 50
            },*/
            buttons : {}
        }
    });
});