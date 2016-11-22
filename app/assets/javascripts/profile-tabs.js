$(function(){

  $(".profile-tab").on("click", function(e){
    // Change active tab
    $(".profile-tab").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $(".profile-tabs-content").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });

});
