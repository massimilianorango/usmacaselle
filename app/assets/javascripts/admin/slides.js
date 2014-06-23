$(function() {
    $( "#sortable" ).sortable({
      placeholder: "sortable-highlight"
    });
    $( "#sortable" ).disableSelection();
    
  });

// $(window).load(function() {
$(document).ready(function(){
    $("#btn_order").click(
      function(event, ui){
        var confirmation = confirm("Sei sicuro di voler salvare l'ordinamento?");
        if(confirmation) {
            var itm_arr = $("#sortable").sortable('toArray');
            var pobj = {slides: itm_arr};
            $.post("/admin/slides/reorder", pobj);
        }
      }
    );
})
// });