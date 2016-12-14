$(document).ready(function(){

  $(".fixtures-tab").on("click", function(e){
    // Change active tab
    $(".fixtures-tab").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $(".fixtures").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });
});
